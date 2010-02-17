Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NheS1-0004fW-Ng
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 07:36:06 +0000
In-Reply-To: <1266391103.11659.356.camel@localhost>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1266249781-27970-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266310789.11659.199.camel@localhost>	
	<OFACBFB4CF.DBE14C44-ONC12576CC.004F427F-C12576CC.004F68EA@transmode.se>
	<1266391103.11659.356.camel@localhost>
Subject: Re: [PATCH 2/2]
	s/jffs2_erase_pending_trigger/jffs2_garbage_collect_trigger/
To: dedekind1@gmail.com
Message-ID: <OF1172D855.9E2C6532-ONC12576CD.0028F2FE-C12576CD.0029AD61@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 17 Feb 2010 08:35:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/17 08:18:23:
>
> On Tue, 2010-02-16 at 15:27 +0100, Joakim Tjernlund wrote:
> > Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/16 09:59:49:
> > >
> > > On Mon, 2010-02-15 at 17:03 +0100, Joakim Tjernlund wrote:
> > > > Since erasing is done in GC now, trigger GC instead.
> > > > jffs2_erase_pending_trigger() renamed to jffs2_dirty_trigger() and
> > > > used by wbuf. Remove call jffs2_garbage_collect_trigger() in
> > > > write_super()
> > > >
> > > > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > > > ---
> > > >  fs/jffs2/erase.c    |    4 +---
> > > >  fs/jffs2/gc.c       |    2 +-
> > > >  fs/jffs2/nodemgmt.c |    4 ++--
> > > >  fs/jffs2/os-linux.h |    2 +-
> > > >  fs/jffs2/scan.c     |    2 +-
> > > >  fs/jffs2/super.c    |    1 -
> > > >  fs/jffs2/wbuf.c     |    8 ++++----
> > > >  7 files changed, 10 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > > > index 1ca2559..fdf9418 100644
> > > > --- a/fs/jffs2/erase.c
> > > > +++ b/fs/jffs2/erase.c
> > > > @@ -172,8 +172,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info
> > > *c, struct jffs2_eraseblo
> > > >     list_move_tail(&jeb->list, &c->erase_complete_list);
> > > >     spin_unlock(&c->erase_completion_lock);
> > > >     mutex_unlock(&c->erase_free_sem);
> > > > -   /* Ensure that kupdated calls us again to mark them clean */
> > > > -   jffs2_erase_pending_trigger(c);
> > > >  }
> > > >
> > > >  static void jffs2_erase_failed(struct jffs2_sb_info *c, struct
> > > jffs2_eraseblock *jeb, uint32_t bad_offset)
> > > > @@ -492,7 +490,7 @@ filebad:
> > > >
> > > >  refile:
> > > >     /* Stick it back on the list from whence it came and come back later */
> > > > -   jffs2_erase_pending_trigger(c);
> > > > +   jffs2_garbage_collect_trigger(c);
> > >
> > > But then you make the code more confusing. Indeed, readability becomes
> > > worse.
> > >
> > > I would just change 'jffs2_erase_pending_trigger()' and make it wake up
> > > the GC thread, just like 'jffs2_garbage_collect_trigger()'...
> >
> > Here we go then:
> >
> > From 96a4a9dc054f2dbd57e180e202f69c9645536e0d Mon Sep 17 00:00:00 2001
> > From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > Date: Tue, 16 Feb 2010 15:18:31 +0100
> > Subject: [PATCH] jffs2: Make jffs2_erase_pending_trigger() initiate GC.
> >
> > Since erasing is now in the GC thread, erases should trigger
> > the GC task instead.
> > wbuf.c still wants to flush its buffer via write_super so
> > invent jffs2_dirty_trigger() and use that in wbuf.
> > Remove surplus call to jffs2_erase_pending_trigger() in erase.c
> > and remove jffs2_garbage_collect_trigger() from write_super as
> > of now write_super() should only commit dirty data to disk.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >  fs/jffs2/erase.c    |    2 --
> >  fs/jffs2/os-linux.h |    9 +++++++--
> >  fs/jffs2/super.c    |    1 -
> >  fs/jffs2/wbuf.c     |    2 +-
> >  4 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > index 1ca2559..5616658 100644
> > --- a/fs/jffs2/erase.c
> > +++ b/fs/jffs2/erase.c
> > @@ -172,8 +172,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info
> *c, struct jffs2_eraseblo
> >     list_move_tail(&jeb->list, &c->erase_complete_list);
> >     spin_unlock(&c->erase_completion_lock);
> >     mutex_unlock(&c->erase_free_sem);
> > -   /* Ensure that kupdated calls us again to mark them clean */
> > -   jffs2_erase_pending_trigger(c);
> >  }
>
> Looks like BGT should be triggered from here in order to write the clean
> marker.

How so? JFFS2 is already running jffs2_erase_pending_blocks() and
has just completed an erase, the next thing it will do is to mark it with a clean
marker. To me it looks like belts and suspenders: kick it again just in case we missed
something.

 Jocke
