Received: from mail2.metocean.com ([142.176.129.151] helo=metocean.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HivjU-0000iP-7v
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 13:01:45 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: NFTL partition using fdisk failed (DiskOnChip DOC2000 )
Date: Tue, 1 May 2007 14:00:42 -0300
Message-ID: <5269FB0A43484A4AA1B7EE047BCBFAAD01BC87B2@juno.MetoceanData.local>
From: "Charles Mao" <CMao@metocean.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

When I partition my 64MB DOC2000 (MD2202-D64) using fdisk, I got a bunch
of message from syslog and then it stuck there forever. I attached dmesg
below. My linux kernel is 2.6.20.6 and I just loaded two mdoules:
diskonchip and nftl, then I ran fdisk and got the error.

Could you guys tell me what could be wrong? Thanks.

Dmesg related to diskonchip:

DiskOnChip found at 0xd0000
DiskOnChip 2000 responds to DWORD access
Detected 2 chips per floor.
NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 (Toshiba NAND 32MiB
3,3V 8-bit)
2 NAND chips detected
Found DiskOnChip ANAND Media Header at 0x30000
Found DiskOnChip ANAND Media Header at 0x34000
    DataOrgID        =3D ANAND
    NumEraseUnits    =3D 4084
    FirstPhysicalEUN =3D 12
    FormattedSize    =3D 65536000
    UnitSizeFactor   =3D 255
Bad block table at page 385, version 0x55
Bad block table at page 417, version 0x55
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
 nftla: unknown partition table
BUG: unable to handle kernel paging request at virtual address d1bed280
 printing eip:
c0256506
*pde =3D 10f15067
*pte =3D 00000000
Oops: 0002 [#1]
Modules linked in: nftl mtd_blkdevs diskonchip reed_solomon autofs4
CPU:    0
EIP:    0060:[<c0256506>]    Not tainted VLI
EFLAGS: 00010282   (2.6.20.6PC104-2 #12)
EIP is at nand_fill_oob+0x36/0x120
eax: c13cf4c0   ebx: 00000010   ecx: 00000004   edx: c72e1f40
esi: c72e1f40   edi: d1bed280   ebp: c72e1f40   esp: c72e1e28
ds: 007b   es: 007b   ss: 0068
Process nftld (pid: 2679, ti=3Dc72e1000 task=3Dcd751570 =
task.ti=3Dc72e1000)
Stack: d185e402 ffffffff ffffffff c13cf4c0 00000200 c737d000 03ffc000
00000000=20
       c0256853 00000000 00000000 00000000 c737d000 c72e1f40 00000200
c13cf4c0=20
       00000000 0000001f 0000ffe0 0001ffe0 00000001 c13cf400 c72e1ebc
00000000=20
Call Trace:
 [<d185e402>] doc2000_read_byte+0x22/0x50 [diskonchip]
 [<c0256853>] nand_do_write_ops+0x263/0x310
 [<c0256b70>] nand_write_oob+0xa0/0xc0
 [<d18672ab>] nftl_write+0x4b/0x60 [nftl]
 [<d1867bae>] nftl_writeblock+0x28e/0x2a0 [nftl]
 [<c01baccc>] elv_dispatch_sort+0x1c/0x70
 [<c01c3dc2>] __cfq_dispatch_requests+0x72/0x1b0
 [<d1863089>] do_blktrans_request+0x89/0xc0 [mtd_blkdevs]
 [<c01bb1fd>] elv_next_request+0x5d/0x110
 [<d1863207>] mtd_blktrans_thread+0x147/0x190 [mtd_blkdevs]
 [<c0117f60>] default_wake_function+0x0/0x10
 [<c0102c3e>] ret_from_fork+0x6/0x1c
 [<c0117f60>] default_wake_function+0x0/0x10
 [<d18630c0>] mtd_blktrans_thread+0x0/0x190 [mtd_blkdevs]
 [<c010387f>] kernel_thread_helper+0x7/0x18
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Code: 24 0c 8b 01 8b 59 0c 83 f8 01 74 33 72 09 83 f8 02 0f 85 e5 00 00
00 8b 44 24 0c 89 ee 8b 79 14 89 d9 c1 e9 02 03 b8 80 00 00 00 <f3> a5
89 d9 83 e1 03 74 02 f3 a4 8d 74 1d 00 e9 c1 00 00 00 8b=20
EIP: [<c0256506>] nand_fill_oob+0x36/0x120 SS:ESP 0068:c72e1e28
