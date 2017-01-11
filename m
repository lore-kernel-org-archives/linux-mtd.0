Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPha-0000D6-Uh
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:41:00 +0000
Subject: [PATCH 05/18] mtd-cfi_cmdset_0001: Use common error handling code in
 do_write_oneword()
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <98176d77-b469-d0e3-9364-4035b0254b11@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:40:26 +0100
MIME-Version: 1.0
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 16:40:47 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0c0fa918c9ff..4b134e8beb93 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1552,10 +1552,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	mutex_lock(&chip->mutex);
 	ret = get_chip(map, chip, adr, mode);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
+	if (ret)
+		goto unlock;
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
 	ENABLE_VPP(map);
@@ -1600,6 +1598,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	xip_enable(map, chip, adr);
  out:	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
+unlock:
 	mutex_unlock(&chip->mutex);
 	return ret;
 }
-- 
2.11.0
