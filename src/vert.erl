%% Copyright (c) 2010-2011, Michael Santos <michael.santos@gmail.com>
%% All rights reserved.
%% 
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted provided that the following conditions
%% are met:
%% 
%% Redistributions of source code must retain the above copyright
%% notice, this list of conditions and the following disclaimer.
%% 
%% Redistributions in binary form must reproduce the above copyright
%% notice, this list of conditions and the following disclaimer in the
%% documentation and/or other materials provided with the distribution.
%% 
%% Neither the name of the author nor the names of its contributors
%% may be used to endorse or promote products derived from this software
%% without specific prior written permission.
%% 
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
%% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
%% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
%% FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
%% COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
%% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
%% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
%% ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%% POSSIBILITY OF SUCH DAMAGE.
-module(vert).
-include("vert.hrl").

-export([
        virNodeGetSecurityModel/1,
        virNodeGetInfo/1,
        virNodeGetFreeMemory/1,
        virNodeGetCellsFreeMemory/2,
        virNetworkUndefine/1,
        virNetworkLookupByUUIDString/2,
        virNetworkLookupByUUID/2,
        virNetworkLookupByName/2,
        virNetworkIsPersistent/1,
        virNetworkGetXMLDesc/2,
        virNetworkGetUUID/1,
        virNetworkGetName/1,
        virNetworkGetBridgeName/1,
        virNetworkGetAutostart/1,
        virNetworkDestroy/1,
        virNetworkDefineXML/2,
        virNetworkCreate/1,
        virInterfaceUndefine/1,
        virInterfaceLookupByName/2,
        virInterfaceLookupByMACString/2,
        virInterfaceGetXMLDesc/1, virInterfaceGetXMLDesc/2,
        virInterfaceGetName/1,
        virInterfaceGetMACString/1,
        virInterfaceDestroy/1,
        virInterfaceDefineXML/2,
        virInterfaceCreate/1,
        virDomainUndefine/1,
        virDomainSuspend/1,
        virDomainShutdown/1,
        virDomainSetAutostart/2,
        virDomainSave/2,
        virDomainResume/1,
        virDomainRestore/2,
        virDomainLookupByUUID/2,
        virDomainLookupByName/2,
        virDomainLookupByID/2,
        virDomainGetXMLDesc/2,
        virDomainGetUUIDString/1,
        virDomainGetUUID/1,
        virDomainGetSecurityLabel/1,
        virDomainGetSchedulerType/1,
        virDomainGetSchedulerParameters/1,
        virDomainGetOSType/1,
        virDomainGetName/1,
        virDomainGetMaxVcpus/1,
        virDomainGetMemoryParameters/1,
        virDomainGetMaxMemory/1,
        virDomainGetInfo/1,
        virDomainGetID/1,
        virDomainGetJobInfo/1,
        virDomainGetBlockInfo/2,
        virDomainGetAutostart/1,
        virDomainDestroy/1,
        virDomainDefineXML/2,
        virDomainCreate/2,
        virConnectOpen/1,
        virConnectOpenReadOnly/1,
        virConnectNumOfStoragePools/1,
        virConnectNumOfSecrets/1,
        virConnectNumOfNetworks/1,
        virConnectNumOfNWFilters/1,
        virConnectNumOfInterfaces/1,
        virConnectNumOfDomains/1,
        virConnectNumOfDefinedStoragePools/1,
        virConnectNumOfDefinedNetworks/1,
        virConnectNumOfDefinedInterfaces/1,
        virConnectNumOfDefinedDomains/1,
        virConnectListStoragePools/1, virConnectListStoragePools/2,
        virConnectListSecrets/1, virConnectListSecrets/2,
        virConnectListNetworks/1, virConnectListNetworks/2,
        virConnectListNWFilters/1, virConnectListNWFilters/2,
        virConnectListInterfaces/1, virConnectListInterfaces/2,
        virConnectListDomains/1, virConnectListDomains/2,
        virConnectListDefinedStoragePools/1, virConnectListDefinedStoragePools/2,
        virConnectListDefinedNetworks/1, virConnectListDefinedNetworks/2,
        virConnectListDefinedInterfaces/1, virConnectListDefinedInterfaces/2,
        virConnectListDefinedDomains/1, virConnectListDefinedDomains/2,
        virConnectIsSecure/1,
        virConnectIsEncrypted/1,
        virConnectGetVersion/1,
        virConnectGetURI/1,
        virConnectGetType/1,
        virConnectGetMaxVcpus/2,
        virConnectGetLibVersion/1,
        virConnectGetHostname/1,
        virConnectGetCapabilities/1
    ]).
%-export([
%        cast/2, cast/3, cast/4,
%        call/2, call/3
%    ]).

-on_load(on_load/0).

on_load() ->
    case erlang:system_info(smp_support) of
        true ->
            erlang:load_nif(niflib(), []);
        false ->
            {error, "Requires smp support (-smp flag to enable)"}
    end.


%%-------------------------------------------------------------------------
%%% Stream
%%-------------------------------------------------------------------------

%virStreamSendAll(Stream, Handler, Opaque) ->
%virStreamSend(Stream, Data, Nbytes) ->
%virStreamRecvAll(Stream, Handler, Opaque) ->
%virStreamRecv(Stream, Data, Nbytes) ->
%virStreamNew(Conn, Flags) ->
%virStreamFree(Stream) ->
%virStreamFinish(Stream) ->
%virStreamEventUpdateCallback(Stream, Events) ->
%virStreamEventRemoveCallback(Stream) ->
%virStreamEventAddCallback(Stream, Events, Cb, Opaque, Ff) ->
%virStreamAbort(Stream) ->


%%-------------------------------------------------------------------------
%%% Storage Volume
%%-------------------------------------------------------------------------

%virStorageVolLookupByPath(Conn, Path) ->
%virStorageVolLookupByName(Pool, Name) ->
%virStorageVolLookupByKey(Conn, Key) ->
%virStorageVolGetXMLDesc(Vol, Flags) ->
%virStorageVolGetPath(Vol) ->
%virStorageVolGetName(Vol) ->
%virStorageVolGetKey(Vol) ->
%virStorageVolGetInfo(Vol, Info) ->
%virStorageVolGetConnect(Vol) ->
%virStorageVolFree(Vol) ->
%virStorageVolDelete(Vol, Flags) ->
%virStorageVolCreateXMLFrom(Pool, Xmldesc, Clonevol, Flags) ->
%virStorageVolCreateXML(Pool, Xmldesc, Flags) ->


%%-------------------------------------------------------------------------
%%% Storage Pool
%%-------------------------------------------------------------------------

%virStoragePoolUndefine(Pool) ->
%virStoragePoolSetAutostart(Pool, Autostart) ->
%virStoragePoolRefresh(Pool, Flags) ->
%virStoragePoolNumOfVolumes(Pool) ->
%virStoragePoolLookupByVolume(Vol) ->
%virStoragePoolLookupByUUIDString(Conn, Uuidstr) ->
%virStoragePoolLookupByUUID(Conn, Uuid) ->
%virStoragePoolLookupByName(Conn, Name) ->
%virStoragePoolListVolumes(Pool, Names, Maxnames) ->
%virStoragePoolIsPersistent(Pool) ->
%virStoragePoolIsActive(Pool) ->
%virStoragePoolGetXMLDesc(Pool, Flags) ->
%virStoragePoolGetUUIDString(Pool, Buf) ->
%virStoragePoolGetUUID(Pool, Uuid) ->
%virStoragePoolGetName(Pool) ->
%virStoragePoolGetInfo(Pool, Info) ->
%virStoragePoolGetConnect(Pool) ->
%virStoragePoolGetAutostart(Pool, Autostart) ->
%virStoragePoolFree(Pool) ->
%virStoragePoolDestroy(Pool) ->
%virStoragePoolDelete(Pool, Flags) ->
%virStoragePoolDefineXML(Conn, Xml, Flags) ->
%virStoragePoolCreateXML(Conn, XmlDesc, Flags) ->
%virStoragePoolCreate(Pool, Flags) ->
%virStoragePoolBuild(Pool, Flags) ->


%%-------------------------------------------------------------------------
%%% Secret
%%-------------------------------------------------------------------------

%virSecretUndefine(Secret) ->
%virSecretSetValue(Secret, Value, Value_size, Flags) ->
%virSecretLookupByUsage(Conn, UsageType, UsageID) ->
%virSecretLookupByUUIDString(Conn, Uuidstr) ->
%virSecretLookupByUUID(Conn, Uuid) ->
%virSecretGetXMLDesc(Secret, Flags) ->
%virSecretGetValue(Secret, Value_size, Flags) ->
%virSecretGetUsageType(Secret) ->
%virSecretGetUsageID(Secret) ->
%virSecretGetUUIDString(Secret, Buf) ->
%virSecretGetUUID(Secret, Uuid) ->
%virSecretGetConnect(Secret) ->
%virSecretFree(Secret) ->
%virSecretDefineXML(Conn, Xml, Flags) ->


%%-------------------------------------------------------------------------
%%% Node
%%-------------------------------------------------------------------------

%virNodeNumOfDevices(Conn, Cap, Flags) ->
%virNodeListDevices(Conn, Cap, Names, Maxnames, Flags) ->

%% struct _virSecurityModel {
%%  char model[VIR_SECURITY_MODEL_BUFLEN];      /* security model string */
%%  char doi[VIR_SECURITY_DOI_BUFLEN];          /* domain of interpetation */
%% }
virNodeGetSecurityModel(#resource{type = connect, res = Res}) ->
    case call(virNodeGetSecurityModel, [Res]) of
        {ok, <<
            Model:?VIR_SECURITY_MODEL_BUFLEN/native-bytes,
            Doi:?VIR_SECURITY_DOI_BUFLEN/native-bytes
            >>} ->
            {ok, #security_model{
                    model = Model,
                    doi = Doi
                }};
        Error ->
            Error
    end.

%% struct _virNodeInfo {
%%     char model[32];     /* string indicating the CPU model */
%%     unsigned long memory;/* memory size in kilobytes */
%%     unsigned int cpus;  /* the number of active CPUs */
%%     unsigned int mhz;   /* expected CPU frequency */
%%     unsigned int nodes; /* the number of NUMA cell, 1 for uniform mem access */
%%     unsigned int sockets;/* number of CPU socket per node */
%%     unsigned int cores; /* number of core per socket */
%%     unsigned int threads;/* number of threads per core */
%% };
virNodeGetInfo(#resource{type = connect, res = Res}) ->
    Long = erlang:system_info({wordsize, external}),
    case call(virNodeGetInfo, [Res]) of
        {ok, <<
            Model:32/native-bytes,
            Memory:Long/native-unsigned-integer-unit:8,
            Cpus:32/native,
            Mhz:32/native,
            Nodes:32/native,
            Sockets:32/native,
            Cores:32/native,
            Threads:32/native
        >>} ->
        {ok, #node_info{
                model = Model,
                memory = Memory,
                cpus = Cpus,
                mhz = Mhz,
                nodes = Nodes,
                sockets = Sockets,
                cores = Cores,
                threads = Threads
            }};
        Error ->
            Error
    end.

virNodeGetFreeMemory(#resource{type = connect, res = Res}) ->
    call(virNodeGetFreeMemory, [Res]).

virNodeGetCellsFreeMemory(#resource{type = connect, res = Res}, MaxCells) ->
    call(virNodeGetFreeMemory, [Res, MaxCells]).


%%-------------------------------------------------------------------------
%%% Node Device
%%-------------------------------------------------------------------------

%virNodeDeviceReset(Dev) ->
%virNodeDeviceReAttach(Dev) ->
%virNodeDeviceNumOfCaps(Dev) ->
%virNodeDeviceLookupByName(Conn, Name) ->
%virNodeDeviceListCaps(Dev, Names, Maxnames) ->
%virNodeDeviceGetXMLDesc(Dev, Flags) ->
%virNodeDeviceGetParent(Dev) ->
%virNodeDeviceGetName(Dev) ->
%virNodeDeviceFree(Dev) ->
%virNodeDeviceDettach(Dev) ->
%virNodeDeviceDestroy(Dev) ->
%virNodeDeviceCreateXML(Conn, XmlDesc, Flags) ->


%%-------------------------------------------------------------------------
%%% Network
%%-------------------------------------------------------------------------

virNetworkUndefine(#resource{type = network, res = Res}) ->
    call(virNetworkUndefine, [Res]).

%virNetworkSetAutostart(#resource{type = network, res = Res}, Autostart)
%   when is_integer(Autostart) ->
%    call(virNetworkSetAutostart, [Res, Autostart]).

virNetworkLookupByUUIDString(#resource{type = connect, res = Res}, Uuidstr)
    when is_binary(Uuidstr); is_list(Uuidstr) ->
    call(virNetworkLookupByUUIDString, [Res, Uuidstr]).

virNetworkLookupByUUID(#resource{type = connect, res = Res}, Uuid) when is_binary(Uuid);
    is_list(Uuid) ->
    call(virNetworkLookupByUUID, [Res, Uuid]).

virNetworkLookupByName(#resource{type = connect, res = Res}, Name) when is_list(Name) ->
    call(virNetworkLookupByName, [Res, Name]).

virNetworkIsPersistent(#resource{type = network, res = Res}) ->
    call(virNetworkIsPersistent, [Res]).

%virNetworkIsActive(#resource{type = network, res = Res}) ->
%    call(virNetworkIsActive, [Res]).

virNetworkGetXMLDesc(#resource{type = network, res = Res}, Flags)
    when is_integer(Flags) ->
    call(virNetworkGetXMLDesc, [Res, Flags]).

%virNetworkGetUUIDString(Network, Buf) ->

virNetworkGetUUID(#resource{type = network, res = Res}) ->
    call(virNetworkGetUUID, [Res]).

virNetworkGetName(#resource{type = network, res = Res}) ->
    call(virNetworkGetName, [Res]).

%virNetworkGetConnect(#resource{type = network, res = Res}) ->

virNetworkGetBridgeName(#resource{type = network, res = Res}) ->
    call(virNetworkGetBridgeName, [Res]).

virNetworkGetAutostart(#resource{type = network, res = Res}) ->
    call(virNetworkGetAutostart, [Res]).

virNetworkDestroy(#resource{type = network, res = Res}) ->
    call(virNetworkDestroy, [Res]).

virNetworkDefineXML(#resource{type = connect, res = Res}, Xml) ->
    call(virNetworkDefineXML, [Res, Xml]).

%virNetworkCreateXML(Conn, XmlDesc) ->

virNetworkCreate(#resource{type = network, res = Res}) ->
    call(virNetworkCreate, [Res]).


%%-------------------------------------------------------------------------
%%% Interface
%%-------------------------------------------------------------------------
virInterfaceUndefine(#resource{type = interface, res = Res}) ->
    bool(call(virInterfaceUndefine, [Res])).

virInterfaceLookupByName(#resource{type = connect, res = Res}, Name)
    when is_list(Name); length(Name) < 128 ->
    call(virInterfaceLookupByName, [Res, Name]).

virInterfaceLookupByMACString(#resource{type = connect, res = Res}, Macstr)
    when is_list(Macstr); length(Macstr) =< 18 ->
    call(virInterfaceLookupByMACString, [Res, Macstr]).

%virInterfaceIsActive(#resource{type = interface, res = Res}) ->
%    call(virInterfaceIsActive, [Res]).

virInterfaceGetXMLDesc(#resource{type = interface, res = Res}) ->
    virInterfaceGetXMLDesc(Res, 0).
virInterfaceGetXMLDesc(#resource{type = interface, res = Res}, Flags)
    when is_integer(Flags) ->
    call(virInterfaceGetXMLDesc, [Res, Flags]).

virInterfaceGetName(#resource{type = interface, res = Res}) ->
    call(virInterfaceGetName, [Res]).

virInterfaceGetMACString(#resource{type = interface, res = Res}) ->
    call(virInterfaceGetMACString, [Res]).

%virInterfaceGetConnect(#resource{type = interface, res = Res}) ->
%    call(virInterfaceGetConnect, [Res]).

virInterfaceDestroy(#resource{type = interface, res = Res}) ->
    bool(call(virInterfaceDestroy, [Res])).

virInterfaceDefineXML(#resource{type = connect, res = Res}, Xml)
    when is_binary(Xml); is_list(Xml) ->
    call(virInterfaceDefineXML, [Res, Xml]).

virInterfaceCreate(#resource{type = interface, res = Res}) ->
    bool(call(virInterfaceCreate, [Res])).


%%-------------------------------------------------------------------------
%%% Domain
%%-------------------------------------------------------------------------

virDomainUndefine(#resource{type = domain, res = Res}) ->
    ok(call(virDomainUndefine, [Res])).

virDomainSuspend(#resource{type = domain, res = Res}) ->
    ok(call(virDomainSuspend, [Res])).

virDomainShutdown(#resource{type = domain, res = Res}) ->
    ok(call(virDomainShutdown, [Res])).

%virDomainSetVcpus(#resource{type = domain, res = Res}, Nvcpus) ->
%virDomainSetSchedulerParameters(#resource{type = domain, res = Res}, Params, Nparams) ->
%virDomainSetMemory(#resource{type = domain, res = Res}, Memory) ->
%virDomainSetMaxMemory(#resource{type = domain, res = Res}, Memory) ->

virDomainSetAutostart(#resource{type = domain, res = Res}, Autostart) ->
    call(virDomainSetAutostart, [Res, Autostart]).

virDomainSave(#resource{type = domain, res = Res}, To) when is_list(To) ->
    call(virDomainSave, [Res, To]).

virDomainResume(#resource{type = domain, res = Res}) ->
    ok(call(virDomainResume, [Res])).

virDomainRestore(#resource{type = connect, res = Res}, From) ->
    call(virDomainRestore, [Res, From]).

%virDomainReboot(#resource{type = domain, res = Res}, Flags) ->
%virDomainPinVcpu(#resource{type = domain, res = Res}, Vcpu, Cpumap, Maplen) ->
%virDomainMigrateToURI(#resource{type = domain, res = Res}, Duri, Flags, Dname, Bandwidth) ->
%virDomainMigrate(#resource{type = domain, res = Res}, Dconn, Flags, Dname, Uri, Bandwidth) ->
%virDomainMemoryStats(#resource{type = domain, res = Res}, Stats, Nr_stats, Flags) ->
%virDomainMemoryPeek(#resource{type = domain, res = Res}, Start, Size, Buffer, Flags) ->
%virDomainLookupByUUIDString(#resource{type = connect, res = Res}) ->

virDomainLookupByUUID(#resource{type = connect, res = Res}, Uuid) when is_list(Uuid) ->
    call(virDomainLookupByUUID, [Res, Uuid]).

virDomainLookupByName(#resource{type = connect, res = Res}, Name) when is_list(Name) ->
    call(virDomainLookupByName, [Res, Name]).

virDomainLookupByID(#resource{type = connect, res = Res}, Id) when is_integer(Id) ->
    call(virDomainLookupByID, [Res, Id]).

%virDomainIsPersistent(#resource{type = domain, res = Res}) ->
%virDomainIsActive(#resource{type = domain, res = Res}) ->
%virDomainInterfaceStats(#resource{type = domain, res = Res}, Path, Stats, Size) ->

virDomainGetXMLDesc(#resource{type = domain, res = Res}, Flags) ->
    call(virDomainGetXMLDesc, [Res, Flags]).

%virDomainGetVcpus(#resource{type = domain, res = Res}, Info, Maxinfo, Cpumaps, Maplen) ->

virDomainGetUUIDString(#resource{type = domain, res = Res}) ->
    call(virDomainGetUUIDString, [Res]).

virDomainGetUUID(#resource{type = domain, res = Res}) ->
    call(virDomainGetUUID, [Res]).

virDomainGetSecurityLabel(#resource{type = domain, res = Res}) ->
    call(virDomainGetSecurityLabel, [Res]).

virDomainGetSchedulerType(#resource{type = domain, res = Res}) ->
    call(virDomainGetSchedulerType, [Res]).

virDomainGetSchedulerParameters(#resource{type = domain, res = Res}) ->
    call(virDomainGetSchedulerParameters, [Res]).

virDomainGetOSType(#resource{type = domain, res = Res}) ->
    call(virDomainGetOSType, [Res]).

virDomainGetName(#resource{type = domain, res = Res}) ->
    call(virDomainGetName, [Res]).

virDomainGetMaxVcpus(#resource{type = domain, res = Res}) ->
    call(virDomainGetMaxVcpus, [Res]).

virDomainGetMemoryParameters(#resource{type = domain, res = Res}) ->
    call(virDomainGetMemoryParameters, [Res]).

virDomainGetMaxMemory(#resource{type = domain, res = Res}) ->
    call(virDomainGetMaxMemory, [Res]).

%% struct virDomainInfo{
%%     unsigned char   state
%%     unsigned long   maxMem (Kb)
%%     unsigned long   memory (Kb)
%%     unsigned short  nrVirtCpu
%%     unsigned long long  cpuTime (nanoseconds) 
%% }
virDomainGetInfo(#resource{type = domain, res = Res}) ->
    Long = erlang:system_info({wordsize, external}),
    case call(virDomainGetInfo, [Res]) of
        {ok, <<
            State:8, % _Pad:24,
            MaxMem:Long/native-unsigned-integer-unit:8,
            Memory:Long/native-unsigned-integer-unit:8,
            NrVirtCpu:2/native-unsigned-integer-unit:8, % _Pad1:16,
            CpuTime:8/native-unsigned-integer-unit:8
            >>} ->
            #domain_info{
                state = state({domain, State}),
                maxmem = MaxMem,
                memory = Memory,
                nrvirtcpu = NrVirtCpu,
                cputime = CpuTime
            };
        Err ->
            Err
    end.

virDomainGetID(#resource{type = domain, res = Res}) ->
    call(virDomainGetID, [Res]).

virDomainGetJobInfo(#resource{type = domain, res = Res}) ->
    call(virDomainGetJobInfo, [Res]).

%virDomainGetConnect(#resource{type = domain, res = Res}) ->

virDomainGetBlockInfo(#resource{type = domain, res = Res}, Path) ->
    call(virDomainGetBlockInfo, [Res, Path]).

virDomainGetAutostart(#resource{type = domain, res = Res}) ->
    call(virDomainGetAutostart, [Res]).

%virDomainDetachDevice(#resource{type = domain, res = Res}, Xml) ->

virDomainDestroy(#resource{type = domain, res = Res}) ->
    ok(call(virDomainDestroy, [Res])).

virDomainDefineXML(#resource{type = connect, res = Res}, Xml) when is_binary(Xml); is_list(Xml) ->
    call(virDomainDefineXML, [Res, Xml]).

%virDomainCreateXML(Conn, XmlDesc, Flags) ->

virDomainCreate(#resource{type = domain, res = Res}, Flags) when is_integer(Flags) ->
    ok(call(virDomainCreate, [Res, Flags])).

%virDomainCoreDump(#resource{type = domain, res = Res}, To, Flags) ->
%virDomainBlockStats(#resource{type = domain, res = Res}, Path, Stats, Size) ->
%virDomainBlockPeek(#resource{type = domain, res = Res}, Path, Offset, Size, Buffer, Flags) ->
%virDomainAttachDevice(#resource{type = domain, res = Res}, Xml) ->


%%-------------------------------------------------------------------------
%%% Connect
%%-------------------------------------------------------------------------

virConnectOpen(Name) when is_list(Name) ->
    call(virConnectOpen, [Name]).

virConnectOpenReadOnly(Name) when is_list(Name) ->
    call(virConnectOpenReadOnly, [Name]).

%virConnectOpenAuth(Name, Auth, Flags) ->

virConnectNumOfStoragePools(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfStoragePools, [Res]).

virConnectNumOfSecrets(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfSecrets, [Res]).

virConnectNumOfNetworks(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfNetworks, [Res]).

virConnectNumOfNWFilters(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfNWFilters, [Res]).

virConnectNumOfInterfaces(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfInterfaces, [Res]).

virConnectNumOfDomains(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfDomains, [Res]).

virConnectNumOfDefinedStoragePools(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfDefinedStoragePools, [Res]).

virConnectNumOfDefinedNetworks(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfDefinedNetworks, [Res]).

virConnectNumOfDefinedInterfaces(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfDefinedInterfaces, [Res]).

virConnectNumOfDefinedDomains(#resource{type = connect, res = Res}) ->
    call(virConnectNumOfDefinedDomains, [Res]).

virConnectListStoragePools(Res) ->
    {ok, Maxnames} = virConnectNumOfStoragePools(Res),
    virConnectListStoragePools(Res, Maxnames).
virConnectListStoragePools(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListStoragePools, [Res, Maxnames]).

virConnectListSecrets(Res) ->
    {ok, Maxuuids} = virConnectNumOfSecrets(Res),
    virConnectListSecrets(Res, Maxuuids).
virConnectListSecrets(#resource{type = connect, res = Res}, Maxuuids) when is_integer(Maxuuids) ->
    call(virConnectListSecrets, [Res, Maxuuids]).

virConnectListNetworks(Res) ->
    {ok, Maxnames} = virConnectNumOfNetworks(Res),
    virConnectListNetworks(Res, Maxnames).
virConnectListNetworks(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListNetworks, [Res, Maxnames]).

virConnectListNWFilters(Res) ->
    {ok, Maxnames} = virConnectListNWFilters(Res),
    virConnectListNWFilters(Res, Maxnames).
virConnectListNWFilters(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListNWFilters, [Res, Maxnames]).

virConnectListInterfaces(Res) ->
    {ok, Maxnames} = virConnectNumOfInterfaces(Res),
    virConnectListInterfaces(Res, Maxnames).
virConnectListInterfaces(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListInterfaces, [Res, Maxnames]).

virConnectListDomains(Res) ->
    {ok, Maxids} = virConnectNumOfDomains(Res),
    virConnectListDomains(Res, Maxids).
virConnectListDomains(#resource{type = connect, res = Res}, Maxids) when is_integer(Maxids) ->
    call(virConnectListDomains, [Res, Maxids]).

virConnectListDefinedStoragePools(Res) ->
    {ok, Maxnames} = virConnectNumOfDefinedStoragePools(Res),
    virConnectListDefinedStoragePools(Res, Maxnames).
virConnectListDefinedStoragePools(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListDefinedStoragePools, [Res, Maxnames]).

virConnectListDefinedNetworks(Res) ->
    {ok, Maxnames} = virConnectNumOfDefinedNetworks(Res),
    virConnectListDefinedNetworks(Res, Maxnames).
virConnectListDefinedNetworks(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListDefinedNetworks, [Res, Maxnames]).

virConnectListDefinedInterfaces(Res) ->
    {ok, Maxnames} = virConnectNumOfDefinedInterfaces(Res),
    virConnectListDefinedInterfaces(Res, Maxnames).
virConnectListDefinedInterfaces(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListDefinedInterfaces, [Res, Maxnames]).

virConnectListDefinedDomains(Res) ->
    {ok, Maxnames} = virConnectNumOfDefinedDomains(Res),
    virConnectListDefinedDomains(Res, Maxnames).
virConnectListDefinedDomains(#resource{type = connect, res = Res}, Maxnames) when is_integer(Maxnames) ->
    call(virConnectListDefinedDomains, [Res, Maxnames]).

virConnectIsSecure(#resource{type = connect, res = Res}) ->
    bool(call(virConnectIsSecure, [Res])).

virConnectIsEncrypted(#resource{type = connect, res = Res}) ->
    bool(call(virConnectIsEncrypted, [Res])).

virConnectGetVersion(#resource{type = connect, res = Res}) ->
    case call(virConnectGetVersion, [Res]) of
        {ok, Version} ->
            {ok, version(Version)};
        Err ->
            Err
    end.

virConnectGetURI(#resource{type = connect, res = Res}) ->
    call(virConnectGetURI, [Res]).

virConnectGetType(#resource{type = connect, res = Res}) ->
    call(virConnectGetType, [Res]).

virConnectGetMaxVcpus(#resource{type = connect, res = Res}, Type) ->
    call(virConnectGetMaxVcpus, [Res, Type]).

virConnectGetLibVersion(#resource{type = connect, res = Res}) ->
    case call(virConnectGetLibVersion, [Res]) of
        {ok, Version} ->
            {ok, version(Version)};
        Error ->
            Error
    end.

virConnectGetHostname(#resource{type = connect, res = Res}) ->
    call(virConnectGetHostname, [Res]).

virConnectGetCapabilities(#resource{type = connect, res = Res}) ->
    call(virConnectGetCapabilities, [Res]).

%virConnectFindStoragePoolSources(Conn, Type, SrcSpec, Flags) ->
%virConnectDomainXMLToNative(Conn, NativeFormat, DomainXml, Flags) ->
%virConnectDomainXMLFromNative(Conn, NativeFormat, NativeConfig, Flags) ->

%virConnectCompareCPU(Conn, XmlDesc, Flags) ->

%virGetVersion(LibVer, Type, TypeVer) ->

%%-------------------------------------------------------------------------
%%% Not for use in language bindings
%%-------------------------------------------------------------------------
%#%virDomainRef(Domain)
%#%virNetworkRef(Network)
%#%virNodeDeviceRef(Dev)
%#%virResetError(Err)
%#%virResetLastError()
%#%virSaveLastError()
%#%virSecretRef(Secret)
%#%virStoragePoolRef(Pool)
%#%virStorageVolRef(Vol)
%#%virStreamRef(Stream)

%#%virCopyLastError(To)
%#%virDefaultErrorFunc(Err)
%#%virEventRegisterImpl(AddHandle, UpdateHandle, RemoveHandle, AddTimeout, UpdateTimeout, RemoveTimeout)
%#%virFreeError(Err)
%#%virGetLastError()
%#%virInitialize()
%#%virInterfaceRef(Iface)

%#%virConnectDomainEventRegister(Conn, Cb, Opaque, Freecb)
%#%virConnectDomainEventDeregister(Conn, Cb)

%#%virConnSetErrorFunc(Conn, UserData, Handler)
%#%virConnResetLastError(Conn)
%#%virConnGetLastError(Conn)
%#%virConnCopyLastError(Conn, To)
%#%virSetErrorFunc(UserData, Handler)

%#%virNetworkFree(Network)
%#%virInterfaceFree(Iface)
%#%virDomainFree(#resource{type = domain, res = Res})
%#%virConnectRef(Conn)
%#%virDomainCreateLinux(Conn, XmlDesc, Flags)

% Called by virConnectPtr dtor
%#%virConnectClose(#resource{type = connect, res = Res})


%%-------------------------------------------------------------------------
%%% NIF stubs
%%-------------------------------------------------------------------------
cast_2(Fun, [Arg1]) ->
    cast(Fun, Arg1);
cast_2(Fun, [Arg1, Arg2]) ->
    cast(Fun, Arg1, Arg2);
cast_2(Fun, [Arg1, Arg2, Arg3]) ->
    cast(Fun, Arg1, Arg2, Arg3).

cast(_,_) ->
    erlang:error(not_implemented).
cast(_,_,_) ->
    erlang:error(not_implemented).
cast(_,_,_,_) ->
    erlang:error(not_implemented).

%%-------------------------------------------------------------------------
%%% Blocking API
%%-------------------------------------------------------------------------
call(Fun, Arg) ->
    % Result is returned from the NIF
    % function, so not a tagged tuple
    case cast_2(Fun, Arg) of
        ok ->
            block();
        Error ->
            Error
    end.

block() ->
    % Message sent by the background thread
    receive
        {vert, Response} ->
            Response
    end.


%%-------------------------------------------------------------------------
%%% Internal functions
%%-------------------------------------------------------------------------
version(Version) when is_integer(Version) ->
    Major = Version div 1000000,
    Minor = Version rem 1000000 div 1000,
    Release = Version rem 1000000 rem 1000,
    {Major, Minor, Release}.

state({domain, ?VIR_DOMAIN_NOSTATE}) -> undefined;
state({domain, ?VIR_DOMAIN_RUNNING}) -> running;
state({domain, ?VIR_DOMAIN_BLOCKED}) -> blocked;
state({domain, ?VIR_DOMAIN_PAUSED}) -> paused;
state({domain, ?VIR_DOMAIN_SHUTDOWN}) -> shutdown;
state({domain, ?VIR_DOMAIN_SHUTOFF}) -> shutoff;
state({domain, ?VIR_DOMAIN_CRASHED}) -> crashed;

state({domain, undefined}) -> ?VIR_DOMAIN_NOSTATE;
state({domain, running}) -> ?VIR_DOMAIN_RUNNING;
state({domain, blocked}) -> ?VIR_DOMAIN_BLOCKED;
state({domain, paused}) -> ?VIR_DOMAIN_PAUSED;
state({domain, shutdown}) -> ?VIR_DOMAIN_SHUTDOWN;
state({domain, shutoff}) -> ?VIR_DOMAIN_SHUTOFF;
state({domain, crashed}) -> ?VIR_DOMAIN_CRASHED.

bool({ok, 0}) -> false;
bool({ok, 1}) -> true;
bool(Error) -> Error.

ok({ok, _}) -> ok;
ok(Error) -> Error.

privdir(File) ->
    filename:join([
        filename:dirname(code:which(?MODULE)),
        "..",
        "priv",
        File
    ]).

niflib() ->
    privdir(?MODULE).
