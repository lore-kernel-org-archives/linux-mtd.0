Received: from port103.vestas.dk ([195.41.59.103]
	helo=rkbexch02.vws.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARTjf-0007bv-NX
	for <linux-mtd@lists.infradead.org>; Wed, 03 Dec 2003 09:55:55 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 3 Dec 2003 10:53:48 +0100
Message-ID: <72F54639F41FD643A2349136F3E33DAD2C3BE5@rkbexch02.vws.vestas.dom>
From: "Esben Nielsen" <ESN@vestas.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: M-System's DiskOnChip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,
 My company is designing a new piece of hardware based on a PPC. We are =
looking at M-Systems for storage. So how good is the Linux support for =
DiskOnChip?

Our options are:

1) They provide a TFFS-driver but there huge problems with license (it =
isn't GPL). The only way to use it is to use it as a loadable module. =
This is technically complicated as the root file system has to be on the =
DiskOnChip, so I need some kind of trick to load the module from a =
ramdisk or something before that.=20
But as far as I can see it we will still be destributing the driver =
along with the kernel, not linked, but residing on the same bootrom. =
Chouldn't that be considered as a derivative work as a whole and thus =
breaking the GPL?

2) We can skip M-system's TFFS and jump to JFFS2. But how stable is that =
on DiskOnChip? As far as I could see from the website there are still =
problems with bad blocks support. How does that affect the stability? =
What is your experience?
Is it stable enough for production use?

Esben Nielsen
=20
