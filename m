Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AADEC021A5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgBwTudi6JyGc+A0ZuM16aHHvdWOvA0pBdOebJc9BeQ=; b=I3xooMkFdCsqmh
	MVrcfMy5ZurUKphYYDRdDfTrNDrcKtLTKl6Qvn3o2/M3AI6Atj6RcqU3+BlCfirZ8EVVt7K/WZWxb
	8Fa/Rip3cp38pvqctxV3eOBiXfNine1skkRNKsM2ZspZ9p5rARxupok16HVhd84PF4ecGxNkFcFV8
	ki1nLdom4vhB6Bkl+YFGQso0fwiC9Zhl7fmDQfU3Tk9yrwG5Hn36GWKx9s3xJ0fpjlBMMDUDQisja
	OYls95CwfXsgv32705TjXqW0FA1sYda+NAWFwiuRfiMeLBnoP5M5RNVvNeK7N3oqI68MuQ3lmw9Li
	0KG7v+Q1M1dvV2YnXMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs9-000000008vz-47Jo;
	Mon, 10 Feb 2025 14:34:53 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs2-000000008p0-1WoD
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 14:34:50 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4675E120008;
	Mon, 10 Feb 2025 17:34:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4675E120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198081;
	bh=Z65oLmBcPx/herXhhzANuhgaRDcagc8x/OOfb0G4WKs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=jeIAL+lM3gC20v753wT6BquatLl/7/zfEqwcVnIXCZvCx6dx9Xoaj2Td62sBswB/A
	 Dk4qZK8wbcUGW1TfUwariq5CdlHOBgdfiW7B2InHJder9ft1uCE3Ul9SDauPCwUzp0
	 ci+f3Rp9uBMZPTz9QSP+yoZJaG0f2IPBxZBk5osJ2lC3aNePVHHrW/ha0zZXyk/+6p
	 LLEyUU+knXQXCzLmt3MA6bAc0TCkob5J1F16MTSir8zHntvL5Qd0MUkJeGTMcNMdUA
	 eXxOa64YLOoY0n8LKR08lC21dxeAYEQAs/7PG2iPChoa4rKew+sJbmiUtuOpqNl8Kt
	 uYoj1qhh00/rw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 17:34:41 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v5 4/6] mtd: spinand: otp: add helpers functions
Date: Mon, 10 Feb 2025 17:34:16 +0300
Message-ID: <20250210143429.286803-5-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
References: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.130.205]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190904 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063447_043316_D28225DC 
X-CRM114-Status: GOOD (  17.25  )
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

The global functions spinand_otp_read() and spinand_otp_write() have
been introduced. Since most SPI-NAND flashes read/write OTP in the same
way, let's define global functions to avoid code duplication.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/otp.c  | 109 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |   7 +++
 2 files changed, 116 insertions(+)

diff --git a/drivers/mtd/nand/spi/otp.c b/drivers/mtd/nand/spi/otp.c
index af9a7a69fc0f..ce41bca86ea9 100644
--- a/drivers/mtd/nand/spi/otp.c
+++ b/drivers/mtd/nand/spi/otp.c
@@ -66,6 +66,115 @@ static int spinand_user_otp_check_bounds(struct spinand_device *spinand,
 					&spinand->user_otp->layout);
 }
 
+static int spinand_otp_rw(struct spinand_device *spinand, loff_t ofs,
+			  size_t len, size_t *retlen, u8 *buf, bool is_write,
+			  const struct spinand_otp_layout *layout)
+{
+	struct nand_page_io_req req = {};
+	unsigned long long page;
+	size_t copied = 0;
+	size_t otp_pagesize = spinand_otp_page_size(spinand);
+	int ret;
+
+	if (!len)
+		return 0;
+
+	ret = spinand_otp_check_bounds(spinand, ofs, len, layout);
+	if (ret)
+		return ret;
+
+	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, CFG_OTP_ENABLE);
+	if (ret)
+		return ret;
+
+	page = ofs;
+	req.dataoffs = do_div(page, otp_pagesize);
+	req.pos.page = page + layout->start_page;
+	req.type = is_write ? NAND_PAGE_WRITE : NAND_PAGE_READ;
+	req.mode = MTD_OPS_RAW;
+	req.databuf.in = buf;
+
+	while (copied < len) {
+		req.datalen = min_t(unsigned int,
+				    otp_pagesize - req.dataoffs,
+				    len - copied);
+
+		if (is_write)
+			ret = spinand_write_page(spinand, &req);
+		else
+			ret = spinand_read_page(spinand, &req);
+
+		if (ret < 0)
+			break;
+
+		req.databuf.in += req.datalen;
+		req.pos.page++;
+		req.dataoffs = 0;
+		copied += req.datalen;
+	}
+
+	*retlen = copied;
+
+	if (spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_fact_otp_read() - Read from OTP area
+ * @spinand: the spinand device
+ * @ofs: the offset to read
+ * @len: the number of data bytes to read
+ * @retlen: the pointer to variable to store the number of read bytes
+ * @buf: the buffer to store the read data
+ *
+ * Return: 0 on success, an error code otherwise.
+ */
+int spinand_fact_otp_read(struct spinand_device *spinand, loff_t ofs,
+			  size_t len, size_t *retlen, u8 *buf)
+{
+	return spinand_otp_rw(spinand, ofs, len, retlen, buf, false,
+			      &spinand->fact_otp->layout);
+}
+
+/**
+ * spinand_user_otp_read() - Read from OTP area
+ * @spinand: the spinand device
+ * @ofs: the offset to read
+ * @len: the number of data bytes to read
+ * @retlen: the pointer to variable to store the number of read bytes
+ * @buf: the buffer to store the read data
+ *
+ * Return: 0 on success, an error code otherwise.
+ */
+int spinand_user_otp_read(struct spinand_device *spinand, loff_t ofs,
+			  size_t len, size_t *retlen, u8 *buf)
+{
+	return spinand_otp_rw(spinand, ofs, len, retlen, buf, false,
+			      &spinand->user_otp->layout);
+}
+
+/**
+ * spinand_user_otp_write() - Write to OTP area
+ * @spinand:  the spinand device
+ * @ofs: the offset to write to
+ * @len: the number of bytes to write
+ * @retlen: the pointer to variable to store the number of written bytes
+ * @buf: the buffer with data to write
+ *
+ * Return: 0 on success, an error code otherwise.
+ */
+int spinand_user_otp_write(struct spinand_device *spinand, loff_t ofs,
+			   size_t len, size_t *retlen, const u8 *buf)
+{
+	return spinand_otp_rw(spinand, ofs, len, retlen, (u8 *)buf, true,
+			      &spinand->user_otp->layout);
+}
+
 static int spinand_mtd_otp_info(struct mtd_info *mtd, size_t len,
 				size_t *retlen, struct otp_info *buf,
 				bool is_fact)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 597d28339d15..73424405232a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -689,6 +689,13 @@ size_t spinand_otp_page_size(struct spinand_device *spinand);
 size_t spinand_fact_otp_size(struct spinand_device *spinand);
 size_t spinand_user_otp_size(struct spinand_device *spinand);
 
+int spinand_fact_otp_read(struct spinand_device *spinand, loff_t ofs,
+			  size_t len, size_t *retlen, u8 *buf);
+int spinand_user_otp_read(struct spinand_device *spinand, loff_t ofs,
+			  size_t len, size_t *retlen, u8 *buf);
+int spinand_user_otp_write(struct spinand_device *spinand, loff_t ofs,
+			   size_t len, size_t *retlen, const u8 *buf);
+
 int spinand_set_mtd_otp_ops(struct spinand_device *spinand);
 
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
