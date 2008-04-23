Subject: [JFFS2] Fix free space leak with in-band cleanmarkers
From: David Woodhouse <dwmw2@infradead.org>
To: stable@kernel.org
In-Reply-To: <1208945526.9212.770.camel@pmac.infradead.org>
References: <1206973072.6190.16.camel@KARCLT0275>
	<679044850803310823x10ac1f9dg7de6ed531c7d01b6@mail.gmail.com>
	<1207035371.6252.7.camel@KARCLT0275>
	<1207549813.6505.8.camel@KARCLT0275>
	<1208945526.9212.770.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 11:15:35 +0100
Message-Id: <1208945735.9212.775.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Martin Creutziger <martin.creutziger@barco.com>,
	Damir Shayhutdinov <lost404@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 96d9ad5..bdc6a7b 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -419,9 +419,6 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 			if (jffs2_write_nand_cleanmarker(c, jeb))
 				goto filebad;
 		}
-
-		/* Everything else got zeroed before the erase */
-		jeb->free_size = c->sector_size;
 	} else {
 
 		struct kvec vecs[1];
@@ -449,18 +446,19 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 
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

-- 
dwmw2
