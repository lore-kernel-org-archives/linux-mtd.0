Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAMqs-0006HJ-Td
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 11:03:35 +0000
Subject: Re: Minor Error in UBIFS FAQ
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <69731.17422.qm@web58904.mail.re1.yahoo.com>
References: <69731.17422.qm@web58904.mail.re1.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 13:01:22 +0200
Message-Id: <1228906882.13686.248.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-09 at 09:07 -0800, Philip Rakity wrote:
> Could not find FAQ to generate patch.  Did we mean UBIFS images (see belo=
w)
>=20
> How to create an UBIFS image?
> Creating UBIFS images might be a little trickier than creating JFFS2 imag=
es.
> First of all, you have to understand that UBIFS works on top of UBI which=
 works
> on top or MTD which basically represents your raw flash. This means, that=
 if
> you need to create an image which would be flashed to the raw flash, you =
should
> first create an UBIFS image, than UBI image. In other words, the process =
has 2
> steps.
> However, as described here,
> UBI has a volume update facility and there is an ubiupdatevol utility
> for this. So you may update UBI volumes on your running system as well.
> In this case you only need an UBIFS image, and you do not have to make th=
e
> UBI image, i.e., the process has only 1 step in this case.
> So, there are 2 utilities:
> 	* mkfs.ubifs which creates UBIFS images;
> 	* ubinize which creates UBI images out of UBI images.  <=3D=3D=3D=3D ERR=
OR  out of UBIFS images

The MTD web site is available here:
git://git.infradead.org/mtd-www.git
or
http://git.infradead.org/mtd-www.git

I've just fix the typo you have pointed out:
http://git.infradead.org/mtd-www.git?a=3Dcommit;h=3D39df2684657ab982c96d769=
d761cbb84e23ece80

Thank you for this notice, typo and "bad English" fixes are appreciated.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
