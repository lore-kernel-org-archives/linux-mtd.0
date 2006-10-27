Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdSSL-0003NC-NE
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 10:13:18 -0400
Subject: Re: mtd-utils/nandwrite: what if write fails?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610271500310.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
	<1161095820.3260.84.camel@sauron>
	<Pine.LNX.4.64.0610271500310.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Oct 2006 17:13:05 +0300
Message-Id: <1161958385.3080.29.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-27 at 15:07 +0200, Ricard Wanderlof wrote:
> I assume that the mtd block devices don't provide any bad block managemen=
t=20
> either? (Hm, one could imagine a device which when written to simply=20
> skipped bad blocks ... ?)
Yes. I personally have never used it because it is obviously very poor
FTL and is barely usable except for testing/debugging or such.

> A torture test would be nice too, but it's not really the same thing.=20
> Blocks can go bad with time, and when one actually does go bad, it has to=
=20
> be handled at that time.

I offer you to test it. Select an eraseblock, and erase it many times in
cycle and see what happens. It may be interesting. I can send you a test
module which does this.

> Another option would be to integrate erasure into nandwrite, so that it=20
> could erase blocks prior to writing them, to give a completely integrated=
=20
> utility. Writing to a non-erased (nand) flash is rather pointless anyway=20
> isn't it? Naturally, one would want to set limits for the erasure so that=
=20
> not the whole flash would have to be erased just to write a small image.

IMO be it makes sense to write a nice image flashing utility for this
instead from scratch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
