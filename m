Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6A1C636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIPbMKJxCds7oa+1O/wor4k1JJYBp76T+HP+GTU73Gw=; b=jsegN0DCoSsP9V
	0X07CzhX7qMhORlIu+J23gFn7MzO4TDM4RDjHQO/xPlPfSgKz+ho5SXI3kQKiYzyO4LSySQCnNyZ0
	vswdHmo5+3HdZc2KjJuHlTl5F+K6pJNtpEKSH7gVMAB9bTHuV1scNgjtSP+cHawDeLijsZOGFJyRL
	JRIAKMUWpKIFdB+9DSdevHPSXqhjPGmsTowPfSHpSrNpFHnQ7QgfPIHOoOyHLHCmxH6rRuwI1bNiJ
	+7gAQh4wgK1Ec8entydqUIIeYvFk7wSUezv6Nj/wAY9IMrRbAVdqDdh1M+Pjn5sS2saZUGIiCh4S8
	eUDZhYPvjPZg31WmtQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUyR-00DN9c-O8; Tue, 07 Feb 2023 20:53:55 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUyE-00DN6c-12; Tue, 07 Feb 2023 20:53:43 +0000
Received: by mail-ot1-f41.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so4632576otj.3;
        Tue, 07 Feb 2023 12:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAv9Jpi0KexB9Ih6OJ/eh7c8xwDqoQ2WcLRdyerdHjk=;
        b=OVZaMpehfg3PRpGlfwI0iSkdjwhNq1pJfuB50l8rXyFKBp6z/QegtjdGAFhpkgIPJc
         cefoboRWWgRhm0Y9oUtcu41qYolJ9jA5irTM6FcEQDDf8mbvJ4YVZVmdL3Pg7IIFnDWT
         GTaftAhX8qR5H0J6qpDaNlPmhKQpPVlLKK3fkdV0Q+OqmKD+4uzKTKVzAPUF5bu3zbRb
         drilce/Sr029J3/3fro/XSpkw3vQHY5p92chaoa/OdqdXi7taQaZD3kbVMW5aNS13ar5
         Fk63oR7qi8HGqp1ZycyUT6+aLV8kOCsB4NSF4EKdM/RBzsji4aKGH8kCMAdZa2jSnIL1
         luCw==
X-Gm-Message-State: AO0yUKVUU+3bOCVU/AX1i4T/axufYhajiGGBjZKk60RfvFJX52J1V6oE
	EY96kqCDmvw4QcmN9z3r1Q==
X-Google-Smtp-Source: AK7set9ZVCI9niJuvxDniBrgzZraDMssmA+Px+EsRdlv5pz3TtkreXukjqhz0oB4qbZ7m8K/9d67Qg==
X-Received: by 2002:a05:6830:1b61:b0:68b:be3a:543c with SMTP id d1-20020a0568301b6100b0068bbe3a543cmr2583599ote.29.1675803221130;
        Tue, 07 Feb 2023 12:53:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d70c1000000b006863c59f685sm7084705otj.28.2023.02.07.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:53:40 -0800 (PST)
Received: (nullmailer pid 4137152 invoked by uid 1000);
	Tue, 07 Feb 2023 20:53:39 -0000
Date: Tue, 7 Feb 2023 14:53:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-serial@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>, linux-ide@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, - <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3 2/3] dt-bindings: reference MC peripheral properties
 in relevant devices
Message-ID: <167580321119.4136851.3959945880355770473.robh@kernel.org>
References: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
 <20230206092624.22922-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206092624.22922-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_125342_085532_7C8CAE44 
X-CRM114-Status: GOOD (  11.31  )
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


On Mon, 06 Feb 2023 10:26:23 +0100, Krzysztof Kozlowski wrote:
> Several devices can be attached to memory controllers (or memory-mapped
> buses), thus they can come with additional controller-specific
> properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
> intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.
> 
> Referencing Memory Controller or IXP4XX bus peripheral properties fixes
> few dtbs_check warnings like:
> 
>   intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
>     ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml      | 1 +
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml           | 1 +
>  Documentation/devicetree/bindings/serial/8250.yaml               | 1 +
>  Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml    | 1 +
>  4 files changed, 4 insertions(+)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
