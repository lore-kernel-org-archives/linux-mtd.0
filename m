Received: from [192.109.80.15] (helo=turing.logware.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15esGJ-0004A9-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 07:03:39 +0100
Message-ID: <71B37AB6576DD211AB7E008048CD4D319FA65F@exchange.ten.logware.de>
From: Veikko Werner <veikko.werner@logware.de>
To: "'Holger Friedrich'" <friedrich@MAZeT.de>,
        "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Boot from DOC 2000
Date: Thu, 6 Sep 2001 08:09:08 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Holger,

I think the HOWTO is good for your target.
I don't see the problem.
create a partition on the DOC, make an ext2 fs on it.
You need to build your root file system on the DOC
create a /etc/lilo.conf  (search the net for mtd-lilo - you'll find a
mtd-lilo.conf or something else)
and use mtd-lilo -r /mnt/nftla1 (or wherever you mount /dev/nftla1) to =
let
the DOC boot
what M-Systems firmware do you have on it?
if the kernel assumes a mtd device that you don't have - where is it =
than?

Veikko

> -----Original Message-----
> From:	Holger Friedrich [SMTP:friedrich@MAZeT.de]
> Sent:	Wednesday, September 05, 2001 5:14 PM
> To:	'linux-mtd@lists.infradead.org'
> Subject:	Boot from DOC 2000
>=20
> Hi all,
> I got my kernel to recognize the DOC, I can mount it as nftla, I can =
put
> file systems on it, read and write. I was even able to put a demo =
from
> elinos on it and boot it, but this was on msdos fs using syslinux as
> bootloader.=20
> Now I want to boot a "real" linux using ext2 or jffs. I've tried to =
work
> through the mtd-jffs-HOWTO. It works fine as long as you just want to
> detect the DOC. When it comes to booting from it it seems to assume a
> mtd device, which I don't have.=20
> I'd like to know how to deal with nftl devices.=20
> Could anyone point me in the right direction?
> Thanks in advance Holger
> --=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Holger Friedrich
>=20
> MAZeT GmbH                  mailto:friedrich@mazet.de
> branch office Jena          Phone: +49 3641 280954
> G=F6schwitzer Stra=DFe 32
> 07745 Jena
> Germany
> Visit our website: http://www.MAZeT.de
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
