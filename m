Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8B4C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 20:49:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A783B218AE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 20:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UPo+yYGX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EVogxiRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A783B218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S78kdU+gdLasnIZWiiVsPYLw8G0r5D2mgtdq4eMWMBc=; b=UPo+yYGXd0fjcV
	oF9eCIztOgKhDLtWMnLpVASZc03JIYH6r5lKmTqu0F252OoX5h39aa2htd/SGD2/XdeuLSIj2cTzC
	8piBsu4FlQOxqXLDg/GCg/3Wfg9/3jAVvfNzkl3SYLv/2cSVwOMBBDB+yIwiylnkxhnCG6RxhkjK+
	cIW1CrzsrL4lFuGIluw41n12dz+42Iz1H6thgVFfHGwfDUeLhSTohO3mVavd4mmOEG5qrY6rHniNV
	Vy0c024lzm6K77Xbd+Fd6FWYTxnhd7IN75jcamE2QAgDIrr6w2Vt12JHHYpvC3YeqChK+uHN17O3M
	GindCB1/tW51jE3UCjTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSoiV-0001nk-ID; Thu, 07 Nov 2019 20:49:19 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSoiR-0001n8-To
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 20:49:17 +0000
Received: by mail-lj1-x242.google.com with SMTP id p18so3803780ljc.6
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2019 12:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KkTD5gX6r21ysf3E/G0ER4ttxBA6h/ZquKv5oqO4gic=;
 b=EVogxiRTC356Qi4YLMYKspWdGIH3pIcKoIJFWHmn38tSznKzyFvAMdDn1LaV8AOZUH
 1kikjYQcJmP5b1wntMYg7bGODEeDxHKqjsDYGlSShvlY3QeNFlt8bFi0xYrZ5S4B2MaS
 9Z261P4LdV7UuW56P39OvsSX9hvBzzJvc1Xk9pUw0Y6ziBHtBom1Iswjbskwc9OMaVxJ
 1fnvDWON5xtfrZUo9OMg23K5WXLkPJP3cKlOqSLo8x0KVMtsZrwmotaKMa0zbpWCCEMS
 hSB5ix0XrcxheTYlNTobr/Cd+Cr5EaRNCxtFEKpP5eRKjhok49RDXuAmNBSovu91eP03
 LvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KkTD5gX6r21ysf3E/G0ER4ttxBA6h/ZquKv5oqO4gic=;
 b=C2UuorZJX30kF/XBHYUWuSnB1qfNVn5iLbnElARkGoivg+6T/Hrvdb/MQIu5Sou5zR
 GHCXDJVUQxO7ohP9B8NvY8TCkzSz7SsCrse78a/w4JIvPfKb36cvgqkyh/P4qPd57Ecy
 aSTxm/7Ktdxs/4MFTRYRLM8I/DKwwaq8dHJmelh3mnVl3l1jQzh70Dxrl0eOwxfy66ZB
 vHbsFskvBy8uvaP4AUOEvg5gXMeXJUTFH7S096wAQOAj2AE/c0jSBH9b69f7XyzRUpm5
 LjJGVHf7q9wm/SNkmuetJ4NucXllZARUjKppF0yWB3UFkrmeHH+PFtfGaSA3Xxw+I1us
 zekw==
X-Gm-Message-State: APjAAAWdWRcGwf2X1aSap5mUVuJ6auF7+VIr7oLsoOky6xq7JS9xQWPo
 M1I1KDzswgzib5aUUbRQUXy7aw==
X-Google-Smtp-Source: APXvYqwqAcOFVciGKupawTQ0gVf08SvfkYtUSV5nU1vIcgBMwYnB7o+FGPqIg9wQ7toVEezhOBso+g==
X-Received: by 2002:a2e:88c9:: with SMTP id a9mr3628107ljk.30.1573159754136;
 Thu, 07 Nov 2019 12:49:14 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4419:fb0d:268a:7979:ff08:4b0e])
 by smtp.gmail.com with ESMTPSA id l21sm1424232lfc.62.2019.11.07.12.49.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Nov 2019 12:49:13 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mtd: spi-nor: use spi-mem dirmap API
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
Date: Thu, 7 Nov 2019 23:49:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_124916_379708_4CA3CA5B 
X-CRM114-Status: GOOD (  19.57  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping.

Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
  spi_nor_spimem_{read|write}_data().

 drivers/mtd/spi-nor/spi-nor.c |  125 +++++++++++++++++++++++++++++++++---------
 include/linux/mtd/spi-nor.h   |    5 +
 2 files changed, 104 insertions(+), 26 deletions(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -305,22 +305,28 @@ static ssize_t spi_nor_spimem_xfer_data(
 static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
 					size_t len, u8 *buf)
 {
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
-			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
-			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
-			   SPI_MEM_OP_DATA_IN(len, buf, 1));
-
-	/* get transfer protocols. */
-	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
-	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
-	op.dummy.buswidth = op.addr.buswidth;
-	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
+	if (!nor->dirmap.rdesc) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
+				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
+				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
+				   SPI_MEM_OP_DATA_IN(len, buf, 1));
+
+		/* get transfer protocols. */
+		op.cmd.buswidth =
+			spi_nor_get_protocol_inst_nbits(nor->read_proto);
+		op.addr.buswidth =
+			spi_nor_get_protocol_addr_nbits(nor->read_proto);
+		op.dummy.buswidth = op.addr.buswidth;
+		op.data.buswidth =
+			spi_nor_get_protocol_data_nbits(nor->read_proto);
 
-	/* convert the dummy cycles to the number of bytes */
-	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
+		/* convert the dummy cycles to the number of bytes */
+		op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
 
-	return spi_nor_spimem_xfer_data(nor, &op);
+		return spi_nor_spimem_xfer_data(nor, &op);
+	}
+	return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
 }
 
 /**
@@ -354,20 +360,27 @@ static ssize_t spi_nor_read_data(struct
 static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 					 size_t len, const u8 *buf)
 {
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
-			   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
-
-	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
-	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
-	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
+	if (!nor->dirmap.wdesc) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
+				   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
 
-	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
-		op.addr.nbytes = 0;
+		op.cmd.buswidth =
+			spi_nor_get_protocol_inst_nbits(nor->write_proto);
+		op.addr.buswidth =
+			spi_nor_get_protocol_addr_nbits(nor->write_proto);
+		op.data.buswidth =
+			spi_nor_get_protocol_data_nbits(nor->write_proto);
+
+		if (nor->program_opcode == SPINOR_OP_AAI_WP &&
+		    nor->sst_write_second)
+			op.addr.nbytes = 0;
 
-	return spi_nor_spimem_xfer_data(nor, &op);
+		return spi_nor_spimem_xfer_data(nor, &op);
+	}
+	return spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
 }
 
 /**
@@ -4979,6 +4992,58 @@ int spi_nor_scan(struct spi_nor *nor, co
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
@@ -5040,6 +5105,14 @@ static int spi_nor_probe(struct spi_mem
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
@@ -602,6 +602,11 @@ struct spi_nor {
 	int (*clear_sr_bp)(struct spi_nor *nor);
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
