Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQV-0002gl-3x
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:09 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.com>,
 linux-ext4@vger.kernel.org
Subject: [PATCH v2 19/53] fs: jbd2: make jbd2_journal_start() kernel-doc
 parseable
Date: Tue, 16 May 2017 09:16:11 -0300
Message-Id: <91e4775d0fe30d105df56bf13a796001f20780ad.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kernel-doc script expects that a function documentation to
be just before the function, otherwise it will be ignored.

So, move the kernel-doc markup to the right place.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/jbd2/transaction.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index 9ee4832b6f8b..fe7f4a373436 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -409,25 +409,6 @@ static handle_t *new_handle(int nblocks)
 	return handle;
 }
 
-/**
- * handle_t *jbd2_journal_start() - Obtain a new handle.
- * @journal: Journal to start transaction on.
- * @nblocks: number of block buffer we might modify
- *
- * We make sure that the transaction can guarantee at least nblocks of
- * modified buffers in the log.  We block until the log can guarantee
- * that much space. Additionally, if rsv_blocks > 0, we also create another
- * handle with rsv_blocks reserved blocks in the journal. This handle is
- * is stored in h_rsv_handle. It is not attached to any particular transaction
- * and thus doesn't block transaction commit. If the caller uses this reserved
- * handle, it has to set h_rsv_handle to NULL as otherwise jbd2_journal_stop()
- * on the parent handle will dispose the reserved one. Reserved handle has to
- * be converted to a normal handle using jbd2_journal_start_reserved() before
- * it can be used.
- *
- * Return a pointer to a newly allocated handle, or an ERR_PTR() value
- * on failure.
- */
 handle_t *jbd2__journal_start(journal_t *journal, int nblocks, int rsv_blocks,
 			      gfp_t gfp_mask, unsigned int type,
 			      unsigned int line_no)
@@ -478,6 +459,25 @@ handle_t *jbd2__journal_start(journal_t *journal, int nblocks, int rsv_blocks,
 EXPORT_SYMBOL(jbd2__journal_start);
 
 
+/**
+ * handle_t *jbd2_journal_start() - Obtain a new handle.
+ * @journal: Journal to start transaction on.
+ * @nblocks: number of block buffer we might modify
+ *
+ * We make sure that the transaction can guarantee at least nblocks of
+ * modified buffers in the log.  We block until the log can guarantee
+ * that much space. Additionally, if rsv_blocks > 0, we also create another
+ * handle with rsv_blocks reserved blocks in the journal. This handle is
+ * is stored in h_rsv_handle. It is not attached to any particular transaction
+ * and thus doesn't block transaction commit. If the caller uses this reserved
+ * handle, it has to set h_rsv_handle to NULL as otherwise jbd2_journal_stop()
+ * on the parent handle will dispose the reserved one. Reserved handle has to
+ * be converted to a normal handle using jbd2_journal_start_reserved() before
+ * it can be used.
+ *
+ * Return a pointer to a newly allocated handle, or an ERR_PTR() value
+ * on failure.
+ */
 handle_t *jbd2_journal_start(journal_t *journal, int nblocks)
 {
 	return jbd2__journal_start(journal, nblocks, 0, GFP_NOFS, 0, 0);
-- 
2.9.3
