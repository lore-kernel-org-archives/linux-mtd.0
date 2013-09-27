Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXXM-00026y-Ap
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 12:52:48 +0000
Received: by mail-we0-f182.google.com with SMTP id q59so2651167wes.13
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 05:52:26 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: simplify image sequence test
Date: Fri, 27 Sep 2013 14:51:56 +0200
Message-Id: <1380286316-29911-2-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
References: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
---
 drivers/mtd/ubi/attach.c |    5 ++---
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
1.7.10.4
