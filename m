Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPG4E-0002gV-Sj
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 04:37:33 -0500
Message-ID: <442CF82B.5060904@yandex.ru>
Date: Fri, 31 Mar 2006 13:36:43 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
In-Reply-To: <20060331092715.GC11367@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> The current mess that makes up mtd->type and mtd->flags needs to be
> sanitized anyway.  Instead of being MTD_NAND, MTD_NOR or MTD_STRIPED,
> it should tell the user _how_ to treat the device, not _what_ it is.
> Basically, whereever a user (jffs2 basically) has
> 	if (mtd->type =3D=3D MTD_FOO)
> 		setup_bar;
> it should actually do
> 	if (mtd->flags =3D=3D MTD_NEEDS_BAR)
> 		setup_bar;
>=20
> Quite likely there won't be many flags left after the cleanup is done.
> Most of them should simple be erase_size and write_size (page_size or
> ecc_size currently), not flags.

No, mtd->type has to tell you the type of the MTD device. Ideally, this=20
has to me the only flash-specific field in the mtd_info structure. And=20
if users want to do some flash specific things, they have to look at=20
mtd->type, realize what is the subsystem which handles this flash, and=20
start working with this subsystem. For striping, this is the striping=20
subsystem. I don't know what for mtd->flags, probably this hast to go at =

all.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
