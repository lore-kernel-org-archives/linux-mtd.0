Received: from mail-wg0-f42.google.com ([74.125.82.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFm6o-0007F1-0r
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 14:57:21 +0000
Received: by mail-wg0-f42.google.com with SMTP id k14so3145035wgh.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 06:56:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/35] mtd: st_spi_fsm: Use device size to determine address
 width
Date: Tue, 18 Feb 2014 14:55:38 +0000
Message-Id: <1392735362-1245-12-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, lee.jones@linaro.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
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
index 68fa12e..1d7a13a0 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -670,6 +670,10 @@ static int stfsm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	fsm->info = info;
 
+	/* Use device size to determine address width */
+	if (info->sector_size * info->n_sectors > 0xFFFFFF)
+		info->flags |= FLASH_FLAG_32BIT_ADDR;
+
 	platform_set_drvdata(pdev, fsm);
 
 	fsm->mtd.dev.parent	= &pdev->dev;
-- 
1.8.3.2
