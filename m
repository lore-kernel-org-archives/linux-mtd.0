Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FCAC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DDA600EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DDA600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/JKLORyqE9jO4xkFnNn/6DMVdhXiQcFv1Ew+OyXWeQ=; b=C75FwmOKd/+g03
	AAzTGdTqu8CO4OERT1NaOnObkYZcwHxVumrnf72pz+esbFoS6EWlcYVCHDgCrrK23MzFaXZoNYaZW
	t2JHbgC9+SlYfsYQqUzGxVbIvhCEYSI5q3XRX/lptAaFj2UTPLx9MptVINkrOpIYrmmHVA5ATVtt2
	tXgs9OmoUb5z8Ztd6F+fCSRIDrpZ43Kz6IO3pBWPVv087uVJmWe4ueBtmcSLtN4rRu2IpciBoQYgi
	LtcGE4uiiTymIfbKeBAapeo7GWiexUM8+1BJ1zKgKbTnHNzQHjM1YFyq+dqvWTIdHIgtbVzTBsdLV
	Fbz37oZycdBVhSxFGxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnmWS-00D6EG-8S; Mon, 31 May 2021 18:20:20 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnmUa-00D5b8-Qb
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 18:18:26 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VIILv5078859;
 Mon, 31 May 2021 13:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622485101;
 bh=Sl31BUmX3/FJulfUqY3PNC/Qjz+pJuWiNkIVYGd5qs0=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=NfuXKZimM57kbNyutIUTJM6AQmbAJeZSoNqqHrlLgWl4z9pvTMaJl3/+9eXFtRs3z
 g2Y+W0xB5DH8z4j+ETzjcWRrEMcLFd+xTtADNU10HcNjTnsLAf/xk/WE1OG3JJtRXL
 KdvAAs3J4ejOE+WFsF4pYzDBzu83kTs9mr1RiPEc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VIIL4i028558
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 May 2021 13:18:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 13:18:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 13:18:20 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VIHwdL118543;
 Mon, 31 May 2021 13:18:18 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address writes in
 8D-8D-8D mode
Date: Mon, 31 May 2021 23:47:57 +0530
Message-ID: <20210531181757.19458-7-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210531181757.19458-1-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_111824_968216_4AFC6129 
X-CRM114-Status: GOOD (  22.19  )
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

On Octal DTR capable flashes like Micron Xcella the writes cannot start
or end at an odd address in Octal DTR mode. Extra 0xff bytes need to be
appended or prepended to make sure the start address and end address are
even. 0xff is used because on NOR flashes a program operation can only
flip bits from 1 to 0, not the other way round. 0 to 1 flip needs to
happen via erases.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v2:
- Replace semicolon in subject with colon.
- Add a comment that ret < 0 after adjusting for extra bytes is not
  possible, and add a WARN_ON() on the condition to make sure it gets
  spotted quickly when some change triggers this bug.

 drivers/mtd/spi-nor/core.c | 73 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a696af6a1b71..d2a7e16e667d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2023,6 +2023,72 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return ret;
 }
 
+/*
+ * On Octal DTR capable flashes like Micron Xcella the writes cannot start or
+ * end at an odd address in Octal DTR mode. Extra 0xff bytes need to be appended
+ * or prepended to make sure the start address and end address are even. 0xff is
+ * used because on NOR flashes a program operation can only flip bits from 1 to
+ * 0, not the other way round. 0 to 1 flip needs to happen via erases.
+ */
+static int spi_nor_octal_dtr_write(struct spi_nor *nor, loff_t to, size_t len,
+				   const u8 *buf)
+{
+	u8 *tmp_buf;
+	size_t bytes_written;
+	loff_t start, end;
+	int ret;
+
+	if (IS_ALIGNED(to, 2) && IS_ALIGNED(len, 2))
+		return spi_nor_write_data(nor, to, len, buf);
+
+	tmp_buf = kmalloc(nor->page_size, GFP_KERNEL);
+	if (!tmp_buf)
+		return -ENOMEM;
+
+	memset(tmp_buf, 0xff, nor->page_size);
+
+	start = round_down(to, 2);
+	end = round_up(to + len, 2);
+
+	memcpy(tmp_buf + (to - start), buf, len);
+
+	ret = spi_nor_write_data(nor, start, end - start, tmp_buf);
+	if (ret == 0) {
+		ret = -EIO;
+		goto out;
+	}
+	if (ret < 0)
+		goto out;
+
+	/*
+	 * More bytes are written than actually requested, but that number can't
+	 * be reported to the calling function or it will confuse its
+	 * calculations. Calculate how many of the _requested_ bytes were
+	 * written.
+	 */
+	bytes_written = ret;
+
+	if (to != start)
+		ret -= to - start;
+
+	/*
+	 * Only account for extra bytes at the end if they were actually
+	 * written. For example, if for some reason the controller could only
+	 * complete a partial write then the adjustment for the extra bytes at
+	 * the end is not needed.
+	 */
+	if (start + bytes_written == end)
+		ret -= end - (to + len);
+
+	/* Should not be possible. */
+	if (WARN_ON(ret < 0))
+		ret = -EIO;
+
+out:
+	kfree(tmp_buf);
+	return ret;
+}
+
 /*
  * Write an address range to the nor chip.  Data must be written in
  * FLASH_PAGESIZE chunks.  The address range may be any size provided
@@ -2067,7 +2133,12 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto write_err;
 
-		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
+		if (nor->write_proto == SNOR_PROTO_8_8_8_DTR)
+			ret = spi_nor_octal_dtr_write(nor, addr, page_remain,
+						      buf + i);
+		else
+			ret = spi_nor_write_data(nor, addr, page_remain,
+						 buf + i);
 		if (ret < 0)
 			goto write_err;
 		written = ret;
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
