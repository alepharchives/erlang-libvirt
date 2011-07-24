/* Copyright (c) 2010-2011, Michael Santos <michael.santos@gmail.com>
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of the author nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#include "vert.h"
#include "vert_util.h"
#include "vert_network.h"


    ERL_NIF_TERM
vert_virNetworkLookupByName(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *vp = NULL;
    char name[IFNAMSIZ] = {0};

    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, vp, VERT_RES_CONNECT);
    VERT_GET_STRING(1, name, sizeof(name));

    RESOURCE_ALLOC(np, VERT_RES_NETWORK, vp->res);

    np->res = virNetworkLookupByName(vp->res, name);

    if (np->res == NULL) {
        enif_release_resource(np);
        return verterr(env);
    }

    return vert_make_resource(env, np, atom_network);
}

    ERL_NIF_TERM
vert_virNetworkLookupByUUID(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *vp = NULL;
    ErlNifBinary buf = {0};

    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, vp, VERT_RES_CONNECT);
    VERT_GET_IOLIST(1, buf);

    RESOURCE_ALLOC(np, VERT_RES_NETWORK, vp->res);

    np->res = virNetworkLookupByUUID(vp->res, buf.data);

    if (np->res == NULL) {
        enif_release_resource(np);
        return verterr(env);
    }

    return vert_make_resource(env, np, atom_network);
}

    ERL_NIF_TERM
vert_virNetworkLookupByUUIDString(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *vp = NULL;
    ErlNifBinary buf = {0};

    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, vp, VERT_RES_CONNECT);
    VERT_GET_IOLIST(1, buf);

    RESOURCE_ALLOC(np, VERT_RES_NETWORK, vp->res);

    np->res = virNetworkLookupByUUIDString(vp->res, (const char *)buf.data);

    if (np->res == NULL) {
        enif_release_resource(np);
        return verterr(env);
    }

    return vert_make_resource(env, np, atom_network);
}

    ERL_NIF_TERM
vert_virNetworkGetAutostart(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    int autostart = 0;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    VERTERR(virNetworkGetAutostart(np->res, &autostart) < 0);

    return (autostart ? atom_true : atom_false);
}

    ERL_NIF_TERM
vert_virNetworkGetBridgeName(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    char *name = NULL;

    ERL_NIF_TERM term = {0};


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    name = virNetworkGetBridgeName(np->res);
    VERTERR(name == NULL);

    term = enif_make_string(env, name, ERL_NIF_LATIN1);
    free(name);

    return term;
}

    ERL_NIF_TERM
vert_virNetworkGetName(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    const char *name = NULL;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    name = virNetworkGetName(np->res);
    VERTERR(name == NULL);

    return enif_make_string(env, name, ERL_NIF_LATIN1);
}

    ERL_NIF_TERM
vert_virNetworkGetUUID(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    unsigned char uuid[VIR_UUID_BUFLEN];

    ERL_NIF_TERM term = {0};


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    VERTERR(virNetworkGetUUID(np->res, uuid) < 0);

    BINCOPY(term, uuid, sizeof(uuid));

    return term;
}

    ERL_NIF_TERM
vert_virNetworkGetXMLDesc(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    int flags = 0;

    char *desc = NULL;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);
    VERT_GET_INT(1, flags);

    desc = virNetworkGetXMLDesc(np->res, flags);
    VERTERR(desc == NULL);

    return enif_make_string(env, desc, ERL_NIF_LATIN1);
}

    ERL_NIF_TERM
vert_virNetworkIsPersistent(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;
    int n = -1;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    n = virNetworkIsPersistent(np->res);
    VERTERR(n == -1);

    return (n == 1 ? atom_true : atom_false);
}

    ERL_NIF_TERM
vert_virNetworkDefineXML(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *vp = NULL;
    ErlNifBinary cfg;

    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, vp, VERT_RES_CONNECT);
    VERT_GET_IOLIST(1, cfg);

    VERT_NULL_TERM_BIN(cfg);

    RESOURCE_ALLOC(np, VERT_RES_NETWORK, vp->res);

    np->res = virNetworkDefineXML(vp->res, (char *)cfg.data);

    if (np->res == NULL) {
        enif_release_resource(np);
        return verterr(env);
    }

    return vert_make_resource(env, np, atom_network);
}

    ERL_NIF_TERM
vert_virNetworkUndefine(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    VERTERR(virNetworkUndefine(np->res) == -1); /* Network is still running */

    return atom_ok;
}

    ERL_NIF_TERM
vert_virNetworkCreate(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    VERTERR(virNetworkCreate(np->res) == -1);

    return atom_ok;
}

    ERL_NIF_TERM
vert_virNetworkDestroy(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    VERT_RESOURCE *np = NULL;


    VERT_GET_RESOURCE(0, np, VERT_RES_NETWORK);

    VERTERR(virNetworkDestroy(np->res) != 0);
    VERTERR(virNetworkFree(np->res) != 0);

    np->res = NULL;

    return atom_ok;
}
