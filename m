Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E74EC2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD1624679
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnRyP+7B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="d47znQRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD1624679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cvg2lm+FkvnMt+c5dJ46Niirv7a0FTaVujpjPZ7hJNA=; b=lnRyP+7BwfW12XLRasoH2LLUMQ
	ELfRVXmlHuCOQkDCETZ3la+2X1D2yrgUsXna/nw2Gta4Os1iGOiG9piAOw032v0jPowG55G6RKcYx
	G5HD8R3MNwElaEppT3cGo0kw5AYX/Co1BWj6FPAuSPdpDJ8OCKqJVygHf++F8mvMgYl49XFSDKP64
	EKKUGkM7lFc13QxN5ZdCc9Q8QWmx3TjTBkdhU1nlIQa+u8CwG3JJkA6ANt1MSgBUKtwaj4CYHjvPS
	CfS0xIgef2aZlz9skUmptTd/IqF+FiSoQsD8tlAloEhePCrbicfP8iuWV+IB/iwkJ46j9V8J1DAVn
	R/UmdAmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwB0V-0004Em-1q; Mon, 27 Jan 2020 20:29:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwB0Q-0004E0-BN
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 20:29:13 +0000
Received: by mail-lj1-x22c.google.com with SMTP id q8so8217289ljb.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 12:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Wxy1D5vKE6geq2qAOWCMTguafI8Ew/DouKKTjLgjik=;
 b=d47znQRW1/J86VB6o4wa+6hL+fflwbUHFKtGP4mDxC0EFNxnx3qzeSP+dDLS2sIgmb
 BDidJWLYhO1/vPYvNBh+ZW4jBkP+igNZHN95Y32kdx0emBaVnLuG9x72mh20TWJs9vh2
 cTFW6fPEOu/qTCXFAuZyzewwois4zLiO4/voFrq5wSzKqw9gFSzjTDfsqQWGq2bYEsjb
 F13+g3jK9JqMmn71AKnuBBxsRFvcdjuu2BOQgn/cWy4mf8P5n3xXw04y+DNKliF5hRdy
 Q/PdUZpjs5ZOYsih6nRxpaa0FVfq4RsFgm+iROufnZOmD4i8LxxGSpZixVJCfeEY2gw7
 upkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Wxy1D5vKE6geq2qAOWCMTguafI8Ew/DouKKTjLgjik=;
 b=DxDQqj7szTUINtjA9z88znTWJE4mvx86uS4Vl/Jr5aL+jTTVVDBzO/8MJ1hR3IopBU
 +7HoUk9cfSmZyOEvgTI1kq+L3pMC1qEVQFrgFkLr3YRj9uKPzJAzU+zAGPS6i2WfHJJL
 bjG9JzVnicGdAAQDPmG0d8gTlXunEIt80xvt/ilLQ6h55d/45NGMKvofvCmCC/kKJpnD
 mGFVfPPwI0vayGcM0AR6Du1uRGetSR1Ci+cshTFZdPW+2Hrod6MWTa8X6809a9uP1Hjz
 F6+v1KIutv4ynvTj/djItD50Pva50iAz1e1lMJp6K5yh4ApGoB0OfUvn0/vY9CTPQy6O
 2jpQ==
X-Gm-Message-State: APjAAAUG/LjIciyx9fJleuR311N6GXrZY75Ro6QfK4ZmdY0zz5BrL6/z
 E073EvL1JmvErjUgxSPo+bFez79tbCg=
X-Google-Smtp-Source: APXvYqyV7E6QUcvWsvklPPiOJeiNuuk0CmlGgw5xnzUGCg8C8rl5/4bk8prOXM3pTsPKYS/ixtbf5g==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr12016347ljh.104.1580156948312; 
 Mon, 27 Jan 2020 12:29:08 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:848:32ac:5845:9fa3:1634:7984])
 by smtp.gmail.com with ESMTPSA id 135sm8757636lfb.28.2020.01.27.12.29.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 12:29:07 -0800 (PST)
Subject: [PATCH v4 2/2] mtd: spi-nor: use spi-mem dirmap API
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <13ff717c-a85c-8532-b86e-1dc04af0c9dd@cogentembedded.com>
Date: Mon, 27 Jan 2020 23:29:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_122911_759402_4E78E6A6 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping.

Based on the original patch by Boris Brezillon
<boris.brezillon@bootlin.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

---
Changes in version 4:
- moved the spi_mem_dirmap_{read|write}() calls closer to the ending of
  spi_nor_{read|write}(), adapting to the chnages caused by the new patch
  splitting spi_nor_spimem_xfer_data()...

Changes in version 3:
- simplified the way spi_mem_dirmap_{read|write}() are called;
- added Boris' tag.

Changes in version 2:
- moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
  spi_nor_spimem_{read|write}_data().

 drivers/mtd/spi-nor/spi-nor.c |   97 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |    5 ++
 2 files changed, 93 insertions(+), 9 deletions(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -306,6 +306,7 @@ static ssize_t spi_nor_spimem_read_data(
 			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
 			   SPI_MEM_OP_DATA_IN(len, buf, 1));
 	bool usebouncebuf;
+	ssize_t nbytes;
 	int error;
 
 	/* get transfer protocols. */
@@ -319,14 +320,23 @@ static ssize_t spi_nor_spimem_read_data(
 
 	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
 
-	error = spi_nor_spimem_exec_op(nor, &op);
-	if (error)
-		return error;
+	if (nor->dirmap.rdesc) {
+		nbytes = spi_mem_dirmap_read(nor->dirmap.rdesc, op.addr.val,
+					     op.data.nbytes, op.data.buf.in);
+		if (nbytes < 0)
+			return nbytes;
+	} else {
+		error = spi_nor_spimem_exec_op(nor, &op);
+		if (error)
+			return error;
+
+		nbytes = op.data.nbytes;
+	}
 
 	if (usebouncebuf)
-		memcpy(buf, op.data.buf.in, op.data.nbytes);
+		memcpy(buf, op.data.buf.in, nbytes);
 
-	return op.data.nbytes;
+	return nbytes;
 }
 
 /**
@@ -366,6 +376,7 @@ static ssize_t spi_nor_spimem_write_data
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
 	bool usebouncebuf;
+	ssize_t nbytes;
 	int error;
 
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
@@ -379,11 +390,19 @@ static ssize_t spi_nor_spimem_write_data
 	if (usebouncebuf)
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	error = spi_nor_spimem_exec_op(nor, &op);
-	if (error)
-		return error;
+	if (nor->dirmap.wdesc) {
+		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
+					   op.data.nbytes, op.data.buf.out);
+		if (nbytes < 0)
+			return nbytes;
+	} else {
+		error = spi_nor_spimem_exec_op(nor, &op);
+		if (error)
+			return error;
+		nbytes = op.data.nbytes;
+	}
 
-	return op.data.nbytes;
+	return nbytes;
 }
 
 /**
@@ -5270,6 +5289,58 @@ int spi_nor_scan(struct spi_nor *nor, co
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
@@ -5331,6 +5402,14 @@ static int spi_nor_probe(struct spi_mem
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
@@ -604,6 +604,11 @@ struct spi_nor {
 
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
