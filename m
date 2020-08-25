Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B515C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C9C2071E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pXZcr5oO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C9C2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=daAgfP+/RMl4dv9NLdG/VUeFx199Ub+x/PQS/Wwkqfc=; b=pXZcr5oOXLCJhC8DzrWzEc2Fp
	cghwJcCKQZ2Nhw56O4lEMQJCndWXZyWWMZshyqZ6QSh1Y0HBdKEKiW53v02+K0bkfp9jvolmESg9x
	JKadl0OVjYPu3CuX8L5LCYIORmjqOOurhsKRgp60vKuxeQy86QyYwXfVK1OCKvFeyp/B6/4taHn4p
	2I8IaIBvbD9OsSX7IuA9b3yFLlG8uLdazGOV8imO+fZHSb6F15UL3WM+eoRI1wHt5Sc9GoDSKl39P
	1w+jO5dAFV/KYBp2CmaKc1Ggx847r0pCJ0vOq7Qu/GiWoanaKFcAoccFOvmL1ugZA7L8skQdNNis3
	ZZTXGAmOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kASdU-0005UY-IE; Tue, 25 Aug 2020 06:40:48 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kASdR-0005Tg-Q3
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2020 06:40:46 +0000
Received: from [2001:67c:670:100:1d::c0] (helo=ptx.hi.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kASd5-0006Yi-0e; Tue, 25 Aug 2020 08:40:23 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kASd2-0002aQ-Mk; Tue, 25 Aug 2020 08:40:20 +0200
Date: Tue, 25 Aug 2020 08:40:20 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/16] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
Message-ID: <20200825064020.GM13023@pengutronix.de>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824190701.8447-2-krzk@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:34:56 up 187 days, 14:05, 139 users,  load average: 0.34, 0.21,
 0.22
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_024046_129663_77D42D54 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 09:06:47PM +0200, Krzysztof Kozlowski wrote:
> Driver requires different amount of clocks for different SoCs.  Describe
> these requirements properly to fix dtbs_check warnings like:
> 
>     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
>  1 file changed, 61 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> index 28ff8c581837..9d764e654e1d 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx6q-gpmi-nand
> +              - fsl,imx6sx-gpmi-nand
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: SoC gpmi io clock
> +            - description: SoC gpmi apb clock
> +            - description: SoC gpmi bch clock
> +            - description: SoC gpmi bch apb clock
> +            - description: SoC per1 bch clock
> +        clock-names:
> +          items:
> +            - const: gpmi_io
> +            - const: gpmi_apb
> +            - const: gpmi_bch
> +            - const: gpmi_bch_apb
> +            - const: per1_bch

This enforces this specific order of the clocks given in the dts. The
clock binding itself doesn't require any specific order, that's what we
have the names array for.

Is this really what we want?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
