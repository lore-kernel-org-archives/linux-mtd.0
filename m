Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnAXo-0004ga-DB
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 02:25:37 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090361318.9473.10.camel@localhost.localdomain>
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
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1090391133.15766.4.camel@famine>
Mime-Version: 1.0
Date: Wed, 21 Jul 2004 08:25:33 +0200
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

On Wed, 2004-07-21 at 00:08, David Woodhouse wrote:
> On Tue, 2004-07-20 at 20:52 +0200, =D8yvind Harboe wrote:
> > I caught it in gc.c where at some point the code assumes that gc_node
> > does not change beneath it. Don't remember.
>=20
> Hmmm. That sounds like it could break anyway. Can you be more specific?

1. Set jeb->gc_node =3D NULL; at the end of jffs2_mark_node_obsolete();=20

2. fire up the debugger and start writing to the JFFS2 disk.

3. See below...

in gc.c:

	240=09
-	241		if (!raw->next_in_ino) {
 	242			/* Inode-less node. Clean marker, snapshot or something like
that */
 	243			/* FIXME: If it's something that needs to be copied, including
something
 	244			   we don't grok that has JFFS2_NODETYPE_RWCOMPAT_COPY, we
should do so */
 	245			spin_unlock(&c->erase_completion_lock);
-	246			jffs2_mark_node_obsolete(c, raw);
-	247			up(&c->alloc_sem);
-	248			goto eraseit_lock;
 	249		}
 	250=09

----- Here raw =3D=3D NULL, hence jffs2_raw_ref_to_ic() crashes.

-	251		ic =3D jffs2_raw_ref_to_ic(raw);


> Also, memset the raw_node_ref to 0xdeadbeef before you free it. (Or run
> with slab poisoning enabled in Linux). We should go through the code and
> make sure manually that nothing's going to dereference a pointer to the
> old node after it's freed, but the poisoning is a quick and useful
> debugging aid.

eCos, which I'm using, has this facility built in:
CYGDBG_MEMALLOC_ALLOCATOR_DLMALLOC_DEBUG=20


--=20
=D8yvind Harboe
http://www.zylin.com
