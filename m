Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C0DC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18452086C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 04:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ky9o/Yrx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDzGIH//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D18452086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgnVEXxbL1zUjvfXp62o53YFm6QfIMszQ9U1PoyJceY=; b=Ky9o/Yrx5+wEub
	Oxj/iV8iSPacL4OzbIlmXE13IW6IdTirUzAxnKunit3oYtZz/dOMP8OKW6zR4tJTVVUI+Ea3k6N5Z
	j7wJMZOmEj7f83FkavJtsuGsN3IECZCo2diewARS+xWpn7LigKbe3ZXb0+JK3Frc7gjR4NKKDj8OV
	q5eZtisHQaONH/5Rb+t479QoeYU0iQc78SXrtUxVCyAo6OUsxn3VOvLEfedy5N8oV6tc3AC4tCoPI
	0Ok5aLr2jYqXHzhu0SDU3/kDtnkG74A5BoLCyO0QY7rMOoQuy4N/LAj2Uqe+wjlcP5K3EKcEmXFwM
	BzAyi6EOGv/PRHMo65SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAotk-0005Re-21; Mon, 01 Apr 2019 04:50:16 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAotN-0003rG-DM
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 04:49:54 +0000
Received: by mail-pl1-x641.google.com with SMTP id m10so3836517plt.10
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 21:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moNJlz8Hnp8YLvfjdfiXHR1qR6R97pFA3oXU5nhsmmU=;
 b=SDzGIH//bFj5ysGW9Bn4ADrZSYG7CaIdulWP2HGxnsk+BALBtIkYpbUa42iQKrpvfk
 gZDagi7qJeK3zODSAh6PWxsvRsyWjO7wqK1lONBVo8jGGamAtBf05XpCCjioEOwmXCX/
 l7Qho1wfAnhtAqqz3s+SSGfffkKKrrnhR2gZKu7J99PYHRQWCnAU6aYJgQQazoqhbM3i
 VIPGuQJ6mArLwnNxoq8LDZNjvWtdZhrMvxiZSCmLLvptPp4zC8Rd6J38EAXhIM84IAln
 Xd0MRNgwZY9P/HiwPmjBsFfxzYH3dLNvj/q8ANVOZpaMDhCVJyzcoA5R96AZ0PqGFLHD
 LPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moNJlz8Hnp8YLvfjdfiXHR1qR6R97pFA3oXU5nhsmmU=;
 b=miQQWb59VqA/n/pS75gIvkbA/2irquG2yZnzKqNSFJA3Sw4QbOGgIkQeJYpeJ3xDvR
 3qun3oQA1bymw/n6VNbV+gqolod3Zs2XUQT4xlQcCHSAwDI8p2Pf7skBRqNgwtEX4mPz
 NmCVJUQRxkZ+okXRMPAvxyGVNZ9t10TNVCHCMm716bWX4Ludst1PWZujyGzWTFCYVhzh
 ppwCerhVtOjlxCKBM7ZOce3tKD/OS99bYrYjL52rEa+/TpiidqPdYMyANTbdzPNh0FGh
 cg4NIJgEba/shgAKLZtB/BO+i263zJGeepM3TfY87bblTBsDHUGs3hqqWmYyM84fH5q0
 axDw==
X-Gm-Message-State: APjAAAWYV5Xxh2k2c2IUo5YjVofe15C6MRS/WoKAgUXw7E1sZzFMVCy+
 3nhc82ABst/neSqoYUHkmnghr3DN
X-Google-Smtp-Source: APXvYqxPoH5bx85nZpF1l5tdVoirRcUd3/NBIvDFXloIEDGmac9KOCbNo8hjLENNpqF5oQ9voX9hQw==
X-Received: by 2002:a17:902:bb98:: with SMTP id
 m24mr40860174pls.17.1554094192397; 
 Sun, 31 Mar 2019 21:49:52 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id i31sm16256097pgi.36.2019.03.31.21.49.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 31 Mar 2019 21:49:51 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: devices: m25p80: Share code between m25p80_read()
 and m25p80_write()
Date: Sun, 31 Mar 2019 21:49:38 -0700
Message-Id: <20190401044938.31237-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401044938.31237-1-andrew.smirnov@gmail.com>
References: <20190401044938.31237-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_214953_450716_8D1645F8 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move shared parts of m25p80_read() and m25p80_write() into a separate
subroutine and convert the rest of the code to use it. No functional
change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/devices/m25p80.c | 58 ++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index a54cad9bb6e3..199f7c210799 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -81,34 +81,41 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return ret;
 }
 
-static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
-			    const u_char *buf)
+static ssize_t m25p80_read_write(struct spi_nor *nor, struct spi_mem_op *op,
+				 enum spi_nor_protocol proto)
 {
 	struct m25p *flash = nor->priv;
-	struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
-				   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
 	int ret;
 
 	/* get transfer protocols. */
-	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
-	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
-	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
-
-	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
-		op.addr.nbytes = 0;
+	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
+	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
+	op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
 
-	ret = spi_mem_adjust_op_size(flash->spimem, &op);
+	ret = spi_mem_adjust_op_size(flash->spimem, op);
 	if (ret)
 		return ret;
 
-	ret = spi_mem_exec_op(flash->spimem, &op);
+	ret = spi_mem_exec_op(flash->spimem, op);
 	if (ret)
 		return ret;
 
-	return op.data.nbytes;
+	return op->data.nbytes;
+}
+
+static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
+			    const u_char *buf)
+{
+	struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
+				   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
+
+	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
+		op.addr.nbytes = 0;
+
+	return m25p80_read_write(nor, &op, nor->write_proto);
 }
 
 /*
@@ -118,32 +125,17 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 			   u_char *buf)
 {
-	struct m25p *flash = nor->priv;
 	struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
 				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
 				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
 				   SPI_MEM_OP_DATA_IN(len, buf, 1));
-	int ret;
-
-	/* get transfer protocols. */
-	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
-	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
-	op.dummy.buswidth = op.addr.buswidth;
-	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
 
+	op.dummy.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
 	/* convert the dummy cycles to the number of bytes */
 	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
 
-	ret = spi_mem_adjust_op_size(flash->spimem, &op);
-	if (ret)
-		return ret;
-
-	ret = spi_mem_exec_op(flash->spimem, &op);
-	if (ret)
-		return ret;
-
-	return op.data.nbytes;
+	return m25p80_read_write(nor, &op, nor->read_proto);
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
