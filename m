Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FC8EB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWMoqLVUyQ8LpPEmGc4B6SyFejFEXSGExAzuukp4JsE=; b=XFNJDpqWat1JJv
	VsEC3KHW5BiEujJgkxLiIMUxa6R6jKWZyIITKWs2AOEQYpwaL9s0yMGXgtLZyv4hLVIqXNAhiXh4E
	nNiHd5w/RRox/StgDRjWF9++1aR8CD3+CaCxVBwdcK0W5PngnO8yx9Ad8U5sy6GpyFkqsdPylg0t+
	pQDqrnbynf75QCDVsJQCNDcobx1fCLcM6QbR8LUESOwnpY+uSfKPiSAgk4srdiDCoTW2YpJizSb7r
	TTjQ0GG7BkEwLZlstaanQGaRa2G67fDjvjytxVydNGfBUECSe4JTyJIAf7xbETF9g5LPyc9whA6p7
	9CCOfDt3CEzaL1QPR0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7tO-000RgS-07;
	Fri, 16 Jun 2023 11:45:26 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7tK-000Rdh-0v;
	Fri, 16 Jun 2023 11:45:23 +0000
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686915916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7vKXcoGnfHByIjNR4PPOnXfjMYez+Hmo6GodYExhsY=;
	b=cTmBdZOVa7wbqWhmXSVD72Qc/Ds9ElgOdPoJLeG60uZz/X2FzpTaZBgUf1mTQnFiak3Wch
	y+hC+XwNCaxkbWNKbk2ezoz5gB0yRlpXswJgj14U0bGZl7vDodc8DQjIPblmerD7LHmGm/
	DENlhkG1c4RsTXxQpp1bEUB3j95R/VHXV4bsNsU8Eu8pplbVCBjNbe2g0vhz1hoTHP/uAF
	97/ojRMbaSub3mqqC6wiv8hzCEWSjFvU5igE5MnJSjDtd9pTMR3mIjdT2DBBsYeOcT3h4y
	5N1++kgT/+d/SGjUdsVFUDZgygac/sJlAsUbDYNENJKuz3DvXxFT9GLwfqQvfA==
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
X-GND-Sasl: gregory.clement@bootlin.com
X-GND-Sasl: gregory.clement@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EC8D20007;
	Fri, 16 Jun 2023 11:45:14 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
 vadym.kochan@plvision.eu
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com, Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v6 0/2] dt-bindings: mtd: marvell-nand: Add YAML scheme
In-Reply-To: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
Date: Fri, 16 Jun 2023 13:45:14 +0200
Message-ID: <87r0qbhbqt.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_044522_506178_DF0E55A5 
X-CRM114-Status: GOOD (  11.77  )
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

> Add YAML scheme for the Marvell's NAND controller
> to validate it's DT bindings. Old txt file is deleted,
> not included the compatibles and properties which were marked as
> deprecated.
>
> Also fix node name in cp11x DTSI acording to nand-controller.yaml
>
> I've picked up this series to hopefully get it over the line. I think I've
> addressed all the feedback from the last round of review.
>
> Vadym Kochan (2):
>   dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
>   arm64: dts: marvell: cp11x: Fix nand_controller node name according to
>     YAML


Both patch applied on mvebu/dt64

However if the first patch should be merged through another tree, let me
know.

Thanks,

Gregory


>
>  .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>  MAINTAINERS                                   |   1 -
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
>  4 files changed, 191 insertions(+), 128 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>
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
