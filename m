Received: from mx1.globalfono.com ([200.69.212.173] helo=sermail.discar.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IE368-0004Rp-PP
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 09:09:48 -0400
content-class: urn:content-classes:message
Subject: We cant Mount a MTD partition with JFFS2
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jul 2007 10:09:39 -0300
Message-ID: <5607052019BEC243A4B704754EC5683F92DF33@sermail.discar.org>
From: "Lucas Olmos" <LOlmos@DISCAR.com>
To: "Lucas Olmos" <LOlmos@DISCAR.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We have a uClinux 2.6.x over NXP LPC2468 (Kit of embedded artist)=20

We generated a image with mkfs.jffs2 tool, typing in the console of =
debian PC:

DEBIAN-LINUX:#=A0 mkfs.jff2 -root=3DDocumentation -eraseblock=3D128 =
-output=3Dimage.lo

Then with the uboot we copy the image.lo to the NAND 0x600000=20

In the kernel create the MTD partitions an then we see this

The "cat /proc/partitions" show:

Major=A0=A0 minor=A0=A0=A0 =
#blocks=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 name
31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
4906=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
mtdblock0
31=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
2048=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
mtdblock1

And we have block devices in this numbers

/dev/rom0 in 31 0
/dev/rom1 in 31 1

But when we try to mount with:

mount =A0-t jffs2 =A0/dev/rom1=A0 /mnt/mtd

the system show in the console this message:

Eep. No valid nodes for ino #1

And then the system try to erase ....


Then, we type "mount " and we see that the=A0 /dev/rom1 mount in =
/mnt/mtd=A0 but we ls the dir and show nothing, try to mkdir and we cant

Somebody =A0know what happened ????


____________________________________________
Lucas Federico Olmos
DISCAR S.A.
Ingeniero de Desarrollo=A0- I+D
Faustino Allende 866 - C=F3rdoba (X5004DVR) - Argentina=20
Tel.: (54 351) 4732020 (Int: 2134) Fax: (54 351) 4720633
www.discar.com=A0
