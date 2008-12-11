Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAens-0007RA-BJ
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 06:13:40 +0000
Subject: Re: CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y corrupts slab?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Don Mullis <don.mullis@gmail.com>
In-Reply-To: <49400626.8030408@gmail.com>
References: <493F6ED2.5080402@gmail.com> <1228905714.13686.236.camel@sauron>
	<49400626.8030408@gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2008 08:11:30 +0200
Message-Id: <1228975890.13686.370.camel@sauron>
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

On Wed, 2008-12-10 at 10:10 -0800, Don Mullis wrote:
> Artem Bityutskiy wrote:
> > Hmm, I ran integrity test on UBIFS and had this UBI config option
> > enabled (as well ass emulate write and erase errors options enabled)
> > yesterday, and it worked fine - not slab problems and UBI was able to
> > recover from all errors, so the integrity check test worked fine.
> >=20
> > But that was the latest UBIFS from the ubifs-2.6.git tree.
>=20
> Thanks for testing, that helps me narrow the search.

Note, the CONFIG_MTD_UBI_DEBUG_DISABLE_BGT is debugging option, which
was introduce to test UBI correctness, because theoretically it should
work even if the thread dies or does not exist. However, UBI becomes
less efficient without the thread, so I'd recommend to use it only for
developing/test purposes.

> > We have UBI/UBIFS backport trees, could you try ubifs-v2.6.26.git
> > please? It has all the UBI/UBIFS patches back-ported. Or you may just
> > take the patches from ubifs-v2.6.26.git and apply them to your tree.
>=20
> I assume you meant "ubifs-v2.6.25.git" -- I'm stuck at 2.6.25 for
> the present due to some out-of-tree drivers.  I'll try extracting
> patches from git://git.infradead.org/~dedekind/ubifs-v2.6.25.git
> and applying them to my tree.

Right, I meant ubifs-v2.6.25.git.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
