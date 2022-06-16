Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1617FC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6poJlxkHUOCUA+tJYBBqi+DJJfNokI7GX9mYMpaVkBs=; b=AkRziNOIZ0Wf+9
	sQB1Plqcb0wAE07D/5IJlzWBi7hbQO4zhtlVHsjFPO/rQmfag7rAurMscaEwDxfMscwUqbiJrNCVq
	TvErSufWWuoT3lKggYLoxZA8CO6Vmp/grkWmLYnhxtDe0rXJKEoDhsAYkmPH9FjSF1XkZfZVrlYxF
	ZLXpOq9l/5WcSi/vibmnyJhq8Ak3qk2HMpi3QCTLcEqrjJRpdH/OXMAGTK0UoEFHAzKyjLYfC+cFX
	S+Mm9I8XwpQt4xZGu0Y8ZEGKFsNqE9b6Y1V83BRzfUiPAI2RhuvulxA5JfFXsDJr9Vu0fIP2ZVNsv
	XRCM3Z+yPAwhYSvHsqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rdC-003DPK-2M; Thu, 16 Jun 2022 15:42:02 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1rd9-003DKr-Eg
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 15:42:00 +0000
Received: by mail-io1-f53.google.com with SMTP id c189so1880591iof.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2022 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c+Of7pAImRcJq99CbMv/G3hY7m2gLQV0aaUFDPDS9K0=;
        b=aG/o7Yhi1peAGEoirzDDuwtaQLzWFAKYpMSP4usSwvlPIY6rdnV72/7oOP9DUX4Gz6
         95M3OLY9qyvYeOgbkWz1NKTTVHjZedf3NrygM7RO8mUIpDSbCZIiNTJa+kCKsqQnk0q4
         PGb1hlLJikjiz00CnrcVxPvwmLkQjhMqqsQGJxsjnTr+7BHDPTxEWaURdSusG5EliZTm
         0Dgp7uZLpb+cA4n8qDuu+UhqDNsF6D4Ve+FDFiQ/oO+YJGd9PZJ/VIFmjrG1ID4vKS5G
         rt5ujipAokJljHQIjygbIya5BkcCIvwYiaiRljI9YNi2cTfvLGfxIsHN+TvddMiPgKR2
         kQqA==
X-Gm-Message-State: AJIora9drX3S/0Adm1rZuVbhR/QLG83EIg2njzzyhm3qYYd96nXeRYrC
	F7OnXWYNX3PRJ8Anq/no/w==
X-Google-Smtp-Source: AGRyM1tSOR64Ae/eujWzzeeM77A3ZzCWEqAAf7jb/wDwxahhn0VLduHwEjuUuXSJE6UZ5RBW7e3Ang==
X-Received: by 2002:a05:6638:13d1:b0:331:c916:d6cd with SMTP id i17-20020a05663813d100b00331c916d6cdmr3029714jaj.317.1655394113361;
        Thu, 16 Jun 2022 08:41:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c9-20020a029609000000b00331d411da60sm1011098jai.75.2022.06.16.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:41:53 -0700 (PDT)
Received: (nullmailer pid 3528499 invoked by uid 1000);
	Thu, 16 Jun 2022 15:41:51 -0000
Date: Thu, 16 Jun 2022 09:41:51 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-partitions binding
Message-ID: <20220616154151.GA3528396-robh@kernel.org>
References: <20220616001835.24393-1-ansuelsmth@gmail.com>
 <20220616001835.24393-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616001835.24393-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_084159_511430_1BBBC736 
X-CRM114-Status: GOOD (  10.26  )
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

On Thu, 16 Jun 2022 02:18:35 +0200, Christian Marangi wrote:
> Document new qcom,boot-partition binding used to apply special
> read/write layout to boot partitions.
> 
> QCOM apply a special layout where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
