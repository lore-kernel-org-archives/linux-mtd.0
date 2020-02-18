Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1D7C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 21:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF292173E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 21:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYC3oG4r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZGAm1KJB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF292173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h8d59bnQZ7PB6Q4Pu4IVnwkDWU4QznlGfr5FtqKxd5g=; b=GYC3oG4rbPh/0kdKGTGwcZkU8k
	jsuzgCqMYTkv1brToYD7FuUwefSrNdO6NhXt1yd6/x6m/wWXBVkIbvdLutYWQ09QrAeDa3W11fUs7
	KptGniGz1sCbr0TxyEuIo4iNG4dKKiPdwSW+/sFdySMDiFwYLl2AEoak3iPcue/00UT5WcGB9/Jwi
	NUMh65bjTb61dRoosvyO5CtfDa8a1oso9zd//WeHFh98mmjHfyAST3JY9J02hO1wLyiq4k/2PDPlj
	hyw/CjirhujrW7dKWduA/EeDlMzg4WyqC5rfzNcGHGEGM0fbIqvMfooDTOly8oChUWSkVdJdPIE+G
	5XqPGYbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ALq-0004FH-Eq; Tue, 18 Feb 2020 21:24:18 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ALn-0004EZ-HO
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 21:24:17 +0000
Received: by mail-lj1-x242.google.com with SMTP id o15so24691707ljg.6
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2020 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7Ke16SIMrbPFRg3soDuJETaTOOUJNMPo6V1rF6BvBY=;
 b=ZGAm1KJBBIufpXNvoJ24/P2msT7Of554/Vx//dlbmUOJhKIQozAhIEkAzVTN84bca6
 thZ8wsoOGidgRQQidlzx/07TDEtwbJV3dl1Xus7tUe1uxz1sc8V+w43peuYRnvSRtKxJ
 ZxmGp1v3lrBl/qvJCphz48Ufa+D5cSZeHExhsXBF8qmoz+3LZJM2WLuVKYWIGMCKDIuy
 ExA+mi1hVJCTJ59IE63/GGGUwXvRGP9oxpshDxoSkbSoC/sxza/fkKqg8ZvZbt14OvVi
 KDS5aEi/Mam5hC+YaZNqxceHdwQF35ykCUJrStEJJPZIkc9+jCgKVlSGF01MGjPbTN1w
 JtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T7Ke16SIMrbPFRg3soDuJETaTOOUJNMPo6V1rF6BvBY=;
 b=c2OA5w2QzBmioT0jurmqELu1BGtqDdiDuyi3AWnF83UmStnKsFz0UDDXScZkvPorep
 hoZ4ddKIy+4UHd0nyLe5bC+t16M2In9OzimQ4GDaGzVwlKg1hdE4ylPnkNnlTsr9XC2b
 lDSwj9HRJ7q3FkRk+LdS884wNHYUNiLp7wSMy31o7X1Ijr3ZaSyzAudOm/vh/ao3B2+X
 OmFv9XiRO5AEjKSFYenB53KDJnpqQVu0igrjmzb0R+B5Q19riQOYpu1HVD8ntElsZEgd
 cGeKPQwbXDkTVfLZFZ7WWBM+6W74+tcCPtZdktryH+DIXk7CxBnEsknBViZ8RtQgCopy
 uxwA==
X-Gm-Message-State: APjAAAVMJhUfnxHwKXHWpKgIf+Sr5AgsjBgjiqrbp/AStBV/eac8xImg
 zXTphCy7BZfShN5xjy7efkcMjkMggC4=
X-Google-Smtp-Source: APXvYqzsvpQWXJTOyHqIuYZ7HdZyIrQ7TQKYKJRalKrv8E7G1MiNPMsuWw6cHTnUQOWkNfiXZBc9Ig==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr14149118ljg.213.1582061053175; 
 Tue, 18 Feb 2020 13:24:13 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4291:80f4:9357:4c36:a787:cdd4])
 by smtp.gmail.com with ESMTPSA id j7sm8161ljg.25.2020.02.18.13.24.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 13:24:11 -0800 (PST)
Subject: [PATCH v5 2/2] mtd: spi-nor: use spi-mem dirmap API
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <cae72c1d-2004-0736-fca7-89b44aacf111@cogentembedded.com>
Date: Wed, 19 Feb 2020 00:24:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_132415_580625_A2D2EDEB 
X-CRM114-Status: GOOD (  19.28  )
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
Changes in version 5:
- transformed *if*/return* statements into an extra check before the memcpy()
  call and removed an empty line in spi_nor_spimem_read_data();
- resolved a reject when adding the 'nbytes' local variable and refreshed
  atop of the previous patch in spi_nor_spimem_write_data();
- removed the unnecessary *if*/return* statements in
  spi_nor_spimem_write_data();
- added the 'kernel-doc' comment for the 'dirmap' field of the 'struct spi_nor';
- refreshed the patch.
 
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

 drivers/mtd/spi-nor/spi-nor.c |   94 +++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |    6 ++
 2 files changed, 90 insertions(+), 10 deletions(-)

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
@@ -319,14 +320,20 @@ static ssize_t spi_nor_spimem_read_data(
 
 	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
 
-	error = spi_nor_spimem_exec_op(nor, &op);
-	if (error)
-		return error;
+	if (nor->dirmap.rdesc) {
+		nbytes = spi_mem_dirmap_read(nor->dirmap.rdesc, op.addr.val,
+					     op.data.nbytes, op.data.buf.in);
+	} else {
+		error = spi_nor_spimem_exec_op(nor, &op);
+		if (error)
+			return error;
+		nbytes = op.data.nbytes;
+	}
 
-	if (usebouncebuf)
-		memcpy(buf, op.data.buf.in, op.data.nbytes);
+	if (usebouncebuf && nbytes > 0)
+		memcpy(buf, op.data.buf.in, nbytes);
 
-	return op.data.nbytes;
+	return nbytes;
 }
 
 /**
@@ -365,6 +372,7 @@ static ssize_t spi_nor_spimem_write_data
 			   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
+	ssize_t nbytes;
 	int error;
 
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
@@ -377,11 +385,17 @@ static ssize_t spi_nor_spimem_write_data
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	error = spi_nor_spimem_exec_op(nor, &op);
-	if (error)
-		return error;
+	if (nor->dirmap.wdesc) {
+		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
+					      op.data.nbytes, op.data.buf.out);
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
@@ -5265,6 +5279,58 @@ int spi_nor_scan(struct spi_nor *nor, co
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
@@ -5326,6 +5392,14 @@ static int spi_nor_probe(struct spi_mem
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
@@ -580,6 +580,7 @@ struct flash_info;
  *                      The structure includes legacy flash parameters and
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
+ * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
  * @priv:		the private data
  */
 struct spi_nor {
@@ -606,6 +607,11 @@ struct spi_nor {
 
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
