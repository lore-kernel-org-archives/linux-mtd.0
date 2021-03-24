Return-Path: <SRS0=a/jC=IW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E1AC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 18:11:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4614E61A24
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 18:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4614E61A24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHPXs5n2xDbWEY/q6/V8xLFJmsTS0MyPSXBob5HxZqg=; b=c8TaIyuBqptSj/KEryfGuHmVA
	iU89M8i0jgSAH/y2+xhxrqcbAIJ5vhpEbw/i3C6mQOaY6gBsMYD0eYLOeAPElSwDClJ5gD9uB8gm+
	V+jQzUfQeBkLoSN/O3+IdkhEJqehDLpj1UdQ9Zt/V+/kf6crGEgkFHwFbXMYgUoVeHlr1XmQsy/9m
	vq30YpqSk/Ou869805vQLtorPREPRuMBF/b8eDOEkyxDN8buVgB0t6ao3UJ4VIDhMBq3RLfx25eTY
	IDBmOywP/8ztCNvpvDfPPfJ0lG+U+Cr5GC/fDMufKuZ/42YrCV6pF7yLGgW4SkCSe8mt9RWy90YBp
	kc9eGOpEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP7xs-0001IK-SK; Wed, 24 Mar 2021 18:10:45 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7xp-0001He-DE
 for linux-mtd@lists.infradead.org; Wed, 24 Mar 2021 18:10:43 +0000
Received: by mail-il1-f170.google.com with SMTP id c17so22227404ilj.7
 for <linux-mtd@lists.infradead.org>; Wed, 24 Mar 2021 11:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RdLddjC+iEoz4u6jK63hDy1PT64QJ2geKnpXuxhai+o=;
 b=t75CXfYWnEnY8xp5qQv1dQAlLgSE+cplCIbjzaAtYutQOBhe1Kwy3PqYsN+X7y9WGG
 P40mr6Qei3VgwqY6FCFSLiglg8yg7XjCtVAg4cz/Un1fvcdtHVvgbZ6eCyc54S0WYRuK
 Ho02hFFKEbA/hbuk2/RpCX/hw945wawCvg5W+3b13N5PfuUBXcJrHArQMmteczTOaBWs
 cTyN9rUyoqU3QFOxsxC3FWr2R2jWMRUmrfpsdd55DmUGjPa7cDx1dTqp/Ku2bI/nOled
 2/s9vaiVpqmGKgOLI6rPPaspmJJuxpGebrXfFk/uXx6Wf4y4BR1esUdxd4p1+a/8hn9f
 C8mg==
X-Gm-Message-State: AOAM531QFsMIRzOLIOj+c2sy/6sSykWpmrSRFPMs78Seonr+ngsgtjJo
 ekgrdbRAfheTw76tYDIU3g==
X-Google-Smtp-Source: ABdhPJwm0lu4eHHZUt2iJVbAnUdqjkeCxMGA0KTL4TLAcSjo5jjJ4hxUEVPPY6roCmHkoYeekofWyg==
X-Received: by 2002:a92:c748:: with SMTP id y8mr1842248ilp.37.1616609440259;
 Wed, 24 Mar 2021 11:10:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b9sm1443474iof.54.2021.03.24.11.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:10:39 -0700 (PDT)
Received: (nullmailer pid 3355529 invoked by uid 1000);
 Wed, 24 Mar 2021 18:10:37 -0000
Date: Wed, 24 Mar 2021 12:10:37 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
Message-ID: <20210324181037.GB3320002@robh.at.kernel.org>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_181041_576832_E75B013D 
X-CRM114-Status: GOOD (  20.38  )
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

On Tue, Mar 16, 2021 at 12:00:52AM +0530, Pratyush Yadav wrote:
> +Cc mtd list
> 
> Hi,
> 
> On 15/03/21 05:45PM, Kuldeep Singh wrote:
> > Convert the Freescale DSPI binding to DT schema format using json-schema.
> > 
> > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > ---
> > Hi Rob,
> > This patch is checked with following commands with no warnings observed.
> > make distclean; make allmodconfig;
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.yaml;
> > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.yaml
> 
> When I add the "fsl,spi-cs-sck-delay" property under the flash@0 node in 
> the example and run dt_binding_check, I see the below error:
> 
>   /home/pratyush/src/linux/Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.example.dt.yaml: flash@0: 'fsl,spi-cs-sck-delay' does not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
>      From schema: /home/pratyush/src/lin/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> I am trying to solve a similar problem for the Cadence QSPI controller 
> binding and I wonder what the best solution for this is. The obvious one 
> would be to add these properties to jedec,spi-nor.yaml. I haven't 
> managed to come up with any other solution to this problem.
> 
> Rob, all, any suggestions on how to best model this?

I'm aware of the issue, but I don't have a solution for this situation. 
It's a problem anywhere we have a parent or bus binding defining 
properties for child nodes. For now, I'd just avoid it in the examples 
and we'll figure out how to deal with actual dts files later.

For this one in particular, CS to clock timing isn't any FSL or 
controller specific, but is device specific. So this probably should 
have been a generic spi bus property (if not implicit). That's somewhat 
easier to work-around than potentially adding controller specific 
properties to every slave device schema.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
