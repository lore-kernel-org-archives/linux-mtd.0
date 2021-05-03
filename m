Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB86AC433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 17:13:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782C861075
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 782C861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dm1NKdf31+D47iqCT6H/Er9dC5ik5URQH9ccJOpylGs=; b=JpLRdPW/sqz9/TkzF2BomEPAT
	/iSbILUwBaNAphu48qJpsDL+XjJh9SkvHor/pHKXVr7NtHeyuHUYPVYkxoMUvYl7Rdg9rbD2o0MsW
	0xyTlDBjof9x1ircNa+gfR0TOTCIPlpXXQvC9rhoEnZm6ca0R0fXo/qPfPvFAKGf7lUOdr7ZHRA4a
	ex2F/eQd8rTbRydUjvW0H+gsvcpAr3KQ+rFPr5XACx80sx5FhRh4VEHUwZ/SuTB6Xk5QHTF/LqBVl
	ECmKbokvaQECfsuhBrbKHO0420t+LzTAPYkfo2mT6nHlL4t7/D4wfv+1awioH6kv6gF6sLoAZjbI2
	YZERZXa3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldc7J-00EUAR-JO; Mon, 03 May 2021 17:12:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldc7H-00EUAF-UE
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 17:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mmR9lvM5KXaM8R/c2iAszsw0iEDqwRBTAho3NoMlYWw=; b=JtmZDAjnVaeEIKV0LSkd7BDDrq
 BnPDmNB3Lgil9t/7bogsbf/lwdDmMhk8InE4bNeKw9gUd8dXn1/bPmK0TnSJcZ7zjFeT3oZnHvbYb
 TjVYwF2ZKEQRDr8DzAljzYwx1u+wfoIwGlXGm5wlElnfwqDr/Mce/tl6667m/iOHXaSEkYCzQtsVT
 6Azfc9hMn44qxeAlEji5/FsKK45bxEwFvRQZeh+As5pzkdSGYyZpMzVqdemrkXJ8VwYXDsYiWoS8o
 /HVyo3P8oMRoR8S3Wgh8uhOVC5u4dEdEZvMWuPfZeutxR9F+b0Occ/oDsGkVXGvrjx9TroJsZS5nP
 jgykRBAA==;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldc7F-003Kbu-5V
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 17:12:18 +0000
Received: by mail-oi1-f175.google.com with SMTP id d21so3982393oic.11
 for <linux-mtd@lists.infradead.org>; Mon, 03 May 2021 10:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mmR9lvM5KXaM8R/c2iAszsw0iEDqwRBTAho3NoMlYWw=;
 b=cRa8qEgNYy5o662JlzcMjhJzgqxY9cDuI+lDKOU8cLRZHuZRNjjskg+bZ17KD/xjhs
 WGCnbse0otEBO4FHI2+eaeHgCzcbTEGmUknnAiY73Y2MJ1M0uDJ1dBnqdvhbsLIqp/Ii
 hshUGMBHejsx0SrWVKmnp8HOU1VDhVbLjG0xmnqqas8kgAuL5hvWh4TISdP9IIvEjh+I
 eAsylsJ4BOIJh1F2M6mWCPiMgdLk1bWZFA6x1xWFTqINnCVbZKBzLE1Z/tIAh/Rhe2O4
 rOkunIsU02ilcRE2vkEeHYdtWDcLBn6G0VCOFs6YBxqLkD7U5hBHmeEom8T4Ui9b2wmf
 MmIA==
X-Gm-Message-State: AOAM533Y25Yipstg8kGBDfd+R8GFoFda8CEU/CgL1NglkYRlg6XwrDmE
 0V/dqVA7ctdhxeH9B2EwbQ==
X-Google-Smtp-Source: ABdhPJy4HRq/pQtrZ2XxdEnU6VfzL8Nh4FFoiBM9/hydl2ztAcXZDBd1tTKMnAGJf63FV4qhNeoZ7Q==
X-Received: by 2002:a05:6808:308:: with SMTP id
 i8mr2208636oie.95.1620061935675; 
 Mon, 03 May 2021 10:12:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s131sm88588oib.14.2021.05.03.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:12:14 -0700 (PDT)
Received: (nullmailer pid 2026722 invoked by uid 1000);
 Mon, 03 May 2021 17:12:13 -0000
Date: Mon, 3 May 2021 12:12:13 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: mtd: add OTP bindings
Message-ID: <20210503171213.GA2026691@robh.at.kernel.org>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-4-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210424110608.15748-4-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_101217_229309_FEF4268E 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Sat, 24 Apr 2021 13:06:06 +0200, Michael Walle wrote:
> Flash devices can have one-time-programmable regions. Add a nvmem
> binding so they can be used as a nvmem provider.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v1:
>  - drop "mtd-" prefix for the compatible strings
> 
> Changes since RFC:
>  - added missing "$"
>  - dropped first example
>  - use real device compatibles
> 
>    Please note, that this will lead to an error without patch 4/5, which
>    introduces that property for the jedec,spi-nor. Should I keep it
>    seperate or should I squash that patch into this one?
> 
>  .../devicetree/bindings/mtd/mtd.yaml          | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
