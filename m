Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwVUm-0002Su-63
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2012 09:13:20 +0000
Received: by wico1 with SMTP id o1so3318816wic.36
 for <linux-mtd@lists.infradead.org>; Sun, 12 Feb 2012 01:13:17 -0800 (PST)
Date: Sun, 12 Feb 2012 11:13:08 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>,
 linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
Subject: [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
Message-ID: <20120212111308.0267f200@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: netdev@vger.kernel.org, shmulik.ladkani@gmail.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

As of bb0eb217, MTD_FAIL_ADDR_UNKNOWN should be used to indicate mtd
erase failure not specific to any particular block.

Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff when setting
'erase->fail_addr' in 'efx_mtd_erase()'.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
diff --git a/drivers/net/ethernet/sfc/mtd.c b/drivers/net/ethernet/sfc/mtd.c
index 6622eca..c44a03e 100644
--- a/drivers/net/ethernet/sfc/mtd.c
+++ b/drivers/net/ethernet/sfc/mtd.c
@@ -193,7 +193,7 @@ static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
 		erase->state = MTD_ERASE_DONE;
 	} else {
 		erase->state = MTD_ERASE_FAILED;
-		erase->fail_addr = 0xffffffff;
+		erase->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	}
 	mtd_erase_callback(erase);
 	return rc;
