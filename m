Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37224C636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYiqzDFkPMgYPW67VnPa9RPAY8c+iKOltb/tYwiUE+k=; b=AV8XftNX9lzgtf
	5mdRdeTpXbHNNGu9MwWuXXMS2VFYn4hb4L8A//TK//pJ5FwBnQqVjFfUToXGYSaIiWAmOgW9jjCZj
	WKJFIZN2GsO2DrQ3Fs2sjxkYGDoFLcm3yvrN18oP+OeO6DBKAtfJka+bqMiiU1OD+vwOiSz1Vz+hX
	WvPOmlSGpcudj3fGs3AKEJOUXV5PmK7zm5SupGhx81GQ64ykQt0LkwdDPIIOdpdQjzG5MsUuNIcwF
	5SIZtJErSPfyUiMGawGPovjoxJUKGqfUOimuiQZNEA8H+S3wMWAgbBosNW/R6iC0Q8ZMGLtrV4Ql3
	/fOBMK9f+WtWNhw03cUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUyA-00DN6C-7A; Tue, 07 Feb 2023 20:53:38 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUy0-00DN4H-5T; Tue, 07 Feb 2023 20:53:29 +0000
Received: by mail-oi1-f180.google.com with SMTP id s17so13743258ois.10;
        Tue, 07 Feb 2023 12:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PJSm9CilBHFyIsWRbAHYLGlD4Zqx4Jlnh/4qUPzl5M=;
        b=KIJZZG3ecSNx5z0PnutoTFqw89BNXF0qYvQIBd93G0WaIFtWSqM5IdVpFsuGxI4xXx
         PLvfeLfX4vg13P59+qThBbpiSDZz6wKazLlXgii3G6BNKSTQVQJtMyLOqW+ZMd4cW1EF
         5YcmZ1g6sSbFyeoDfGNYhnKOBrIVOVgS8JshitCf6lqhVsg2IxMMxCD8qy386sKUfJi8
         KB3uU/z+xbC1tUeFoLATExn8vv0IGXN0BnXckcUf+gyC2Uxld/1kY8hNTdadHBC15a3U
         Ks0L7yE67Mbwp9d+7CaNekgq3iXb4HZAFcpLzCKtf+Nya8Ty1KKI94yNe74BizagCy3N
         nAog==
X-Gm-Message-State: AO0yUKVDxXfN/kvQFV1UEKjw8NC4ELpfn5PNV4yCL9igvnhq9MSv9u50
	p4/mBV+KMR+5g1duS3fzAg==
X-Google-Smtp-Source: AK7set/z//YA/7nJzXqqCVgcdIIk5jn7+70eSAIqLW/fE6APlY4qVBeuPVuP8TVksPd0GAoMBckujg==
X-Received: by 2002:a05:6808:7da:b0:36c:d1c7:ba37 with SMTP id f26-20020a05680807da00b0036cd1c7ba37mr1766812oij.41.1675803206680;
        Tue, 07 Feb 2023 12:53:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a26-20020a056808099a00b00378ce4197casm6114632oic.8.2023.02.07.12.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:53:26 -0800 (PST)
Received: (nullmailer pid 4136611 invoked by uid 1000);
	Tue, 07 Feb 2023 20:53:25 -0000
Date: Tue, 7 Feb 2023 14:53:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, - <devicetree@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, linux-serial@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>, Vignesh Raghavendra <vigneshr@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-ide@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>, Richard Weinberger <richard@nod.at>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split
 out peripheral properties
Message-ID: <167580320367.4136537.4626987585773695329.robh@kernel.org>
References: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
 <20230206092624.22922-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206092624.22922-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_125328_229407_11066067 
X-CRM114-Status: GOOD (  13.86  )
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


On Mon, 06 Feb 2023 10:26:22 +0100, Krzysztof Kozlowski wrote:
> The properties of devices in IXP4xx expansion bus need to be also
> applied to actual devices' bindings.  Prepare for this by splitting them
> to separate intel,ixp4xx-expansion-peripheral-props binding, just like
> other memory-controller peripheral properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> ---
> 
> Changes since v2:
> 1. Add tags.
> 2. Move intel,ixp4xx-expansion-bus-controller.yaml to memory-controllers (Rob).
> 3. Drop | in intel,ixp4xx-expansion-peripheral-props.yaml (Rob).
> ---
>  ...intel,ixp4xx-expansion-bus-controller.yaml | 66 +--------------
>  ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
>  .../mc-peripheral-props.yaml                  |  1 +
>  MAINTAINERS                                   |  2 +-
>  4 files changed, 84 insertions(+), 65 deletions(-)
>  rename Documentation/devicetree/bindings/{bus => memory-controllers}/intel,ixp4xx-expansion-bus-controller.yaml (57%)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
