Received: from web7703.mail.in.yahoo.com ([202.86.4.41])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkFge-00075d-S1
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 10:09:06 +0000
Date: Mon, 29 Sep 2008 15:39:01 +0530 (IST)
From: gajula_kittu@yahoo.co.in
Subject: problem in reading jffs2 on 16MB ST flash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <311076.35581.qm@web7703.mail.in.yahoo.com>
Reply-To: gajula_kittu@yahoo.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

  I have problem in reading jffs2 file system on spi flash of 16MB. Here be=
low i have given the error messages coming on the console while booting lin=
ux.. on my embedded box.

 I am using ST M25P128 flash part of 16MB sector size of 256K. I am using l=
inux-2.6.15 and jffs2 mounting is ok .. but console is hanging due to some =
problem and giving the following error messsages.

spi flash read/write are working , as i have checked in my bootloader(u-boo=
t). and for the same kernel 8MB ST flash is working fine..
it has, 64KB sector size.

##########################################################################
CLEANMARKER node found at 0x00000000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0000000c ends at 0x00000010
CLEANMARKER node found at 0x00040000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0004000c ends at 0x00040010
CLEANMARKER node found at 0x00080000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0008000c ends at 0x00080010
CLEANMARKER node found at 0x000c0000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x000c000c ends at 0x000c0010
CLEANMARKER node found at 0x00100000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0010000c ends at 0x00100010
CLEANMARKER node found at 0x00140000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0014000c ends at 0x00140010
CLEANMARKER node found at 0x00180000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0018000c ends at 0x00180010
CLEANMARKER node found at 0x001c0000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x001c000c ends at 0x001c0010
CLEANMARKER node found at 0x00200000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0020000c ends at 0x00200010
CLEANMARKER node found at 0x00240000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0024000c ends at 0x00240010
CLEANMARKER node found at 0x00280000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0028000c ends at 0x00280010
CLEANMARKER node found at 0x002c0000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x002c000c ends at 0x002c0010
CLEANMARKER node found at 0x00300000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0030000c ends at 0x00300010
CLEANMARKER node found at 0x00340000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0034000c ends at 0x00340010
CLEANMARKER node found at 0x00380000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0038000c ends at 0x00380010
CLEANMARKER node found at 0x003c0000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x003c000c ends at 0x003c0010
CLEANMARKER node found at 0x00400000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0040000c ends at 0x00400010
CLEANMARKER node found at 0x00440000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0044000c ends at 0x00440010
CLEANMARKER node found at 0x00480000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x0048000c ends at 0x00480010
CLEANMARKER node found at 0x004c0000 has totlen 0x10 !=3D normal 0xc
Empty flash at 0x004c000c ends at 0x004c0010
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 84K
Read of newly-erased block at 0x00640000 failed: 1. Putting on bad_list
Write clean marker to block at 0x00640000 failed: 1
###########################################################################=
#######

plz give us suggestion to know the actual problem... can we suspect it as a=
 =20
filesystem problem (corner case).

Thanks in advance..

Thanks,
Sai=0A=0A=0A      Be the first one to try the new Messenger 9 Beta! Go to h=
ttp://in.messenger.yahoo.com/win/
