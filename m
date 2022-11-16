Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D102C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Nov 2022 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnItVcFFhUbMXZmjvWIqpfd5u6ZZpbpqb5GHGG7xKdc=; b=uaZYdtc9zAZc5N
	ug8Ja0JOAYePixdc6xWhDNupqgUGIMQJdcD4albEZ5TjFNnNzJ6dIdzCyVKac/GwHdIWk3VPNZHF2
	qjuYx0kKFcbahJUvLL4Vqu5Rl35FdFfyw0aHIi/HRd5vCPyGmVBICu64RGkwno0xPGfe0mA4dv4Y+
	5bbGbVPyGl9+cYxk9ZaZAELQmmVMWAZNQPYz5MBCeTtobeBzsA2jK5gVRM0TFhqojIQXhUGuN9bfM
	8VLJu5dG65ILspXIhCT3YLrpr6xN0I4NjAjSfldM/9zwE/vyWT+Uir5d9a7Sy5tvbcdbKwK3tuszR
	Zmx7A53kWv+IuwI9A6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovPSj-007wii-53; Wed, 16 Nov 2022 20:56:49 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovPSh-007waj-0L
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2022 20:56:48 +0000
Received: by mail-oi1-f174.google.com with SMTP id b124so19957728oia.4
        for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2022 12:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aYRQELqghd3olCWrn6RVp8hDiY21bGgrNc5ikJRp1Y=;
        b=PDAuT0Jio1TchCqm587ZURI1wyEuCtzNUN9WEideroAAVSMIJWrRke1GUJznc9vpS+
         mYZu/oFtufixJ746nfaXgKgx4BwdZefq3D0+Ir73Cjr4Y7Guf8ggpsMGMIp0MtthK12K
         Zj/Skgmif5ygKySKFSG04eh/l1idhHDh3jrvkecUGaQH8wcbthoiwT3fbMwp72wVNjbv
         Sl4/gROuI8bsel99TLisxVCxFx0N56EsxIOjlClzSLibyTvR2LOV3jCe52fgLN6NH8WA
         6j+UB8yNSLx0J7wxn/ieEuNsl0WV5+RQGWDj9k+Wu3BFsu4JsijVGUASi9pN8MqBvnOk
         arWA==
X-Gm-Message-State: ANoB5plmSvMIPbsADxRHObEgMC4a+Ugm4VvKUt7zQe3otGjM5dE4Utrv
	T02RxSylaT9v1ICQJumTAg==
X-Google-Smtp-Source: AA0mqf4QUudAXVd8BEXK9yUDRkBWJk4n/c3YPupaLw41GSxMen3W9MWBN7DVlKtuHc0/u7QNydq/8A==
X-Received: by 2002:aca:1208:0:b0:355:8873:40b2 with SMTP id 8-20020aca1208000000b00355887340b2mr2587774ois.50.1668632203193;
        Wed, 16 Nov 2022 12:56:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a05683011cd00b00661b5e95173sm6989940otq.35.2022.11.16.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 12:56:42 -0800 (PST)
Received: (nullmailer pid 867646 invoked by uid 1000);
	Wed, 16 Nov 2022 20:56:44 -0000
Date: Wed, 16 Nov 2022 14:56:44 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 13/17] dt-bindings: mtd: nvmem-cells: Drop range
 property from example
Message-ID: <166863220434.867607.9322853555110461989.robh@kernel.org>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
 <20221114090315.848208-14-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221114090315.848208-14-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_125647_063990_FE1D7113 
X-CRM114-Status: GOOD (  14.64  )
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


On Mon, 14 Nov 2022 10:03:11 +0100, Miquel Raynal wrote:
> Memory mapped devices such as parallel NOR flash could make use of the
> 'ranges' property to translate a nvmem 'reg' cell address to a CPU
> address but in practice there is no upstream user nor any declaration of
> this property being valid in this case yet, leading to a warning when
> constraining a bit more the schema:
> 
> 	.../mtd/partitions/nvmem-cells.example.dtb: calibration@f00000:
> 	Unevaluated properties are not allowed ('ranges' was unexpected)
> 
> So let's drop the property from the example, knowing that someone might
> actually properly define it some day.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
