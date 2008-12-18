Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200812170956.55539.david-b@pacbell.net>
References: <1229532627.17960.37.camel@sauron>
	<200812170956.55539.david-b@pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Dec 2008 08:26:57 +0200
Message-Id: <1229581617.17960.63.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 09:56 -0800, David Brownell wrote:
> On Wednesday 17 December 2008, Artem Bityutskiy wrote:
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Date: Wed, 17 Dec 2008 19:42:38 +0200
> > Subject: [PATCH] MTD: fix dataflash 64-bit divisions
> >=20
> > MTD has recently been upgraded for 64-bit support, see commit
> > number 69423d99fc182a81f3c5db3eb5c140acc6fc64be in the
> > mtd-2.6.git tree (git://git.infradead.org/mtd-2.6.git)
>=20
> Hmm, in another thread I was just reading about how Linux
> would only support the first 2 GBytes of a 4 GByte NAND
> chip (Samsung MT29F16G08DAA) ... the updates to support
> large pages were easy, but signed 32-bit offsets prevented
> the full size from being recognized.  Slightly older parts
> integrated four dies with 2K pages, not two with 4KB ones,
> and gave no trouble.

Yeah, we still do not support 4KiB pages, and >2GiB NANDs.

> Would this be part of a set of patches making 4 GByte
> (and eventually, larger) NAND chips behave?

Well, this patch does only part of the job - it changes
in-kernel API. Yes, makes >4GiB NANDs behave, and we tested
it with NAND simulator (nandsim).

However, all the user-space interfaces are still 32-bit.
And the interfaces are not extendible, so someone should
invent completely new MTD interfaces.

And to support 4KiB-page NANDs, which have 128bytes OOB,
one needs to change user-space interfaces (ioctls), because
they support 64-bit OOBs at max. On the other hand, I
personally do not care about OOB support, because it is
in general better to avoid any use of OOB.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
