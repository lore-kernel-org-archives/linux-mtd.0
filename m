Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9968C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pVvO22IdI2lG3U+bMSmontNVAnBpi//K63rRJyocgY=; b=cR450ehacO1t4k
	gjTK9I2JO/9da/JdIM2S7ECtVZuTCTuCTDvAU2mRluexTg0RQkFFgFcEmNMC2iDGc5b8BcQVk9OQp
	CkH+4rX6nWxDsTVn9HCmxGJ5qhNcdHZnsnCAAvoR7hvjYLHLZW0EU0rpBtC5kmclZZplIpIXx3k09
	BZLu358cxAZyMACBkW5rq4VooPPuk26UNHn40aejE1GXhpCwt42bTjEHaTb74fci36YWKuwKzJVDe
	OZbezXDY13L4/hQFtgAU+QMkf3nOphkhzyla2Tc/YUsKPIKc3FdOUF9TXcg0JaWhoIoPmHq84+C+W
	YJ9hl+WRoNJb29rlE2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgP-0000000C6F5-30Vw;
	Thu, 24 Sep 2026 20:04:41 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgN-0000000C6Dp-1bf4
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1408545e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280278; x=1790885078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElnHn2hsyQHJS/loLjzxhWE+x4OJLh0H9QSrawSVavs=;
        b=QEIuNYTrqaKNQM5BJ9Z9fbVzBxsCOwpe1smjblLGh854jw6h/CHSbHS3uP47F+ZrN5
         frUqL5hBxSnlrjt9SCQG6yrRoj3AnQoAAgdEtVcvrAo+UrdqFDoIvMUbEeJb/gjpHpFB
         B+8X1r7kQI1kqbbYofZiGxQcCzq9Q+j9invmS8+Z47kMfy5S6c1f5ZxTK6nli69Y2SsI
         6DAz+yoap209n0Wvq7VuB45UlZ5IDJkhASnWyvvoV3iPiywxSZt6ZDWBOoX4GUVVp8bg
         6pJu2uaJmQSKgHsvzcuwzjOHVu3ZZxOm2wOmAa+KgX6JCR6nMDr+ti7OOm0VpCTNkkHQ
         yMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280278; x=1790885078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElnHn2hsyQHJS/loLjzxhWE+x4OJLh0H9QSrawSVavs=;
        b=PSrimSKC7aK3o0Vw6T/wdLbvUkROAlNsqhDQ0/Eu0C519Cvdy8SdPz9w3mYiEzgLFa
         n8yFAVKLxCXpRjWiRUc/w0Eqg18GXywxfsG5kpIS4g+zL4A5Oka4lNyl4Vdw5pEW1HY6
         EozVc+yqNUs/z4LqTYT/GGHkIohKJ5kj3sgFOqzba5ct3QUHj5HJgHrkBrjsqky7zkQE
         3NBQCvTT/D5tspAJh5cbat+A9UpZOwZ9f2Fge8kBkGq59A3RZil1rGKDfU5RxcCuwzc2
         QFm24xdztEm3NHHQTgviqaqmKejtxeG9naLfolpvX9dGzOzDUPkuQihx00q7FnlBWK/t
         Nwcg==
X-Forwarded-Encrypted: i=1; AKwUvBzfYTbx7JGyIFPHnI2/hXuOJwymc1MWjZe/S27FyXLPFomXgWxAXXeEo1scjEIi1z0herhR8hohaAc=@lists.infradead.org
X-Gm-Message-State: AFuF++mfaLiw1y3xkGYTfdsWS7A9KYYumfA6YGK0NT7N1jAaLVjL6qbv
	KXM0S0M+TqK6gKIVg2yRcOO3lGZxXZWdco24JaJlC7rLqQwEVb7FB80Q
X-Gm-Gg: AYBFou2yfBk1h4+hrJqtDhT9KusoDdvce2ldiKAhRUGTBhb9NMXDaJ4P4QI8aifIReY
	PMlRFrkgLhyN9+ehPblHxPWuPCKQVp3Fy3J4lw6RboNtYN998XTLNzClZf/s2u+IK1MCCzfdSRE
	I7ENbV9k9i1pM54XBPRR+vyyGe9DRjaYUSccQ3+h12TkqEfzOPqff8Falb3BWQTODTsY7ZJX970
	g8dwJzKdGFpXqvIakNbh4ZZjKdq0xY8fph1PJhMt4vyHJv7ka2v9O6/Rly1PO5dcBnsS7OTw9TZ
	QZLc+px5ZfQYJg5oQXE/loemNckKDJ2LYqHeioHqiTr3rwtzyPaWBlBHdqprg0xXWY7AQz8Fh0Q
	VGQzQ+6UDwwFOt0ddKe7wHVWAFIkbaezsPgHPGW3TOCx4ZPPCc5IusZWvKCSs6uEvl56yQynGOv
	XZbLo+avPyWV0NXPixT+dXA/gfJhDsosg7pWReHRluRn/r22ZuJhc9yDG764GK8k7inDhh+LQXu
	I8VP8B8wnVIXaDM9/zNYNQ4gNU=
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr63598875e9.23.1790280277751;
        Thu, 24 Sep 2026 13:04:37 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:37 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:17 +0200
Subject: [PATCH 2/8] mtd: rawnand: qcom: make config_nand_page_read() more
 generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130439_446216_2A7C3523 
X-CRM114-Status: GOOD (  15.85  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 12bfb14cd9a3..c65a8416c3f5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -305,10 +305,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
  * Helper to prepare DMA descriptors for configuring registers
  * before reading a NAND page.
  */
-static void config_nand_page_read(struct nand_chip *chip)
+static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	if (!nandc->props->qpic_version2)
@@ -357,7 +355,9 @@ static void
 config_nand_single_cw_page_read(struct nand_chip *chip,
 				bool use_ecc, int cw)
 {
-	config_nand_page_read(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+
+	qcom_nandc_config_page_read(nandc);
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
@@ -490,7 +490,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	qcom_clear_bam_transaction(nandc);
 	set_address(host, host->cw_size * cw, page);
 	update_rw_regs(host, 1, true, raw_cw);
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
@@ -727,7 +727,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 	int i, ret;
 
-	config_nand_page_read(chip);
+	qcom_nandc_config_page_read(nandc);
 
 	/* queue cmd descs for each codeword */
 	for (i = 0; i < ecc->steps; i++) {

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
