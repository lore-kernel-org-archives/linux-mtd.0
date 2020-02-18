Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E97C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 21:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C99892173E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 21:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FyL/t6xu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Gs0twGbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C99892173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BnHmDoVt9xA0eHctbGBGhR7qdbZiFtxE+bMw770lspU=; b=FyL/t6xuM9H1po5cpDFV9SEMh4
	XoWwoLO6bfaN1DvoJio1fDsidtn1cy2Ya9EZEtMM/qpMwGGmDnG9IpcDLpCIGsAFO7k6cByOl0J6L
	DW6nEHAbBZT3jUyUW+WJKfgGasHUlfapSekBbxBYYB4IJ9HU8dkulxxLNI4HMG+Mky9DT+a2tX9Qr
	mOjaY0xbtm3tGEtFngU0iQO1NYoNSDXkT7ga0WxiTG4asaY9cIskIbOqaZpuIXv81Ngk7q2BKzYMK
	ulk/H7gy49Sa8Qj2ToTFYZF180ZPFn/KEmA60jUcjtp+DycZIH7Gs0KT4jbrGvqnijVleJdY0sE3h
	rNSnEhag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4AIm-0003r5-Q7; Tue, 18 Feb 2020 21:21:08 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4AIk-0003qe-5v
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 21:21:07 +0000
Received: by mail-lf1-x143.google.com with SMTP id f24so15620493lfh.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2020 13:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QG5Z9bBu26B32PBFqYv2CDhlgCk/4uvdzhO/Cbs69do=;
 b=Gs0twGbOhahDrWWclDuwK9dSTGNQiPhdX+JKBUwHfaAPoSmWABkLFuYHAU9d0/i1uS
 oPT39S00mfjT6gEegqEaH1itkhfgr8+pQYCA7mV82kzACsFsOscUnALHuRmmkvk2V6w8
 xNI4Pjf5P6ippP07+sdRpRvwBWDDqy4f5XRX46sNWIAMIj3HJ53dIWpeXB4+2tkYvL2R
 Nc6hHarpW1giGH3UMKT71EeB99VS2XUeJ91pKOl532TDRb3U6lDNh1IZ44aw4VJhXaSP
 fyWU8a0G3danfVFWbcYRdFjZKQaQT6Z37AgwBsew+q9qJ4dtjdQG3SS1ZwDdSZ0KtsRB
 88JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QG5Z9bBu26B32PBFqYv2CDhlgCk/4uvdzhO/Cbs69do=;
 b=ElX/RCFWAGFwYAZ7YT0HrEFZGk3LC9tQ+4yJDul5rcHbjcpASeCVGfbp2VAabuhdi6
 sx33R9XsFLyCysh/qeBMSC//+xlBHHgyVqOixNEmhy3d5PPcLwURmTLbEjPx46SGh/Ns
 MsYnhZ6mstQSEFXyQy1pgPWXAKsJCmzx40x97bXq/7ckbjS4o+zxHADLNomsdLN/eRU/
 emxtHGEG/CwSEw8XxePcqtS6nJn8JmD4R3wDVdT3rVYN+QTSoBYaBD2jreDhi++KYrDj
 3zjqUOtMrgNFuEVJEVu6wcXApFqZdfd30AbruiHb2sWkAs5gxHrgx+rOmA5wFsW1VQQL
 vdPQ==
X-Gm-Message-State: APjAAAXzu9URsW9CEiH7PqlZlu4q3uUNn8u/yvLneceqmB9Md0dw8Gne
 0G8YRXA9Eky/hjIFfzqunvbWfLsur+k=
X-Google-Smtp-Source: APXvYqx9DLUmpHTD+iBAWOHz7sJX9+BekIHYeU1L4PzRMyro7TG5sIvypcOfVJeMLjCjypTWP3pa1w==
X-Received: by 2002:a19:f00d:: with SMTP id p13mr11417923lfc.37.1582060862438; 
 Tue, 18 Feb 2020 13:21:02 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4291:80f4:9357:4c36:a787:cdd4])
 by smtp.gmail.com with ESMTPSA id l64sm2911093lfd.30.2020.02.18.13.21.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 13:21:01 -0800 (PST)
Subject: [PATCH v5 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9c862aa2-04fb-f9d5-4d15-1938a8c0e4cb@cogentembedded.com>
Date: Wed, 19 Feb 2020 00:21:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_132106_226335_09F0DE06 
X-CRM114-Status: GOOD (  21.09  )
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

spi_nor_spimem_xfer_data() being a helper function for the data reads/
writes contains 3 fragments that depend on the data direction; and I'm
going to add another one to call the SPI dirmap API...
I think this function should be split so that the common fragments are
put into 2 functions, spi_nor_spimem_bounce() and spi_nor_spimem_exec_op()
called from spi_nor_spimem_{read|write}_data(), and the data direction
dependent bits moved back into those read/write functions -- that way we
would be able to avoid *goto*s otherwise needed in the next patch adding
the  SPI dirmap support...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 5:
- removed the 'usebouncebuf' local variable from spi_nor_spimem_write_data();
- refreshed the patch.

Changes in version 4:
- new patch.

 drivers/mtd/spi-nor/spi-nor.c |   89 +++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 40 deletions(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -246,55 +246,45 @@ struct flash_info {
 #define JEDEC_MFR(info)	((info)->id[0])
 
 /**
- * spi_nor_spimem_xfer_data() - helper function to read/write data to
- *                              flash's memory region
+ * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
+ *                           transfer
  * @nor:        pointer to 'struct spi_nor'
  * @op:         pointer to 'struct spi_mem_op' template for transfer
  *
- * Return: number of bytes transferred on success, -errno otherwise
+ * If we have to use the bounce buffer, the data field in @op will be updated.
+ *
+ * Return: true if the bounce buffer is needed, false if not
  */
-static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
-					struct spi_mem_op *op)
+static bool spi_nor_spimem_bounce(struct spi_nor *nor, struct spi_mem_op *op)
 {
-	bool usebouncebuf = false;
-	void *rdbuf = NULL;
-	const void *buf;
-	int ret;
-
-	if (op->data.dir == SPI_MEM_DATA_IN)
-		buf = op->data.buf.in;
-	else
-		buf = op->data.buf.out;
-
-	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
-		usebouncebuf = true;
-
-	if (usebouncebuf) {
+	/* op->data.buf.in occupies the same memory as op->data.buf.out */
+	if (object_is_on_stack(op->data.buf.in) ||
+	    !virt_addr_valid(op->data.buf.in)) {
 		if (op->data.nbytes > nor->bouncebuf_size)
 			op->data.nbytes = nor->bouncebuf_size;
-
-		if (op->data.dir == SPI_MEM_DATA_IN) {
-			rdbuf = op->data.buf.in;
-			op->data.buf.in = nor->bouncebuf;
-		} else {
-			op->data.buf.out = nor->bouncebuf;
-			memcpy(nor->bouncebuf, buf,
-			       op->data.nbytes);
-		}
+		op->data.buf.in = nor->bouncebuf;
+		return true;
 	}
 
-	ret = spi_mem_adjust_op_size(nor->spimem, op);
-	if (ret)
-		return ret;
-
-	ret = spi_mem_exec_op(nor->spimem, op);
-	if (ret)
-		return ret;
+	return false;
+}
 
-	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
-		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
+/**
+ * spi_nor_spimem_exec_op() - execute a memory operation
+ * @nor:        pointer to 'struct spi_nor'
+ * @op:         pointer to 'struct spi_mem_op' template for transfer
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
+{
+	int error;
 
-	return op->data.nbytes;
+	error = spi_mem_adjust_op_size(nor->spimem, op);
+	if (error)
+		return error;
+
+	return spi_mem_exec_op(nor->spimem, op);
 }
 
 /**
@@ -315,6 +305,8 @@ static ssize_t spi_nor_spimem_read_data(
 			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
 			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
 			   SPI_MEM_OP_DATA_IN(len, buf, 1));
+	bool usebouncebuf;
+	int error;
 
 	/* get transfer protocols. */
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
@@ -325,7 +317,16 @@ static ssize_t spi_nor_spimem_read_data(
 	/* convert the dummy cycles to the number of bytes */
 	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
 
-	return spi_nor_spimem_xfer_data(nor, &op);
+	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
+
+	error = spi_nor_spimem_exec_op(nor, &op);
+	if (error)
+		return error;
+
+	if (usebouncebuf)
+		memcpy(buf, op.data.buf.in, op.data.nbytes);
+
+	return op.data.nbytes;
 }
 
 /**
@@ -364,6 +365,7 @@ static ssize_t spi_nor_spimem_write_data
 			   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
+	int error;
 
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
@@ -372,7 +374,14 @@ static ssize_t spi_nor_spimem_write_data
 	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
 		op.addr.nbytes = 0;
 
-	return spi_nor_spimem_xfer_data(nor, &op);
+	if (spi_nor_spimem_bounce(nor, &op))
+		memcpy(nor->bouncebuf, buf, op.data.nbytes);
+
+	error = spi_nor_spimem_exec_op(nor, &op);
+	if (error)
+		return error;
+
+	return op.data.nbytes;
 }
 
 /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
