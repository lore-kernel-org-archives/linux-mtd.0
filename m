Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJqKq-0002Fx-1P
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 18:39:48 +0000
In-Reply-To: <OF7B7B7723.82703A82-ONC1257A8D.005A1DFC-C1257A8D.005CA7D7@rohde-schwarz.com>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
 <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
 <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
 <OF7B7B7723.82703A82-ONC1257A8D.005A1DFC-C1257A8D.005CA7D7@rohde-schwarz.com>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
To: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFB615AF11.05DABF7D-ONC1257A8D.00661C69-C1257A8D.0066832C@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 4 Oct 2012 20:39:42 +0200
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

Thomas.Betker@rohde-schwarz.com wrote on 2012/10/04 18:51:58:
>
> Hello Joakim:
>
> > Try Reply With Internet-style History (We use Notes here too)
>
> Got it. Thanks!
>
> > > jffs2_reserve_space() must not be called with f->sem held because it
> > > acquires c->alloc_sem.
> >
> > hmm, are you sure? Did it fail?
> > As far as I can see jffs2_garbage_collect_live() does this.
>
> jffs2_reserve_space() does mutex_lock(&c->alloc_sem) first thing, and
> README.Locking says "Never attempt to allocate space or lock alloc_sem
> with any f->sem held.". So I didn't even try; yes, I am a coward. (:-)
> Also, all the code I checked carefully releases f->sem before calling
> jffs2_reserve_space().

I see, thanks.

>
> jffs2_garbage_collect_live() doesn't call jffs2_reserve_space() directly.
> Is it called indirectly somehow?

hmm, misread the code a bit so forget this comment.

>
> > > So I have moved mutex_lock(&f->sem) and grab_cache_page_write_begin()
> > > after jffs2_reserve_space(). Attached is my 3.4.11 patch (which is
> based
> > > on your patch) for review; I hope it is not mangled by Lotus Notes ...
> >
> > don't have time to look ATM
>
> Okay. When the tests succeed, I will simply mail it to the list as a
> regular patch, for general review.

I think your patch will work, but I don't like having 2 call sites
to grab_cache_page_write_begin(mapping, index, flags) so I came
up with this instead(untested as well):

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index db3889b..8eaeaa35 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -140,31 +140,33 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
-	int ret = 0;
+	int ret = -ENOMEM;
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_raw_inode ri;
+	uint32_t alloc_len;
+
+	if (pageofs > inode->i_size) {
+		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
+					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+		if (ret)
+			return ret;
+	}

+	mutex_lock(&f->sem);
 	pg = grab_cache_page_write_begin(mapping, index, flags);
 	if (!pg)
-		return -ENOMEM;
+		goto out_unlock;
 	*pagep = pg;

 	jffs2_dbg(1, "%s()\n", __func__);

-	if (pageofs > inode->i_size) {
+	if (!ret) { /* reserve_space succeded */
 		/* Make new hole frag from old EOF to new page */
-		struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
-		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
-		uint32_t alloc_len;

 		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
 			  (unsigned int)inode->i_size, pageofs);

-		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
-					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
-		if (ret)
-			goto out_page;
-
-		mutex_lock(&f->sem);
 		memset(&ri, 0, sizeof(ri));

 		ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -191,7 +193,6 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 		if (IS_ERR(fn)) {
 			ret = PTR_ERR(fn);
 			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
@@ -206,12 +207,10 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 			jffs2_mark_node_obsolete(c, fn->raw);
 			jffs2_free_full_dnode(fn);
 			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		jffs2_complete_reservation(c);
 		inode->i_size = pageofs;
-		mutex_unlock(&f->sem);
 	}

 	/*
@@ -220,18 +219,19 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	 * case of a short-copy.
 	 */
 	if (!PageUptodate(pg)) {
-		mutex_lock(&f->sem);
 		ret = jffs2_do_readpage_nolock(inode, pg);
-		mutex_unlock(&f->sem);
 		if (ret)
 			goto out_page;
 	}
+	mutex_unlock(&f->sem);
 	jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
-	return ret;
+	return 0;

 out_page:
 	unlock_page(pg);
 	page_cache_release(pg);
+out_unlock:
+	mutex_unlock(&f->sem);
 	return ret;
 }
