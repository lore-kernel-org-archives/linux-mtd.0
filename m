Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUHcX-0007Io-74
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 10:03:26 +0000
Message-ID: <4A6986FC.6070006@nokia.com>
Date: Fri, 24 Jul 2009 13:03:40 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: UBIFS robustness questions
References: <200907241600.54640.manningc2@actrix.gen.nz>
	<4A695819.7000705@nokia.com> <4A697DCC.2010302@nokia.com>
In-Reply-To: <4A697DCC.2010302@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Hunter Adrian (Nokia-D/Helsinki) wrote:
>> Charles Manning wrote:
>>> This is probably documented somewhere but I could not find it...
>>>
>>> What operations in UBIFS are robust to power failure and which are not?
>> Only sync operations guarantee that changes have reached the flash.
>> There are all the usual ways to sync:
>> 	fsync/fdatasync a file/directory
>> 	open a file as synchronous
>> 	mark a file with the sync flag
>> 	sync the filesystem
>> 	mount the file system as synchronous
>>
>>> I know for example that writing a file into flash does not mean it has been 
>>> completely written to flash until after a sync, but what about other 
>>> operations such as mv?
>> After mv, the containing directory must be sync'd to be sure the change reaches the
>> flash.  But rename is atomic so there will always be either the old
>> naming or the new naming
>>
>>> The reasonn I'm asking this is that I want to be able to "hot-swap" a 
>>> directory of files without losing any file state.
>> Should be no problem if you sync correctly.
>>
>>> What I'm considerings doing is something like:
>>>
>>> Start with ~/runtime having a sane set of files
>>>
>>> untar etc into ~/updated
>>> sync
>>> mv ~/updated ~/run-time
>>> sync
>>>
>>> What is unacceptable is that, at any time, a power failure/reboot results in 
>>> ~/runtime having a non-sane set of files.
>>>
>>> * Does the above sequence look safe?
>> Yes
> 
> Well, safe but not possible. You cannot rename over the top
> of a non-empty directory. Sorry I was misleading.

Sorry to drag this out but it seems like it can be done with symlinks

e.g.

/ # mkdir test
/ # cd test
/test # mkdir version1
/test # mkdir version2
/test # echo "This is version 1" > version1/afile
/test # echo "This is version 2" > version2/afile
/test # ln -s version1 current
/test # ln -s version2 next                                                                              
/test # cat current/afile                                                                                
This is version 1                                                                                        
/test # cat next/afile                                                                                   
This is version 2                                                                                        
/test # mv -T next current
/test # ls -al
drwxr-xr-x    4 root     root          432 Jan  2 01:57 .
drwxrwxrwx   25 root     root         1704 Jan  2 01:44 ..
lrwxrwxrwx    1 root     root            8 Jan  2 01:46 current -> version2
-rwxr-xr-x    1 root     root       261307 Jul 24  2009 mv
drwxr-xr-x    2 root     root          224 Jan  2 01:47 version1
drwxr-xr-x    2 root     root          224 Jan  2 01:45 version2
/test # cat current/afile
This is version 2
/test # 


Note that busybox's 'mv' does not support the -T option

>>> * Is the second sync required?
>> It is required to guarantee that the mv has reached the flash at that
>> point in time i.e. power loss before the second sync => same as if mv
>> was not done
> 
