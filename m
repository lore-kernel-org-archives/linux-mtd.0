Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmZro-00058Y-63
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 11:15:49 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
	<Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090250145.14173.3.camel@famine>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 17:15:46 +0200
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, ecos-discuss@sources.redhat.com
Subject: Re: JFFS2 eats memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

man, 19.07.2004 kl. 16.24 skrev David Woodhouse:
> On Mon, 19 Jul 2004, [ISO-8859-1] yvindHarboe wrote:
>=20
> > It crashes during garbage collect.
> >=20
> > How does this fix look?
>=20
> Suboptimal. You refrain from freeing if(jeb->gc_node) but that's going to=
=20
> mean that every time GC frees such a node you're not claiming the memory=20
> back?=20

I suppose.

At this point I'm just trying to find a fix that is correct.=20

> Can't you adjust gc_node instead?

I don't know.

What should I adjust it to?

> Standard comments about 8-char indentation=20

I need to beat emacs into submission at some point...

> and "=3D=3DNULL" being horrid also apply :)

I have a database over all the formatting preferences of all the
different projects and source codes I'm working on, and your profile
still needs a bit of tweaking. ;-)

--=20
=D8yvind Harboe
http://www.zylin.com
