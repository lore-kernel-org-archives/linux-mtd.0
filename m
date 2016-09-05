Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvSl-0007qr-D7
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:32 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 02/17] UBI: fix add_fastmap() to use the vid_hdr passed in
 argument
Date: Mon,  5 Sep 2016 17:04:53 +0200
Message-Id: <1473087908-27862-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add_fastmap() is passed a ubi_vid_hdr pointer in argument, but is
referencing the global vidh pointer.
Even if this is correct from a functional point of view (vidh and vid_hdr
point to the same object), it is confusing.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 903becd31410..95138ae2062f 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -197,8 +197,8 @@ static int add_fastmap(struct ubi_attach_info *ai, int pnum,
 		return -ENOMEM;
 
 	aeb->pnum = pnum;
-	aeb->vol_id = be32_to_cpu(vidh->vol_id);
-	aeb->sqnum = be64_to_cpu(vidh->sqnum);
+	aeb->vol_id = be32_to_cpu(vid_hdr->vol_id);
+	aeb->sqnum = be64_to_cpu(vid_hdr->sqnum);
 	aeb->ec = ec;
 	list_add(&aeb->u.list, &ai->fastmap);
 
-- 
2.7.4
