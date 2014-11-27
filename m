Received: from albert.telenet-ops.be ([195.130.137.90])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtwtq-0005OE-9j
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 11:06:15 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH/TRIVIAL 4/4] jffs2: Drop bogus if in comment
Date: Thu, 27 Nov 2014 12:05:46 +0100
Message-Id: <1417086346-23698-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1417086346-23698-1-git-send-email-geert+renesas@glider.be>
References: <1417086346-23698-1-git-send-email-geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 fs/jffs2/readinode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 386303dca382e636..dddbde4f56f4e32a 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -224,7 +224,7 @@ static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
 
 	dbg_readinode("insert fragment %#04x-%#04x, ver %u at %08x\n", tn->fn->ofs, fn_end, tn->version, ref_offset(tn->fn->raw));
 
-	/* If a node has zero dsize, we only have to keep if it if it might be the
+	/* If a node has zero dsize, we only have to keep it if it might be the
 	   node with highest version -- i.e. the one which will end up as f->metadata.
 	   Note that such nodes won't be REF_UNCHECKED since there are no data to
 	   check anyway. */
-- 
1.9.1
