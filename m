Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXBJb-0002Rl-9y
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 19:36:46 +0000
Subject: [PATCH 2/2] mtdconcat: Improve a size determination in concat_erase()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <07947bdd-2b30-e4b5-82f7-d98b62df858e@users.sourceforge.net>
Message-ID: <8a90314d-dead-5723-b8dd-b97a38eab9f2@users.sourceforge.net>
Date: Thu, 4 Jan 2018 20:30:49 +0100
MIME-Version: 1.0
In-Reply-To: <07947bdd-2b30-e4b5-82f7-d98b62df858e@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 20:00:27 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdconcat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f1a60c55a126..67d39e562c0f 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -428,8 +428,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	}
 
 	/* make a local copy of instr to avoid modifying the caller's struct */
-	erase = kmalloc(sizeof (struct erase_info), GFP_KERNEL);
-
+	erase = kmalloc(sizeof(*erase), GFP_KERNEL);
 	if (!erase)
 		return -ENOMEM;
 
-- 
2.15.1
