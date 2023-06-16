Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DFEB64D8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoNUb5f9fCMjVWobK/KMLKLpIGEA/Kq9JxPiClR6NP4=; b=TmuxTFNbbcbpls
	EC36r88r7L/7VSdGIC/4BCs+Dq8loH5BInRAIIDJjyErk69ih7nVZWXJMCvH+JmjiNQEN7czwsgi+
	cecdcbBVTzZsOyZlgZ1TZM5Ext8V4JujCqkDBigraHEVPLSaRGuvEINanbOVCBp8jcBKjrPNXUqiI
	piZHqS2c7IMLcSCGGDQz4jZelCXaS/FtLmev7k53cpu+zNk4g0DsVY4OYEXMtQrqd2mS1Vy9ioFk5
	RWQBkjPWfXipa/ja/ZiMDLpeNX6kW9rmcZd0X8ytG6e83pmrwsxr3axR9AxbfHJtKdJLYLbDz3w1g
	wlN70nkmUwguMAjsczHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA85j-000UFW-0L;
	Fri, 16 Jun 2023 11:58:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA85f-000UDl-0Z;
	Fri, 16 Jun 2023 11:58:09 +0000
X-GND-Sasl: gregory.clement@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686916683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oopUZlUtuLZK+7zdDNuIoLpQDqrRtt6+LrJlqbPl+AI=;
	b=htS+g7ijJc5qam38E8e1ZkE/HXVDeDZ+ba6SRIEWVePZUyKejAdMDewGRoVC/Nr8g8sc3F
	ME/1ArWeIEkf4ymtm5tSbG7yn/XEYHxlt6GsrT6cIgbk7I6D43+uSG/76cT2UPYZJeodmR
	b96q9hu9bkt9s5bVrp08fYqYVtIi+FpKhIwl8RlYGRdrdFHWXLE6rlUtAzLXyGN7wOegoF
	sb1CwFK8RXhqbM2Ty+RISw7Rexiz0AH21PvekTxmJB/kWAUcMLMu4pCaHwmXn9GssgY687
	TosXZ0/toRqZYHN5M72qgRIqvypo8OoeChBC599H0aQF/OaOLwCWdlCDCd6o4w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95F0160007;
	Fri, 16 Jun 2023 11:58:00 +0000 (UTC)
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
In-Reply-To: <87r0qbhbqt.fsf@BL-laptop>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <87r0qbhbqt.fsf@BL-laptop>
Date: Fri, 16 Jun 2023 13:58:00 +0200
Message-ID: <87ilbnhb5j.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_045807_372113_51C071D3 
X-CRM114-Status: GOOD (  13.80  )
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

Gregory CLEMENT <gregory.clement@bootlin.com> writes:

> Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
>
>> Add YAML scheme for the Marvell's NAND controller
>> to validate it's DT bindings. Old txt file is deleted,
>> not included the compatibles and properties which were marked as
>> deprecated.
>>
>> Also fix node name in cp11x DTSI acording to nand-controller.yaml
>>
>> I've picked up this series to hopefully get it over the line. I think I've
>> addressed all the feedback from the last round of review.
>>
>> Vadym Kochan (2):
>>   dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
>>   arm64: dts: marvell: cp11x: Fix nand_controller node name according to
>>     YAML
>
>
> Both patch applied on mvebu/dt64
>
> However if the first patch should be merged through another tree, let me
> know.

Finally I removed these both patches, I missed the version 9!

I applied the 2 patches for the dts files from v9.

Thanks,

Gregory
>
>
>>
>>  .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>>  MAINTAINERS                                   |   1 -
>>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   2 +-
>>  4 files changed, 191 insertions(+), 128 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>
>> -- 
>> 2.40.1
>>
>
> -- 
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
