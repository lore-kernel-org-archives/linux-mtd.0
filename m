Date: Fri, 21 Jan 2005 13:52:29 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050121134221.GB9931@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501211349270.20298@phoenix.infradead.org>
References: <20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
	<20050121124403.GA9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
	<20050121134221.GB9931@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Fri, 21 January 2005 13:13:14 +0000, Artem B. Bityuckiy wrote:
> >=20
> > I would like create TeX file and put this "JFFS3 checkusm stuff" there.=
=20
> > This will be "JFFS3 design issues file". It will be accessible via CVS =
and=20
> > people may  edit it, contributing new ideas.
>=20
> Sounds good.
>=20
> > More questions which I would like to discuss are:
> >=20
> > * JFFS3 memory consumption
>=20
> Good idea.
>=20
> > * JFFS3 & locking
>=20
> I started a locking document for jffs2.  Below.
>=20
> It doesn't follow any style.  As I didn't know a decent style for
> locking documentation, I made up my own.  Feel free to improve it.
>=20
> J=F6rn
>=20
> --=20
> When people work hard for you for a pat on the back, you've got
> to give them that pat.
> -- Robert Heinlein
>=20
> Locking hierarchy:
>=20
> Locks can belong to either an inode or a superblock.  "f" is used to
> indicate an inode, "c" to indicate a superblock, as in most of the
> code:
> =09struct jffs2_inode *f
> =09struct jffs2_sb *c
>=20
> Each lock in the graph below is requested with all the locks above it
> possibly held - as long as their indentation level is less.  So
> c->inocache_lock can be requested with c->alloc_sem, f->sem and
> c->erase_completion_lock held.  c->erase_free_sem is never requested
> with any other locks held.
>=20
> none
> =09c->alloc_sem
> =09=09f->sem
> =09=09=09c->erase_completion_lock
> =09=09=09=09c->inocache_lock
> =09c->erase_free_sem
> =09c->gc_thread_start
>=20
>=20
>=20
> Protected data structures:
>=20
> f->sem
> =09everything inside f?
>=20
> c->alloc_sem
> =09everything in c but the below?
>=20
> c->erase_completion_lock
> =09c->free_list
> =09c->erasing_list
>=20
> c->inocache_lock
> =09c->inocache_list
>=20
> c->erase_free_sem
> =09???
>=20
> c->gc_thread_start
> =09nothing - just for synchronization
>=20
I think the locking rules in JFFS2 are fuzzy and would like to change=20
them. But now I do not have any *real* idea and not sure will have any.

P.S. Have you ever seen fs/jffs2/README.Locking?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
