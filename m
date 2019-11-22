Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CF2C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 21:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C27E20706
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 21:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nUkpyQqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="sKgqxut6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C27E20706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UyaleiO+friYxamcrEMIBnzFbTZn7t/ITOt6HaXtjVk=; b=nUkpyQqOEFCZWy
	TNKWi8hrGlY0WnhS8KW1f15e1SHu7hICw39R05eXhXeIB73JHHnsEjz3Mp1PDoGV7Ov9jcmcb7Hvv
	zRQc3BLcPxYIlwJUB6EY2i9BpZbZgatvMaXRoXAy3d7rVszKKRwhJTCu71SFNCEmtti30Zw/cWWhr
	9BFD52sN/Uyht0Vy57PHnqIWwc9zLi5AW/1PAlKneiBalHq94TctRlDtVIDFOGXKhOnGwyei0zh2T
	3cJR7Kxr5oGJ39RUqHGyZWJOJ3OrAQUhpDw0EgSNPzcQT5ho85HKJZ5/SKhmB5xTPi2Scjx3iHBXq
	+wxrDgp2m6wPdQMHNLSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYG4s-0007iy-Jo; Fri, 22 Nov 2019 21:02:54 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYG4o-0007i7-OH
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2019 21:02:52 +0000
Received: by mail-lj1-x243.google.com with SMTP id q2so8906594ljg.7
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2019 13:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=OpGm8QVyOMiVECp902L4KR4X9/68D0nPrJPhBv850Jg=;
 b=sKgqxut6SiL6NCv4BT9sMtMnpMwF2UGVWSDXjW1z82u1G8bczbN3pbPOY8q8o8Re9y
 ewLiO0rgDhsRH5rZiMZHfuhBm1lZSPTZACRT7jbeV/TwR4eKf4jKEoYCr+x1G0USpOry
 IvQ3ZR1aj3LnwgvnO1SmgNPHlUSJs/o0JMiH/ptYrN+RUBEjYYlsZ0xJA1sN0pLhTSsF
 v+bRlZ5FtYPkmK3A0iLv1beDsGfBc9eiO88QNsd4xWNr5xsrIxYrqm2zpmzZJ1PmCktx
 /ngLamd6DjTgVe2pbTAbWF1LPkmsdN9TwQRATO7vlRTrW89P6oZMiulbEt1CHiegPBbP
 BvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=OpGm8QVyOMiVECp902L4KR4X9/68D0nPrJPhBv850Jg=;
 b=FYrTbjslhprcKxn35aFYqtOIscBcgTCVLMMeP/5TR0xGcNwkzGdS5urzSvaZ/SgmcW
 CxS0WBAKjsrPFOR9v4emWXVPNnw02xfxqMB1sWNZcwo0VnYlShEHQ/mmZzPefve8+kLz
 tvkAWUqFGJQ6dhJevyzbWsQFWFrGtTt5GGuCkw0gAz8/CuUt8iE0kkCCIthAJZpJBwLm
 YBhFAznW9DmpTB+Ogtxr8n+P1wfMo9l5hqN5hpqXxUCwGBh6hSzE73eoqMyVa9Ia/1qq
 UTarhMx1ZKtZnhynNTgtNgZPyfnDHyKSX/AiwR04ORE2WwxSGiXJfOyIakOGAXTIw12C
 Byyw==
X-Gm-Message-State: APjAAAVhu2NL8XqUdEGgbIYS45MWNIEp6gLsf8mwOd0mLufbdN2ZzSBF
 TOdYYVwZCjrJKfSg2u/2N/21UA==
X-Google-Smtp-Source: APXvYqw29dS1xc3+9O/mIwo7jOYAieFJ5Afi0UANIlJl3/kK2l85FyPB7MIqoZuhm43kpA7zQ6c/eg==
X-Received: by 2002:a2e:3a12:: with SMTP id h18mr7022809lja.217.1574456564771; 
 Fri, 22 Nov 2019 13:02:44 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4201:eb7d:1e8b:64db:2e79:5340])
 by smtp.gmail.com with ESMTPSA id a18sm3710762lfg.2.2019.11.22.13.02.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 13:02:43 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH REPOST v3] mtd: spi-nor: use spi-mem dirmap API
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <88969938-961b-973b-0c13-3792c394b1d3@cogentembedded.com>
Date: Sat, 23 Nov 2019 00:02:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_130251_203324_614F15F4 
X-CRM114-Status: GOOD (  16.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping.

Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

---
The patch is against the 'spi-nor/next' branch of the MTD 'linux.git repo...
Forgot to post to 'linux-mtd' 1st time... :-(

Changes in version 3:
- simplified the way spi_mem_dirmap_{read|write}() are called;
- refreshed the patch;
- added Boris' tag.

Changes in version 2:
- moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
  spi_nor_spimem_{read|write}_data().

 drivers/mtd/spi-nor/spi-nor.c |   66 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |    5 +++
 2 files changed, 71 insertions(+)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -311,6 +311,9 @@ static ssize_t spi_nor_spimem_read_data(
 			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
 			   SPI_MEM_OP_DATA_IN(len, buf, 1));
 
+	if (nor->dirmap.rdesc)
+		return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
+
 	/* get transfer protocols. */
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
@@ -360,6 +363,9 @@ static ssize_t spi_nor_spimem_write_data
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
 
+	if (nor->dirmap.wdesc)
+		return spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
+
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
 	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
@@ -5204,6 +5210,58 @@ int spi_nor_scan(struct spi_nor *nor, co
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
+static int spi_nor_create_read_dirmap(struct spi_nor *nor)
+{
+	struct spi_mem_dirmap_info info = {
+		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
+				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
+				      SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
+				      SPI_MEM_OP_DATA_IN(0, NULL, 1)),
+		.offset = 0,
+		.length = nor->mtd.size,
+	};
+	struct spi_mem_op *op = &info.op_tmpl;
+
+	/* get transfer protocols. */
+	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
+	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
+	op->dummy.buswidth = op->addr.buswidth;
+	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
+
+	/* convert the dummy cycles to the number of bytes */
+	op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
+
+	nor->dirmap.rdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
+						       &info);
+	return PTR_ERR_OR_ZERO(nor->dirmap.rdesc);
+}
+
+static int spi_nor_create_write_dirmap(struct spi_nor *nor)
+{
+	struct spi_mem_dirmap_info info = {
+		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
+				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
+				      SPI_MEM_OP_NO_DUMMY,
+				      SPI_MEM_OP_DATA_OUT(0, NULL, 1)),
+		.offset = 0,
+		.length = nor->mtd.size,
+	};
+	struct spi_mem_op *op = &info.op_tmpl;
+
+	/* get transfer protocols. */
+	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
+	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
+	op->dummy.buswidth = op->addr.buswidth;
+	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
+
+	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
+		op->addr.nbytes = 0;
+
+	nor->dirmap.wdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
+						       &info);
+	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
+}
+
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
@@ -5265,6 +5323,14 @@ static int spi_nor_probe(struct spi_mem
 			return -ENOMEM;
 	}
 
+	ret = spi_nor_create_read_dirmap(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_create_write_dirmap(nor);
+	if (ret)
+		return ret;
+
 	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
 }
Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -610,6 +610,11 @@ struct spi_nor {
 
 	struct spi_nor_flash_parameter params;
 
+	struct {
+		struct spi_mem_dirmap_desc *rdesc;
+		struct spi_mem_dirmap_desc *wdesc;
+	} dirmap;
+
 	void *priv;
 };
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
