Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmwX7-0001Nl-Qq
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 11:28:01 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090330892.4614.1.camel@localhost.localdomain>
References: <1090250271.14173.6.camel@famine>
	<1090330892.4614.1.camel@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090337274.15094.0.camel@famine>
Mime-Version: 1.0
Date: Tue, 20 Jul 2004 17:27:54 +0200
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems with JFFS2 assert failure on mutex
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tir, 20.07.2004 kl. 15.41 skrev David Woodhouse:
> On Mon, 2004-07-19 at 17:17 +0200, =D8yvind Harboe wrote:
> > I was working on a different problem when I came across a mutex that
> > was being obtained twice(discovered via eCos asserts).
> >=20
> > On the surface of it, this patch looks correct.
>=20
> Looks correct; I've committed an equivalent to CVS. Thanks.
>=20
> > Comments?
>=20
> Only that this error path should never happen. The call to
> jffs2_gc_fetch_inode() for a valid inode should _never_ fail.

I believe this was with a corrupt JFFS2 disk.

--=20
=D8yvind Harboe
http://www.zylin.com
