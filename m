Received: from mx2.suse.de ([195.135.220.15])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JpYcV-0006AS-L3
	for linux-mtd@lists.infradead.org; Sat, 26 Apr 2008 00:50:29 +0000
Subject: patch jffs2-fix-free-space-leak-with-in-band-cleanmarkers.patch added
	to 2.6.24-stable tree
To: dwmw2@infradead.org, gregkh@suse.de,
	linux-mtd@lists.infradead.org, lost404@gmail.com,
	martin.creutziger@barco.com
From: <gregkh@suse.de>
Date: Fri, 25 Apr 2008 17:50:16 -0700
In-Reply-To: <1208945735.9212.775.camel@pmac.infradead.org>
Message-Id: <20080426005023.833C514540CB@imap.suse.de>
Cc: stable@kernel.org, stable-commits@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that we have just queued up the patch titled

     Subject: JFFS2: Fix free space leak with in-band cleanmarkers

to the 2.6.24-stable tree.  Its filename is

     jffs2-fix-free-space-leak-with-in-band-cleanmarkers.patch

A git repo of this tree can be found at 
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary


>From stable-bounces@linux.kernel.org Wed Apr 23 03:16:00 2008
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 23 Apr 2008 11:15:35 +0100
Subject: JFFS2: Fix free space leak with in-band cleanmarkers
To: stable@kernel.org
Cc: Martin Creutziger <martin.creutziger@barco.com>, Damir Shayhutdinov <lost404@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1208945735.9212.775.camel@pmac.infradead.org>

From: David Woodhouse <dwmw2@infradead.org>

We were accounting for the cleanmarker by calling jffs2_link_node_ref()
(without locking!), which adjusted both superblock and per-eraseblock
accounting, subtracting the size of the cleanmarker from {jeb,c}->free_size
and adding it to {jeb,c}->used_size.

But only _then_ were we adding the size of the newly-erased block back
to the superblock counts, and we were adding each of jeb->{free,used}_size
to the corresponding superblock counts. Thus, the size of the cleanmarker
was effectively subtracted from the superblock's free_size _twice_.

Fix this, by always adding a full eraseblock size to c->free_size when
we've erased a block. And call jffs2_link_node_ref() under the proper
lock, while we're at it.

Thanks to Alexander Yurchenko and/or Damir Shayhutdinov for (almost)
pinpointing the problem.

[Backport of commit 014b164e1392a166fe96e003d2f0e7ad2e2a0bb7]

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 fs/jffs2/erase.c |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -419,9 +419,6 @@ static void jffs2_mark_erased_block(stru
 			if (jffs2_write_nand_cleanmarker(c, jeb))
 				goto filebad;
 		}
-
-		/* Everything else got zeroed before the erase */
-		jeb->free_size = c->sector_size;
 	} else {
 
 		struct kvec vecs[1];
@@ -449,18 +446,19 @@ static void jffs2_mark_erased_block(stru
 
 			goto filebad;
 		}
-
-		/* Everything else got zeroed before the erase */
-		jeb->free_size = c->sector_size;
-		/* FIXME Special case for cleanmarker in empty block */
-		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
 	}
+	/* Everything else got zeroed before the erase */
+	jeb->free_size = c->sector_size;
 
 	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
+
 	c->erasing_size -= c->sector_size;
-	c->free_size += jeb->free_size;
-	c->used_size += jeb->used_size;
+	c->free_size += c->sector_size;
+
+	/* Account for cleanmarker now, if it's in-band */
+	if (c->cleanmarker_size && !jffs2_cleanmarker_oob(c))
+		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
 
 	jffs2_dbg_acct_sanity_check_nolock(c,jeb);
 	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);


Patches currently in stable-queue which might be from dwmw2@infradead.org are

queue-2.6.24/jffs2-fix-free-space-leak-with-in-band-cleanmarkers.patch
