Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1495AC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D867120663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYrqeap5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="SS6r+bCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D867120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SjerUaAwJ4dnufaqu71WHsDA1y2i5efz9eBP4wcgI2k=; b=eYrqeap5iydTj505g6QiCnp48
	WfSqhgZ/3hcujm2R1CX9kZRq4TKB8rG/+ytb016tLud1FVP7xuzWCxEHANl0TQUqcQZ6UXx+Wc84L
	rsbic3fzpX7T/YAw19kXXzL357ILgyiCKLwdgyQKXsoZq3BAfM5kIDjqwaX6bvB3KWflYkFeBA+Sh
	sXfN6CfemppZoOjyCUy5Sfrc6k9PlySJUgwMDPddPKL9mGzedSfBgRFNrXfid0YptjeYHxARj63gr
	27X9OMsQLREOcdrOIF8F8MqZTmzczAoSI1Af6XyGRbv7XzoknDQx52u4VnxN5XejQSOpBd3QVK5Rx
	Bn5WTKmag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sEc-0000tN-JY; Mon, 04 Mar 2019 18:22:42 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sEZ-0000sD-7A
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1551723749; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHwuU9Y+V+vVpKPqoBrFRK246RbRVM7QYbYfLWrqTeI=;
 b=SS6r+bCVTYvktntxuSPxrlBq64mAYcPiuWIyH0lr4cP3s97iayrC1AbLLyT8CV+yhyckPq
 RzPRg92ELhMZ1WJmeblbOWmKT57OGZaCk9pZA0rLxzg7khTavX/iXjK7qL1yWTUAMkUPWu
 LDyEdTPRZKHFdL20ggJq7PLD6tZelso=
Date: Mon, 04 Mar 2019 19:22:22 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1551723742.4932.2@crapouillou.net>
In-Reply-To: <20190304104554.09be4cd4@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190304104554.09be4cd4@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_102239_621308_67E24852 
X-CRM114-Status: GOOD (  17.41  )
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

Hi Miquel,

On Mon, Mar 4, 2019 at 10:45 AM, Miquel Raynal =

<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> =

> wrote on Sat,  9 Feb 2019 16:22:57
> -0300:
> =

>>  Add compatible strings to probe the jz4780-nand and jz4780-bch =

>> drivers
>>  from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net =

>> <mailto:paul@crapouillou.net>>
>>  ---
>> =

>>  Changes:
>> =

>>  v2: - Change 'ingenic,jz4725b-nand' compatible string to
>>        'ingenic,jz4740-nand' to reflect driver change
>>      - Add 'ingenic,jz4740-bch' compatible string
>>      - Document 'ingenic,oob-layout' property
>> =

>>  v3: - Removed 'ingenic,oob-layout' property
>>      - Update compatible strings to what the driver supports
>> =

>>  v4: No change
>> =

>>   Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10 =

>> ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>> =

>>  diff --git =

>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt =

>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  index 29ea5853ca91..a5b940f18bf6 100644
>>  --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), and =

>> thus NAND device nodes must
>>   be children of the NEMC node.
>> =

>>   Required NAND controller device properties:
>>  -- compatible: Should be set to "ingenic,jz4780-nand".
>>  +- compatible: Should be one of:
>>  +  * ingenic,jz4740-nand
>>  +  * ingenic,jz4725b-nand
>>  +  * ingenic,jz4780-nand
> =

> Wouldn't "-nand-controller" suffix be better? Of course in the driver
> you should still check for jz4780-nand.

So I would be compatible with:
* ingenic,jz4740-nand-controller
* ingenic,jz4725b-nand-controller
* ingenic,jz4780-nand
?

>>   - reg: For each bank with a NAND chip attached, should specify a =

>> bank number,
>>     an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC =

>> bank).
>> =

>>  @@ -72,7 +75,10 @@ NAND devices. The following is a description of =

>> the device properties for a
>>   BCH controller.
>> =

>>   Required BCH properties:
>>  -- compatible: Should be set to "ingenic,jz4780-bch".
>>  +- compatible: Should be one of:
>>  +  * ingenic,jz4740-ecc
>>  +  * ingenic,jz4725b-bch
>>  +  * ingenic,jz4780-bch
>>   - reg: Should specify the BCH controller registers location and =

>> length.
>>   - clocks: Clock for the BCH controller.
>> =

> =

> Thanks,
> Miqu=E8l



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
