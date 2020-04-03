Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276FBC43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC73020737
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PCXDxYQc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="oNujB17C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC73020737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Gy2x1NdJjKVmd6PsTXtpyRHql8uXwCUSXTrLFcCHyM=; b=PCXDxYQcOtfh1c
	h0MZ43eBDtOTpprT6e6eISeitjyIrHF55bxUls4R4RmlrhLQhN0Y3PONop+GoqmYpFREc6C7Lnkuu
	HhFMf75c2x7UarhxF2eb9O71xN8GJrw768IxpX2O0uYAcmThRM99txxYcaUK5c1XgCfdPF888rGSP
	HLyFxanqkr3jHD37Aq6RlOyWRLyTMmm+0CIBRux3Ujp8rU9CZCyV1UMXP4kxxaM/E7Hh5wl7XfT4x
	JHHf2FsLlN+Y7KcaV6oNTNvjr1eihhkkHzTCMaiYHXqN+O4QC6os7wz+3eeI33UU2NPSOv5eunqkk
	pR1NMUbndR6KtHpU7QJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKTAs-0007Te-Bk; Fri, 03 Apr 2020 20:44:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKTAq-0007TL-4w
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:44:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id n20so6870175lfl.10
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TMcZAhC7cSft3goWAjrl3uV5uRTRwkS1dcVpZohdpTo=;
 b=oNujB17CXuJjpd+5/kziAk0ewHgzXh57sTxQl1g2cXivyLlllFBB/IR5IBYQuf+pjI
 YRzAv3EO6wOyimVRjRRkAoirgx0Z8KoV946fWFwfobeGnMJd/LTN/WjJVgsyGwcWaNO8
 FATC3iSs9D8PO9eFyS2aEjLyI56w8zPTymGHzEIq7Jepb63aTjJJ9i9OnKGpAa1JflEC
 3pKRcdrKAwU3GD3X7V2mTCT9/3bfRs8BYOZioWjuwC0aqqpuiL5v9NuDqWchd/S/vVPE
 f4BxG/5hl1a+ViaHZ6VGqP7HH35IGEp5vs2D4jYVuVP6o9rq+qPos82F6Y6Zu2wV4POk
 Y4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TMcZAhC7cSft3goWAjrl3uV5uRTRwkS1dcVpZohdpTo=;
 b=kqKw+OjLgGqA85pTXwaB65dGncAbZ6+H2NT+X1TzEIIrcEKE9/uZbAHSzjYYQbsEcH
 hv6eDlEtKnncpcDHsfv+rHjehFjnI2hKSnpsK5fKsFqhDdppEgA/8MJ8yhoSvtEFYdFw
 SmRXfog6M+uPP/or6uzhoXdA05ou8s5r0lUtP8rEaCY35zGRxDSo34B53YtAJg/jBXCY
 F29JcxUdCBF2m/E00ja4jlrGk1AoUx1CPUG2Te88r5JBhup0OhaNPNxRaX9SpeyGfV2T
 J3mvxoCFuO2SAhTRuaZi919Frh0/9uGnDuaPIdt5mD56ZbE/qqHdXxhsWzIrOJt6x2rb
 7jMg==
X-Gm-Message-State: AGi0PuYhlAi9SeojJH24NDgXBgmY3PsEnq3Zzk0+d98GANY5xfe+37Sj
 mGFqk4bOgqZ1abNAAoIf3tkHrB78EIA=
X-Google-Smtp-Source: APiQypIF4KJa7l/J2JMvEp/rjNcc7PHuf7RnDDFU6f0fxxeA1sYsqcq7uWRkED4TKjxXVI1cPsKIkw==
X-Received: by 2002:ac2:4987:: with SMTP id f7mr6648685lfl.207.1585946658330; 
 Fri, 03 Apr 2020 13:44:18 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:41a:7e80:40ac:b40e:d552:2978])
 by smtp.gmail.com with ESMTPSA id k11sm1486524lfe.44.2020.04.03.13.44.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 13:44:17 -0700 (PDT)
Subject: [PATCH v2 2/5] mtd: spi-nor: fix kernel-doc for spi_nor::mtd
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c2325972-565e-b936-8046-8d2f53222066@cogentembedded.com>
Date: Fri, 3 Apr 2020 23:44:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_134420_191244_810A7627 
X-CRM114-Status: GOOD (  14.23  )
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

When embedding 'struct mtd_info' within 'struct spi_nor', the kernel-doc
comment was forgotten. Fix it by dropping the "pointer to" part from the
comment.

Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct spi_nor")
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
@@ -328,7 +328,7 @@ struct spi_nor_flash_parameter;
 
 /**
  * struct spi_nor - Structure for defining the SPI NOR layer
- * @mtd:		pointer to an mtd_info structure
+ * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		point to the spi mem device

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
