Received: from miraculix.pixel.de ([145.253.133.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D92d4-0004kb-0I
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 09:57:42 -0500
Received: from encryptix.pixel.de ([145.253.132.115])
	by miraculix.pixel.de with esmtp (Exim 4.34) id 1D92fC-0006GP-J2
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 15:59:54 +0100
Received: from encryptix (localhost [127.0.0.1])
	by encryptix.pixel.de (Postfix) with ESMTP id 369ACA7A4
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Mar 2005 15:57:06 +0100 (CET)
Received: from majestix2.pixel.de (majestix2.pixel.de [145.253.132.236])
	by encryptix.pixel.de (Postfix) with ESMTP id 1F552A79D
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Mar 2005 15:57:06 +0100 (CET)
Received: from automatix (localhost [127.0.0.1])
	by majestix2.pixel.de (8.12.10+Sun/8.12.10) with ESMTP id
	j29Ev4cY019797 for <linux-mtd@lists.infradead.org>;
	Wed, 9 Mar 2005 15:57:05 +0100 (CET)
Received: from www-data by automatix with local (Exim 3.36 #1 (Debian))
	id 1D92cR-0005iD-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2005 15:57:03 +0100
Message-ID: <1110380223.422f0ebf951f5@intern.netexpress.de>
Date: Wed,  9 Mar 2005 15:57:03 +0100
From: Wolfram Gettert <Wolfram.Gettert@mixed-mode.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Bugreport: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I want to report two bugs on mkfs.jffs2 Revision 1.44

1.
I tried to create a file sytem image with this commandline.

mkfs.jffs2 -l -e 0x20000 -D devtable.txt -d rootfs -o test.img

The file devtable.txt contains a line =20

----8<-----
/dev/input   d  755     0       0       -       -       -       -       -
----8<-----

and the rootfs directory contains a directory=20

rootfs/dev/input


Of course it is my fault that I put the /dev/input directory in the devic=
e table
and in the rootfs. But never the less the result is a jffs2 image which i=
s not
usable. Mounting it on the host with mtdram mtdblock .... freezes the PC =
and on
the target I cannot mount it too.

So there should be an error message or something like "Omitting directory=
 xyz
from devtable already present"


2.
It is not possible to create a directory with devtable in "/"
Devtable contains this line

/opt   d  755     0       0       -       -       -       -       -

I get this message:

mkfs.jffs2: skipping device_table entry '/opt': no parent directory!



Please put me on CC, I am not subscribed to list.

Wolfram



--=20
Dipl.-Ing.
Wolfram Gettert

Software Engineer Embedded Systems

Mixed Mode GmbH
Lochhamer Schlag 17                   D-82166 Gr=E4felfing/M=FCnchen
Tel. +49-89-89868.0                   Fax +49-89-89868.222
mailto:Wolfram.Gettert@mixed-mode.de  http://www.mixed-mode.de

Mixed Mode - Your Partner for Systems Engineering!
