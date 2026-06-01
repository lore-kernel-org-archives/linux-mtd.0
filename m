Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369E5CD6E55
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TahiVHMAjw5l4xMoiGnoXt3Rr6yV1s9TP8bV2CDdzcA=; b=1PiRh9Alq64ka/
	sxDmyruQ3QP67h9ZviOQcQ2R1EotCP0w1qGS6ncMNTMWcgxiPFBKLhr+8VAaHv4LgXLcKHyanic5J
	+71w5Z/ei0fPwiZsKkVbXo8eK7W/IWLsI/YEUs0KBt+emkNWGn1Kl1Ip91Y7V84nGDI8pFMhMiMJz
	gjwoHwA+cVlZPPWEN0r+NVurPSL39rFg41esmmdLmRvJQEvRx1nVPZVRocV1OyxydJz9g9ImhppMG
	rG15Dg6Df2mOd0hlBKEABntmjNbxhX/FGEqnuCaE+pkP3Dbe7Dp2qwa8zNHTXzNP42uED7x2RZZ3M
	90XmoNh9hRux/gz9gzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0n4-0000000Ajx6-1RE4;
	Mon, 01 Jun 2026 11:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0n1-0000000AjwJ-1h5Z
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 11:26:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BF3A43C4A;
	Mon,  1 Jun 2026 11:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3905C1F00893;
	Mon,  1 Jun 2026 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780313198;
	bh=8fzOkWbeJ42VtDXVbRsgq4BOgF3ms6OGA9UaeuBoOqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lQw1Zkm0vxnt9LDCSvFK7HHztHAJMwA1TX5kMJir9a7Ch+iJsEPUJ6sO7d2lpHTVf
	 JAnljh4jOBeezj34btuKIM6wEDCIkzF09XfY3xqTQqMUgIFWPk0+2D/Si3mxkzACrk
	 pU95cSS117aLO2/UmThKnJzsZi4CgTl7ICfCChWdk37jKr2fppHuzwFwWFnVHLQJp6
	 1Ex4HywfoJ0nHMpeSFSYRFS71PgidOJGuvgHVhY/h3dY9WWlOh7+g4EeWeJrNirpL4
	 vGF9bNfc+zYL0Jw2hgL5E8jpXpbS5lyYR0shYDYeL+nxjowz8Y6Yy/fihCQRNVEiGi
	 IhpUr/z/7H3Ig==
Message-ID: <063fe976-9a28-4670-90df-921fbc1c3a8c@kernel.org>
Date: Mon, 1 Jun 2026 13:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org,
 takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
 a-dutta@ti.com
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
 <20260530-original-peccary-of-cubism-af68ed@quoll>
 <2f091813-fa28-407f-892d-bbbbe3cac4e4@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2f091813-fa28-407f-892d-bbbbe3cac4e4@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_042639_498147_F921FB9F 
X-CRM114-Status: GOOD (  18.82  )
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

On 01/06/2026 10:26, Santhosh Kumar K wrote:
> Hello Krzysztof,
> 
> On 30/05/26 14:22, Krzysztof Kozlowski wrote:
>> On Wed, May 27, 2026 at 11:25:16PM +0530, Santhosh Kumar K wrote:
>>> PHY tuning requires a known data pattern to be readable from flash.
>>> When no partition is explicitly identified, the controller must search
>>> all available partitions to locate the pattern by label, which adds
>>> overhead and relies on label naming conventions outside the
>>> controller's control.
>>>
>>> Add cdns,phy-pattern-partition, a phandle property that allows the DT
>>> author to directly reference the flash partition holding the PHY tuning
>>> pattern. The controller uses this partition during calibration, avoiding
>>> the partition search entirely.
>>>
>>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>>> ---
>>>   .../bindings/spi/cdns,qspi-nor-peripheral-props.yaml      | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
>>> index 510b82c177c0..0ffcdf5b00d0 100644
>>> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
>>> @@ -39,4 +39,12 @@ properties:
>>>         Delay in nanoseconds between setting qspi_n_ss_out low and
>>>         first bit transfer.
>>>   
>>> +  cdns,phy-pattern-partition:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Phandle to the flash partition containing the PHY tuning pattern.
>>> +      When present, the controller uses this partition to locate the
>>> +      pattern data during PHY tuning instead of searching all partitions
>>> +      by label.
>>> +
>>
>> This should be used in any of applicable examples.
> 
> Please refer to the DT changes included in the repository linked in the
> cover letter, which should provide a clearer picture of how this
> property is intended to be used. [0]
> 
> I'll also add a DT binding example in the next version to make the usage
> more explicit.

Why do you new a new example? Why existing examples are not applicable?

> 
>>
>> I also have doubts that this is per-device property. Your commit msg
>> suggests it is per controller.
> 
> This is a per-device property. It is consumed by the controller driver
> only to locate and retrieve the offset of the PHY pattern partition

So with two devices on a bus, you need two separate partitions for tuning?



Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
