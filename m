Received: from mail.ibk.com.au ([203.174.147.20] helo=mail.senetas.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GfNbB-000353-KU
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 16:26:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Kernel OOPS when paritioning DiskOnChip 2000 nftl  in nand_base.c
Date: Thu, 2 Nov 2006 08:26:16 +1100
Message-ID: <1F695B041C4BC345AFB7BD5D647B8500011999AD@mail.senetas.com>
From: "John Weston" <john.weston@senetas.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am currently working on a 2.6.18-rc2 kernel, using the latest patches
from the mtd gir respository. The Kernel has been configured for NFTL,
and the new Diskonchip drivers.

I am unable to re-partition my DiskOnChip 2000 (64M) device, with the
following results.

sfdisk: ERROR: sector 0 does not have an msdos signature
 /dev/nftla: unrecognized partition table type
Old situation:
No partitions found
Input in the following format; absent fields get a default value.
<start> <size> <type [E,S,L,X,hex]> <bootable [-,*]> <c,h,s> <c,h,s>
Usually you only need to specify <start> and <size> (and perhaps
<type>).

/dev/nftla1 :0 400
/dev/nftla1          0+    399     400-     25599+  83  Linux
/dev/nftla2 :400 400
/dev/nftla2        400     799     400      25600   83  Linux
/dev/nftla3 :800 101
/dev/nftla3        800     900     101       6464   83  Linux
/dev/nftla4 :901 101
/dev/nftla4        901    1001     101       6464   83  Linux
New situation:
Units =3D cylinders of 65536 bytes, blocks of 1024 bytes, counting from =
0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/nftla1          0+    399     400-     25599+  83  Linux
/dev/nftla2        400     799     400      25600   83  Linux
/dev/nftla3        800     900     101       6464   83  Linux
/dev/nftla4        901    1001     101       6464   83  Linux
Warning: no primary partition is marked bootable (active)
This does not matter for LILO, but the DOS MBR will not boot this disk.
Do you want to write this to disk? [ynq] y
Successfully wrote the new partition table

Re-reading the partition tableOops: kernel access of bad area, sig: 11
[#1]
NIP: C0010A28 LR: C016495C CTR: 00000040
REGS: c2e91a90 TRAP: 0300   Tainted: P       (2.6.18-rc2)
MSR: 00009032 <EE,ME,IR,DR>  CR: 28088448  XER: 20000000
DAR: C7CC2280, DSISR: 22000000
TASK =3D c330e030[422] 'nftld' THREAD: c2e90000
GPR00: 00000000 C2E91B40 C330E030 C7CC2280 C2E91C28 00000200 C7CC227C
FFFFFFFF
GPR08: FFFF5555 00000020 00000009 00000005 48084442 1005E8C4 FFFFFFFF
0000FFFF
GPR16: C2EC2000 00000000 C3C97400 0000001F 00000001 00000200 C2E91C24
C2EC2000
GPR24: C3C974B4 0001FFE1 0000FFE0 C3C974B4 C3C97400 00000200 00000000
C2E91C24
NIP [C0010A28] memcpy+0x24/0x9c
LR [C016495C] nand_fill_oob+0x44/0x13c
Call Trace:
[C2E91B40] [C0169378] doc2000_read_byte+0x0/0x78 (unreliable)
[C2E91B70] [C0164F14] nand_do_write_ops+0x280/0x288
[C2E91BB0] [C016509C] nand_write_oob+0xa0/0xe0
[C2E91BD0] [C501E368] nftl_write+0x64/0x80 [nftl]
[C2E91C10] [C501EBC4] nftl_writeblock+0x534/0x964 [nftl]
[C2E91FA0] [C0162508] mtd_blktrans_thread+0x230/0x250
[C2E91FF0] [C0006D54] kernel_thread+0x44/0x60
Instruction dump:
4e800020 7c032040 418100a0 54a7e8ff 38c3fffc 3884fffc 41820028 70c00003
7ce903a6 40820054 80e40004 85040008 <90e60004> 95060008 4200fff0
70a50007
 ...

Now, I have seen a few patches for nand_base.c on the mailing list, but
nothing seems to fix this. If anyone has seen this before, or may have
an idea as to how to correct this behaviour, any imput would be
appreciated.

Sincerely

John Weston
Senetas PL
