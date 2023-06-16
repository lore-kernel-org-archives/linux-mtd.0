Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17CEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFSmpCPGI1KcyCOwzBjwIc+dtg5gMMRiFnqMBy7Sr3c=; b=VjnFgK2vg1E3uB
	SvTYJ8biYiWaPhm7+b/mh2fDLpReNMqtgdZ+GluM8ZuaR8myFcyyZkRmbINCxQv1P4NpyJaBUoo1i
	/aVIX/NasyaTZxvYHzAw60fgILF2Iyp5HO6qs7/iIYQBtN8ZY60KfKHkGw0+ZRZ2R1fMoDgc5rZQJ
	GQzNNiVvuqSUgCuggPw9SBSPUKuECOveNPZSGT1IQ+X/ULyv3/TQi6c0MElMce7tUWG8KKRrVhf9L
	WNF3aAvNjlBKVS9SQ1zYxplXSHoEC7d8v8AsEqZCkQgHrFOyksg5kkyzhTIRxLruIf4RYmWQ694ZQ
	NiuXqjm1CsfvMPpmGMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA83p-000TlF-2d;
	Fri, 16 Jun 2023 11:56:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA83m-000Tj9-22;
	Fri, 16 Jun 2023 11:56:12 +0000
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686916568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QaZnoro0oU0BUT67Qd+xO/fbwDMI8KTckqLRYFBC1A=;
	b=F4yISwuao80Yq+BfiQHCmYOpMnGAeJxFSVfrWuqpY/P6HLjFFCoFhz0lo96y1NyGig0eWj
	sDErek1g/skSmiysKMh7RQDKWRKllmMsl0byx0C4xXIa1v5Tby/m81i9EzeHKKo1KAI2Xh
	jZ5tKuFuRxaWWQG453O6K/oKdgppll19PVojTDpxeFWSMErJZtnmraOglde5qpBlcMGWft
	DNlCpRYwy6ADtML0ewRZrsx0fbSSdbXFbmPowV63AFelyzYBmgbci1OvpG92FVKlrxx6pC
	6nEgNgBeuOGKW4E/ssMzNDlRlcW2bccMh4vCSvY54g+o1EJV9RgOFnY59bE7Ow==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 398F92000C;
	Fri, 16 Jun 2023 11:56:08 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris
 Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v9 2/3] ARM: dts: mvebu: align MTD partition nodes to
 dtschema
In-Reply-To: <20230615040447.3484564-3-chris.packham@alliedtelesis.co.nz>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-3-chris.packham@alliedtelesis.co.nz>
Date: Fri, 16 Jun 2023 13:56:07 +0200
Message-ID: <87legjhb8o.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_045610_964512_851CA960 
X-CRM114-Status: GOOD (  12.65  )
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

> Update the node names for the SPI NOR and NAND partitions to conform to
> the partition properties in the relevant dtschema.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied on mvebu/dt

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
>  arch/arm/boot/dts/armada-385-atl-x530.dts | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-385-atl-x530.dts b/arch/arm/boot/dts/armada-385-atl-x530.dts
> index 241f5d7c80e9..5a9ab8410b7b 100644
> --- a/arch/arm/boot/dts/armada-385-atl-x530.dts
> +++ b/arch/arm/boot/dts/armada-385-atl-x530.dts
> @@ -179,19 +179,19 @@ partitions {
>  			compatible = "fixed-partitions";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			partition@u-boot {
> +			partition@0 {
>  				reg = <0x00000000 0x00100000>;
>  				label = "u-boot";
>  			};
> -			partition@u-boot-env {
> +			partition@100000 {
>  				reg = <0x00100000 0x00040000>;
>  				label = "u-boot-env";
>  			};
> -			partition@unused {
> +			partition@140000 {
>  				reg = <0x00140000 0x00e80000>;
>  				label = "unused";
>  			};
> -			partition@idprom {
> +			partition@fc0000 {
>  				reg = <0x00fc0000 0x00040000>;
>  				label = "idprom";
>  			};
> @@ -216,16 +216,16 @@ partitions {
>  			compatible = "fixed-partitions";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			partition@user {
> +			partition@0 {
>  				reg = <0x00000000 0x0f000000>;
>  				label = "user";
>  			};
> -			partition@errlog {
> +			partition@f000000 {
>  				/* Maximum mtdoops size is 8MB, so set to that. */
>  				reg = <0x0f000000 0x00800000>;
>  				label = "errlog";
>  			};
> -			partition@nand-bbt {
> +			partition@f800000 {
>  				reg = <0x0f800000 0x00800000>;
>  				label = "nand-bbt";
>  			};
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
