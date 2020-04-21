Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BFEC54FC9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 19:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2923C206D9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 19:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MnIUkkU5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rww75NZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2923C206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kptm6VnezHgj3QE1Y//eJKXxCCTIayUmy+PXjPg9j1g=; b=MnIUkkU5042Vxy
	vCIpkp/EwNm/56ne8eKsFHByuZtX/RCMKnHgaSDtfVBykHZ+j3rS0WlCEtr5N1J4NTYxRa4MlIp8m
	5dCSIsOOd6OKT0yPg3OfKf3zGBD+IkweUbjIVyr+o7nZ0sINXyz2EQMKuI14xS5HDFklTxhqTBhwy
	2uvXNJibD3sPYbQ7s/QVZNNGyhTeiTFE7OQGwSpX4GAFLhBgvQ54gv5Mnvdm7AiboBd1cV1QTCexH
	n/3aeAiJviwZDl0Evcuh5u4ghggYgWPmqSW30GmKJPYIGZKnaEsPliw7krtAsu1RiXaLkeTYuEJ5g
	/LHS72U9K7nKJjF2R07g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQykd-00076t-GW; Tue, 21 Apr 2020 19:40:11 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQykZ-0006C3-Qj
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 19:40:09 +0000
Received: by mail-lj1-x244.google.com with SMTP id j3so15221451ljg.8
 for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2020 12:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aywk03+JEODUGobRpOUMqkQLJxtrpo3jrYrMRf2HZB8=;
 b=rww75NZcUiY5SKEitwajOXAq+UORvaVUNlrSNQc6AbUSUPAB82P+kzsv460Cjl8J2Z
 cu4xemwBgD3MDcWdImuJiryMe8QX1M0qIxDt6bWu5RTWFubX1JGVhjI+OyPqIP/A7Ocb
 z/oqbcyLWone55Ij0TSB6CsASunMQuc0ZkQuPUnCRs8EBIBwlaJBSrEG98DkrmLDNus/
 x7dRBAmdUFN6EdUSuJlIAkm81IPEhIM3Z0rqmfRYxZGCTkofF33n7Ea0kM/unzCTfDcY
 lU3ySE9Vf0GmGgl5DEnGHbLZuvS8qV1tDlzAEvUz+xQhmGj9eQOXHCWjFYcCJwVSxRjV
 Lhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Aywk03+JEODUGobRpOUMqkQLJxtrpo3jrYrMRf2HZB8=;
 b=BZn1xA2jjdsEUyT4WZ1KKf1ekGSQ5sGwBIZp8RZMhDO1AX+hcvJVa1fJoauvnRo9JX
 rOVrTdk8uYjup+/CR6YmtPGF4Bb0D0tmJS4pEcEmT+d/+3BYgT+FKOooqqvxhfBWDb0c
 elKz5z65VIo365ipsCdOIeIGdsSTNMaQpWg1Iln25iBLZr4Fu0oW+2NtXqaFNlnCSpA4
 IA8G0UdwFMgWfbxmJ+vlyFDxxXAeU35nQQ5wXp4yik+KOAUHaOdalRh44D5hqWJx76GF
 Gq/tepYZLZnEnVha0uQ8WbWTo6FhNbVIh4s8LtkQguT15evzockmqzuuYSWfWePcwzaK
 YUCA==
X-Gm-Message-State: AGi0Puau4gyqD0vCeTWlIK+78fRGLsr7wrcynXsAQR+ftQB7o+Eqga0s
 0YHekuRM6ZCjqFXH3631cb9w2coGrWM=
X-Google-Smtp-Source: APiQypL2rBbsGeKEPsF8ZL2i9Tiyw6VbrV7AEsYxiXVeJPNi/1pqL9q5yZaKtSmstaoP4zVOOttEyA==
X-Received: by 2002:a2e:3209:: with SMTP id y9mr8042291ljy.154.1587498006174; 
 Tue, 21 Apr 2020 12:40:06 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44ea:bbc9:93b5:ce4b:a4b8:c36c])
 by smtp.gmail.com with ESMTPSA id f22sm2510603lja.39.2020.04.21.12.40.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 12:40:05 -0700 (PDT)
Subject: [PATCH 2/2] mtd: spi-nor: core: fix kernel-doc typo for
 spi_nor_[{info|sfdp}_]init_params()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <255c50e1-f233-6cb1-f170-aa0c384ca8bd@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <1d43520f-93d8-9e6c-3cea-3078dcfb1ea8@cogentembedded.com>
Date: Tue, 21 Apr 2020 22:40:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <255c50e1-f233-6cb1-f170-aa0c384ca8bd@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_124007_898175_AE77958A 
X-CRM114-Status: GOOD (  13.38  )
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

When spi_nor_info_init_params(), spi_nor_sfdp_init_params(), and
spi_nor_init_params() were added, the kernel-doc for them contained
a typo: 'struct spi-nor' instead of 'struct spi_nor' -- fix them.

Fixes: 1c1d8d98e1c7 ("mtd: spi-nor: Split spi_nor_init_params()")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/spi-nor/core.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: renesas-devel/drivers/mtd/spi-nor/core.c
===================================================================
--- renesas-devel.orig/drivers/mtd/spi-nor/core.c
+++ renesas-devel/drivers/mtd/spi-nor/core.c
@@ -2690,7 +2690,7 @@ static void spi_nor_manufacturer_init_pa
 /**
  * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
  * based on JESD216 SFDP standard.
- * @nor:	pointer to a 'struct spi-nor'.
+ * @nor:	pointer to a 'struct spi_nor'.
  *
  * The method has a roll-back mechanism: in case the SFDP parsing fails, the
  * legacy flash parameters and settings will be restored.
@@ -2712,7 +2712,7 @@ static void spi_nor_sfdp_init_params(str
 /**
  * spi_nor_info_init_params() - Initialize the flash's parameters and settings
  * based on nor->info data.
- * @nor:	pointer to a 'struct spi-nor'.
+ * @nor:	pointer to a 'struct spi_nor'.
  */
 static void spi_nor_info_init_params(struct spi_nor *nor)
 {
@@ -2841,7 +2841,7 @@ static void spi_nor_late_init_params(str
 
 /**
  * spi_nor_init_params() - Initialize the flash's parameters and settings.
- * @nor:	pointer to a 'struct spi-nor'.
+ * @nor:	pointer to a 'struct spi_nor'.
  *
  * The flash parameters and settings are initialized based on a sequence of
  * calls that are ordered by priority:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
