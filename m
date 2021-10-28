Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20B4C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:32:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C330960FF2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C330960FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QBGGNBOLNoEULzl8A8YGrPDbBMMPSZzVTjp6j8lX30=; b=2OyPT+9W11D2GD
	nMZc36QzA8QqSaXJo6WrbWv7aS5JNnltqqb6gyoE/bO5PYFlhAgQPcHOILH/IPmrfX9MeY+kz9dPW
	jXKz7EdFpjg7RGnDy2JzRfHNI/vGA+9cV+n0AIPu/LUtY3Fjk5nYtCQWhGKGza7h6WVvbxoOwIr0w
	38OozKyPkhLJbBYSQW/YKG5FDla9QOw6Kk25qVRJpzIyFU5xi5lvQ8q8XKUHXsIFpjl1GXOoHav2i
	pQBGDhEIbGHigroNcOuxp5Gz/xSAEy+wg2l5BNmMBcHiO5T4JmTBw6jRcAoq2UN/iAaIsIFGKxHvS
	ffJMyNrGjVMehrxlM6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCzl-0098lF-9f; Thu, 28 Oct 2021 21:31:33 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCzh-0098kI-Pk
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:31:31 +0000
Received: by mail-oi1-f172.google.com with SMTP id q124so10272298oig.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+qPtDQaqseg1rU0SAu/DvoYp4TWdxNR8dGfzDgYPBA=;
 b=6YSCr6waWFjmbH8c2lbyyi/sq/sjR6ZH/lTNsXTr2DSYWfvQ/Q7IVFwpiUfPFsPAvo
 8IrS2WmRUmYzXupqvxoBAY0Inwd2X4VmUaUAzfkO7Lh20y3tqv/93qiujfk9mZhJ9ERa
 CdAy2Ut5ZBc831MxziAaYW2oAHo1NIp6NRCAE/PS8i0v5IQkdhbsVzSAYJLOGqKUYrYz
 EF4RRjYo21qfl1yXabv62LpHJW7yhYT2z4dtF5vStYXS993V9r4FC5X46wULzw97omJK
 pUOtB/cf24N4QiSiroVLuMSDgJyA0zTFCwZEFT17eqSCevd2yl1kuK3/V0KMZJXKFx83
 KzKw==
X-Gm-Message-State: AOAM530s9R9tTEiPUrz4ldP4epJbjXWJknvKvV/WBBhC+m2aL4/yh1OB
 aLGtPvPx1w8gp5momA07vg==
X-Google-Smtp-Source: ABdhPJyn0uHM4S3b450KWKg+1utYRpqTm/tyjiH0wlvami17ti2zOIj1hgx4YhMjMlXM5T6rdPTGeg==
X-Received: by 2002:aca:7c3:: with SMTP id 186mr5241810oih.60.1635456688810;
 Thu, 28 Oct 2021 14:31:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l2sm1370413otl.61.2021.10.28.14.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:31:28 -0700 (PDT)
Received: (nullmailer pid 621898 invoked by uid 1000);
 Thu, 28 Oct 2021 21:31:27 -0000
Date: Thu, 28 Oct 2021 16:31:27 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Jaime Liao <jaimeliao@mxic.com.tw>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Julien Su <juliensu@mxic.com.tw>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/18] dt-bindings: vendor-prefixes: Clarify Macronix
 prefix
Message-ID: <YXsWrwPrDJh+d9ay@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143129_876378_AB6A0DF9 
X-CRM114-Status: GOOD (  12.17  )
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

On Wed, 20 Oct 2021 16:27:56 +0200, Miquel Raynal wrote:
> When looking at compatible prefixes, Macronix is sometimes referred as
> "mxicy":
> - mxicy,mx25r1635f
> - mxicy,mx25u6435f
> - mxicy,mx25v8035f
> - mxicy,mx25f0a-spi
> and sometimes as "mxic":
> - mxic,multi-itfc-v009-nand-controller
> - mxic,enable-randomizer-otp
> 
> The oldest prefix that is also the one preferred by Macronix engineers
> is "mxicy", so document the other one and mark it deprecated.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
