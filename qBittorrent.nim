#initialize a session
proc initQb(url: string; username: string; password: string): Qb

#login to QBittorrent WebAPI with credentials provided
proc login(self: var Qb): bool {.raises: [OSError, SslError, ValueError, Exception, HttpRequestError, IOError, Defect, TimeoutError, ProtocolError, KeyError], tags: [
 ReadIOEffect, WriteIOEffect, TimeEffect, RootEffect].}

 #logout of current session
 proc logout(self: var Qb): bool {.raises: [KeyError, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, Exception, TimeoutError, ProtocolError], tags: [
 ReadIOEffect, WriteIOEffect, TimeEffect, RootEffect].}

 #return version of the Qbitorrent  client
 proc getVersion(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [
 RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#returns JSON of build information for Qbittorrents libraries
proc getBuildInfo(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [
 RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

 #returns all preferences of the QBittorrent instance
 proc getPreferences(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [
 RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

 #get the logs from the current Qt instance
 proc getMainLog(self: Qb; normal = false; info = false; warning = true; critical = true;
 last_known_id = -1): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#get peer logs from the current Qt instance. timeframe can be set by filling last_known_id with an integer field different than -1
proc getPeerLog(self: Qb; last_known_id = -1): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Returns the default savepath of the Qbittorrent instance
proc getDefaultSavePath(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#if no lastrid is provided, lastrid 0 will be assumed. If the given rid is different from the one of last server reply, full_update will be true
proc getSyncMainData(self: Qb; lastrid = 0): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#get global transfer info like seen in the client's statusbar
proc getGlobalTransferData(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Returns true if speedlimit mode is activated, otherwise it returns false
proc isSpeedLimitMode(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [
 RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#toggles the speedlimit switch, true=false and false=true
proc toggleSpeedLimitMode(self: Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#gets the current global download limit. if zero is returned, no download limit is set. returns bytes/sec
proc getGlobalDownloadLimit(self: var Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#sets global download limit. please note that the limit must be in bytes/sec
proc setGlobalDownloadLimit(self: Qb; limit: int = 0): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#gets the current global upload limit. if 0 is returned, no download limit is set, returns bytes/sec
proc getGlobalUploadLimit(self: var Qb): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#sets the global download limit. Please note that the limit must be in bytes/sec
proc setGlobalUploadLimit(self: Qb; limit: int = 0): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#gets a list of torrents
proc getTorrents(self: Qb; filter = "all"; category = ""; sort = ""; reverse = false;
 limit = 0; offset = 0; hashes: seq[string] = @[]): JsonNode {.raises: [
 KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#returns the properties of the torrent provided via its hash. you can get the torrent hash by calling gettorrents procedure
proc getTorrentProperties(self: Qb; hash: string): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#returns tracker information of the torrent provided via its hash. you can get the torrent hash by calling getTorrents procedure
proc getTorrentTrackers(self: Qb; hash: string = ""): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#returns the webseeds of the torrent provided via it's hash. you can get the torrent hash by calling getTorrents procedure
proc getTorrentWebSeeds(self: Qb; hash: string = ""): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#returns the states of the pieces of the torrent provided via it's hash. You can get the torrent hash by calling getTorrents procedure. 0:not downloaded yet. 1:Now downloading. 2:already downloaded
proc getTorrentPiecesState(self: Qb; hash: string = ""): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Returns the hashes of pieces of the torrent provided via it's hash. You can get the torrent hash by calling getTorrents procedure.
proc getTorrentPiecesHashes(self: Qb; hash: string = ""): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Pauses the download/upload of torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure.
proc setTorrentsPaused(self: Qb; hashes: seq[string]): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Resumes the download/upload of torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure.
proc setTorrentsResumed(self: Qb; hashes: seq[string]): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Returns a list of the files included in the torrent with the provided hash.
proc getTorrentFiles(self: Qb; hash: string = ""): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Deletes the torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure. if deleteFiles is set to true, the physical files in the download path will be deleted.
proc deleteTorrents(self: Qb; hashes: seq[string]; deleteFiles = false): JsonNode {.raises: [
 KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Rechecks the torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure.
proc torrentsRecheck(self: Qb; hashes: seq[string]): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Increases the priority of torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure.
proc torrentsIncreasePriority(self: Qb; hashes: seq[string]): JsonNode {.raises: [
 KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#Resumes the download/upload of torrents with the provided hashes. Requires knowing the torrents hashes. You can get it from getTorrents procedure.
proc torrentsReannounce(self: Qb; hashes: seq[string]): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#proc banPeers 
proc banPeers(self: Qb; peers: seq[string]): JsonNode {.raises: [KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}

#proc deleteTorrents
proc deleteTorrents(self: Qb; hashes: seq[string]; delFiles = false): JsonNode {.raises: [
 KeyError, Exception, ValueError, OSError, HttpRequestError, SslError, IOError, Defect, TimeoutError, ProtocolError], tags: [RootEffect, ReadIOEffect, WriteIOEffect, TimeEffect].}
