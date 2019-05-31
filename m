Return-Path: <SRS0=uwAN=T7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A661DC04AB6
	for <linux-mtd@archiver.kernel.org>; Fri, 31 May 2019 18:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D83726DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 31 May 2019 18:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAeVFi6J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="pTE0qPcr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D83726DF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jq02kbDvTneuaybM/Nu/c3aRFziz+86SV7+jr74rdEw=; b=XAeVFi6JLJbXs+
	q1Tth5rDNG68LISUEXJ64oRm/l51BZlsxlyUUgQg0F2nCz7DB18AcSa/y0RqqnuzkhZzs6wMx7UEO
	c36e6k5IVkMUVl/vs7TExHbOhmhhcTKq1OOL5Se9g9KoNm11/pfw3oUGb3sogK/MtBhqLSpu3/8jO
	2412w63l7ygvOM9PDdyRYLmCYLq2lAm0NUBLv2qJsQlvwRxjGIhUNtw7pYgu/OM03x81gsU3qLTmb
	izswMQjgwMK23iqZJMxkyDe7zj8pktybPOJ1Bw3ZaJTgTVlJGV7HdJQj6tDmJhsDSrr/cGHYEpuoA
	t9vqDEZs38SQK9rgwb7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWmJn-0004Sf-0c; Fri, 31 May 2019 18:31:55 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWmJj-0004SA-Ty
 for linux-mtd@lists.infradead.org; Fri, 31 May 2019 18:31:53 +0000
Received: by mail-lf1-x143.google.com with SMTP id y13so8671775lfh.9
 for <linux-mtd@lists.infradead.org>; Fri, 31 May 2019 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:cc:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LKyWUKEvfM1fzUvfhVPjqkU6bFidAIH+7Nxwrly31cY=;
 b=pTE0qPcrgsFhHlYnCVNYBZGcUADT6SeE5kPaTeHm8m00++8QPf+o8i7QecbDMNgq7z
 IgZ3ORWP7ngHem8qZmexXRfq2zEbivbJbqqMalXtgdxXpiAJ3Um/glGL82BXC4E9Xr38
 UilcKnlZK0gEc2A0OZUCfAdU3GF1g8IrpVcLmz5TtEvSPsu6lZcJDQwq4EQVne9RA21G
 azt8uun7Nvdao868hSM20mYDKKclekrVuQGvf/A8uVk5x3UAUcxZV3YnYw2EJpADee38
 lk1+00Ok4qR+jSSdo5sCojVTesFUwySz2/sE+o1Z7G8aq8e0hiMHAy23s8OKwwDzWQ2x
 p6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:cc:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LKyWUKEvfM1fzUvfhVPjqkU6bFidAIH+7Nxwrly31cY=;
 b=eHIYGUBO6TurraOuIYgNz5bN122FAspKuyzOdjZ3gpZr4Fiwg9hn2fJaJYJSZLIM65
 hjzQnx02FTjMjQsWZ2D80PV1rZGKGSKB2eu7YkcC2oHGFJaadXl/3AZYUBKgpCRuBFRT
 gZK8CedqdvGcZl87XnGjVgjpAON/j7mHM3L+IatXGcGqXdtZ5FToELTuH+kJAzsRr9vD
 nPhYlVrv8a1pb9cjzVgcuGIED+EL9KY+3y39/CvOXGbGs/UEL480Icm+de5w9vC6rhFH
 beEldF7Hg+WfPtVmllYKJcCFulJ01b+Iltx1nkeVF9uzR/UZ7uMdiA8PP2kkPyoHg5tS
 txnA==
X-Gm-Message-State: APjAAAVPd4RjLLzZvvHndrXYojCsszuWjOpizYjWqK/BtkSyh1plxM3V
 2C0WPcd3QiVLWH0FRkl1npGXNA==
X-Google-Smtp-Source: APXvYqxBVoMOLjlqCdKyS50irSjf5kd9lEianha8OyN79vWlieMHfo4zeaBKiaOxNf2EXOlFe71qxg==
X-Received: by 2002:a19:7716:: with SMTP id s22mr6429503lfc.64.1559327509063; 
 Fri, 31 May 2019 11:31:49 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.86.142])
 by smtp.gmail.com with ESMTPSA id n9sm1381782ljj.10.2019.05.31.11.31.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 11:31:47 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4] mtd: devices: m25p80: Use the spi-mem dirmap API
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c405efc0-58ef-c67a-d519-95e0eb843229@cogentembedded.com>
Date: Fri, 31 May 2019 21:31:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_113152_260561_1D7C0D27 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>

---
This is a leftover unmerged patch of the "spi: spi-mem: Add a direct mapping
API" series, atop of the 'mtd/next' branch of the MTD 'linux.git' repo.

Changes in v4:
- Add Yogesh's T-b and my S-o-b

Changes in v3:
- Make nor->read/write() functional before the direct mappings have been
  created
- Add Miquel's R-b

Changes in v2:
- Rename the dirmap fields
- Return directly after calling dirmap_read/write() and let the spi-nor
  framework call us again if those functions returned less than the
  requested length

 drivers/mtd/devices/m25p80.c |  102 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

Index: linux/drivers/mtd/devices/m25p80.c
===================================================================
--- linux.orig/drivers/mtd/devices/m25p80.c
+++ linux/drivers/mtd/devices/m25p80.c
@@ -31,8 +31,70 @@
 struct m25p {
 	struct spi_mem		*spimem;
 	struct spi_nor		spi_nor;
+	struct {
+		struct spi_mem_dirmap_desc *rdesc;
+		struct spi_mem_dirmap_desc *wdesc;
+	} dirmap;
 };
 
+static int m25p_create_write_dirmap(struct m25p *flash)
+{
+	struct spi_nor *nor = &flash->spi_nor;
+	struct spi_mem_dirmap_info info = {
+		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
+				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
+				      SPI_MEM_OP_NO_DUMMY,
+				      SPI_MEM_OP_DATA_OUT(0, NULL, 1)),
+		.offset = 0,
+		.length = flash->spi_nor.mtd.size,
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
+	flash->dirmap.wdesc = spi_mem_dirmap_create(flash->spimem, &info);
+	if (IS_ERR(flash->dirmap.wdesc))
+		return PTR_ERR(flash->dirmap.wdesc);
+
+	return 0;
+}
+
+static int m25p_create_read_dirmap(struct m25p *flash)
+{
+	struct spi_nor *nor = &flash->spi_nor;
+	struct spi_mem_dirmap_info info = {
+		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
+				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
+				      SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
+				      SPI_MEM_OP_DATA_IN(0, NULL, 1)),
+		.offset = 0,
+		.length = flash->spi_nor.mtd.size,
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
+	flash->dirmap.rdesc = spi_mem_dirmap_create(flash->spimem, &info);
+	if (IS_ERR(flash->dirmap.rdesc))
+		return PTR_ERR(flash->dirmap.rdesc);
+
+	return 0;
+}
+
 static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
 {
 	struct m25p *flash = nor->priv;
@@ -92,6 +154,9 @@ static ssize_t m25p80_write(struct spi_n
 				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
 	int ret;
 
+	if (flash->dirmap.wdesc)
+		return spi_mem_dirmap_write(flash->dirmap.wdesc, to, len, buf);
+
 	/* get transfer protocols. */
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
@@ -128,6 +193,9 @@ static ssize_t m25p80_read(struct spi_no
 	size_t remaining = len;
 	int ret;
 
+	if (flash->dirmap.rdesc)
+		return spi_mem_dirmap_read(flash->dirmap.rdesc, from, len, buf);
+
 	/* get transfer protocols. */
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
@@ -238,19 +306,47 @@ static int m25p_probe(struct spi_mem *sp
 	if (ret)
 		return ret;
 
-	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
-				   data ? data->nr_parts : 0);
+	ret = m25p_create_write_dirmap(flash);
+	if (ret)
+		return ret;
+
+	ret = m25p_create_read_dirmap(flash);
+	if (ret)
+		goto err_destroy_write_dirmap;
+
+	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
+	if (ret)
+		goto err_destroy_read_dirmap;
+
+	return 0;
+
+err_destroy_read_dirmap:
+	spi_mem_dirmap_destroy(flash->dirmap.rdesc);
+
+err_destroy_write_dirmap:
+	spi_mem_dirmap_destroy(flash->dirmap.wdesc);
+
+	return ret;
 }
 
 
 static int m25p_remove(struct spi_mem *spimem)
 {
 	struct m25p	*flash = spi_mem_get_drvdata(spimem);
+	int ret;
 
 	spi_nor_restore(&flash->spi_nor);
 
 	/* Clean up MTD stuff. */
-	return mtd_device_unregister(&flash->spi_nor.mtd);
+	ret = mtd_device_unregister(&flash->spi_nor.mtd);
+	if (ret)
+		return ret;
+
+	spi_mem_dirmap_destroy(flash->dirmap.rdesc);
+	spi_mem_dirmap_destroy(flash->dirmap.wdesc);
+
+	return 0;
 }
 
 static void m25p_shutdown(struct spi_mem *spimem)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
