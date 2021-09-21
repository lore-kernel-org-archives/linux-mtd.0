Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BCAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C133B61165
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C133B61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dt1XcYCj5B9afLWju7mrQYwNm59m1g37QzZF0iAA8AY=; b=blTE0QGjUwMwGG
	21geAxfTqc8w0hd0AEcpUn/W2blmHvAIFiAZsTgVonSdWFJeXrWUKsxEObotvYpLnvgW5K6GxS50Z
	9gfkJHpT98dOAsJNqnRCEYe2CsyPRrpx8PXkDKc/YcFx8Y6EC/a6gQRDBcTVFn2srATr5Ra7kE1SV
	DizYVJE8fpmt40kufQ64RxcicZq/JTWYKLonmxLf8o7+SE7B9jag4MDfcEySWfI69JukChJw9+WM/
	nLjzmGy75FpwRSEii1i+EjD1zar4uSeOmfzS1yIFuOnCsOwpR2USvoFXO2P9/+c1GJfhJqCbjkGOn
	3JT1/AQ1e5R9Nfb9nFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmcF-005jQk-24; Tue, 21 Sep 2021 20:43:47 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmcC-005jOx-4W
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:43:45 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 w64-20020a9d3646000000b0054716b40005so320997otb.4
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L07hQ1b9j/e6t5cbfVZEdTBHXu+ODfYJ4V0bxjmgq4Q=;
 b=hlxtw5lKkQ2kXf7q7Fu48LkzRV5EHlUFyjizFMoeNvkkmPu/Z2S2d0/aOH4uCqG4K7
 pAOtRfP/cjpyKIRzhp7PMsaQHL37Ye4iHzgvYmVtvkGuMrBCvSi4VYXStWkmznjv9oHJ
 XxEQiMPVpWQtvhuN0Ws9Rs4ktJiJ0S+JK8dbtf2/LvOezHucY9xukvNnRuaHa03CJmDI
 cfraEye1swMqPj4xVBxjM4DXsuFFEC8OKE2WN63tEyFxv3f/r/pyDsx/eXA7rEEJBOCV
 UDA9wcJwhyOk/WmKS3Kl2/eEyPpT/hwxhtxTd3/EpK3gTCpzdNUte0SF0QELwU+bVSVt
 gNzw==
X-Gm-Message-State: AOAM530PlTOdAgQsYoxWncY7LS9vogaA4oKHZEMieT66glgiGdydd1e7
 mIGs0rLkCCkSGhjjFyjDhhBzJtg0eQ==
X-Google-Smtp-Source: ABdhPJy8Vb5MDCTiDpKSkStvWFDG4J+xUwMgTQ9K9brhTc/HsBkWGXoxaoj5hzT1dqsEZiAtAXefbg==
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr5106252otf.234.1632257021856; 
 Tue, 21 Sep 2021 13:43:41 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id c24sm14277otf.71.2021.09.21.13.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:43:41 -0700 (PDT)
Received: (nullmailer pid 3295272 invoked by uid 1000);
 Tue, 21 Sep 2021 20:43:40 -0000
Date: Tue, 21 Sep 2021 15:43:40 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, nsekhar@ti.com,
 krzysztof.kozlowski@canonical.com, nm@ti.com, linux-kernel@vger.kernel.org,
 tony@atomide.com, robh+dt@kernel.org, miquel.raynal@bootlin.com,
 grygorii.strashko@ti.com, lokeshvutla@ti.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
Message-ID: <YUpD/CvFZ8WO7pI/@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-6-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-6-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_134344_254533_64E0EE79 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On Tue, 14 Sep 2021 15:27:02 +0300, Roger Quadros wrote:
> Convert gpmc-nand.txt to ti,gpmc-nand.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 ------------------
>  .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 121 ++++++++++++++
>  2 files changed, 121 insertions(+), 147 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
