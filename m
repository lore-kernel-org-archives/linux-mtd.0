Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE8CC0218C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uzQSqUb4xjwTpaTXFcbFOVexXs1yy+568O15mxrFVs=; b=TqcTUZmTbowUut
	6Dv5e+yBVgpCRVPFPqizz7Xhi3I3qTNH9j0Jcr4Fi7G+Xeph9PLB5YzD2ADFjYLGymSt5T327If5V
	YBRdGkHZpaEF7Zf02YXYmwQCfcgqS8oPTIiom86nKjVx8SqSHDNhF4Lpi+kALxJ6rSlnQr2bNbKXk
	BQ3KVY52hI5h0bFp94AG2SLyeRFAK9N7uGVSdcWUN0l6ia8VbLyCj/TR9imWOmBMl9wGWOe/EMFOu
	VkDs1Cdrd/ssJOM42bj0TPCBWVBe8oYZvjwKEcT4KgHlGvm47LFj9y9QilhCW+3viEDIvuJHmBkrl
	lqTqpw2pheJX0uWNfAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRCx-00000002cYp-2oLg;
	Mon, 27 Jan 2025 15:39:27 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRCt-00000002cWn-3eGR
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 15:39:26 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 984FA12000A;
	Mon, 27 Jan 2025 18:39:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 984FA12000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737992354;
	bh=NAdg8iOfY3hOQ3Sfvs8WLDdRB6CCC8PTCW8ddrTRSSA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=q6LJSEqD0cvAU99NfqCcRTxpf4dl9lX5ROnJO3+jZHSKhzZjr930YiqJ93fjrENdU
	 otkeC1QuhAzefS0/B/cI9ng9mmv2IRC99VXHShQftvBLPMOEqSLmLlF4+XQXqqERch
	 mYxYF+hfk3bp91Eu5CqRGQJ/u/uD63+zEjgte9171XVWSCJjIRLn1jNIGvRM7E6q95
	 Dd6gQgpHBuGRV7VOWYR9oTzf317HgquudQH6YFRkbPDW1ce5csPIBi8sIuJDYoF/EX
	 tmFEv/bIl7o85dteGTtH6kBQD0ztVP9fTWpYU0xZHVHgrE/LyOimrBIJ0Apqn66QsV
	 tVnhrcz3RhtKw==
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
Subject: [PATCH v4 3/6] mtd: spinand: make spinand_{wait,otp_page_size} global
Date: Mon, 27 Jan 2025 18:38:21 +0300
Message-ID: <20250127153848.199526-4-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
References: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.160.199]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190599 [Jan 27 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/27 13:50:00 #27131010
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_073924_587637_4C1C2BF4 
X-CRM114-Status: GOOD (  14.76  )
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

Change the functions spinand_wait() and spinand_otp_page_size() from
static to global so that SPI NAND flash drivers don't duplicate it.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/core.c | 18 ++++++++++++++----
 drivers/mtd/nand/spi/otp.c  | 19 ++++++++++++++-----
 include/linux/mtd/spinand.h |  4 ++++
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 832ac36666edb..0b5cddc4664ac 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -531,10 +531,20 @@ static int spinand_erase_op(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
-static int spinand_wait(struct spinand_device *spinand,
-			unsigned long initial_delay_us,
-			unsigned long poll_delay_us,
-			u8 *s)
+/**
+ * spinand_wait() - Poll memory device status
+ * @spinand: the spinand device
+ * @initial_delay_us: delay in us before starting to poll
+ * @poll_delay_us: time to sleep between reads in us
+ * @s: the pointer to variable to store the value of REG_STATUS
+ *
+ * This function polls a status register (REG_STATUS) and returns when
+ * the STATUS_READY bit is 0 or when the timeout has expired.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
+		 unsigned long poll_delay_us, u8 *s)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
 						      spinand->scratchbuf);
diff --git a/drivers/mtd/nand/spi/otp.c b/drivers/mtd/nand/spi/otp.c
index d465dced554c4..1eb5677508ff8 100644
--- a/drivers/mtd/nand/spi/otp.c
+++ b/drivers/mtd/nand/spi/otp.c
@@ -8,14 +8,23 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spinand.h>
 
-static size_t spinand_otp_size(struct spinand_device *spinand,
-			       const struct spinand_otp_layout *layout)
+/**
+ * spinand_otp_page_size() - Get SPI-NAND OTP page size
+ * @spinand: the spinand device
+ *
+ * Return: the OTP page size.
+ */
+size_t spinand_otp_page_size(struct spinand_device *spinand)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	size_t otp_pagesize = nanddev_page_size(nand) +
-			      nanddev_per_page_oobsize(nand);
 
-	return layout->npages * otp_pagesize;
+	return nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
+}
+
+static size_t spinand_otp_size(struct spinand_device *spinand,
+			       const struct spinand_otp_layout *layout)
+{
+	return layout->npages * spinand_otp_page_size(spinand);
 }
 
 /**
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 458bf4b0bea2d..e0fdd3408ffa1 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -626,12 +626,16 @@ int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
+int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
+		 unsigned long poll_delay_us, u8 *s);
+
 int spinand_read_page(struct spinand_device *spinand,
 		      const struct nand_page_io_req *req);
 
 int spinand_write_page(struct spinand_device *spinand,
 		       const struct nand_page_io_req *req);
 
+size_t spinand_otp_page_size(struct spinand_device *spinand);
 size_t spinand_fact_otp_size(struct spinand_device *spinand);
 size_t spinand_user_otp_size(struct spinand_device *spinand);
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
