Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmwXe-0001S2-W0
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 11:28:45 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090331120.4614.3.camel@localhost.localdomain>
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
	<1090305682.14825.2.camel@famine>
	<1090331120.4614.3.camel@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090337308.15094.2.camel@famine>
Mime-Version: 1.0
Date: Tue, 20 Jul 2004 17:28:28 +0200
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

tir, 20.07.2004 kl. 15.45 skrev David Woodhouse:
> On Tue, 2004-07-20 at 08:41 +0200, =D8yvind Harboe wrote:
> > What if gc_node points to the last node?
>=20
> Then you just finished garbage collecting the eraseblock in question.
> You should have a single node which is now first_node and last_node, and
> which is obsolete. You can just set gc_node to NULL.

Setting gc_node to NULL crashed when I tried it.

--=20
=D8yvind Harboe
http://www.zylin.com
