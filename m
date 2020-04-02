Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A2C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F0220719
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtfCndGF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="DjQCH0KS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F0220719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1hy/ABrCLrhMzhwt2ELilVmTu+rbLCy5o4HTC7p018=; b=YtfCndGFAHl+fL
	QlAlPiEmwJ4Rr4DxCFM9Yyoupm1dqE7Yf9RWJBf01n9ZbQN58QErhGkGumAxce2E1kFfe3w0iETRd
	E8PuO7X7cjixSNauVMNJIfVmfgGfTpaRK6/w0fqsn4nFQ+B/3rB25hRYdtsPkX/CHsg3CqRU7x/2w
	lJbl/tbmeP0VZXU4PGBIRxsxl6CtQ2agM447afAZOSnHSaGFwKTtNY1wF7GnqDc76Am1EKsDEgZgb
	nVpmwM11vgxP2wOl+fcivRE0aEC68x6VPQbpzhwwTTSVdtRHKbTTrju6YJei4+PZuOI5q6kSBplyy
	iWxrj/zy57YPlZhvdYGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7bu-00018u-Jl; Thu, 02 Apr 2020 21:42:50 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7bs-00018X-LK
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 21:42:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id n17so4874591lji.8
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2020 14:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xbnsb1gq21P/+CxfSy7ZOpEg+CLQDkOh/PqrTx5qArU=;
 b=DjQCH0KSyHC2fQUnlgVMzxKmPa/yqsWK48Ty1SlPPTMdAsiCQ0dg0jKyvcXehNiNDj
 yQi/5gKUDVYLIgfRLOtCrStYOgGnoESrWDi88aMSXdf3r0zP88Wfn/5ZdxcFSMRtE1x8
 0NLEmZrNWq5sgRgwMmVXBRCXhxgk4ZbdTW/GS3vI/SJ5AYhqXtaHPm+ywaHEJYCwbj0b
 Y3eUBp4/M19WXgm0OtFDF/Gr3OEoDzg40eMwgHoCVEoJDTq9rsYDXUAWhdvplXB8FfB+
 ZpCNemNx4wxvgLt+Q/dZ342+09xltPpMpJ1V79QX/ok1j89Uybz92zWv383aleHiYtDF
 4CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Xbnsb1gq21P/+CxfSy7ZOpEg+CLQDkOh/PqrTx5qArU=;
 b=QBA1id4uFZx+4nNGOMbKM6APSu6TOmLYp/oKBU2dSmRALsLAs9En8FvNfSKKYkyg9T
 /RAIFCoxY1BSifo+tDtIihPMqtB3NNhlu110SWCJCkhIFRbGv6amAgjG6kKBwCq1uixc
 cY+inR7rHcGuKgUsSbETUoWSPVBLP5eNoPDXKH/k1shTfzU0SqQfWx77nokITO6erphl
 09bAbu1IsnfBi/hXxdN3QJNhKuLDxj0ADRz6l19yrtGtsfNE+cXgj6DOBuqRFDRAb2ry
 JABbdGrlYfYoUcmefvaHY0JtzhZrkIWK/S0GKml+Afv7AnBElyPGJp5t8g3hKKjgMsyn
 utbA==
X-Gm-Message-State: AGi0Pub+YXGcxqo9x49U8EDzkljihZBxqiDncYVIilp81Aiuh+0Zpxdq
 lSyOKmCcpdjWqPkYGLr2Rs2kTw==
X-Google-Smtp-Source: APiQypJQBRzVbTSgD98XnR1h6QNk/mUxIQuzY6VhxYYi1+30rL7VtOfcm5pE6lxfuuvIq5HH7innwQ==
X-Received: by 2002:a2e:b018:: with SMTP id y24mr3244332ljk.268.1585863766951; 
 Thu, 02 Apr 2020 14:42:46 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:638:9d01:50cb:2c0c:a09a:3ff3])
 by smtp.gmail.com with ESMTPSA id b21sm3872699ljj.46.2020.04.02.14.42.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 14:42:46 -0700 (PDT)
Subject: [PATCH 2/5] mtd: spi-nor: fix kernel-doc for spi_nor::mtd
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dd91222d-f6df-c4f3-a2f2-a4e58d235d36@cogentembedded.com>
Date: Fri, 3 Apr 2020 00:42:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_144248_698681_D0AB5856 
X-CRM114-Status: GOOD (  14.14  )
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
 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas-devel/include/linux/mtd/spi-nor.h
===================================================================
--- renesas-devel.orig/include/linux/mtd/spi-nor.h
+++ renesas-devel/include/linux/mtd/spi-nor.h
@@ -554,7 +554,7 @@ struct flash_info;
 
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
