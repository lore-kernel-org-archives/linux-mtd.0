Received: from ey-out-1920.google.com ([74.125.78.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh8tW-0006tz-7e
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 21:54:22 +0000
Received: by ey-out-1920.google.com with SMTP id 4so1092309eyg.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 13:54:16 -0800 (PST)
Message-ID: <4B79C444.8090402@gmail.com>
Date: Mon, 15 Feb 2010 23:01:40 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: [PATCH] mtd: misplaced parenthesis in find_boot_record()
References: <4B79C344.60908@gmail.com>
In-Reply-To: <4B79C344.60908@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The parenthesis was misplaced

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
Not sure if you care about this one, it is between #if 0 ... #endif 

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 8b22b18..1ae6a02 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -109,7 +109,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 
 		/* Finally reread to check ECC */
 		if ((ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				     &retlen, buf) < 0)) {
+				     &retlen, buf)) < 0) {
 			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but ECC read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
