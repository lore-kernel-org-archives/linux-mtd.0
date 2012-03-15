Received: from as-smtp3.itc.alstom.com ([159.245.16.38] helo=itc.alstom.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8DLg-0004gQ-7G
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 16:16:22 +0000
From: STOTTS Timothy <timothy.stotts@transport.alstom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: how to support 4096+224 page size with plat_nand ?
Date: Thu, 15 Mar 2012 16:00:33 +0000
Message-ID: <6E13A53B51111A48A6299DFACA193D4A85FDBF@041-DB3MPN1-015.041d.mgd.msft.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am looking to add support for the NAND Flash chip MT29F16G08ABABA to a bo=
ard implementation of the platform NAND driver plat_nand.c .

I have followed the instructions available for my architecture at:
http://docs.blackfin.uclinux.org/doku.php?id=3Dlinux-kernel:drivers:bfin_as=
ync_nand

The chip has a page size of 4096+224.

According to the manufacturer, all blocks come preset as either 0xFF or 0x0=
0. If 0xFF, the block is erased and good. If 0x00, the block was factory-de=
termined to be bad.

It was necessary to make the following changes to the NAND subsystem for OO=
B of size 224.
=3D=3D=3D modified file 'drivers/mtd/nand/nand_base.c'
--- drivers/mtd/nand/nand_base.c        2011-12-28 19:57:41 +0000
+++ drivers/mtd/nand/nand_base.c        2012-03-15 15:08:23 +0000
@@ -3256,6 +3256,11 @@
                case 128:
                        chip->ecc.layout =3D &nand_oob_128;
                        break;
+               case 224:
+                       chip->ecc.layout =3D &nand_oob_128;
+                       break;
                default:
                        printk(KERN_WARNING "No oob scheme defined for "
                               "oobsize %d\n", mtd->oobsize);

All kernel MTD Tests (kernel modules) run without error.
MTD nandtest executable runs without error.

Works as expected: ubiformat /dev/mtd4

Does not work as expected: ubiattach /dev/ubi_ctrl -m 4
root:~> ubiattach /dev/ubi_ctrl -m 4
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   524288 bytes (512 KiB)
UBI: logical eraseblock size:    520192 bytes
UBI: smallest flash I/O unit:    4096
UBI: sub-page size:              1024
UBI: VID header offset:          1024 (aligned 1024)
UBI: data offset:                4096
uncorrectable error :
uncorrectable error :
...
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI: max. sequence number:       0
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "file system(nand)"
UBI: MTD device size:            2048 MiB
UBI: number of good PEBs:        4096
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             4052
UBI: total number of reserved PEBs: 44
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 0/0
UBI: image sequence number:  760250844
UBI: background thread "ubi_bgt0d" started, PID 482
UBI device number 0, total 4096 LEBs (2130706432 bytes, 2.0 GiB), available=
 4052 LEBs (2107817984 bytes, 2.0 GiB), LEB size 520192 bytes (508.0 KiB)

I am assuming that the errors are due to an incorrect OOB layout, or the EC=
C not being written correctly by ubiformat. What can I do to define the cor=
rect OOB layout for a chip with OOB size of 224 bytes?

Works as expected: ubimkvol /dev/ubi0 -N nand -m

root:~> ubimkvol /dev/ubi0 -N nand -m
Set volume size to 2107817984
Volume ID 0, size 4052 LEBs (2107817984 bytes, 2.0 GiB), LEB size 520192 by=
tes (508.0 KiB), dynamic, name "nand", alignment 1

Does not work as expected: mount -t ubifs ubi0:nand /mnt

root:~> mount -t ubifs ubi0:nand /mnt
UBIFS: default file-system created
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBIFS: mounted UBI device 0, volume 0, name "nand"
UBIFS: file system size:   2102616064 bytes (2053336 KiB, 2005 MiB, 4042 LE=
Bs)
UBIFS: journal size:       33292288 bytes (32512 KiB, 31 MiB, 64 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)

Regards,
Timothy Stotts


________________________________
CONFIDENTIALITY : This e-mail and any attachments are confidential and may =
be privileged. If you are not a named recipient, please notify the sender i=
mmediately and do not disclose the contents to another person, use it for a=
ny purpose or store or copy the information in any medium.
