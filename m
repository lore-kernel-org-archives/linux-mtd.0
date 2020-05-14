Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF5C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 15:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FAA20643
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 15:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DrEZzkD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38FAA20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6oRtbODij8Sn8qOcmevNHJnST9KdTW7P6Rq+vnwxSo=; b=DrEZzkD7NUYm8X
	//WeAg4pyGkvCez7mPyROKTt+U1yaGsWJx7aYOapMO3GxvC3YsTX/6mIT9tX3/awY4HcmH80obxk7
	87zzMOYmdYKwwh+UMF6WkOkr7G3i2T+ADpMzM4dse0B5JHRHmLX9DT1GD27DyFfxtHzXzvkFcq6Xd
	eGt1imPcybDQ9dMDw3A+/zmV8voTym5rZkHx1xJYpApGxk+ZwTO7T5tg4TW19iz+u1yf1kXe+F+tE
	EVMiFE2AF5m3CNaxIPYWCnLTfyTu1Ux6T7b8d2NwNg/CC1118LRDoaZ4Lgf7Zk7WN1iw0lqbbkMwn
	HsYMF4ovHHbHoP9XX35Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZFLt-0006nb-Qt; Thu, 14 May 2020 15:00:49 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZFLd-0006VS-O3
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 15:00:38 +0000
Received: by mail-ot1-f65.google.com with SMTP id 63so2565948oto.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 08:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b4HeH81d7CC2pFdjz+KIc9E1a6jJhBx25lXQ9gtMpzM=;
 b=JadDtYHFNtMXnboYVlUAO58NSPz2MBsuMmLstyApwqKL1WXeZp+mUpVktP5EJJ/KPI
 hu9tNtnmhuD5QxuwaKH+hoi0fZ1QgZrUzIEp6vgy3i1fVjatOsIeJWKFbKy+h8LsAAv0
 /BLc924cK1T/6Ng/L7NJz99JWUEy2TmP3hmVpaTDe2WXprb9VhOZf2M7XTQc20ic9FKv
 A6KT3J55gaha02T4WYMMIuntd7mrfqWBIS840eNO+q/rPxVNAbm75dl80ktqt5jnIh1X
 p5kyCq9hncPBhtahX1pdiWQR+lA7frLsYf1Ptt8gu4pCTPfepkl0KT8+tciei810MNF6
 cStg==
X-Gm-Message-State: AOAM531oLKsXWaJzoet0FJZqVtMwGaLZeII/94gBvfDEgzSW+fr9CUD/
 OFvPDGAo9a3xSDUPinSjfw==
X-Google-Smtp-Source: ABdhPJzW85ZeQbTbhD2yMI5gcvb3x7Kv8qJI1H0Pl22tcfxBOiO1jCVwwbhxlPlqaQj6fzuo6pKuzg==
X-Received: by 2002:a9d:7343:: with SMTP id l3mr3559142otk.276.1589468430559; 
 Thu, 14 May 2020 08:00:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u45sm818344ooi.41.2020.05.14.08.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 08:00:29 -0700 (PDT)
Received: (nullmailer pid 8677 invoked by uid 1000);
 Thu, 14 May 2020 15:00:28 -0000
Date: Thu, 14 May 2020 10:00:28 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v4 06/10] dt-bindings: mtd: update STM32 FMC2 NAND
 controller documentation
Message-ID: <20200514150028.GB28489@bogus>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_080033_787681_DB0FC75C 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 06, 2020 at 11:11:15AM +0200, Christophe Kerello wrote:
> These bindings can be used on SOCs where the FMC2 NAND controller is
> in standalone. In case that the FMC2 embeds 2 controllers (an external
> bus controller and a raw NAND controller), the register base and the
> clock will be defined in the parent node. It is the reason why the
> register base address and the clock are now optional.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> index b059267..68fac1a 100644
> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> @@ -18,13 +18,15 @@ properties:
>  
>    reg:
>      items:
> -      - description: Registers
> +      - description: Registers (optional)

The only thing that can be optional are the last entries. You have to do 
a 'oneOf' with 6 entries and 7 entries.

And where's your new compatible string for this different h/w?

>        - description: Chip select 0 data
>        - description: Chip select 0 command
>        - description: Chip select 0 address space
>        - description: Chip select 1 data
>        - description: Chip select 1 command
>        - description: Chip select 1 address space
> +    minItems: 6
> +    maxItems: 7
>  
>    interrupts:
>      maxItems: 1
> @@ -61,7 +63,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
>  
>  examples:
>    - |
> @@ -77,13 +78,13 @@ examples:
>              <0x81000000 0x1000>,
>              <0x89010000 0x1000>,
>              <0x89020000 0x1000>;
> -            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
> -                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
> -                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
> -            dma-names = "tx", "rx", "ecc";
> -            clocks = <&rcc FMC_K>;
> -            resets = <&rcc FMC_R>;
> +      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
> +             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
> +             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
> +      dma-names = "tx", "rx", "ecc";
> +      clocks = <&rcc FMC_K>;
> +      resets = <&rcc FMC_R>;
>        #address-cells = <1>;
>        #size-cells = <0>;
>  
> -- 
> 1.9.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
