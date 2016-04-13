Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqEWL-0002MJ-VV
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 06:43:26 +0000
Date: Wed, 13 Apr 2016 09:42:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch] mtd: silence some uninitialized variable warnings
Message-ID: <20160413064234.GE8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "tmp_retlen" variable can be uninitialized if action() fails.  It's
harmless except for the static checker warning.  I have moved the error
handling earlier to fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index af28bb3..006a464 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3201,13 +3201,13 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t tmp_retlen;
 
 			ret = action(mtd, from, len, &tmp_retlen, buf);
+			if (ret)
+				break;
 
 			buf += tmp_retlen;
 			len -= tmp_retlen;
 			*retlen += tmp_retlen;
 
-			if (ret)
-				break;
 		}
 		otp_pages--;
 	}
