Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46359E77191
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9ehf+jjG2nnfbcAPpuEoaW1CHZOXnI/NymPOfTukO0=; b=4j1WWDO768MMaq
	5gyQ9Y4cfv0lp7/fqCI3RHvtc3ITY9dhGTj82IGvvK7AFQhvBzfKhrNdKunF6Ko0U43YsbUu1Y/rE
	VX73LgulfpXXtmeJ352NwCPsxVGUTJZZqGsBsXlKFCoRY0uVRmyKht577zDtDhNhMDfyibnexTNX8
	0VPkOO6BYD1AHjB0vO3h31X6lWlhrJrN9RxkdwIEkGv0d+USNqn9u6TKECFp64igdJKEFdLe50zye
	NsMFTIXMSUMg8nLXsw1TGSta8P5BNVGXI4Nr3vcaXgtLK8R34t7TmHCh3Xj8FGYEwk15tweT93Rmj
	XbPkqQhyGLj1G/tl/uZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoN0-0000000Fray-3z7h;
	Thu, 26 Dec 2024 13:57:46 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoM2-0000000FrNG-3Zqi
	for linux-mtd@lists.infradead.org;
	Thu, 26 Dec 2024 13:56:49 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D55BD12000D;
	Thu, 26 Dec 2024 16:56:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D55BD12000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735221396;
	bh=EC+AhQnFBqRN/0Suzazs1APZmE2vEqAK2nZQiqZ2ZrU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=EfbFAeFasUhVG7SRIGJ7x8/3D0CO3+jzyVYVjtZdbJqRrXCy7W3ckAbO8jZJJi+D8
	 MslnO/1WtmN2Zw072Al1OQDWQq2RYdOBqsiZcTRRz3dUFRqzoWCRNhshTrlhRFLNhP
	 73hFc3g2i8wtxqiXpBb+2uKb/CraVdSbnz0C3vB6AWQTzjDOTXSjmOWMj0DYCflOpt
	 sm7TPhTggdiu3RgXNXU9Ssw359U0UVoFyz5YdjB9oS9TDvj3uM513v2z6S9ADs85p3
	 C2Pby4IqXy8adSNWhS0t6XwjNgZurKutpRY6FcPfFCz2Bd1fdYNq6fER5d+q7MkaZg
	 gDa3Q3pWXIMiA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 26 Dec 2024 16:56:36 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Alexey Romanov
	<avromanov@salutedevices.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v3 3/7] mtd: spinand: make spinand_{wait,otp_page_size} global
Date: Thu, 26 Dec 2024 16:55:48 +0300
Message-ID: <20241226135623.43098-4-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
References: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.224.140]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190075 [Dec 26 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/26 12:50:00 #26919000
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_055647_632433_E22658A5 
X-CRM114-Status: GOOD (  14.87  )
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
index d12f09b28e371..018d6b6c61d10 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -496,10 +496,20 @@ static int spinand_erase_op(struct spinand_device *spinand,
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
index 3650ff336db14..a50d6af818613 100644
--- a/drivers/mtd/nand/spi/otp.c
+++ b/drivers/mtd/nand/spi/otp.c
@@ -8,6 +8,19 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spinand.h>
 
+/**
+ * spinand_otp_page_size() - Get SPI-NAND OTP page size
+ * @spinand: the spinand device
+ *
+ * Return: the OTP page size.
+ */
+size_t spinand_otp_page_size(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	return nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
+}
+
 /**
  * spinand_otp_size() - Get SPI-NAND OTP area size
  * @spinand: the spinand device
@@ -16,11 +29,7 @@
  */
 size_t spinand_otp_size(struct spinand_device *spinand)
 {
-	struct nand_device *nand = spinand_to_nand(spinand);
-	size_t otp_pagesize = nanddev_page_size(nand) +
-			      nanddev_per_page_oobsize(nand);
-
-	return spinand->otp->layout.npages * otp_pagesize;
+	return spinand->otp->layout.npages * spinand_otp_page_size(spinand);
 }
 
 static int spinand_otp_check_bounds(struct spinand_device *spinand, loff_t ofs,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a9ad286de2902..19d76057c0444 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -567,12 +567,16 @@ int spinand_match_and_init(struct spinand_device *spinand,
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
+int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
+		 unsigned long poll_delay_us, u8 *s);
+
 int spinand_read_page(struct spinand_device *spinand,
 		      const struct nand_page_io_req *req);
 
 int spinand_write_page(struct spinand_device *spinand,
 		       const struct nand_page_io_req *req);
 
+size_t spinand_otp_page_size(struct spinand_device *spinand);
 size_t spinand_otp_size(struct spinand_device *spinand);
 
 int spinand_set_mtd_otp_ops(struct spinand_device *spinand);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
