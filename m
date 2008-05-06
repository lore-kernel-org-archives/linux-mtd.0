Received: from smtp5.centerbeam.com ([63.120.115.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtVLu-0001JH-9r
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 22:09:38 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: MTD/JFFS2 causes libc.so to break(?)
Date: Tue, 6 May 2008 15:09:31 -0700
Message-ID: <32C4C619DF66B945B608E59A6791C8C302626746@CBA0E2K11.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I have a linux 2.6.22.2 kernel running on an AT91SAM9260 processor =
board, with debian filesytem stored on a Samsung NAND flash.

When I setup the filesystem by untarring a tarball into /dev/mtblock0, =
everything is fine.
When I setup the filesystem by using a jffs2 image (with either uboot, =
nandwrite(in linux) or preprogrammed ) , it boots fine once( or a couple =
of times) and then gives the following error:

/bin/sh: error while loading shared libraries: /lib/libc.so.6: undefined =
symbol: __`=C0, version GLIBC_2.0

I have verified (using md5-sum) that the library remains the same. I =
have a soft link to the library like so:

ls -la libc.so.6
lrwxrwxrwx=A0 1 root root 13 May=A0 5=A0 2008 libc.so.6 -> libc-2.3.2.so
ls -la libc-2.3.2.so
-rwxr-xr-x=A0 1 root root 1159708 Mar=A0 5=A0 2007 libc-2.3.2.so


1) Could it be that my mkfs.jffs2 is the wrong version (mkfs.jffs2: =
revision 1.50 ) ?? What version would I need to compile a FS for a =
2.6.22 kernel ?
2) Am I passing the wrong params to mkfs.jffs2? I invoke it like so:
       mkfs.jffs2 -n -l -s 512 -p 16KiB -e 16 KiB -o jffs2.img -d =
deb_root
Does the page size need to include the oob area???

My Flash is K9F1208U0B, which has 512 byte pages, and 16 KiB erase =
blocks.

Any and all help greatly appreciated

Manu Rao

Misc info:

uname -a=A0 =3D=3D Linux version 2.6.22.2.alien.x650 (mrao@mhlxrh4rfe) =
(gcc version 4.0.1) #2 Fri May 2 17:32:13 PDT 2008
