Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mh6QJ-0005XP-0f
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 18:43:47 +0000
Date: Fri, 28 Aug 2009 11:43:29 -0700
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>,
	dwmw2@infradead.org
Subject: Re: [PATCH v5] [MTD] BCMRING: mtd nand umi driver support
Message-ID: <20090828184329.GD20707@broadcom.com>
References: <20090821221701.GF14815@broadcom.com>
	<20090827183558.GB4222@broadcom.com>
	<1251436582.3514.7.camel@localhost>
MIME-Version: 1.0
In-Reply-To: <1251436582.3514.7.camel@localhost>
Content-Type: text/plain;
 charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Got it.  Thanks.

David, would you please include my mtd driver patch in your tree?  Our othe=
r 23
patches for bcmring support in arch/arm are wating for this patch, so
that we can get the defconfig build in linux-next.  Let me know if
there is any improvement needed.  Thanks a lot.

Br,

Leo
On Thu, Aug 27, 2009 at 10:16:22PM -0700, Artem Bityutskiy wrote:
> On Thu, 2009-08-27 at 11:35 -0700, Leo (Hao) Chen wrote:
> > Hi,
> >=20
> > As our bcmring code have been merged by Russell into linux-next repo, w=
e really
> > need this mtd driver be merged into the kenrel as well to get a
> > working system.
> > So, I just want to know if our patch for bcmring mtd driver is accepted=
 or not.
> > If not, what shall we improve? If yes, when can we get our code into li=
nux-next repos?
> > Or we have to submit the patch to any tracking system?
> >=20
>=20
> You should bug David Woodhouse. I've added your driver to my l2-mtd-2.6
> tree, so he should take a look at it at some point:
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/eef42e4b8b0=
de71f3fdac4577c0eea0537ce0386
>=20
> --=20
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>=20
>=20

--=20
Leo Hao Chen
Software Engineer
Broadcom Canada Inc.
