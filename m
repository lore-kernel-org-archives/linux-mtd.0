Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbLv-00040z-Vn
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:26:20 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00E7L0J9ZIE0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:25:57 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
References: 
In-reply-to: 
Subject: [PATCH 01/26] mtd: devices: spear_smi: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:25:57 +0900
Message-id: <004501ce4aeb$bc1006e0$343014a0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
(device-core: Ensure drvdata = NULL when no driver is bound).
Thus, it is not needed to manually clear the device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/spear_smi.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 8a82b8b..e290ef8 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -995,14 +995,12 @@ static int spear_smi_probe(struct platform_device *pdev)
 		ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "bank setup failed\n");
-			goto err_bank_setup;
+			goto err_irq;
 		}
 	}
 
 	return 0;
 
-err_bank_setup:
-	platform_set_drvdata(pdev, NULL);
 err_irq:
 	clk_disable_unprepare(dev->clk);
 err:
@@ -1040,7 +1038,6 @@ static int spear_smi_remove(struct platform_device *pdev)
 	}
 
 	clk_disable_unprepare(dev->clk);
-	platform_set_drvdata(pdev, NULL);
 
 	return 0;
 }
-- 
1.7.2.5
