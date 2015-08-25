Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUO89-0004ZA-Re
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 23:59:54 +0000
Received: by widdq5 with SMTP id dq5so30484963wid.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 16:59:32 -0700 (PDT)
Message-ID: <55DD015F.4070103@gmail.com>
Date: Wed, 26 Aug 2015 01:59:27 +0200
From: Gabriel Dobato <dobatog@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel Update on NAND (CM-510 Compulab)
References: <55DC55A6.4000801@gmail.com>
 <CAAEAJfA9=RaEd6VEobs53qLQTuY-w0PfYDjqA-HSY7xTq1oGTA@mail.gmail.com>
In-Reply-To: <CAAEAJfA9=RaEd6VEobs53qLQTuY-w0PfYDjqA-HSY7xTq1oGTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

thanks for answering,

> I'm not sure I'm following you:
>
> Your /dev/mtd0 is attached to a mounted UBIFS while you are erasing it?

No, /dev/mtd0 is not attached. The device attached to UBIFS is /dev/mtd1:


root@debug:~# dmesg|grep UBI
UBI-0: ubi_attach_mtd_dev:default fastmap pool size: 200
UBI-0: ubi_attach_mtd_dev:default fastmap WL pool size: 25
UBI-0: ubi_attach_mtd_dev:attaching mtd1 to ubi0
UBI-0: scan_all:scanning is finished
UBI-0: autoresize:volume 0 ("ubi-image") re-sized from 3717 to 3978 LEBs
*UBI-0: ubi_attach_mtd_dev:attached mtd1 (name "rootfs", size 508 MiB)*
UBI-0: ubi_attach_mtd_dev:PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI-0: ubi_attach_mtd_dev:min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI-0: ubi_attach_mtd_dev:VID header offset: 2048 (aligned 2048), data offset: 4096
UBI-0: ubi_attach_mtd_dev:good PEBs: 4055, bad PEBs: 9, corrupted PEBs: 0
UBI-0: ubi_attach_mtd_dev:user volume: 1, internal volumes: 1, max. volumes count: 128
UBI-0: ubi_attach_mtd_dev:max/mean erase counter: 0/0, WL threshold: 4096, image sequence number3
UBI-0: ubi_attach_mtd_dev:available PEBs: 0, total reserved PEBs: 4055, PEBs reserved for bad PE1
UBI-0: ubi_thread:background thread "ubi_bgt0d" started, PID 35
UBIFS: background thread "ubifs_bgt0_0" started, PID 79
UBIFS: mounted UBI device 0, volume 0, name "ubi-image"
UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS: FS size: 503713792 bytes (480 MiB, 3967 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
UBIFS: reserved for root: 0 bytes (0 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID CD52ABF3-9554-41F6-9C4A-160915DAB4F2, small Ll



I have 2 MTD partitions to flash kernel and RootFS on NAND:

/dev/mtd0 ---> Kernel (uImage)
/dev/mtd1 ---> Rootfs (ubi image)


If I try to erase /dev/mtd0 using an older kernel (2.6), I have no problem, I am able to update the kernel on /dev/mtd0 using "flash_erase" and "nandwrite", without errors. But if I try the same with kernel version 3.19, I get this:


flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use it
Erasing 128 Kibyte @ 11040000 -- 53 % complete flash_erase: Skipping bad block at 11060000
Erasing 128 Kibyte @ 1f5c0000 -- 97 % completeUBIFS error (pid 26): check_lpt_type: invalid type0
Erasing 128 KiUBIFS error (pid 26): make_reservation: cannot reserve 282 bytes in jhead 2, error2
byte @ 1f5e0000 UBIFS error (pid 26): do_writepage: cannot write page 252 of inode 1365, error -2
Erasing 128 Kibyte @ 1f640000 UBIFS error (pid 26): make_reservation: cannot reserve 160 bytes i0
-- 98 % completeUBIFS error (pid 26): ubifs_write_inode: can't write inode 1365, error -30
Erasing 128 KiUBIFS error (pid 26): make_reservation: cannot reserve 160 bytes in jhead 1, error0
byte @ 1f660000 UBIFS error (pid 26): ubifs_write_inode: can't write inode 1366, error -30
Erasing 128 Kibyte @ 1fee0000 -- 99 % complete flash_erase: Skipping bad block at 1ff00000
flash_erase: Skipping bad block at 1ff20000
flash_erase: Skipping bad block at 1ff40000
flash_erase: Skipping bad block at 1ff60000
flash_erase: Skipping bad block at 1ff80000
flash_erase: Skipping bad block at 1ffa0000
flash_erase: Skipping bad block at 1ffc0000
flash_erase: Skipping bad block at 1ffe0000
Erasing 128 Kibyte @ 1ffe0000 -- 100 % complete
root@debug:~# UBIFS error (pid 26): make_reservation: cannot reserve 160 bytes in jhead 1, error0
UBIFS error (pid 26): ubifs_write_inode: can't write inode 1357, error -30


I have applied the different mtd tests and everything looks right...





El 25.08.2015 a las 17:08, Ezequiel Garcia escribió:
> +mtd folks
>
> On 25 August 2015 at 08:46, Gabriel Dobato <dobatog@gmail.com> wrote:
>> Hi Ezequiel,
>>
>> Sorry for disturbing you again. I contacted you when I was trying to set the
>> Nand driver ( pxa3xx_nand) with Device Tree on 3.19 Kernel Version for
>> Compulab CM-510 platform. Until now, it has worked right, I have made some
>> MTD tests and everything is OK.
>>
>> But now, I would like to update the kernel (/dev/mtd0), while the system is
>> working on NAND. If I try it, I get some UbiFS Errors:
>>
>>
>> root@debug:~# flash_eraseall /dev/mtd0
>> flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use
>> it
>> Erasing 128 Kibyte @ f20000UBIFS error (pid 2679): ubifs_read_node: bad node
>> type (255 but expected 2)
>> 0 -- 47 % compleUBIFS error (pid 2679): ubifs_read_node: bad node at LEB
>> 1055:59640, LEB mapping status 1
>> Erasing 128 Not a node, first 24 bytes:Kibyte @ f220000
>>   -- 47 % complet00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ff ff ff ff ff ff ff                          ........................
>> Erasing 128 KibyUBIFS error (pid 2681): ubifs_read_node: bad node type (255
>> but expected 2)
>> te @ f2a0000 -- UBIFS error (pid 2681): ubifs_read_node: bad node at LEB
>> 1055:34096, LEB mapping status 1
>> ENot a node, first 24 bytes:rasing 128 Kibyt
>> e @ f2c0000 -- 400000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ff ff ff ff ff ff ff                          ........................
>> Erasing 128 Kibyte @ f300000 -- 47 UBIFS error (pid 2679): ubifs_read_node:
>> bad node type (255 but expected 0)
>> ErasUBIFS error (pid 2679): ubifs_read_node: bad node at LEB 1550:41016, LEB
>> mapping status 1
>> ing 128 Kibyte @Not a node, first 24 bytes: f320000 -- 47 %
>> Erasi00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ff ff ff ff                          ........................
>> ng 128 Kibyte @ UBIFS error (pid 2679): ubifs_iget: failed to read inode
>> 16299, error -22
>> Erasing 128 Kibyte @ fUBIFS error (pid 2679): ubifs_lookup: dead directory
>> entry 'sendmail', error -22
>> Erasing 128 Kibyte @ 11040000 -- 53 % complete flash_erase: Skipping bad
>> block at 11060000
>> Erasing 128 Kibyte @ 1fee0000 -- 99 % complete flash_erase: Skipping bad
>> block at 1ff00000
>> flash_erase: Skipping bad block at 1ff20000
>> flash_erase: Skipping bad block at 1ff40000
>> flash_erase: Skipping bad block at 1ff60000
>> flash_erase: Skipping bad block at 1ff80000
>> flash_erase: Skipping bad block at 1ffa0000
>> flash_erase: Skipping bad block at 1ffc0000
>> flash_erase: Skipping bad block at 1ffe0000
>> Erasing 128 Kibyte @ 1ffe0000 -- 100 % complete
>>
>>
>> However if I try it from another space (SD-CARD) it works as expected.
>>
>> If you have a litle time, just to give me a direction in order to find out
>> where the problem is, I really apreciate.
> I'm not sure I'm following you:
>
> Your /dev/mtd0 is attached to a mounted UBIFS while you are erasing it?
>
