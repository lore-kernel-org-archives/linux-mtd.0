Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5866C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9876C20663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ui39PzQF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Ool6FC75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9876C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFKlAyVHGkzci3Tv8g9U5NPhQokcZy3DH6m1Kk+HlPI=; b=Ui39PzQFADUEwlcdmC/RX8le8
	3FnXQGu/CnO6+vAEuIwz4FWi6ULcsBeggNY3E0KW1Yoqp15ZyNC3mAWwZo/RLgNL6SMPcezM0Mj/p
	d4C5o/yTv2bx6TINq764gr6VnXfZLSvI9/8hnBGZwuiCvBgC073zdJpCQiM+Mp4DVN09vbWSHMpSY
	nIX2LfnFftehKoX/x5Y0+TUcTG1jB0cFp1aAYsgAKQYL4xa6bMQkEQ+hrsZj+qCW5rsBpu/5grZqs
	3XNdbt5MNCsJf+Y3KCTUOf6iyLlJTjt/66DA97TX0aR2cxOrW0uaaB3p+yPMg7xog0YONh5Z5PxqH
	vityLYTbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sFt-0001Nw-ML; Mon, 04 Mar 2019 18:24:01 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sFq-0001Mb-Qx
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1551723837; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VdIgxbkW7jJs7e+lCM6DVrb4aw/Z8hcXtudCrVXd2w=;
 b=Ool6FC75VgDObHgCIH6EXieLyfxAguSo0HGYl1AaLaNhyNMs2ZV2//vfO72jai2DsJosKw
 fl3j7j6uam1DHpJONdndwgwToymWGpRugw7XlhqCDakoh5NIgi9T/i/3h2UtUnD25n/6gp
 Cd0Dg2yPnUId9jQdf8Trgun6gAYaDTU=
Date: Mon, 04 Mar 2019 19:23:50 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1551723830.4932.3@crapouillou.net>
In-Reply-To: <20190304105014.0cceea0a@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net> <20190304105014.0cceea0a@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_102359_267325_5C1F1B0D 
X-CRM114-Status: GOOD (  19.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Mon, Mar 4, 2019 at 10:50 AM, Miquel Raynal =

<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> =

> wrote on Sat,  9 Feb 2019 16:22:58
> -0300:
> =

>>  The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes =

>> more
>>  sense to use the more generic ECC term.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net =

>> <mailto:paul@crapouillou.net>>
>>  ---
>> =

>>  Changes:
>> =

>>  v3: New patch
>> =

>>  v4: No change
>> =

>>   .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18 =

>> +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>> =

>>  diff --git =

>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt =

>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  index a5b940f18bf6..5a45cc54f46d 100644
>>  --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  @@ -1,4 +1,4 @@
>>  -* Ingenic JZ4780 NAND/BCH
>>  +* Ingenic JZ4780 NAND/ECC
>> =

>>   This file documents the device tree bindings for NAND flash =

>> devices on the
>>   JZ4780. NAND devices are connected to the NEMC controller =

>> (described in
>>  @@ -14,10 +14,10 @@ Required NAND controller device properties:
>>     an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC =

>> bank).
>> =

>>   Optional NAND controller device properties:
>>  -- ingenic,bch-controller: To make use of the hardware BCH =

>> controller, this
>>  -  property must contain a phandle for the BCH controller node. The =

>> required
>>  +- ingenic,bch-controller: To make use of the hardware ECC =

>> controller, this
>>  +  property must contain a phandle for the ECC controller node. The =

>> required
> =

> I think there is already a 'ecc-engine' property used by MTK and Atmel
> NAND controllers to point to the ECC engine block. Please use this
> property instead of the ingenic specific one.

ingenic,bch-controller is already in the devicetree ABI. I can't change =

it now...

>>     properties for this node are described below. If this is not =

>> specified,
>>  -  software BCH will be used instead.
>>  +  software ECC will be used instead.
>> =

>>   Optional children nodes:
>>   - Individual NAND chips are children of the NAND controller node.
>>  @@ -70,17 +70,17 @@ nemc: nemc@13410000 {
>>   	};
>>   };
>> =

>>  -The BCH controller is a separate SoC component used for error =

>> correction on
>>  +The ECC controller is a separate SoC component used for error =

>> correction on
>>   NAND devices. The following is a description of the device =

>> properties for a
>>  -BCH controller.
>>  +ECC controller.
>> =

>>  -Required BCH properties:
>>  +Required ECC properties:
>>   - compatible: Should be one of:
>>     * ingenic,jz4740-ecc
>>     * ingenic,jz4725b-bch
>>     * ingenic,jz4780-bch
>>  -- reg: Should specify the BCH controller registers location and =

>> length.
>>  -- clocks: Clock for the BCH controller.
>>  +- reg: Should specify the ECC controller registers location and =

>> length.
>>  +- clocks: Clock for the ECC controller.
>> =

>>   Example:
>> =

> =

> Thanks,
> Miqu=E8l



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
