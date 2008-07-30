Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KO8xP-0002wJ-Ur
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 10:31:00 +0000
Subject: Re: Deep thinking about the Wear-leveling mothed
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1217409842.2786.1.camel@localhost.localdomain>
References: <1217327479.2812.24.camel@localhost.localdomain>
	<1217398973.9048.7.camel@sauron>
	<1217409842.2786.1.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 Jul 2008 13:25:58 +0300
Message-Id: <1217413558.9048.36.camel@sauron>
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

On Wed, 2008-07-30 at 17:24 +0800, xiaochuan-xu wrote:
> On Wed, 2008-07-30 at 09:22 +0300, Artem Bityutskiy wrote:
> > Also, I am not sure it is save to erase one eraseblock several million
> > times and do not erase neighbor eraseblocks. There are "radiation"
> > effects in some flashes, when unused eraseblocks slowly "rot" when
> > their
> > neighbor eraseblocks are used a lot.
>=20
> I'm sorry but I'm not understand this clearly.

In this particular case I meant AG-AND flashes. They had "radiation"
effect, which means if you have 2 eraseblocks A and B, and you change A
a lot, but do not change B, B may become corrupted at some point.

P.S. I have not idea if these flashes are still produced/used.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
