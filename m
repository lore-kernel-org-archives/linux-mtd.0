Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CdsPS-00035j-EH
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 10:46:54 -0500
From: stephanwib@t-online.de (Stephan Wiebusch)
To: <linux-mtd@lists.infradead.org>
Date: Mon, 13 Dec 2004 16:46:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-ID: <1CdsP6-0Z25Jo0@fwd10.sul.t-online.com>
Subject: Cannot bulid grub_firmware for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I am trying to build a grub bootloader-firmware for a Diskonchip-2000 =
(16MB)
device.
Therefor, I used the howto found at
http://lakeshoremicro.com/diskonchip-grub-howto.html.

The DOC should be used in a small x86-PC-system. It is devided in only =
one
ext2-partition, where a 2.6.9-Kernel is located in /boot and a =
=84menu.lst=93
file in /boot/grub.
My development PC uses Fedora Linux Core 3.


I was able to build =84grub_firmware=93 in /stage1 directory only for =
one time;
but i cannot remember the combination of grub package and mtd-patch =
anymore.
After installing it on the DOC using M-System=B4s DOS-TOOLS, grub =
successfully
booted from it. But unfortunately grub says: =84Error 23: Error while =
parsing
number=93.
Using the DOC in my development PC, grub was able to recognize the
ext2-filesystem on my hard disk (=84root hd(0,0)=93).

I tried to build the Grub sources from CVS with the mtd-grub-patch
2003-11-10 (not compiling) and 2003-01-08 (compiling, but no
grub_firmware).With these patches, =A0I also tried the grub-0.92 (also =
with
grub-0.92-patch) and grub-0.95 packages from the ftp-server, but all
combinations were not able to compile successfully.

I did it this way:

1)Patch grub with =84patch =96p0 =96i ../mtd/patches/<patch-file>=93
2)aclocal && autoconf =96add-missing && automake
3)./configure =96enable-diskonchip-2000 =96enable-diskonchip-ctrlbypass
=96enable-ext2fs =96disable-ffs =96disable-xfs =96disable-jfs =
=96disable-vstafs
=96disable-reiserfs =96disable-minix =96disable-fat
4)make

Can anybody tell me a working combination or how to fix my problem? Or =
can I
use an alternative bootloader (unfortunately, i did not find any =
information
about using lilo)?
I also would be happy if anybody would send me his/her grub_firmware =
file.

Greetings, Stephan
