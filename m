Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOQap-0006LQ-03
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 05:20:51 +0000
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 31 Jul 2008 08:15:15 +0300
Message-Id: <1217481315.9048.64.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it, jwboyer@gmail.com,
	dwmw2@infradead.org, akpm@linux-foundation.org, rmk@arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2008-07-30 at 15:39 -0700, David Brownell wrote:
> > This patch will probably break all sorts of things because that buffer =
is
> > &*large*: up to half a meg.
> >
> > So this patch isn't mergeable.  I'll hang onto it to bug dmwm2 with whe=
n he
> > reincarnates.
>=20
> I'm still asking whether MTD folk have any plans to make that stack DMA-s=
afe...
> more than just the SPI flash drivers (mtd_dataflash, m25p80) could benefi=
t
> from DMA support, so I'd hope it's at least being considered.
>=20
> If the answer is "no" then (a) the MTD interface specs need to finally sa=
y
> they pass DMA-unsafe addresses, and (b) those SPI flash drivers are going
> to need updates.

We use vmalloc() in both UBI and UBIFS because we need to allocate a
large (of eraseblock size) buffer. So this is not just JFFS2. Using
kmalloc() for this does not seem to be a good idea for me, because
indeed the buffer size may be up to 512KiB, and may even grow at some
point to 1MiB.

Using kmalloc() would mean that at some point we would be unable to
allocate these buffers at one go and would have to do things is
fractions smaller than eraseblock size, which is not always easy. So I
am not really sure what is better - to add complexity to JFFS2/UBI/UBIFS
or to teach low levels (which do DMA) to deal with physically
noncontinuous buffers (e.g., DMA only one RAM page at a time).

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
