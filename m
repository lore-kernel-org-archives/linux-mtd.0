Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SBvHo-0004nJ-F1
 for linux-mtd@lists.infradead.org; Sun, 25 Mar 2012 21:47:42 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Fix docg3 read align bug
Date: Sun, 25 Mar 2012 23:47:29 +0200
Message-ID: <87haxcs68e.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I sent not long ago a patch for unaligned reads. And ... I made an error. I have
a patch to patch my previous submission. I wonder if this can be squashed in, or
requires an incremental commit. Tell me what you want to do, the patch is at the
end of the mail.

I hope I have not overseen another corner case, I'll recheck tomorrow evening
(GMT+1).

Cheers.

-- 
Robert

---8>---
>From c013bc50a456c3c127eae3f1751369dec1e32221 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sun, 25 Mar 2012 23:26:05 +0200
Subject: [PATCH] mtd: docg3 refix docg3 lessen read alignement burden

After the fix "mtd: docg3 less read alignement burden", a corner case
where read is unaligned an length read is small was left. As a full
page must be read, the remaining data bytes to read number was
miscalculated, leading to unreadable LEBs by UBIFS.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 7ced089..8272c02 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -893,7 +893,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		ret = doc_read_page_getbytes(docg3, nbdata, buf, 0);
 		if (ret < nbdata)
 			goto err_in_read;
-		doc_read_page_getbytes(docg3, DOC_LAYOUT_PAGE_SIZE - nbdata,
+		doc_read_page_getbytes(docg3,
+				       DOC_LAYOUT_PAGE_SIZE - nbdata - skip,
 				       NULL, 0);
 		ret = doc_read_page_getbytes(docg3, nboob, oobbuf, 0);
 		if (ret < nboob)
-- 
1.7.5.4
