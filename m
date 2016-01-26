Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNxKs-00056Y-IH
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 06:42:43 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>, linux-mtd@lists.infradead.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH] remove deprecated oobinfo retrieval
Date: Tue, 26 Jan 2016 07:42:16 +0100
Message-Id: <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris BREZILLON <boris.brezillon@free-electrons.com>

This remove OOB info retrieval, which is not used anywhere else in the code
and can generate errors when called on newer NAND that have more than 32
bytes of ECC or 16 bytes available for user usage in the OOB area.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 src/mtd.c | 8 --------
 src/mtd.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/src/mtd.c b/src/mtd.c
index 02af33b..cf8428a 100644
--- a/src/mtd.c
+++ b/src/mtd.c
@@ -700,14 +700,6 @@ struct mtd_data *mtd_open(const struct mtd_config *cfg, int flags)
 			goto out;
 		}
 
-		/* keep original oobinfo */
-		r = ioctl(mp->fd, MEMGETOOBSEL, &mp->old_oobinfo);
-		if (r != 0) {
-			fprintf(stderr, "mtd: device %s can't ioctl MEMGETOOBSEL: %d\n",
-					mp->name, r);
-			goto out;
-		}
-
 		/* get info about the mtd device (partition) */
 		r = ioctl(mp->fd, MEMGETINFO, miu);
 		if (r != 0) {
diff --git a/src/mtd.h b/src/mtd.h
index 99d7887..946a49c 100644
--- a/src/mtd.h
+++ b/src/mtd.h
@@ -112,7 +112,6 @@ struct mtd_part {
 	int nrbad;
 
         int oobinfochanged;
-	struct nand_oobinfo old_oobinfo;
 	int ecc;
 };
 
-- 
1.9.1
