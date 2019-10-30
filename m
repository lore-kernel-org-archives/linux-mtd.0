Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80BBCA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 18:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1CB2080F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 18:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcMx2KUV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="GmrPqm0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1CB2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j8c4pc/dhoV9XJZYEH16o3p7ZiSEZIjcdM4UmrfJDuo=; b=qcMx2KUVl6KUHxDWlsVk9ak4Ft
	TpYOtBivzJFXbbLYM58VgxdSYihhC+DUsPdZmmEVsxC4WtvOBC5bAq5HIU3srpZavQkzoWjhB1PFp
	DTSf2sRZN8/tlEDm2yuvDinN9MH9ID48+QkWPZREO2qcjHqHQXOx9X/JznxNnBUj4ju6CYLtcLQkf
	fd9/jqNfK+5wF79lroXA9Shw5zV+XaCF1Mc8kKXO/y6KChPB8en1tV5G/P+gHTLc6OK9MP5DxVDyZ
	qCEXO/Va+x0x0qjyrlnph2Qv3Ie/NOruLRYexRJHaFpGB6zEbYzc0r8ePNxwOJ3lk2OLgqcP2pgpy
	VhPRmsbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPt5k-0006ue-Jd; Wed, 30 Oct 2019 18:53:12 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPt5i-0006tH-EZ
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 18:53:11 +0000
Received: by mail-lj1-x242.google.com with SMTP id v24so3871386ljj.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2019 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UNzsnRRbSH9Ha4E5jgGT7BZi0+orl3s7qn9TsQRDOw=;
 b=GmrPqm0VD1umw3Cp4Y83+/2ys395MAWmuW71nYIDjgjHo7aqNfdwKpHZrPYUX3wFc7
 arvdL5AkztEaALbOlxxLsl345RKcRNDM2LjA23swHXzMfkOGYtHoU/oheOOAg6llmIXj
 CB9lHXGHIYzEURMSxluc6XEzJ0QCLvhrUjoUCJOLgc9Z8DqvyAbmiVW+jon58YMH0XtS
 ZhSuNIMdugk4nO6BOFS03LDjtLpXE8oeBMLIisKyc9GTaZ7L6FL5NUDFnudpMnlP4bHe
 i/WZN+d6PWd9GmB6Qb9RIlF5E9N3sB1ZvfZUJeP0niBcIwyDQVyKqCD7T7P9pRTlb7Ud
 JRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3UNzsnRRbSH9Ha4E5jgGT7BZi0+orl3s7qn9TsQRDOw=;
 b=EgWPWE/Zub1AxC6CWL/tSXv1CnSbMF/tEpYzDLTOcaYfHlaVgJVmKC/YVFjbQUZohh
 J0wsmm2MP86/t+CLoPaEmijvtx/QLSVG0mUqD9FXgJ+XyGse8PQVOXQub24aXv5Sys4O
 jJlkqzBeY14t/qk1wNDatEOK3Rn9iyYRz4YhboxYfPkcH+8sDhpH2NR0VtcdpgPtVmzv
 XguBlnDE1MteLgML5lAW4w0zbYu4FXb5x86SuhBlwrLtSr9g2Yj9BXoS/1e4HQyCSZcz
 2JKGBIqsXo31Qy2ZKWOmGvj4rJOlqI047ozFQmMz4jTPiL+HbNwwHE6Erdae2KMQ04ZE
 79Nw==
X-Gm-Message-State: APjAAAXOp479u7w3bPvmDxmKJO/0V4kUMsZg7+xJWrKXdPNMPbV5scb7
 s7qntmWMQXvAU7YGbuMzxx7VdB7kVrc=
X-Google-Smtp-Source: APXvYqy3N9tIoqkZ6eTmgnIpRqmtdFmOImXq/2jnii7Q0tiNp01muL7YAQ2pOTzLE0HZdy2Mv9sDDA==
X-Received: by 2002:a2e:151c:: with SMTP id s28mr857872ljd.70.1572461586248;
 Wed, 30 Oct 2019 11:53:06 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:454:89dd:4e25:eb47:574e:ea06])
 by smtp.gmail.com with ESMTPSA id 6sm367253lft.31.2019.10.30.11.53.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 11:53:05 -0700 (PDT)
Subject: [PATCH v2 2/2] mtd: spi-nor: fix silent truncation in
 spi_nor_read_raw()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c83fc5bc-d85d-fd5f-2887-d93c22671102@cogentembedded.com>
Date: Wed, 30 Oct 2019 21:53:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_115310_490291_37C8C0C6 
X-CRM114-Status: GOOD (  15.31  )
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

spi_nor_read_raw() assigns the result of 'ssize_t spi_nor_read_data()'
to the 'int ret' variable, while 'ssize_t' is a 64-bit type and *int*
is a 32-bit type on the 64-bit machines. This silent truncation isn't
really valid, so fix up the variable's type.

Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -2865,7 +2865,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwc
  */
 static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 {
-	int ret;
+	ssize_t ret;
 
 	while (len) {
 		ret = spi_nor_read_data(nor, addr, len, buf);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
