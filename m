Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPI6S-0005Nv-3e
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 06:47:56 -0500
Message-ID: <442D16BE.8010509@yandex.ru>
Date: Fri, 31 Mar 2006 15:47:10 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
In-Reply-To: <20060331114049.GH14713@wohnheim.fh-wedel.de>
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
> Right now, we have code like
>=20
> #define jffs2_can_mark_obsolete(c) ((c->mtd->type =3D=3D MTD_NORFLASH &=
& !(c->mtd->flags & MTD_ECC)) || c->mtd->type =3D=3D MTD_RAM)
>=20
> I guess we can both agree that it is far from optimal.  And my take
> would be to replace it with
>=20
> #define jffs2_can_mark_obsolete(c) (c->mtd->flags & MTD_CAN_MARK_OBSOLE=
TE)
This piece of code indeed looks better. But nevertheless, MTD does not=20
have to please JFFS2. It is difficult to foresee all "features" MTD=20
users can conceive and add corresponding flags. Tomorrow a "XYZ" file=20
system will apear and will want a "can_do_my_crap" feature, and you'll=20
have to add this to mtd_info. This is really a bad idea.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
