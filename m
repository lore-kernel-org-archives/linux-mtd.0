Subject: Re: jffs2 kernel dump with 2.6.22-rc7
From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
	<46C5D764.5000303@andorsystems.com>
	<625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 19 Aug 2007 09:56:26 +0100
Message-Id: <1187513787.28494.9.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Joakim.Tjernlund@transmode.se,
	giulio fedel <giulio.fedel@andorsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-08-18 at 16:42 -0500, Josh Boyer wrote:
> On 8/17/07, giulio fedel <giulio.fedel@andorsystems.com> wrote:
> > In jffs2_do_unlink() in fs/jffs2/write.c
> > the jffs2_complete_reservation(c) is called even if
> > jffs2_reserve_space() is not called. This cause an unmatched
> > up(&c->alloc_sem) so the locking mechanism does not work.
> > People using MTD_CAP_NORFLASH flash _and_ CONFIG_JFFS2_SUMMARY do not
> > see the problem (see  os-linux.h for the definition of
> > jffs2_can_mark_obsolete(c)).
> >
> > I think this is your problem (it was the mine).
> 
> Hm.  That would be a regression introduced by commit
> a491486a2087ac3dfc00efb4f838c8d684afaf54 I think.
> 
> Your patch seems like the correct fix. 

Hm, maybe. On the other hand, it does make it clear that we're violating
the "No writes to flash without alloc_sem" held assumption. That
assumption, when you're holding alloc_sem, means you're allowed to hold
on to a _valid_ node while not holding the erase_completion_lock
spinlock, although you're not allowed to hold onto an invalid one
(because it might disappear if the eraseblock in which it resides is
deleted). If valid nodes can become invalid, that's going to be...
fun :)

I think I'd prefer to make the can_mark_obsolete path also hold
alloc_sem while it's doing its thing.

Giulio, please could you verify that this patch also fixes the problem?

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index bc61859..664c164 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -566,6 +566,9 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 		struct jffs2_full_dirent **prev = &dir_f->dents;
 		uint32_t nhash = full_name_hash(name, namelen);
 
+		/* We don't actually want to reserve any space, but we do
+		   want to be holding the alloc_sem when we write to flash */
+		down(&c->alloc_sem);
 		down(&dir_f->sem);
 
 		while ((*prev) && (*prev)->nhash <= nhash) {


-- 
dwmw2
