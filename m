Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmoJb-0007Ry-Df
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 02:41:28 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090285839.4149.8.camel@localhost.localdomain>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
	<Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
	<1090250145.14173.3.camel@famine>
	<1090285839.4149.8.camel@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090305682.14825.2.camel@famine>
Mime-Version: 1.0
Date: Tue, 20 Jul 2004 08:41:22 +0200
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

On Tue, 2004-07-20 at 03:10, David Woodhouse wrote:
> On Mon, 2004-07-19 at 17:15 +0200, =D8yvind Harboe wrote:
> > At this point I'm just trying to find a fix that is correct.=20
>
> Well yes, but this _is_ a performance optimisation you're doing :)

Granted.

> > > Can't you adjust gc_node instead?
> >=20
> > I don't know.
> >=20
> > What should I adjust it to?
>=20
> gc_node is the next node to be garbage-collected. We don't need to
> garbage-collect nodes which are already obsolete. So if you're freeing
> the object which is currently pointed to by jeb->gc_node, you can just
> make gc_node point to the next_phys node which you're _not_ freeing.

What if gc_node points to the last node?

--=20
=D8yvind Harboe
http://www.zylin.com
