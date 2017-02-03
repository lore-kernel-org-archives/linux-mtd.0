Received: from mail-ot0-f173.google.com ([74.125.82.173])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZaDC-00069T-S2
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 09:31:25 +0000
Received: by mail-ot0-f173.google.com with SMTP id f9so10331822otd.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 01:31:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d11de80d-7136-4113-d43f-dcb024f8c4ee@nod.at>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
 <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
 <CAMBC=j6t2h_yB3wQbNUexrJto+O3ruTXo992JWFLH293OyH0Bg@mail.gmail.com>
 <10f4c447-f1e5-89dc-17b6-b5d450a473fe@nod.at>
 <CAMBC=j5nyA=7vCb_AeM_oYAS+p_+mrcG=nwXVDO6WqD=Sg_nMg@mail.gmail.com>
 <CAMBC=j74mtCsatQnhOLfouA6d58VCd69YY9W8c=Soa8CiCtTFA@mail.gmail.com>
 <d11de80d-7136-4113-d43f-dcb024f8c4ee@nod.at>
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Fri, 3 Feb 2017 15:00:00 +0530
Message-ID: <CAMBC=j7-2R-98Ddh=8NrNmUOyah3pUpETkx2G4Mx_S0sJomW-g@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,
I've taken the UBIFS changes backported to 3.2 kernel from
git://git.infradead.org/users/dedekind/ubifs-v3.2.git. With these
changes , the frequency of the root-filesystem mount failure is
reduced but it is seen some times. One thing I noticed is that
root-filesystem mount failures are seen when the prior reboot
encountered errors during un-mounting root filesystem. I modified the
UBIFS error debug print by adding the process name along with pid.

 Below are the excerpt of the errors seen during reboots

UBIFS error (pid 9515, process umount): dbg_check_space_info: free
space changed from 14128638 to 14743030
UBIFS assert failed in reserve_space at 125 (pid 9529)
UBIFS assert failed in ubifs_write_begin at 436 (pid 9529)
[  234.725204] Backtrace:
[  234.725217] [<c40113a0>] (dump_backtrace+0x0/0x110) from
[<c44120e8>] (dump_stack+0x18/0x1c)
[  234.725224]  r6:e5470120 r5:e5470060 r4:002bb000 r3:00000000
[  234.725239] [<c44120d0>] (dump_stack+0x0/0x1c) from [<c417d024>]
(ubifs_write_begin+0x9c/0x498)
[  234.725251] [<c417cf88>] (ubifs_write_begin+0x0/0x498) from
[<c40a5bc4>] (generic_file_buffered_write+0xe0/0x234)
[  234.725264] [<c40a5ae4>] (generic_file_buffered_write+0x0/0x234)
from [<c40a7794>] (__generic_file_aio_write+0x3fc/0x440)
[  234.725276] [<c40a7398>] (__generic_file_aio_write+0x0/0x440) from
[<c40a7844>] (generic_file_aio_write+0x6c/0xd0)
[  234.725288] [<c40a77d8>] (generic_file_aio_write+0x0/0xd0) from
[<c417c7a8>] (ubifs_aio_write+0x16c/0x180)
[  234.725296]  r8:e653b000 r7:e4cc9f78 r6:e4cc9ea8 r5:e5470060 r4:e609f800
[  234.725313] [<c417c63c>] (ubifs_aio_write+0x0/0x180) from
[<c40d72ac>] (do_sync_write+0xa0/0xe0)
[  234.725325] [<c40d720c>] (do_sync_write+0x0/0xe0) from [<c40d7c00>]
(vfs_write+0xbc/0x148)
[  234.725331]  r5:00300000 r4:e609f800
[  234.725342] [<c40d7b44>] (vfs_write+0x0/0x148) from [<c40d7e8c>]
(sys_write+0x48/0x74)
[  234.725349]  r8:c400dd44 r7:00000004 r6:00300000 r5:4039b008 r4:e609f800
[  234.725366] [<c40d7e44>] (sys_write+0x0/0x74) from [<c400dbc0>]
(ret_fast_syscall+0x0/0x30)
[  234.725372]  r6:4039b008 r5:00000001 r4:0008426c

Subsequently during the boot , the root filesystem mount is failing,
below is excerpt from the logs:-

[   10.090852] UBIFS error (pid 1, process swapper/0):
ubifs_check_node: bad CRC: calculated 0xb4b7338e, read 0xe5385648
[   10.101515] UBIFS error (pid 1, process swapper/0):
ubifs_check_node: bad node at LEB 499:98208
[   10.372656] UBIFS error (pid 1, process swapper/0): ubifs_scan: bad node
[   10.379386] UBIFS error (pid 1, process swapper/0):
ubifs_scanned_corruption: corruption at LEB 499:98208
[   10.388988] UBIFS error (pid 1, process swapper/0):
ubifs_scanned_corruption: first 8192 bytes from LEB 499:98208
[   10.403113] UBIFS error (pid 1, process swapper/0): ubifs_scan: LEB
499 scanning failed
[   10.411213] UBIFS: background thread "ubifs_bgt0_0" stops
[   10.467214] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
[   10.474287] Please append a correct "root=" boot option; here are
the available partitions:
[   10.482683] 1f00             512 mtdblock0  (driver?)
[   10.487774] 1f01             512 mtdblock1  (driver?)
[   10.492855] 1f02             128 mtdblock2  (driver?)
[   10.497942] 1f03            8192 mtdblock3  (driver?)
[   10.503022] 1f04           94208 mtdblock4  (driver?)
[   10.508110] 1f05             128 mtdblock5  (driver?)
[   10.513190] 1f06            8192 mtdblock6  (driver?)
[   10.518280] 1f07           94208 mtdblock7  (driver?)
[   10.523360] 1f08             128 mtdblock8  (driver?)
[   10.528449] 1f09            2048 mtdblock9  (driver?)
[   10.533529] 1f0a           12288 mtdblock10  (driver?)
[   10.538702] 1f0b           32768 mtdblock11  (driver?)
[   10.543868] 1f0c            2048 mtdblock12  (driver?)
[   10.549048] 1f0d             128 mtdblock13  (driver?)
[   10.554215] 1f0e             512 mtdblock14  (driver?)
[   10.559391] 1f0f             128 mtdblock15  (driver?)
[   10.564559] 1f10             128 mtdblock16  (driver?)
[   10.569735] 1f11              64 mtdblock17  (driver?)
[   10.574901] 1f12              64 mtdblock18  (driver?)
[   10.580074] 1f13              64 mtdblock19  (driver?)
[   10.585240] 0800         3915776 sda  driver: sd
[   10.589895]   0801         3914752 sda1 00000000-0000-0000-0000-000000000000
[   10.596979] 1f14           84320 mtdblock20  (driver?)
[   10.602155] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

Can the relation between erroneous reboot followed by unsuccessful
boot give us any insight ?

Thanks
Chaitanya




On Thu, Jan 26, 2017 at 2:12 PM, Richard Weinberger <richard@nod.at> wrote:
> Chaitanya,
>
> Am 23.01.2017 um 11:48 schrieb chaitanya vinnakota:
>> Hi Richard,
>>
>> We are seeing UBIFS errors even when the root-filesystem  is mounted
>> read-only. But , the error is reported only once.
>> Our test scenario is we are rebooting the device by calling "reboot"
>> from a script ,  during data-write operations to the mtd partitions
>> other than root-filesystem executed by another script.
>>
>> What's more baffling is why root-filesystem UBIFS errors are seen when
>> the data-write operations are  performed on the other partitions and
>> most importantly when rootfs is mounted read-only,
>>
>> [  155.121005] UBIFS error (pid 5040): ubifs_decompress: cannot
>> decompress 2434 bytes, compressor zlib, error -22
>
> The compressor fails to uncompress because the payload is corrupted.
> This can be due to a driver bug, not strong enough ECC, etc..
>
>> [  155.121017] UBIFS error (pid 5040): read_block: bad data node
>> (block 60, inode 3484)
>> [  155.121026] UBIFS error (pid 5040): do_readpage: cannot read page
>> 60 of inode 3484, error -22
>>
>> ECC errors are also observed sometimes when the rootfs is mounted read-only
>>
>> [  154.824361] ECC: uncorrectable error 2 !!!
>> [  154.824368] ECC correction failed for page 0x00014b58
>> [  154.825474] ECC: uncorrectable error 2 !!!
>> [  154.825479] ECC correction failed for page 0x00014b58
>> [  154.825604] UBI warning: ubi_io_read: error -74 (ECC error) while
>
> Here we have a classic ECC error. This should not happen on fresh
> NANDs.
>
>> reading 188 bytes from PEB 451:50368, read only 188 bytes, retry
>>
>> The page 0x00014b58 falls in the rootfs partition. But , nanddump
>> utility is not reporting any bad blocks from the rootfs partition .
>>
>>  ~# nanddump /dev/mtd4
>> nanddump: warning!: you did not specify a default bad-block handling
>>   method. In future versions, the default will change to
>>   --bb=skipbad. Use "nanddump --help" for more information.
>> nanddump: warning!: in next release, nanddump will not dump OOB
>>   by default. Use `nanddump --oob' explicitly to ensure
>>   it is dumped.
>> ECC failed: 0
>> ECC corrected: 0
>> Number of bad blocks: 0
>> Number of bbt blocks: 0
>>
>>  We ran mtd and ubi tests , mtd all tests passed but UBI one test i.e
>> io_basic failed.
>>
>> Can you please help us in this regard. Any inputs or suggestions ?
>
> This is not easy. I suggest to double check all NAND/MTD settings from
> group up. Timings, ECC strength, basic driver testing...
>
> Thanks,
> //richard
