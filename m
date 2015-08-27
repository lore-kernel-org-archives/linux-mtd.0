Received: from mail-lb0-f170.google.com ([209.85.217.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUlRp-0003oL-Bi
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2015 00:53:46 +0000
Received: by lbbtg9 with SMTP id tg9so2207266lbb.1
 for <linux-mtd@lists.infradead.org>; Wed, 26 Aug 2015 17:53:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55DD015F.4070103@gmail.com>
References: <55DC55A6.4000801@gmail.com>
 <CAAEAJfA9=RaEd6VEobs53qLQTuY-w0PfYDjqA-HSY7xTq1oGTA@mail.gmail.com>
 <55DD015F.4070103@gmail.com>
Date: Wed, 26 Aug 2015 21:53:22 -0300
Message-ID: <CAAEAJfDGbS3Pde7vsHkNk8JTZOc6Hq_W0yUKVD5O18Kzt9DsLw@mail.gmail.com>
Subject: Re: Kernel Update on NAND (CM-510 Compulab)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Gabriel Dobato <dobatog@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 August 2015 at 20:59, Gabriel Dobato <dobatog@gmail.com> wrote:
> Hi Ezequiel,
>
> thanks for answering,
>
>> I'm not sure I'm following you:
>>
>> Your /dev/mtd0 is attached to a mounted UBIFS while you are erasing it?
>
>
> No, /dev/mtd0 is not attached. The device attached to UBIFS is /dev/mtd1:
>
>
> root@debug:~# dmesg|grep UBI
> UBI-0: ubi_attach_mtd_dev:default fastmap pool size: 200
> UBI-0: ubi_attach_mtd_dev:default fastmap WL pool size: 25
> UBI-0: ubi_attach_mtd_dev:attaching mtd1 to ubi0
> UBI-0: scan_all:scanning is finished
> UBI-0: autoresize:volume 0 ("ubi-image") re-sized from 3717 to 3978 LEBs
> *UBI-0: ubi_attach_mtd_dev:attached mtd1 (name "rootfs", size 508 MiB)*
> UBI-0: ubi_attach_mtd_dev:PEB size: 131072 bytes (128 KiB), LEB size: 126=
976
> bytes
> UBI-0: ubi_attach_mtd_dev:min./max. I/O unit sizes: 2048/2048, sub-page s=
ize
> 2048
> UBI-0: ubi_attach_mtd_dev:VID header offset: 2048 (aligned 2048), data
> offset: 4096
> UBI-0: ubi_attach_mtd_dev:good PEBs: 4055, bad PEBs: 9, corrupted PEBs: 0
> UBI-0: ubi_attach_mtd_dev:user volume: 1, internal volumes: 1, max. volum=
es
> count: 128
> UBI-0: ubi_attach_mtd_dev:max/mean erase counter: 0/0, WL threshold: 4096=
,
> image sequence number3
> UBI-0: ubi_attach_mtd_dev:available PEBs: 0, total reserved PEBs: 4055, P=
EBs
> reserved for bad PE1
> UBI-0: ubi_thread:background thread "ubi_bgt0d" started, PID 35
> UBIFS: background thread "ubifs_bgt0_0" started, PID 79
> UBIFS: mounted UBI device 0, volume 0, name "ubi-image"
> UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048
> bytes/2048 bytes
> UBIFS: FS size: 503713792 bytes (480 MiB, 3967 LEBs), journal size 902348=
8
> bytes (8 MiB, 72 LEBs)
> UBIFS: reserved for root: 0 bytes (0 KiB)
> UBIFS: media format: w4/r0 (latest is w4/r0), UUID
> CD52ABF3-9554-41F6-9C4A-160915DAB4F2, small Ll
>
>
>
> I have 2 MTD partitions to flash kernel and RootFS on NAND:
>
> /dev/mtd0 ---> Kernel (uImage)
> /dev/mtd1 ---> Rootfs (ubi image)
>
>
> If I try to erase /dev/mtd0 using an older kernel (2.6), I have no proble=
m,
> I am able to update the kernel on /dev/mtd0 using "flash_erase" and
> "nandwrite", without errors. But if I try the same with kernel version 3.=
19,
> I get this:
>
>
> flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please us=
e
> it
> Erasing 128 Kibyte @ 11040000 -- 53 % complete flash_erase: Skipping bad
> block at 11060000
> Erasing 128 Kibyte @ 1f5c0000 -- 97 % completeUBIFS error (pid 26):
> check_lpt_type: invalid type0
> Erasing 128 KiUBIFS error (pid 26): make_reservation: cannot reserve 282
> bytes in jhead 2, error2
> byte @ 1f5e0000 UBIFS error (pid 26): do_writepage: cannot write page 252=
 of
> inode 1365, error -2
> Erasing 128 Kibyte @ 1f640000 UBIFS error (pid 26): make_reservation: can=
not
> reserve 160 bytes i0
> -- 98 % completeUBIFS error (pid 26): ubifs_write_inode: can't write inod=
e
> 1365, error -30
> Erasing 128 KiUBIFS error (pid 26): make_reservation: cannot reserve 160
> bytes in jhead 1, error0
> byte @ 1f660000 UBIFS error (pid 26): ubifs_write_inode: can't write inod=
e
> 1366, error -30
> Erasing 128 Kibyte @ 1fee0000 -- 99 % complete flash_erase: Skipping bad
> block at 1ff00000
> flash_erase: Skipping bad block at 1ff20000
> flash_erase: Skipping bad block at 1ff40000
> flash_erase: Skipping bad block at 1ff60000
> flash_erase: Skipping bad block at 1ff80000
> flash_erase: Skipping bad block at 1ffa0000
> flash_erase: Skipping bad block at 1ffc0000
> flash_erase: Skipping bad block at 1ffe0000
> Erasing 128 Kibyte @ 1ffe0000 -- 100 % complete
> root@debug:~# UBIFS error (pid 26): make_reservation: cannot reserve 160
> bytes in jhead 1, error0
> UBIFS error (pid 26): ubifs_write_inode: can't write inode 1357, error -3=
0
>
>
> I have applied the different mtd tests and everything looks right...
>

Hmmm.. this looks odd indeed.

Can you run two nandtests simultaneously (in parallel)
on the two /dev/mtd devices?

If you share your kernel configuration, I can give it a try
on some (similar) board.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
