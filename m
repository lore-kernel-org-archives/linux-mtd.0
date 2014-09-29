Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYjJo-0002bL-IP
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 22:21:22 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
Date: Tue, 30 Sep 2014 00:20:47 +0200
Message-Id: <1412029248-22454-4-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-1-git-send-email-richard@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fastmap can miss a PEB if it is in the protection queue
and not jet in the used tree.
Treat every protected PEB as used.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2b0d8d6..2853a69 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1195,6 +1195,19 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fm_pos += sizeof(*fec);
 		ubi_assert(fm_pos <= ubi->fm_size);
 	}
+
+	for (i = 0; i < UBI_PROT_QUEUE_LEN; i++) {
+		list_for_each_entry(wl_e, &ubi->pq[i], u.list) {
+			fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
+
+			fec->pnum = cpu_to_be32(wl_e->pnum);
+			fec->ec = cpu_to_be32(wl_e->ec);
+
+			used_peb_count++;
+			fm_pos += sizeof(*fec);
+			ubi_assert(fm_pos <= ubi->fm_size);
+		}
+	}
 	fmh->used_peb_count = cpu_to_be32(used_peb_count);
 
 	for (node = rb_first(&ubi->scrub); node; node = rb_next(node)) {
-- 
2.1.0
