Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eP1k2-0008W4-FG
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 07:46:12 +0000
Subject: Re: Mounting issue with old uboot and new rootfs
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <c08a36e5-10ac-29ae-46d7-d598068dd897@nedap.com>
 <1513004605320.75417@nedap.com> <2249046.8pz4TdecgU@blindfold>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <a9bb7f99-d877-ccf8-8918-25d8ce91baa0@nedap.com>
Date: Wed, 13 Dec 2017 08:45:44 +0100
MIME-Version: 1.0
In-Reply-To: <2249046.8pz4TdecgU@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12-12-17 17:29, Richard Weinberger wrote:
> Jaap,
> 
> Am Montag, 11. Dezember 2017, 16:03:25 CET schrieb Jaap de Jong:
>> Hi All,
>>
>> Some time ago I posted a question with a slightly different subject.
>> Now that I found out a bit more the previous subject is no longer relevant.
>>
>> But I still have issues with mounting in a mixed environment.
>> I have this board with an older u-boot (2010.09) in combination with a more
>> recent kernel (4.9.28).
>>
>> The parameters in uboot:
>>          root=ubi0 rw ubi.mtd=3 rootfstype=ubifs
>>         
>> mtdparts=atmel_nand:128K(bootstrap),256K(u-boot-env),640K(u-boot),-(rootfs)
>>
>> U-boot runs `ubi part rootfs` as one of the steps in the startup process to
>> load the kernel. When doing that u-boot reports that the ubi volume is
>> resized. This is due to the fact that the rootfs is written with the u-boot
>> `nand write` command, writing a ubi formatted image.
>>
>> When booting the unit the kernel panics:
>>          [    1.523437] ubi0 error: ubi_read_volume_table: the layout volume
>> was not found [    1.539062] ubi0 error: ubi_attach_mtd_dev: failed to
>> attach mtd3, error -22 [    1.546875] UBI error: cannot attach mtd3
>>          [    1.546875] Kernel panic - not syncing: VFS: Unable to mount root
>> fs on unknown-block(0,0) [    1.546875] Rebooting in 1 seconds..RomBOOT
>> Then u-boot restarts and tells:
>>          UBI warning: process_lvol: volume table copy #1 is corrupted
>>          UBI: create volume table (copy #1)
>>          UBI: volume table was restored
>> But is able to load the kernel and transfer control to it.
>> This second run of this kernel does not panic anymore and just starts as
>> expected! Also, new reboots don't show u-boot issues!
>>
>> Some other combinations:
>>          u-boot        kernel        result
>>          2010.09     2.6.35        fine
>>          2010.09     4.9.28        panic
>>          2016.03     2.6.35        fine
>>          2016.03     4.9.28        fine
>>
>> One thing that I noticed is that the newer u-boot resizes to around 40 less
>> LEBs than the older u-boot does. Related?
> 
> Resize? Or missing?
> This is definitely odd and should not happen.
Below the output of the old uboot when doing its `ubi part rootfs` on a 
new freshly flashed ubi root file system:
- resizing the volume

     Creating 1 MTD partitions on "nand0":
     0x000000100000-0x000020000000 : "mtd=3"
     UBI: attaching mtd1 to ubi0
     UBI: physical eraseblock size:   131072 bytes (128 KiB)
     UBI: logical eraseblock size:    129024 bytes
     UBI: smallest flash I/O unit:    2048
     UBI: sub-page size:              512
     UBI: VID header offset:          512 (aligned 512)
     UBI: data offset:                2048
     UBI: volume 0 ("my-rootfs") re-sized from 933 to 4042 LEBs
     UBI: attached mtd1 to ubi0
     UBI: MTD device name:            "mtd=3"
     UBI: MTD device size:            511 MiB
     UBI: number of good PEBs:        4086
     UBI: number of bad PEBs:         2
     UBI: max. allowed volumes:       128
     UBI: wear-leveling threshold:    4096
     UBI: number of internal volumes: 1
     UBI: number of user volumes:     1
     UBI: available PEBs:             0
     UBI: total number of reserved PEBs: 4086
     UBI: number of PEBs reserved for bad PEB handling: 40
     UBI: max/mean erase counter: 1/0

Then the kernel panics with this, causing a reboot.
During that new startup, the old uboot again shows an interesting error:
- volume table #1 corruption

     Creating 1 MTD partitions on "nand0":
     0x000000100000-0x000020000000 : "mtd=3"
     UBI: attaching mtd1 to ubi0
     UBI: physical eraseblock size:   131072 bytes (128 KiB)
     UBI: logical eraseblock size:    129024 bytes
     UBI: smallest flash I/O unit:    2048
     UBI: sub-page size:              512
     UBI: VID header offset:          512 (aligned 512)
     UBI: data offset:                2048
     UBI warning: process_lvol: volume table copy #1 is corrupted
     UBI: create volume table (copy #1)
     UBI: volume table was restored
     UBI: attached mtd1 to ubi0
     UBI: MTD device name:            "mtd=3"
     UBI: MTD device size:            511 MiB
     UBI: number of good PEBs:        4086
     UBI: number of bad PEBs:         2
     UBI: max. allowed volumes:       128
     UBI: wear-leveling threshold:    4096
     UBI: number of internal volumes: 1
     UBI: number of user volumes:     1
     UBI: available PEBs:             0
     UBI: total number of reserved PEBs: 4086
     UBI: number of PEBs reserved for bad PEB handling: 40
     UBI: max/mean erase counter: 1/0

The kernel does not panic and boots as to be expected, but dmesg shows 
two interesting message (only the ubi messages):
- volume table #2 corruption
- peb reservation

     ubi0: default fastmap pool size: 200
     ubi0: default fastmap WL pool size: 100
     ubi0: attaching mtd3
     ubi0: scanning is finished
     ubi0 warning: ubi_read_volume_table: volume table copy #2 is corrupted
     ubi0: volume table was restored
     ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB 
handling, reserved 35, need 75
     ubi0: attached mtd3 (name "rootfs", size 511 MiB)
     ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
     ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
     ubi0: VID header offset: 512 (aligned 512), data offset: 2048
     ubi0: good PEBs: 4083, bad PEBs: 5, corrupted PEBs: 0
     ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
     ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image 
sequence number: 1296107501
     ubi0: available PEBs: 0, total reserved PEBs: 4083, PEBs reserved 
for bad PEB handling: 35
     ubi0: background thread "ubi_bgt0d" started, PID 94

Things are settled after this


> 
> Thanks,
> //richard
> 
