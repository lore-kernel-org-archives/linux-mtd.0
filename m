Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6Vtu-0000zb-2s
 for linux-mtd@lists.infradead.org; Fri, 05 May 2017 05:35:35 +0000
Date: Fri, 5 May 2017 08:33:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Potential oops on error path in quad_enable()
Message-ID: <20170505053356.vcgboleyqigluhc3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82655033-06b0-a310-07b4-1c8fa2591da2@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
that commit we changed to propagate the return.  My static checker
complains that it's eventually passed to an ERR_PTR() and later
dereferenced, but I'm not totally certain if that's true.  Regardless,
returning 1 is wrong.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Propogate the error code from spi_nor_wait_till_ready() instead of
    just returning -EINVAL

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 060a59e716be..eef55b597ec7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1389,8 +1389,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
 
-	if (spi_nor_wait_till_ready(nor))
-		return 1;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
 
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
