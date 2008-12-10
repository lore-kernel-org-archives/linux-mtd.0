Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAMY1-0002Dr-6U
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 10:44:05 +0000
Subject: Re: CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y corrupts slab?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Don Mullis <don.mullis@gmail.com>
In-Reply-To: <493F6ED2.5080402@gmail.com>
References: <493F6ED2.5080402@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 12:41:54 +0200
Message-Id: <1228905714.13686.236.camel@sauron>
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

On Tue, 2008-12-09 at 23:25 -0800, Don Mullis wrote:
> With CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=3Dy, I get various corruption-cause=
d=20
> OOPSes after a remount:
>=20
>    # umount /cache
>    # mount -t ubifs  -o ro ubi:cache /cache

Hmm, I ran integrity test on UBIFS and had this UBI config option
enabled (as well ass emulate write and erase errors options enabled)
yesterday, and it worked fine - not slab problems and UBI was able to
recover from all errors, so the integrity check test worked fine.

But that was the latest UBIFS from the ubifs-2.6.git tree.

> I'm using a 2.6.25 kernel with the 100+ UBIFS-related patches from=20
> kernel.org back-ported into it, so some mismatch there is possible.

We have UBI/UBIFS backport trees, could you try ubifs-v2.6.26.git
please? It has all the UBI/UBIFS patches back-ported. Or you may just
take the patches from ubifs-v2.6.26.git and apply them to your tree.
Please, glance here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
