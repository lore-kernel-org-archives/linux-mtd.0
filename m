Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A42C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1969B24679
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0kvcgcS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="e7cQvUGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1969B24679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tht5v/B8v6Y6CTURNEdAv4DvF8kju5hXFhzjJPEU9fo=; b=n0kvcgcS4uaVnx47eJLbqC3b32
	LMMHRr8esot/LSqlr5cr4YbrE3ZVrpxAHIMDzcAPxCzxgkS9HGAvuyCXsH8QgGeYTcfRvriwqo/mN
	ocWS2234Y9Sw2ZnaXyluH3viTC1JPjRxsHVA1X/KJEIBRiaTTs9r/lbVZPf6GjO5gO5RRLCsyDsRu
	+hidQsxfMsyXt1pfgxe6gKgM+VMoOoWd/LnNMUZmuLXvualqrE/3zTxtjqUnjMNJf2COOrwHf/B6K
	a+YNoW7Z6HEL3ilGqNW4HMYlknlLbKhKVmIG7QriqXc0YjgKRtBqW48RW+Yku8A05krQrkNGR8juA
	yuDERZLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwAzU-0003uc-PX; Mon, 27 Jan 2020 20:28:12 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwAzR-0003to-Gc
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 20:28:11 +0000
Received: by mail-lf1-x143.google.com with SMTP id t23so7270761lfk.6
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 12:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t/ONaj2FckqgVcP49BuE08BLQBEDOuIeEo33sCiZhD4=;
 b=e7cQvUGEsWpDU9Wqn0iPwZkkKoYr+ax8CrO1fOTkpFSwK+MpxjYPtZYDVoeYPSYkh2
 e/yazGvuCRnzmrD6+B/7RYV9tZGE4D90pjcVRRDKCWPsGxwHSNuIyUOgZMFY669BiPh5
 lOMbMKEJixSC0eTjMrUk0+C4D6On2b/q9KZYYMx1hpJVvBQJ/QljR1V6YzdPFOCHV8XJ
 +qJS/HVA/Lb8RQPou7xXyjsk5F8zdw4zEC81Y/Q6TyfvHFacjwTRy3EmFd7i5+O4mjxv
 9neChbVjkc4TOSX+wx0deP54ibs5rIhDV4YkIBdlgkaZQ0wsyB+AdfFCNrMDRTgo151H
 a/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t/ONaj2FckqgVcP49BuE08BLQBEDOuIeEo33sCiZhD4=;
 b=GNW76JXP5EV30rcYhsWnx4ZXvCrPd9oPi8li0ocpgRYif7Q6dsQGCnStLvqKhtwRUl
 Bs/5VPct3GJQ//CrS3zS9x9XIrZZoQQ892cxF5eFgHsYCKQdOqYZxF/qspqdAI95jQXM
 d9bo/XothuP6poTS7JFelZu7ehFKIkJSX9sIWxOvQGa5lKbpyzmCFtm6FlbHuCWJUPdP
 07SE7nEKfBcNuPJ8q26qkgj2HTgNuv2S5zTh+3fCX0JqRPbNLaiefBqClOqJxOsV2HSX
 2TnVscHbi+cUHq2pysXU3P/3KNLZsPi1bhkl3lGcISuXmDgJZpdYpq1D9U79p5dDy0H/
 JjFQ==
X-Gm-Message-State: APjAAAX9F/c3LEEaFaTE/2PNl5bDV9Wd1nN8NxSe/1sv7eGUbAagKmQ2
 d/G3W0gIujxpzHyrDy4Vdlwpo9jRSTI=
X-Google-Smtp-Source: APXvYqyKfNnsZmRPGOnrMe4xJkKCXYYeY10krZ4sDjl1j9lS9NeUs2a7DagmiuWwIG0uZ5DRRkb1pw==
X-Received: by 2002:ac2:5196:: with SMTP id u22mr217192lfi.123.1580156887122; 
 Mon, 27 Jan 2020 12:28:07 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:848:32ac:5845:9fa3:1634:7984])
 by smtp.gmail.com with ESMTPSA id v7sm6990760ljd.12.2020.01.27.12.28.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 12:28:06 -0800 (PST)
Subject: [PATCH v4 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
Date: Mon, 27 Jan 2020 23:28:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_122809_559944_37E900B5 
X-CRM114-Status: GOOD (  20.64  )
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
Changes in version 4:
- new patch.

 drivers/mtd/spi-nor/spi-nor.c |   91 +++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 40 deletions(-)

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
+
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
 
-	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
-		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
+	error = spi_mem_adjust_op_size(nor->spimem, op);
+	if (error)
+		return error;
 
-	return op->data.nbytes;
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
@@ -364,6 +365,8 @@ static ssize_t spi_nor_spimem_write_data
 			   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
 			   SPI_MEM_OP_NO_DUMMY,
 			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
+	bool usebouncebuf;
+	int error;
 
 	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
@@ -372,7 +375,15 @@ static ssize_t spi_nor_spimem_write_data
 	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
 		op.addr.nbytes = 0;
 
-	return spi_nor_spimem_xfer_data(nor, &op);
+	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
+	if (usebouncebuf)
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
