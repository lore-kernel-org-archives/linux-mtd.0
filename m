Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42295C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:21:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66B961164
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66B961164
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c9de7FqOA3c4jeRCeof8CQUGnnQYFsSYz5WBe4it3M0=; b=foPobJFvlj7o+R9DCJ62EJ5An
	qwRbzS8ScBa/ttHSKTkV3UcI1LkNDlFhCD4kR4oJqBWbjG5p5OepfoBfvdXEYnuaEhXpwd5t9/xHd
	fCXL6mAPrpA5cYmU45Sn1Rh5Lg4xpgXB0oWKzssySNE62L0zCC1qIHuJY2x5mtDyps2oMHvrjE/nT
	A6K24Tb6OJ7QTO7PUuQMbOo82IwbaukYdpi6EKpdDV1GgKttFWVUDmBWjauljUF6FexjqdjxIDIvg
	jbeiLgVzpLp8eNbTF9yf9kG10z+l/AiQr3FyLFHr9yP//hF/pM8nZfAaJQPxENgYsegn/a00A/1RV
	oMRc7A67Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejXy-00580N-7h; Thu, 06 May 2021 19:20:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWS-0057aQ-Rs
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Qre2cxW/qPaINYaX2pXLttHC55Q98kYeS5PJg5R0I7E=; b=e7FtcL4YzGcd5azgqSmmENwvr2
 eHFjhFIF9FpepogGyWIG6yYvXPHU9h8b+bZr1gXX+XWwkKd1CgbpixGVs5H4ujtO8S29P9jw0Ckqc
 3kUBGAD5gwz1VoL9a5lShSqqz6MqjL0V9eFqzm1IaQaFGX/n1nI/8yiSw8x0n/mVrvFpAciclDXH6
 65bAW5nkBUoraOQ6TW5X8x2tsqscATc5m3utiE0bY2QLKaGuhmFj5uj8Y6nVmu3HLlj9wviMbCvDb
 8ggHDC/E3pR/YJgMcSOiw6xEMQSZvz4FT3dAMwvj/2dVq6do/GF67ze/HGjEDbQ5GO9uRJl3YcJHu
 e6ZItN2A==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWQ-006Kim-5a
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIoJc080712;
 Thu, 6 May 2021 14:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328730;
 bh=Qre2cxW/qPaINYaX2pXLttHC55Q98kYeS5PJg5R0I7E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=H3IEfePsq9U2n/1+gEs0wa6wQm0l8EnmgBr62hCtKxHK6Pnm9uiKZMRwEsG2VkqWB
 2GvtvHuYkb47SgcXlr7ftlL3djux7EEBrAgvFN/O4zhHFySIRVxO+yPcbbKh/bIzuB
 WRhQ9sG3yCvy5Cwl2Z5saFGlNGXXaYbcttFUW1II=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIopp122924
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:50 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUNH026052;
 Thu, 6 May 2021 14:18:47 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 5/6] mtd: spi-nor: core;
 avoid odd length/address reads on 8D-8D-8D mode
Date: Fri, 7 May 2021 00:48:28 +0530
Message-ID: <20210506191829.8271-6-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121854_313595_18A2A5ED 
X-CRM114-Status: GOOD (  20.60  )
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

On Octal DTR capable flashes like Micron Xcella reads cannot start or
end at an odd address in Octal DTR mode. Extra bytes need to be read at
the start or end to make sure both the start address and length remain
even.

To avoid allocating too much extra memory, thereby putting unnecessary
memory pressure on the system, the temporary buffer containing the extra
padding bytes is capped at PAGE_SIZE bytes. The rest of the 2-byte
aligned part should be read directly in the main buffer.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

 drivers/mtd/spi-nor/core.c | 81 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5cc206b8bbf3..3d66cc34af4d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1904,6 +1904,82 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * On Octal DTR capable flashes like Micron Xcella reads cannot start or
+ * end at an odd address in Octal DTR mode. Extra bytes need to be read
+ * at the start or end to make sure both the start address and length
+ * remain even.
+ */
+static int spi_nor_octal_dtr_read(struct spi_nor *nor, loff_t from, size_t len,
+				  u_char *buf)
+{
+	u_char *tmp_buf;
+	size_t tmp_len;
+	loff_t start, end;
+	int ret, bytes_read;
+
+	if (IS_ALIGNED(from, 2) && IS_ALIGNED(len, 2))
+		return spi_nor_read_data(nor, from, len, buf);
+	else if (IS_ALIGNED(from, 2) && len > PAGE_SIZE)
+		return spi_nor_read_data(nor, from, round_down(len, PAGE_SIZE),
+					 buf);
+
+	tmp_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!tmp_buf)
+		return -ENOMEM;
+
+	start = round_down(from, 2);
+	end = round_up(from + len, 2);
+
+	/*
+	 * Avoid allocating too much memory. The requested read length might be
+	 * quite large. Allocating a buffer just as large (slightly bigger, in
+	 * fact) would put unnecessary memory pressure on the system.
+	 *
+	 * For example if the read is from 3 to 1M, then this will read from 2
+	 * to 4098. The reads from 4098 to 1M will then not need a temporary
+	 * buffer so they can proceed as normal.
+	 */
+	tmp_len = min_t(size_t, end - start, PAGE_SIZE);
+
+	ret = spi_nor_read_data(nor, start, tmp_len, tmp_buf);
+	if (ret == 0) {
+		ret = -EIO;
+		goto out;
+	}
+	if (ret < 0)
+		goto out;
+
+	/*
+	 * More bytes are read than actually requested, but that number can't be
+	 * reported to the calling function or it will confuse its calculations.
+	 * Calculate how many of the _requested_ bytes were read.
+	 */
+	bytes_read = ret;
+
+	if (from != start)
+		ret -= from - start;
+
+	/*
+	 * Only account for extra bytes at the end if they were actually read.
+	 * For example, if the total length was truncated because of temporary
+	 * buffer size limit then the adjustment for the extra bytes at the end
+	 * is not needed.
+	 */
+	if (start + bytes_read == end)
+		ret -= end - (from + len);
+
+	if (ret < 0) {
+		ret = -EIO;
+		goto out;
+	}
+
+	memcpy(buf, tmp_buf + (from - start), ret);
+out:
+	kfree(tmp_buf);
+	return ret;
+}
+
 static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
@@ -1921,7 +1997,10 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
-		ret = spi_nor_read_data(nor, addr, len, buf);
+		if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
+			ret = spi_nor_octal_dtr_read(nor, addr, len, buf);
+		else
+			ret = spi_nor_read_data(nor, addr, len, buf);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
 			ret = -EIO;
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
