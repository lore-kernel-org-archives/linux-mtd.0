Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429F4C636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OqgbVEAATpLl1rjQCLmLpfzDz0WuC4tbCWqYglqBkA=; b=hhP9NBfdNvLA5A
	g4cLp8KF6e+ZUjc5xT3mvxGGQhnWj1Mug9ymFfUV0NqwSu/ECeNi2teI0Dt++AwTGOH0N5snlrTrR
	Z/5s9dpLPCi5PB3FDjMX+UTa/lItQEb6x5YeiCNB3NREROZYiYRSJATb+PwFauZVZ6iWO+vVC1aHw
	wNIC2uFghLV3mZiA3sDzn9VzO6fIQ1R2Lv4KVmz3D6sJgkVTlTysSjcbg+S9ZtLOjTX/aFZfB5Vg5
	q0RfPo6oOPHe6TSX3ljtlP8TRLjQFNHgS//y00DUOkb8ZMgs1FpDLUA0k8DpwwSeRBNv07o6aDvSR
	8/AzHQ8sESfsuFyIleEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUyY-00DND1-1N; Tue, 07 Feb 2023 20:54:02 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUyV-00DNAv-KA; Tue, 07 Feb 2023 20:54:00 +0000
Received: by mail-ot1-f47.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso4619967oti.10;
        Tue, 07 Feb 2023 12:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=907sHulvoF8neoDNe5yAkdaGfb+ehLMcUUS+7y6XLyY=;
        b=z00I7rc10dwJTpbOrN5upvl1aMSGUFPX0NC5hpFRRm5PWZSlo8VcKAuvI1G7v4jAwX
         qib6TvxsegpwmewHe/AA9QSk3xbJLKVpRk13fabR/6QPjR7Wfgaz0bAyfT688FF1j7KM
         +PdxyO4UeIVUiswVS7EI8Eseh4Y2pa4qc2c34iR1Q+f5aWIPBwREi+tkPLY6gDH5XJ7W
         lS4Icv6boDAIHorGLOQN9PJ/YDiKdPwQ83BjsuVyXcTmR4I2THLJ2NMUQ3DruBQg/CfH
         mOX3D3NxkM7RqnVCy7GPPzeYJMOndmJyV+oua0QlrSZnfgfWWHKIMxw5QHywv9loqs9B
         eLWQ==
X-Gm-Message-State: AO0yUKXARSJRn02W14vinJWwW5BfEM4mKagMP8I48jsyHkwy/cjgkSpC
	6En7p3EH0oQsgj9Anj8Sbg==
X-Google-Smtp-Source: AK7set/fOQVEpQW3hMQDSrruhbgbX3P3rL9zsI3we2gs+uwqyb4nXwNhkr6oeYGTlz4aYRQ5QItAeA==
X-Received: by 2002:a05:6830:68c4:b0:68d:9dce:b59b with SMTP id cw4-20020a05683068c400b0068d9dceb59bmr2452765otb.3.1675803238308;
        Tue, 07 Feb 2023 12:53:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ci10-20020a05683063ca00b00684a10970adsm7083602otb.16.2023.02.07.12.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:53:57 -0800 (PST)
Received: (nullmailer pid 4137580 invoked by uid 1000);
	Tue, 07 Feb 2023 20:53:56 -0000
Date: Tue, 7 Feb 2023 14:53:56 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org, Linus Walleij <linusw@kernel.org>, linux-ide@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org, Krzysztof Halasa <khalasa@piap.pl>, Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Richard Weinberger <richard@nod.at>, - <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Marc Zyngier <maz@kernel.org>, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: serial: restrict possible child node
 names
Message-ID: <167580323532.4137506.13064088667949445777.robh@kernel.org>
References: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
 <20230206092624.22922-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206092624.22922-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_125359_683635_C945DC0A 
X-CRM114-Status: GOOD (  13.16  )
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


On Mon, 06 Feb 2023 10:26:24 +0100, Krzysztof Kozlowski wrote:
> The re-usable serial.yaml schema matches every property with ".*"
> pattern, thus any other schema referencing it will not report unknown
> (unevaluated) properties.  This hides several wrong properties.  It is
> a limitation of dtschema, thus provide a simple workaround: expect
> children to be only of few names matching upstream usage (Bluetooth,
> GNSS, GPS and MCU).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
