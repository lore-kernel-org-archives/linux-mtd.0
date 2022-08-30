Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6824BECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/8uoV2qGy3zYYqDwCQ5uN+3Qq+Is50MZmUF2EzBccU=; b=ijN0lORKXrTjSFzV89UOaehNU6
	Oi1jMTLFK+q05WNUu2Ef5VnJzxiY/81bPfiKJnckztj5p9AHFkZy8LwTF48ozlN0cP9WSqfGLBXwi
	0W1NZqd2KbD353kNjxO+GAwMfm+vNdjtRxCnm6BbcNAYKSiP9z8k6USlf2108jXJ3JZe9WUDohIdZ
	q83HYyUdEJzSU4WTY1kkjGA0yqA36150LwOka4LjO7ZKQ8M7uQsKZkaAq+63YQja/j44LTt9kOmbU
	p7hCSVmOJkxzvPnrk/+Xxg6tr9qYfGG7rn6gKNTA/AQxFiSFGLABgccKCgstzLKo4tPdxqzNFc+hh
	pz0g/Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxg6-00FitL-Gr; Tue, 30 Aug 2022 09:37:02 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxfo-00Fia6-ID
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 09:36:46 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2E68922CF;
	Tue, 30 Aug 2022 11:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661852199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVoTxfXy8cDqrSIhz4HpBP22qZhpepvVK6F1WYi9tQc=;
	b=ekkB0CUy37+MNjEXna5X662xWN2c19XCvS+Tz/efZLb2PBH5oMPE0q0bSDqKrFodNksUau
	1PqOnYx7crQ2Ev8h1/LqM5nu5Aqy/M1w5PTT5wpwToKtqpnw15G1H9TYOP9aK+xM5fzGjp
	a5kcIEADlvSHDqggxoevpOyGZj7mSqT59K/UxFKyhWl+FFeZgPoGlO62swPVncIHDiCpPC
	2Wmy3Q9q741BAiOnAFq1D5/ESvShjcPcSc1Fnmx3kWmCHqeAHYoWTt4oZJcFPxIbcDt6d4
	7FsyIQ7dhGSisEuEl0fdBxZUzn/QKTzxMrZHd0gawVCsBz6c6NsZ9kbU5l91UQ==
MIME-Version: 1.0
Date: Tue, 30 Aug 2022 11:36:38 +0200
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
In-Reply-To: <9a63271b-48c0-1b31-c450-5abc9eedbced@linaro.org>
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
 <20220829090528.21613-2-sai.krishna.potthuri@amd.com>
 <9a63271b-48c0-1b31-c450-5abc9eedbced@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6619ebc290f12fbb7613f32087aa9200@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_023644_891246_833517DD 
X-CRM114-Status: GOOD (  16.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-08-30 11:21, schrieb Krzysztof Kozlowski:
> On 29/08/2022 12:05, Sai Krishna Potthuri wrote:
>> SPI-NOR flashes have RESET pin which can be toggled using GPIO
>> controller, for those platforms reset-gpios property can be used to
>> reset the flash device.
>> 
>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml 
>> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> index 7149784a36ac..d2fc8e9c787f 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -70,6 +70,12 @@ properties:
>>        be used on such systems, to denote the absence of a reliable 
>> reset
>>        mechanism.
>> 
>> +  reset-gpios:
>> +    description:
>> +      contains a GPIO specifier.
> 
> Skip this part - obvious.
> 
>> The reset GPIO is asserted and then deasserted
>> +      to perform device reset. If "broken-flash-reset" is present 
>> then having
>> +      this property does not make any difference.
> 
> Isn't then broken-flash-reset conflicting with this one (e.g.
> disallowing it)?

Sometimes the spi-nor driver needs to switch modes, which are persistent
until you either switch em back or do a hardware reset (or software
reset IIRC) of the flash. If broken-flash-reset is set, we try hard
to leave the flash in the mode which it is normally in after reset or
don't switch modes at all.
Of course we cannot make sure, our shutdown gets called in each case,
thus there is may be warning during startup.

So, even if you have a reset-gpio it might be broken I guess. Think
of it being high active, but someone forgot the pull-up. So, if you
do an unexpected reset, the flash chip might not be reset
automatically. So yes, I think, even if there is a dedicated reset
gpio, it could still be messed up. How likely is it? I don't know,
probably not very.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
