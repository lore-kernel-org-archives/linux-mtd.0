Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CF8C02191
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4oV8kbS1hO5aLnJH8KABxlbyXkW7bR+99Qf6uwRqAg=; b=aBoEcburwlOtIF
	68223cXJ/Wc6wnmWmtbg3gZnhnsseV73eBHkky9jhRHij1uDA96MyimNSz3jSsRm2eXg+Bo1upgWW
	q/s9G33nSd4WpG+w8yWyE4SGvwVkPgItZO4NkPfBH8HfHRi0XdZ1kFoI4jp78DFQ+hZmCQEV4yc1b
	+KijHsaXHYXKmBew9pH388Y/1VXigwBubSjRbKYXxm3y3StjcPaXtWxz6KOnpqOf234yaFYaLiAj2
	Sq9z/RKTHQdg2hL0FBonY1XJ/V1KmSJsdTvZjcqQ9sXGUedSTYje94gC4AgYgaGiKD06Bfq7jpJuh
	nhQZo6rd6HCrCpvoSg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRD1-00000002caW-3C6V;
	Mon, 27 Jan 2025 15:39:31 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRCt-00000002cWr-3fYx
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 15:39:27 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1E740100004;
	Mon, 27 Jan 2025 18:39:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1E740100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737992355;
	bh=P8oBy0hM+/nsKiAeOgpi2vWfWfXqaiBXCDoH11AkK84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qKXOTFYFT+5jwXrcR/mhR3wKSeWDqBOdZptd1hLCIgxqCJwnuXqWZ9QFdkh/gx013
	 u3aDXJ/yCrLUcCimiY8VA+kUVjtt4zSr0t5E5SE1VqkpZhgvyjLImfUQeBh/Z6Ho0W
	 hsEQsVTqHo8k1P2yfLvG5912Ta2nJWGRuMkUZi9hZNUGeGyCfSjqdku5WKwXEunOwy
	 8eP6P8WhgVRKDy4Rxk+VU5+z/aqr/pxscbMba3KdJhspTm8pekDI9n9374iIWiQWXy
	 zbt0w9uk1qFj8TBFDn6sxxd1aDV63kpW0S7VUkLOvXP55TLp1c5DP8SN7TQcxLiEzg
	 qnyIXcQK9LQnw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 27 Jan 2025 18:39:14 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v4 5/6] mtd: spinand: micron: OTP access for MT29F2G01ABAGD
Date: Mon, 27 Jan 2025 18:38:23 +0300
Message-ID: <20250127153848.199526-6-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
References: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.160.199]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190596 [Jan 27 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/27 09:37:00 #27129213
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_073924_597749_17008E38 
X-CRM114-Status: GOOD (  17.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Support for OTP area access on Micron MT29F2G01ABAGD chip.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/micron.c | 135 +++++++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 8d741be6d5f3e..4d089eca1c337 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -9,6 +9,8 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/string.h>
 
 #define SPINAND_MFR_MICRON		0x2c
 
@@ -28,6 +30,10 @@
 
 #define MICRON_SELECT_DIE(x)	((x) << 6)
 
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_STATE		BIT(7)
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK		\
+	(CFG_OTP_ENABLE | MICRON_MT29F2G01ABAGD_CFG_OTP_STATE)
+
 static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		//SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -182,6 +188,131 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int mt29f2g01abagd_otp_is_locked(struct spinand_device *spinand)
+{
+	size_t bufsize = spinand_otp_page_size(spinand);
+	size_t retlen;
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_STATE);
+	if (ret)
+		goto free_buf;
+
+	ret = spinand_user_otp_read(spinand, 0, bufsize, &retlen, buf);
+
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			    0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	if (ret)
+		goto free_buf;
+
+	/* If all zeros, then the OTP area is locked. */
+	if (mem_is_zero(buf, bufsize))
+		ret = 1;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+
+static int mt29f2g01abagd_otp_info(struct spinand_device *spinand, size_t len,
+				   struct otp_info *buf, size_t *retlen,
+				   bool user)
+{
+	int locked;
+
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	locked = mt29f2g01abagd_otp_is_locked(spinand);
+	if (locked < 0)
+		return locked;
+
+	buf->locked = locked;
+	buf->start = 0;
+	buf->length = user ? spinand_user_otp_size(spinand) :
+			     spinand_fact_otp_size(spinand);
+
+	*retlen = sizeof(*buf);
+	return 0;
+}
+
+static int mt29f2g01abagd_fact_otp_info(struct spinand_device *spinand,
+					size_t len, struct otp_info *buf,
+					size_t *retlen)
+{
+	return mt29f2g01abagd_otp_info(spinand, len, buf, retlen, false);
+}
+
+static int mt29f2g01abagd_user_otp_info(struct spinand_device *spinand,
+					size_t len, struct otp_info *buf,
+					size_t *retlen)
+{
+	return mt29f2g01abagd_otp_info(spinand, len, buf, retlen, true);
+}
+
+static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
+				   size_t len)
+{
+	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_OP(0);
+	u8 status;
+	int ret;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK);
+	if (!ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &write_op);
+	if (!ret)
+		goto out;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (!ret)
+		goto out;
+
+	ret = spinand_wait(spinand,
+			   SPINAND_WRITE_INITIAL_DELAY_US,
+			   SPINAND_WRITE_POLL_DELAY_US,
+			   &status);
+	if (!ret && (status & STATUS_PROG_FAILED))
+		ret = -EIO;
+
+out:
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK, 0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct spinand_user_otp_ops mt29f2g01abagd_user_otp_ops = {
+	.info = mt29f2g01abagd_user_otp_info,
+	.lock = mt29f2g01abagd_otp_lock,
+	.read = spinand_user_otp_read,
+	.write = spinand_user_otp_write,
+};
+
+static const struct spinand_fact_otp_ops mt29f2g01abagd_fact_otp_ops = {
+	.info = mt29f2g01abagd_fact_otp_info,
+	.read = spinand_fact_otp_read,
+};
+
 static const struct spinand_info micron_spinand_table[] = {
 	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD",
@@ -193,7 +324,9 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &x4_update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
-				     micron_8_ecc_get_status)),
+				     micron_8_ecc_get_status),
+		     SPINAND_USER_OTP_INFO(12, 2, &mt29f2g01abagd_user_otp_ops),
+		     SPINAND_FACT_OTP_INFO(2, 0, &mt29f2g01abagd_fact_otp_ops)),
 	/* M79A 2Gb 1.8V */
 	SPINAND_INFO("MT29F2G01ABBGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
