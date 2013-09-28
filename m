Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPv0H-0003YE-GW
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:56:15 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 5/7] UBI: simplify image sequence test
Date: Sat, 28 Sep 2013 15:55:14 +0200
Message-Id: <1380376516-30144-6-git-send-email-richard@nod.at>
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Genoud <richard.genoud@gmail.com>

The test:
if (!a && b)
  a = b;
can be symplified in:
if (!a)
  a = b;

And there's no need to test if ubi->image_seq is not null, because if it is,
it is set to image_seq.
So, we just test if image_seq is not null.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 03b32b0..33bb1f2 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -900,10 +900,9 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		 * number.
 		 */
 		image_seq = be32_to_cpu(ech->image_seq);
-		if (!ubi->image_seq && image_seq)
+		if (!ubi->image_seq)
 			ubi->image_seq = image_seq;
-		if (ubi->image_seq && image_seq &&
-		    ubi->image_seq != image_seq) {
+		if (image_seq && ubi->image_seq != image_seq) {
 			ubi_err("bad image sequence number %d in PEB %d, expected %d",
 				image_seq, pnum, ubi->image_seq);
 			ubi_dump_ec_hdr(ech);
-- 
1.8.3.1
