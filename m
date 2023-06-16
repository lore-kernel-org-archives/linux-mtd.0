Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31974EB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqMHw/ZcC1b8lBKwIogGVwzVuf/cjUmkr0v0OBFcI7Y=; b=sbWfhwX803H+5c
	ywFC13bOPbF7+EN23HXOqTmzOkQEf5oU1mEvzHD9r3thPNnnbD36FPvHB761+nC0dJ5NkjmpCkKmv
	p4tLuWhyAHVZ70RkM6FmXy8DB8v3HI5gKVUipbNYvl9kQK3k9E48fkqH3glAC+xR2h2X+Jqi3jHVt
	xThCDDc3X2wtXM0B2Zo+kVTMOxuGcIDKMWnXMa0hgWIC3UsZmD4JRDFMHcYEacQBaqr47EGVneiLZ
	bjCitR29E6QmU8Cni/zoK/RNqbte+NE7fKwNwcgHUOPwo7Z9XJNOUKLMvAhLTaVBi8HEkTVddgXEl
	T2RLaikYPw5//Qn7ATbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA83b-000Th4-1l;
	Fri, 16 Jun 2023 11:55:59 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA83Y-000Tg0-24;
	Fri, 16 Jun 2023 11:55:58 +0000
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686916554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v3VbCZZPj2MH0B0+AxaXEpesaRl2NPyrEf1VpNxwlIQ=;
	b=j6qpC/T8VW1/ouaPpAkjq2VsAZfIQtkXFSdnWjuzAQS4RsC4Kw+gi590pUuYPb976fLsH1
	3Q/+4HPwTOEjzQ1LXKm1DUDzc1JX6zs19JNVW1zg8wkXQZ1BTszQVJseVTdDvqQWuSKY+w
	g7nO7Uw6b0YUF03aP6e3xYlUkkI46SZ52VVrfxDpqe27j7EPmfbJV6nS70ch8WCp5OOrwr
	vg8dv3qpXhaakMbyfLaCvIdVfd5kapMes7HV7Ne3xneNVBXa8ie/FHATVuFKglJ6ZScQS0
	/RqCVTJWZmi0U4x2FmA3w0E0YSqkIVqk5Rv6YvMkhfIN8xrhPf2rVGiLmy28cg==
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BFC12000B;
	Fri, 16 Jun 2023 11:55:52 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vadym
 Kochan <vadym.kochan@plvision.eu>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v9 1/3] arm64: dts: marvell: cp11x: Fix nand_controller
 node name according to YAML
In-Reply-To: <20230615040447.3484564-2-chris.packham@alliedtelesis.co.nz>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-2-chris.packham@alliedtelesis.co.nz>
Date: Fri, 16 Jun 2023 13:55:52 +0200
Message-ID: <87o7lfhb93.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_045556_830768_D96EB193 
X-CRM114-Status: GOOD (  14.22  )
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

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:

> From: Vadym Kochan <vadym.kochan@plvision.eu>
>
> Marvell NAND controller has now YAML to validate it's DT bindings, so
> change the node name of cp11x DTSI as it is required by nand-controller.yaml
>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied on mvebu/dt64

Thanks,

Gregory


> ---
>
> Notes:
>     Changes in v9:
>     - None
>     Changes in v8:
>     - Add r-by from Miquel
>
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> index 7d0043824f2a..982b180b33e6 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -468,7 +468,7 @@ CP11X_LABEL(uart3): serial@702300 {
>  			status = "disabled";
>  		};
>  
> -		CP11X_LABEL(nand_controller): nand@720000 {
> +		CP11X_LABEL(nand_controller): nand-controller@720000 {
>  			/*
>  			 * Due to the limitation of the pins available
>  			 * this controller is only usable on the CPM
> -- 
> 2.40.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
