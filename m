Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jeq8x-0002eV-Bw
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 11:19:39 +0000
Received: from mgw-mx09.nokia.com ([192.100.105.134])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m2R7DSvx013768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2008 09:13:30 +0200
Subject: Re: UBI: about ubinize tool
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803252111y4a79334l6e09567d54a0539e@mail.gmail.com>
References: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
	<bae050c10803252111y4a79334l6e09567d54a0539e@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 27 Mar 2008 08:58:27 +0200
Message-Id: <1206601107.3856.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-03-26 at 12:11 +0800, Nancy wrote:
>    If the input file which needed by ubinize can be the image file
> created by mkfs.ubifs(eg: ubifs.img), then how to use the output ubi
> image file (eg: ubi.img)?

You have to put that image to the _raw_ flash. If you use nandsim,
something like "dd if=3Dubi.img of=3D/dev/mtdX" is OK. If you use a real
NAND flash, you have to use the nandwrite utility, becaus dd cannot skip
bad blocks: nandwrite /dev/mtdX ubi.img

For example, if you were a vendor of some devices and you had a factory,
you would prepare you final ubi.img and you would flash it to the newly
produced devices in the factory. Straight to the raw flash.

> Use the same tool "ubiupdatevol "?
You may put ubifs.img with ubiupdatevol.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
