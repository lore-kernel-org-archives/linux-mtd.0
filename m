Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B410AC43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827FC2076E
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJRe6hhK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="GvD7/GbH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 827FC2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1fcNIg32L5Utpm6hGL4DtP1xTP3Arwo1vGdLbVfMfM=; b=WJRe6hhK8ZFmJr
	y7/nhaF2BEUvEMZy8kUGKH1gtmQSqUAxHEOsjUb3MxD7UEJ1xdZkzRyMbllsoKofgz3lbJkkmwdUq
	5v6GQodUhDVkP8Y9XprrLye0V+eYLUlwn/uS/f3NhtI/2swxqp1jctY5rFRkjNAUt3pYBrJ5fKZp/
	+I8PBZOTL3qXTrxdMP+/KVuObkcYW7FGm4kayuheQrP0ls4uNTaytWP1imdHd+NfpyOibJXLPBWth
	e75ZNK9rzCa6fY/bhrMPibUEfdAJ0nNj6lZtZnWhFnBzsuYb0UuTOhrvaZBhmAYQof4Va3D1XAUbJ
	r5QmIebT5mdJiYg9A4JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKTHM-0005De-FP; Fri, 03 Apr 2020 20:51:04 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKTHJ-0005Cg-6m
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:51:02 +0000
Received: by mail-lf1-x143.google.com with SMTP id s13so6907304lfb.9
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2kz+oAlUtOWtIU19TYV9jGXv90HpFcHnUmlYMJrjFDk=;
 b=GvD7/GbHFNLEArrbjuxq+EQuTJlQw9IFvWM+hL1NTMiowHBH4UbxY4pABhgc9EK+Da
 vxZ8w0z/1yxWDNqHgKQ2HihD0uD51DDTSX9uQmBJZFbeHJ3uPBqQ07nhC3p/vEi13uVv
 MGT7zdQFtzHiO86JL1r63Jq2+Oi9xuL6GU9ehmVgeqR4HMSX3zOnhiiRUY6JmNa4Lbs9
 Yn+N7lGbKNCRGbLFCXxnfaE2yG75kGxdQ79hzRBJN3z9q3eOjnKUI022L1aUAIsAR1dA
 TM0/rhQZ/mWyW+7E8MiTpYmqW8IKcU3VHYQmV0i9Uvl6SzofWdORGUO6RbB34tyMTdd7
 EZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2kz+oAlUtOWtIU19TYV9jGXv90HpFcHnUmlYMJrjFDk=;
 b=ENeoKzpu0YqDKBu2uhZFC6RjapkM/ijb6DaYFfZxeprSdeTBEsql6ahznauDE2T9ke
 u47gtK5SAB1m94XLsxEV7vPJMcrvoIbuUI7novXOWQZ/ctQtXA0u+4aD/GvoPOhHRYJv
 gkjhjbW1IxZNOy2oN+FAb5S8nFR5tTDEI6W26nz/12mlsYmP1thQ12ZYpsfrn4a4Yl0Z
 dkZISBOA7dOHOgSKrV5itLVeFaa6Og+mqS/o4uyaTbGRg4HuL2nJ6wA1j/7A+lGQ7Jpd
 HlNGQqV9sQXze70JfFAVb25YTtb4RC0hDxMVrfeCDAIiK3MOMUdjNzFhdbGgml9bWQqp
 SPHg==
X-Gm-Message-State: AGi0Pua2P1lVXIWzHRQ9zuKLqWe8PaP91kZ3uvo5Q1oGY5MD+fnnxXxE
 opmmbyqYzOkEYrlZTPD47jJyZ9rmM5Q=
X-Google-Smtp-Source: APiQypKIF3yFF7QyLlW+k4Yp2xvz+pSHE/fhZPY1vwWrHjbe6aOqLx9i32pdhLk36bjEoMH7PvIKlw==
X-Received: by 2002:a19:494f:: with SMTP id l15mr6464612lfj.33.1585947059413; 
 Fri, 03 Apr 2020 13:50:59 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:41a:7e80:40ac:b40e:d552:2978])
 by smtp.gmail.com with ESMTPSA id k6sm6523976lfm.91.2020.04.03.13.50.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 13:50:58 -0700 (PDT)
Subject: [PATCH v2 5/5] mtd: spi-nor: fix kernel-doc for spi_nor::spimem
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <24872724-7860-340b-906b-c6d20da03fb4@cogentembedded.com>
Date: Fri, 3 Apr 2020 23:50:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_135101_246263_4C9AACA3 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When adding the 'spimem' field to 'struct spi_nor', a grammar mistake
("point" instead of "pointer") was made -- fix it and convert the SPI
acronym to uppercase and fully spell out "memory", while at it...

Fixes: b35b9a10362 ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- rebased to the 'spi-nor/next' branch of the MTD repo.

 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -331,7 +331,7 @@ struct spi_nor_flash_parameter;
  * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		pointer to an SPI device or an SPI NOR controller device
- * @spimem:		point to the spi mem device
+ * @spimem:		pointer to the SPI memory device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
