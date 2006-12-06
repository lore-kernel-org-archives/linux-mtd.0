Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrzO1-0004wC-P3
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 11:12:48 -0500
Date: Wed, 6 Dec 2006 17:12:03 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Glen Johnson <gjohnson@valcom.com>
Subject: Re: mkfs.jffs2 not compiling, which acl.h?
In-Reply-To: <4576D6E3.2060908@valcom.com>
Message-ID: <Pine.LNX.4.64.0612061708320.29536@lnxricardw.se.axis.com>
References: <4576CC07.2000107@valcom.com>
	<Pine.LNX.4.64.0612061502000.29536@lnxricardw.se.axis.com>
	<4576D6E3.2060908@valcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 6 Dec 2006, Glen Johnson wrote:

> make WITHOUT_XATTR=3D1.  This works great however, when I cd into=20
> uClinux-dist/ and run make, WITHOUT_XATTR=3D1 never gets passed to the=20
> makefile in the mtd-utils directory.

1. Do I need to change something in
> the uClinux-dist/user/Makefile so that it will pass WITHOUT_XATTR=3D1 to=
=20
> the mtd-utils/makefile?

I don't know much about uClinux, but somehow you have to set=20
WITHOUT_XATTR=3D1 when making mtd utils. The easiest is probably to hard=20
edit the mtd-utils makefile and put

WITHOUT_XATTR =3D 1

somewhere at the beginning of the file.

Or, you could find the 'make -C mtd-utils' (or similar) line in=20
uClinux-dist/user/Makefile, and add WIHTOUT_XATTR=3D1 to that line. Don't=
=20
know how the uClinux build system is laid out so it could well be more=20
convoluted than this.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
