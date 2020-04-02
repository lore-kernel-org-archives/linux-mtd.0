Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8842C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B54820719
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tD5jgt4r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="eqU3dX42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B54820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9nmnfr0wZey45u+Z8iQOK6AFx/iazHgySXyaC/v8mw=; b=tD5jgt4rZAvmRr
	bF/YoZQrapfEBwrKGkZB+emT/Ryiuciqrjy+zQ43zXLiM3341Ow5g8898w7CbJB4HwdTzqXCi7Tp0
	zu3FBisqAZ2K8tR7/fHmy1N2K38pfE/3Sc/l3dQtOWGncCDizeoUdrG6xd3IoXBohKx9WkbEYQnIj
	rEXD35T3aj9KhwV2Wk/jvjH7W8CkRgLhOh+OJ3OkWNEqjCRLBGr4w2azx69GhY+faKtbmfHdO61fa
	7hgddlKrqf9sSDgCVpaA4sWb2Hl0d5dZPmWM+wvlVLWvrEUKM2AGwJGawseFrcXPxcnWLh+avXk6g
	eYAx0cswdKCGYu0CHJNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7Zp-0000pQ-Qc; Thu, 02 Apr 2020 21:40:41 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7Zn-0000oy-Gc
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 21:40:40 +0000
Received: by mail-lf1-x144.google.com with SMTP id n20so4005919lfl.10
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2020 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+slmtley1jCXhKQLgxF5IMEzSagvlN4ByObQY1GK57A=;
 b=eqU3dX42VpGBcdgP7uwk9ozTxy8fUQWdYmBOSmTO23pLQ5IfRi1c3iewJ2Kwez0rns
 QOJL9YntGagKE3fd/ZCcuYpvM4u9rz0RzHf52bTCRTRIDziUce8OMaGI5pRjsxrpt39Q
 SW/RLwPOv+/dHls94is/UiIGHDLN8tN8xju4HJEYPTwdzK60X/KT0xc3ErY5KLD8wb5F
 /aIIXdfkmDiiglZmfMbX1a/6cim1+EQIQdnCw6xshg7FmHDHOVSFjI/Dv4az/3VUl+Sy
 wgCguYhfCSTsfgVuxUn/KpQSzmlsUH48sRprAdD9FWBT1k+U/bkbOpBmdXJyJZu/8FPh
 uu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+slmtley1jCXhKQLgxF5IMEzSagvlN4ByObQY1GK57A=;
 b=o3mmehJn7r5mpOehLfqzhro6Ni4hezgPeLThpApW40bLsCP1WCtWL9LHnu1PPDo0r7
 zH/23CTLasiJRyvEPHinFd0PxsL+cP2tsNeob0jg6gG+1TpJSVWIhzkLavPmh8NaGO40
 7+dM9VF9kvcuFV4i1Gh3VsyT4jeY7uaYE6Vld95iywmnYyqSlbJ2NBlMVzA85kai6Vwq
 4D12gi4COWkogO2EVDT8wOY7CdRcEDDnhRDa7RyntO5IeFbhPmr+8MNLKLiv1Z0hVCy4
 gmwsI9odnT9YKB6FmCkeeIorwUuxD4nLNkC9siabstMYQCnOpQLHIWAbW6rn8luFfvU5
 oEQg==
X-Gm-Message-State: AGi0PubW7KijXd9pKQEzSG6VW4JZNvugElmPUZMe8eofRQPSSnHkeOHZ
 UjmkzK3F/R9nGHhhlbSoFa9v2Rq2uPQ=
X-Google-Smtp-Source: APiQypII6pyT3pOCRNF8KHKGjBsE1Y/NF5pUoUqX5liT3ODCw+u2ilbBOPub/NscA5g0ZB09GqOpTQ==
X-Received: by 2002:a19:cb41:: with SMTP id b62mr3405932lfg.21.1585863637620; 
 Thu, 02 Apr 2020 14:40:37 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:638:9d01:50cb:2c0c:a09a:3ff3])
 by smtp.gmail.com with ESMTPSA id d2sm4592454lfj.67.2020.04.02.14.40.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 14:40:37 -0700 (PDT)
Subject: [PATCH 1/5] mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dc42ee55-774a-3156-a459-7e4c598fae1d@cogentembedded.com>
Date: Fri, 3 Apr 2020 00:40:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_144039_553699_4A78D8D9 
X-CRM114-Status: GOOD (  14.26  )
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

When introducing 'struct spi_nor', a number of issues was added in its
kernel-doc comment:

- double article in the heading kernel-doc comment;
- "point" instead of "pointer" for the 'mtd' and 'dev' fields;
- "a" articles instead of "an" for the 'dev' field;
- acronyms in the lower case for the 'dev' field;
- missing "pointer to" for the 'priv' field.

Fix all of those at once...

Fixes: 6e602ef73334 ("mtd: spi-nor: add the basic data structures")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/linux/mtd/spi-nor.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -327,10 +327,10 @@ struct spi_nor_manufacturer;
 struct spi_nor_flash_parameter;
 
 /**
- * struct spi_nor - Structure for defining a the SPI NOR layer
- * @mtd:		point to a mtd_info structure
+ * struct spi_nor - Structure for defining the SPI NOR layer
+ * @mtd:		pointer to an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
- * @dev:		point to a spi device, or a spi nor controller device.
+ * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		point to the spi mem device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
@@ -354,7 +354,7 @@ struct spi_nor_flash_parameter;
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
  * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
- * @priv:		the private data
+ * @priv:		pointer to the private data
  */
 struct spi_nor {
 	struct mtd_info		mtd;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
