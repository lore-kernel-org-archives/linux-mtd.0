Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZAy-0007eP-0u
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:22:12 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so4803914wib.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:21:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 11/36] mtd: st_spi_fsm: Use device size to determine
 address width
Date: Thu, 20 Mar 2014 09:20:43 +0000
Message-Id: <1395307268-12721-12-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Take some known parameters, namely size and number of sectors and use
them to determine weather a device can support 32bit addressing or not.
If it can, set the associated flash capability flag for latter use.

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 2740ae1..5a1b470 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -671,6 +671,10 @@ static int stfsm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	fsm->info = info;
 
+	/* Use device size to determine address width */
+	if (info->sector_size * info->n_sectors > 0x1000000)
+		info->flags |= FLASH_FLAG_32BIT_ADDR;
+
 	fsm->mtd.dev.parent	= &pdev->dev;
 	fsm->mtd.type		= MTD_NORFLASH;
 	fsm->mtd.writesize	= 4;
-- 
1.8.3.2
