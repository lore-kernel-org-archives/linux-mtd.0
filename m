Received: from www.paytv.ru ([213.234.235.99] helo=ns.okbsapr.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKtWJ-00068M-E9
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2004 03:07:29 -0400
Received: from skorinko ([192.168.1.229])
	by ns.okbsapr.ru (8.9.3/8.9.3) with ESMTP id LAA17932
	for <linux-mtd@lists.infradead.org>; Fri, 22 Oct 2004 11:14:22 GMT
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Fri, 22 Oct 2004 11:12:48 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200410221112.48246.skorinkod@mosk.ru>
Subject: anybody!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey, people!!!
Maybe anybody help me??

My problems:
1) I have no NFTL layer with my flash, even after nftl_format
2) Last cvs tree don't work with my flash at all

These problems are not interesting for you???

Dmitry


> I have:
> 1) DiskOnChip 2000 256Mb
> 2) 2.6.8.1 kernel source (2.6.8-7 Debian edition)
> 3) todays cvs tree of mtd drivers
>
> + this patch from Kalev Lember, but for last diskonchip.c file:
>
> RCS file: /home/cvs/mtd/drivers/mtd/nand/diskonchip.c,v
> retrieving revision 1.38
> diff -u -r1.38 diskonchip.c
> --- diskonchip.c =A0 =A0 =A0 =A05 Oct 2004 22:11:46 -0000 =A0 =A0 =A0 1.38
> +++ diskonchip.c =A0 =A0 =A0 =A011 Oct 2004 12:58:01 -0000
> @@ -1409,13 +1409,9 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> =A0 =A0 =A0 =A0 memset((char *) parts, 0, sizeof(parts));
> =A0 =A0 =A0 =A0 numparts =3D inftl_partscan(mtd, parts);
> - =A0 =A0 =A0 /* At least for now, require the INFTL Media Header. =A0We =
could
> probably
> - =A0 =A0 =A0 =A0 =A0do without it for non-INFTL use, since all it gives =
us is
> - =A0 =A0 =A0 =A0 =A0autopartitioning, but I want to give it more thought=
=2E */
> - =A0 =A0 =A0 if (!numparts) return -EIO;
> =A0 =A0 =A0 =A0 add_mtd_device(mtd);
> =A0#ifdef CONFIG_MTD_PARTITIONS
> - =A0 =A0 =A0 if (!no_autopart)
> + =A0 =A0 =A0 if (!no_autopart && numparts > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_mtd_partitions(mtd, parts, numparts);
> =A0#endif
>
> it must help me with flash without headers...
>
> #modprobe inftl
> #modprobe diskonchip
> Segmetation fault
> #dmesg
>
> ---skip---
> INFTL: inftlcore.c $Revision: 1.17 $, inftlmount.c $Revision: 1.14 $
> DiskOnChip found at 0xe0000
> Detected 2 chips per floor.
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,=
3V
> 8-bit)
> 2 NAND chips detected
> Bad block table found at page 524256, version 0x55
> Bad block table not found for chip 0
> nand_read_bbt: Reserved block at 0x00000000
> nand_read_bbt: Bad block at 0x00080000
> nand_read_bbt: Bad block at 0x000c4000
> nand_read_bbt: Bad block at 0x000d4000
> nand_read_bbt: Bad block at 0x08080000
> nand_read_bbt: Bad block at 0x08124000
> nand_read_bbt: Bad block at 0x08134000
> nand_read_bbt: Bad block at 0x09600000
> nand_read_bbt: Reserved block at 0x0fffc000
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000c printing eip:
> c80ac094
> *pde =3D 00000000
> Oops: 0000 [#1]
> PREEMPT
> Modules linked in: diskonchip reed_solomon nand nand_ids nand_ecc mtdpart
> inftl mtd_blkdevs mtdcore ipv6 af_packet 8139too mii crc32 usbkbd usbcore
> rtc ext3 jbd ide_generic sis5513 ide_disk ide_core unix
> CPU: =A0 =A00
> EIP: =A0 =A00060:[<c80ac094>] =A0 =A0Not tainted
> EFLAGS: 00010202 =A0 (2.6.8contr)
> EIP is at doc_ecc_decode+0x94/0x269 [diskonchip]
> eax: 01b901b9 =A0 ebx: 000001b9 =A0 ecx: 00000000 =A0 edx: 000001b9
> esi: c6541ddc =A0 edi: 00000004 =A0 ebp: c6541ddc =A0 esp: c6541cc8
> ds: 007b =A0 es: 007b =A0 ss: 0068
> Process modprobe (pid: 690, threadinfo=3Dc6540000 task=3Dc6b2c0d0)
> Stack: c6540000 21541d4c 00000001 c0115375 c03017e0 01b9033a 01f90344
> c6541d4c c010eb0f c6541d4c c6541d4c 033a033a 033a033a c6541cfc c6541cfc
> 20000001 00000001 c0301928 0000000a c024e098 c0117a58 c0301928 00000000
> c00e0000 Call Trace:
> =A0[<c0115375>] profile_hook+0x1c/0x31
> =A0[<c010eb0f>] smp_local_timer_interrupt+0xc/0x91
> =A0[<c0117a58>] __do_softirq+0x34/0x73
> =A0[<c80acfe3>] doc200x_correct_data+0x107/0x15a [diskonchip]
> =A0[<c80d80c4>] nand_read_ecc+0x430/0x759 [nand]
> =A0[<c80da077>] read_abs_bbt+0xad/0xbc [nand]
> =A0[<c80d7c90>] nand_read+0x21/0x25 [nand]
> =A0[<c8076196>] find_media_headers+0x58/0x14f [diskonchip]
> =A0[<c807675c>] inftl_scan_bbt+0x210/0x3d7 [diskonchip]
> =A0[<c80d9cd0>] nand_scan+0x7cf/0x7d8 [nand]
> =A0[<c8076137>] doc2000_count_chips+0x4e/0x55 [diskonchip]
> =A0[<c8077204>] init_module+0x8e1/0x997 [diskonchip]
> =A0[<c0126785>] sys_init_module+0xea/0x1db
> =A0[<c0104f27>] syscall_call+0x7/0xb
> Code: 8b 41 0c 66 8b 14 50 8b 74 24 08 66 89 54 24 04 31 ff 69 f6
>
> if only #modprobe diskonchip - same
> if use without patch - same
>
> if I use standart kernel source drivers from 2.6.8-7 package + this patch:
>
> #modprobe inftl
> #modprobe diskonchip
> Segmetation fault
>
> errors with inftl here
>
> #modprobe nftl
> #modprobe diskonchip
>
> Wow, mtd layer is work (in /proc/mtd i have "DiskOnChip 2000 (INFTL
> Model)"), but i dont have nftl:
> -
> Could not find valid boot record
> Could not mount NFTL device
> -
> nftl_format work correctly but don't help...
>
>
> I have other same flash with normal nand headers, but without nftl headers
> and situation is same, but I don't need this patch and flash have 2
> partitions, etc.. =A0 no nftl...
>
> Dmitry
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
