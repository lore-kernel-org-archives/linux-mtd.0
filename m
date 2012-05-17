Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SV70q-0007jf-NP
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 20:09:29 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: UBIFS and NAND issue (works only once)
Date: Thu, 17 May 2012 16:08:25 -0400
Message-ID: <5D308BD40154E4439D82454FE483A50206B6FFDD@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I do this:
mkfs.ubifs -r filesystem -m 2048 -e 129024 -c 1012 -o ubifs.img
ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubinize.cfg
.....
In uboot I flash the image:
tftp .....
nand erase .....
nand write....

Then boot my device I do:
Ubiattach /dev/ubi_ctrl -m 3

root:/> ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       2
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "file system(ubifs)"
UBI: MTD device size:            147 MiB
UBI: number of good PEBs:        1180
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1180
UBI: number of PEBs reserved for bad PEB handling: 11
UBI: max/mean erase counter: 1/0
UBI: image sequence number:  125589241
UBI: background thread "ubi_bgt0d" started, PID 353
mtd: Giving out device 4 to cooper
nand_erase_nand: start =3D 0x000006c80000, len =3D 131072
nand_erase_nand: start =3D 0x000006ca0000, len =3D 131072
nand_erase_nand: start =3D 0x000008bc0000, len =3D 131072
nand_erase_nand: start =3D 0x000008be0000, len =3D 131072
nand_erase_nand: start =3D 0x000008c00000, len =3D 131072
nand_erase_nand: start =3D 0x000008c20000, len =3D 131072
nand_erase_nand: start =3D 0x000008c40000, len =3D 131072
....
nand_erase_nand: start =3D 0x00000ffe0000, len =3D 131072

root:/> mount -t ubifs ubi0 /mnt/ubitest/
nand_erase_nand: start =3D 0x000006cc0000, len =3D 131072
nand_erase_nand: start =3D 0x000006de0000, len =3D 131072
UBIFS: mounted UBI device 0, volume 0, name "cooper"
UBIFS: file system size:   129153024 bytes (126126 KiB, 123 MiB, 1001
LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
nand_erase_nand: start =3D 0x000006e00000, len =3D 131072
nand_erase_nand: start =3D 0x000006e40000, len =3D 131072

And all looks good.


Until I reflash the image a second time on the device:
.....
root:/> ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: process_eb: bad image sequence number 125589241 in PEB 1012,
expected 817099782
slab error in kmem_cache_destroy(): cache `ubi_scan_leb_slab': Can't
free all objects
Hardware Trace:
   0 Target : <0x001af2d8> { _dump_stack + 0x0 }
     Source : <0x0004729e> { _kmem_cache_destroy + 0xaa } JUMP.L
   1 Target : <0x0004729e> { _kmem_cache_destroy + 0xaa }
     Source : <0x001af4ac> { _printk + 0x14 } RTS
   2 Target : <0x001af4a8> { _printk + 0x10 }
     Source : <0x00010f94> { _vprintk + 0x164 } RTS
   3 Target : <0x00010f88> { _vprintk + 0x158 }
     Source : <0xffa00cc0> { __common_int_entry + 0xcc } RTI
   4 Target : <0xffa00c5e> { __common_int_entry + 0x6a }
     Source : <0xffa00aa8> { _return_from_int + 0x58 } RTS
   5 Target : <0xffa00aa8> { _return_from_int + 0x58 }
     Source : <0xffa00a7e> { _return_from_int + 0x2e } IF !CC JUMP pcrel
   6 Target : <0xffa00a50> { _return_from_int + 0x0 }
     Source : <0xffa00c5a> { __common_int_entry + 0x66 } JUMP.L
   7 Target : <0xffa00c58> { __common_int_entry + 0x64 }
     Source : <0xffa00380> { _asm_do_IRQ + 0x60 } RTS
   8 Target : <0xffa00378> { _asm_do_IRQ + 0x58 }
     Source : <0x00014540> { ___local_bh_enable + 0x38 } RTS
   9 Target : <0x00014508> { ___local_bh_enable + 0x0 }
     Source : <0x00014bf6> { ___do_softirq + 0xc6 } JUMP.L
  10 Target : <0x00014bea> { ___do_softirq + 0xba }
     Source : <0x00014bce> { ___do_softirq + 0x9e } IF CC JUMP pcrel
  11 Target : <0x00014bb8> { ___do_softirq + 0x88 }
     Source : <0x00034dbe> { _rcu_bh_qs + 0x5e } RTS
  12 Target : <0x00034da4> { _rcu_bh_qs + 0x44 }
     Source : <0x00034d78> { _rcu_bh_qs + 0x18 } IF CC JUMP pcrel
  13 Target : <0x00034d60> { _rcu_bh_qs + 0x0 }
     Source : <0x00014bb4> { ___do_softirq + 0x84 } JUMP.L
  14 Target : <0x00014bac> { ___do_softirq + 0x7c }
     Source : <0x00018a86> { _run_timer_softirq + 0xc6 } RTS
  15 Target : <0x00018a64> { _run_timer_softirq + 0xa4 }
     Source : <0x00018ad8> { _run_timer_softirq + 0x118 } JUMP.S
Stack info:
 SP: [0x02ec7cb0] <0x02ec7cb0> /* kernel dynamic memory */
 FP: (0x02ec7e58)
 Memory from 0x02ec7cb0 to 02ec8000
02ec7cb0:[0004724a] 000472a2  020584e0  ffffffea  02af2a20  001b4e44
0020b9d8  001f8a44
02ec7cd0: 00113ec6  02af2a20  0020b9d8  001c35f0  077c56f9  000003f4
30b3f406  00000000
02ec7cf0: 00000010  000000d0  02af2a3c  02af2a24  00000000  02e95c5c
02aaf000  02af2a2c
02ec7d10: 00000000  000040d0  0000ffff  02ec7e14  0010b97a  02aaf000
02aaf000  02e95800
02ec7d30: 00000000  00000200  00020000  00000200  00000000  00000800
ffffffff  02ec7da8
02ec7d50: 02ec7df0  00047e80  0264e320  02ec7df0  0004f8e6  02ec7e34
0293fdd4  02ec7e34
02ec7d70: 00000000  00000000  00020000  00000024  000517a2  02d6cbf0
000516fc  0264e320
02ec7d90: 00000000  02083005  00000000  00000000  02ec7da8  0293fdd4
02d6cbf0  02ec7dfc
02ec7db0: 00052702  02ec7e34  02ec7ec4  00000000  02ec6000  00000000
02ec7df0  02083000
02ec7dd0: 00000000  00000000  00260d8c  02083000  02ec7df8  00260378
00000000  00000001
02ec7df0: 02010120  02d6b8d4  00000000  02effc58  02ec7ec0  09380000
00000000  00000000
02ec7e10: 000f5f78  02ec7ec0  0010c146  02effcb8  00000036  02ed9808
40186f40  02aaf000
02ec7e30: 02effcb8  40186f40  02d6b8d4  ae0a2a32  00000008  ffffffff
00000003  00000000
02ec7e50: 00000000  00000000 (00000000)<000535e2> 0264e320  00000003
00000003  0201e980
02ec7e70: 02e4f920  0201e984  00000003  00000000  00000000  00000000
02effc58  00047a9e
02ec7e90: 00047ad8  02d6cbf0  0264e320  00000000  00000020  0264e328
00000003  00000001
02ec7eb0: 00000020  0264e328  00000001  00000000  02effc6c  00053a0c
000539e4  00000036
02ec7ed0: 02ed9808  0264e320  00000003  02effcb8  40186f40  00020000
ffffe000  02efff92
02ec7ef0: 02effcb8  00000000 <ffa0090a> 00000000  ffffe000  02efff92
02ed9028  0667a8e7
02ec7f10: 02effa34  0000fffe  0000e1a8  02ed9028  02efff92  02c0e1b4
00008000  00000000
02ec7f30: 00000000  02ec8000  02c0e1b4  02c0e1b4  02ed1af8  ffa01024
02003004  02b0bfc5
02ec7f50: 02b0c59f  02b0bfc2  02b0c59e  00000000  00000000  00000000
00000000  00000000
02ec7f70: 00000000  00000000  7ffff000  000000c0  00000137  00000000
00000000  00000000
02ec7f90: 00000000  0000005b  00001802  00000001  fffffffc  00000007
00000003  02ed9808
02ec7fb0: 02c39188  02effc60  02effc6c  02effd9c  02eca258  02ed9808
02ec9290  02c0e1a8
02ec7fd0: 00000036  00000003  02effcb8  02efff92  02ed9028  0000e1a8
02effcb8  40186f40
02ec7ff0: 00000003  00000003  00000036  00000006
Return addresses in stack:
   frame  1 : <0x000535e2> { _do_vfs_ioctl + 0x62 }
    address : <0xffa0090a> { _system_call + 0x6a }
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
ubiattach: error!: cannot attach mtd3
           error 22 (Invalid argument)
root:/>

Any ideas?
