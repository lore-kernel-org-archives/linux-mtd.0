Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB1FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98C661205
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B98C661205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fEKRj6u469Cwm01z0RhnjYfFLX0BTO8mbgWzQYwKxo=; b=jXgLxrz3y/9kJV
	+4EHeIjCR/GXf1NAGqEPt+7hscnuQUiJlcj+auk/4ZYAOOPFEKWTTql7zgBOKrFdPXAVwC7ttxMP/
	KJlRxp+Ss9T01pzcwUqolqdptY/NE+joj7oALnynTGEU48ClRkYTH34wUl3UefDELIoSsA3FAW460
	ZGQ2IYt2E68ellBeR13D+grerf9iarWFjY594WJs2yZGMfxk3rO3Hbxec9JAXDPws/6IGbK28bjpR
	Ikc470riKqCg8pg4jZWmDZ3LvgfAIvnBuaJcTmVU/29rP03h44KyIxp5af+Blg7qCgoAVYkbEiEUB
	ynNWGDFTXhoysuR97Yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSOwc-002vE7-WD; Mon, 20 Sep 2021 19:27:15 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSOwP-002vBZ-7s
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 19:27:02 +0000
Received: by mail-oi1-f171.google.com with SMTP id a3so1391928oid.6
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 12:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ltg68ai17ryA61wLEpw2gWNDTuZWgZYYvpF3Lm1beig=;
 b=Z/SE6MYofZr/mYXLDMF+Tnm60EfURHJd3tCCUFUma+W4nZwNsXPu8R2fUu9ekN0rWI
 rMUOb6D/66yKNghlYLII4GESUk2l+dz+yKgA1tT+QZApXGK1KnJ9pjEgmITDo5rcu/+Q
 NxI5KhM02Qjcq2YYpET89+C35tjcHyUOm1jWkhk0EBeZdsOB8t2oN//5Jmdsg7RlH2jf
 QLKl0Z6J09kFubqRQjPP5AOKRCtCTf6HTkIuvdI/RlwduwSKKiMxfy/koXOjo9T4ADAO
 QrFMV0OhDMMafoIgbU5axvfx6bUyPoMSDR4jy2/eA8ngLwY1LmoMmNonH1U0q03A1U4y
 b2Lg==
X-Gm-Message-State: AOAM533A7BOOqc7ZvsIeFW+oCGsVnsDINdYVlB4UJxMhlQkwBQPWZRcs
 w4Rk2hAH5B2Cf7dE5QVp7x7SfB0W4g==
X-Google-Smtp-Source: ABdhPJz0ghhIQUq0/xBQQZcGfNHP33ZoBoPP4+VhuvRF80iBYfK9SyWhV3s1G7XFCiXra9a7WP+VNQ==
X-Received: by 2002:a05:6808:2191:: with SMTP id
 be17mr574215oib.30.1632166019071; 
 Mon, 20 Sep 2021 12:26:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg38sm3452836oib.26.2021.09.20.12.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:26:58 -0700 (PDT)
Received: (nullmailer pid 586178 invoked by uid 1000);
 Mon, 20 Sep 2021 19:26:55 -0000
From: Rob Herring <robh@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, michael@walle.cc,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>
In-Reply-To: <20210920142713.129295-3-a-nandan@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-3-a-nandan@ti.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: snps,
 dw-apb-ssi: Use 'flash' node name instead of 'spi-flash' in example
Date: Mon, 20 Sep 2021 14:26:55 -0500
Message-Id: <1632166015.080380.586177.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_122701_301575_D607A849 
X-CRM114-Status: GOOD (  14.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 20 Sep 2021 19:57:13 +0530, Apurva Nandan wrote:
> Change the nodename in the example with spi-nand from 'spi-flash@1'
> to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
> flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
> so make the spi-nand examples in dt-bindings use it too for uniformity.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml:0:0: /example-0/spi@fff00000/flash@1: failed to match any schema with compatible: ['spi-nand']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1530168

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
