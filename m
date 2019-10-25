Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE872CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 20:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A93421D82
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 20:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5UK1m41";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="aDBoc7YU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A93421D82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk04z6t0QljPU9CQS+1eGNHX0GAD/50KjcBXyHYmfxk=; b=H5UK1m41MzQw/K
	aKzXlkZu0v9SM+o0vLV22ZuzXK/0Dw49+qQqs2eHRvkAqwmsbv4PmONoTJgGlJpiHBI6fjSsG03J6
	IXL0coN4RBJSzK7TR29/AnHyyqDgXvQJeBFgigj7BHgTOJtkgVCdM3i81Lpl1BJOJAPcGEs9qeEvo
	+KnzJZS6PRw7Nn/z/caCbr6fbsc3UE0p6mH78HwDG0jR3gGkLf+N57LB1uMTwmnX7zmbFs6ytEkPc
	a1jDECH1jky21Blb56rDVPYeGMuB3bm3JpjphdqtyHwjV/kCze0kcXbZo+Isl6yKDxullzaBPkO7D
	rEBJazueioJKKhMvTmaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO6Aj-0008RL-9K; Fri, 25 Oct 2019 20:26:57 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO6AY-0008O0-GU
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 20:26:56 +0000
Received: by mail-lj1-x242.google.com with SMTP id m7so4218245lji.2
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2019 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zerdr6kcYdxxUQ/8DrVgRoxJJdtRzltPd3B77U8xkKk=;
 b=aDBoc7YU586wojWJu7kYg9bDZvfghbvASPSdKYYVAagqpJlWXKEjHkYM9rU/k7sZwB
 AtsiVsupHJG3+pK5hEUwaF8TXE77b9tzmQLImHq+hmMb/89IgRaNo1eYPS9zYcuCumBL
 hCtZtgTI0rc+7dQ7DqefwR6maMdWNtgfBH3aJO3Y3KqTWKIvhFloT4dts6eDioWP0PCn
 ZAkYZK6NTGKvSSfU4AjRHC6z9jdUpdRiFgAcL4AHcTpyMCPAC1zTrFFsyF7HnXFEZjSJ
 nxQrpjiDme2UWBRYIuRjnjl4N1R5V1Uv+UA8eTxY9n7L16CYowHTBO+eh/5D6843uNAQ
 g01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zerdr6kcYdxxUQ/8DrVgRoxJJdtRzltPd3B77U8xkKk=;
 b=tUBy6wOrgm6xCD0nCGD4d8ZTKL3rFuLFRmQmB8lMFxJzZ8PH0XaVB1sKyocTKos7DF
 PRXZQenp69AAsOYlpTDv+eysvt3oIjGYbdhQHQf5o2aOTskzQ52CzHAlAkLbd2uN8iTR
 Va/wgvI7WcEZTFNUdkTwBsgogZ5QDf/isDqmDkjSWshZZXygbutcgkjBOrfFmNe/y3vU
 Jkb2ohPEarHrLAXq8jcJHdT9Qmlevbtt5rFZN6gjEqoXzgBeH6x6yqecqjknJF4OC31O
 J8ZuBl6OT9WuVAAS5OoEZu6Wpu93AgaZEU4ChH+Re1tm/DLkT/6vcFSgZpUNPAyzpwFW
 JfeQ==
X-Gm-Message-State: APjAAAVPNDaxeWchQHGVowTkeatoVrPJ2GLT91RCp0tsiZP/2GnNsU2J
 pJdut6LKDu+G6kPsV5b9WlIBAA==
X-Google-Smtp-Source: APXvYqzU9HTncvcIVRYlRtR/kWdepyPWr3nYApwNkFwMtI4M+BNGcykbT2fkCdsQvTp+/6EG9Ee7eQ==
X-Received: by 2002:a2e:7212:: with SMTP id n18mr3548228ljc.246.1572035204253; 
 Fri, 25 Oct 2019 13:26:44 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:8c6:34de:2a0f:db9a:ec4e:cc8e])
 by smtp.gmail.com with ESMTPSA id e27sm1296828lfb.79.2019.10.25.13.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Oct 2019 13:26:43 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: use spi-mem dirmap API
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <97330369-c42e-0ce3-ab1e-0f4433e6acad@cogentembedded.com>
Date: Fri, 25 Oct 2019 23:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_132646_973938_49ED931F 
X-CRM114-Status: GOOD (  18.18  )
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
This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo.

 drivers/mtd/spi-nor/spi-nor.c |   79 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |    5 ++
 2 files changed, 84 insertions(+)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -2562,6 +2562,14 @@ static int spi_nor_read(struct mtd_info
 	if (ret)
 		return ret;
 
+	if (nor->dirmap.rdesc) {
+		ret = spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
+		if (ret < 0)
+			goto read_err;
+		*retlen += ret;
+		goto done;
+	}
+
 	while (len) {
 		loff_t addr = from;
 
@@ -2582,6 +2590,7 @@ static int spi_nor_read(struct mtd_info
 		from += ret;
 		len -= ret;
 	}
+done:
 	ret = 0;
 
 read_err:
@@ -2686,6 +2695,14 @@ static int spi_nor_write(struct mtd_info
 	if (ret)
 		return ret;
 
+	if (nor->dirmap.wdesc) {
+		ret = spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
+		if (ret < 0)
+			goto write_err;
+		*retlen += ret;
+		goto done;
+	}
+
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
@@ -2723,6 +2740,8 @@ static int spi_nor_write(struct mtd_info
 		*retlen += written;
 		i += written;
 	}
+done:
+	ret = 0;
 
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
@@ -4991,6 +5010,58 @@ int spi_nor_scan(struct spi_nor *nor, co
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
@@ -5052,6 +5123,14 @@ static int spi_nor_probe(struct spi_mem
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
@@ -611,6 +611,11 @@ struct spi_nor {
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
