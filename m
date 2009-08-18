Received: from wmproxy1-g27.free.fr ([212.27.42.91])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdVwf-0001ex-5w
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 21:10:21 +0000
Date: Tue, 18 Aug 2009 23:10:14 +0200 (CEST)
From: dimitri.gorokhovik@free.fr
To: David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Tim Gardner <tim.gardner@canonical.com>,
	Scott James Remnant <scott@canonical.com>, Julia Lawall <julia@diku.dk>,
	David Brownell <dbrownell@users.sourceforge.net>
Message-ID: <25767218.3393441250629814335.JavaMail.root@zimbra3-e1.priv.proxad.net>
In-Reply-To: <1996041455.3392751250629417929.JavaMail.root@zimbra3-e1.priv.proxad.net>
Subject: [PATCH] nftl: write support is broken
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Write support is broken in NFTL. Fix it.

Signed-off-by: <dimitri.gorokhovik@free.fr>

---

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index fb86cac..665d3eb 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -181,7 +181,7 @@ static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 	int res;
 
 	ops.mode = MTD_OOB_PLACE;
-	ops.ooboffs = offs;
+	ops.ooboffs = offs & (mtd->writesize - 1);
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = oob;
 	ops.datbuf = buf;
