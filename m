Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnFod-0005tT-3h
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 08:03:20 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090410703.4280.10.camel@localhost.localdomain>
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
	<1090337308.15094.2.camel@famine>
	<1090338869.4614.7.camel@localhost.localdomain>
	<1090349564.15140.3.camel@famine>
	<1090361318.9473.10.camel@localhost.localdomain>
	<1090391133.15766.4.camel@famine>
	<1090410703.4280.10.camel@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090411396.15766.37.camel@famine>
Mime-Version: 1.0
Date: Wed, 21 Jul 2004 14:03:16 +0200
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

On Wed, 2004-07-21 at 13:51, David Woodhouse wrote:
> On Wed, 2004-07-21 at 08:25 +0200, =D8yvind Harboe wrote:
>=20
> > in gc.c:
>=20
> > -	241		if (!raw->next_in_ino) {
>=20
> > -	251		ic =3D jffs2_raw_ref_to_ic(raw);
>=20
> Hmmm. Surely you shouldn't be able to get to those in the case where
> gc_node is NULL? You should hit the condition at line 218 because
> jeb->user_size should be zero.
>=20
> Remember, gc_node is the placemarker for the garbage-collector which is
> busily obsoleting every node in this block so that the block can be
> erased and returned to the free pool. If you were freeing a node, and
> there was no 'next' node when you did so, that must have meant you got
> to the end of the eraseblock, surely?
>=20
> Obviously I'm wrong -- you have empirical evidence. But why?

I have no idea. It is easy to reproduce in the fashion I described and
this problem is complex enough that it takes a JFFS2 export a couple of
rounds in the debugger to sort out. At this point I think little would
be gained by me pursuing it.

But. What about my fix where I set jeb->gc_node to the previous element?
Isn't that a better solution in any case?

> PS. Will somebody please kick Beat Morf <beat.morf@duagon.ch> off the
> eCos list?

He will be punished at least. "autorespond =3D valid email address spack
ack support" :-)

--=20
=D8yvind Harboe
http://www.zylin.com
