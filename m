Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FDAECAAD1
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 22:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTvxIUozFR9jkeorjncH8u5OkNAQPno8ME8z6Lspzy4=; b=T3jIACdIY7p6Y3yseG+tmc6YCO
	+3WsZifJqlyZ01nOJHVY+iz6Q907GPQ1Mg4kGz21dgIsNvviOVjBfkOFt5aWXsl+JcTPstA2Hgwt4
	cD2eIY/1tf0zdoMJVCyLapXukTImvui6O716fVJ6I31vc4TSS5LSNNAfMm9qFXmlEEGEjAs/WhIV2
	AQBLXoyvni28xA/ltsb3IyNBHmMZhMdjTMzy0bNIiONGIXzWdqgmXuIkejnw62cc6ClQ+mSp1MHz+
	kR5tFoS6YEzBPq28JqN3xRI9Kk314Lkd9NC7/x1uPfcyVy4mWYo6wTAn1+DtuaYNGbXxYOMyf/wYN
	6TmnuqRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTWDz-008Una-O6; Wed, 31 Aug 2022 22:30:19 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTWDo-008Umc-KX; Wed, 31 Aug 2022 22:30:10 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E54E22126;
	Thu,  1 Sep 2022 00:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661985003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5A2fJzkWuA9bifn4MudMipTvJqlngyg+cza0sDoxRl0=;
	b=1WhjYa1SzJ9k71JE6p5vX6/cBxrlqc3zVmEflXmNFqmEOewjxP7vYZ5kejmmfbdUuFffva
	G5MGC5GocP7DeNNm2jloqcbS3K8jEK7+APKukF/on/RZyvWTWlzQ+O2GbnISR6g5HgbBe2
	v/7Gw8TZ/BWs1cK1ugiVP11fu0GG3CYQEiRxSWXQTKD6dcUF2+etuwGRuPN4RQEku0pQi8
	lDK/gKjJ3rrFMpBgFFjiFOCqCIy8HjTEcfHgUX+McVPwmCBkD9mullNKk9yc+pzsVKNa5K
	xhoVWUhDcO/Tc+9roHAPCHg2y8YiwqAJLfdfLAbhY8wXtCijfOrq1muQmyISxw==
MIME-Version: 1.0
Date: Thu, 01 Sep 2022 00:30:02 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible
 string
In-Reply-To: <20220831214809.GA282739-robh@kernel.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-9-michael@walle.cc>
 <20220831214809.GA282739-robh@kernel.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <60308ba420cdd072ea19e11e2e5e7d4b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_153008_884590_94AD6D55 
X-CRM114-Status: GOOD (  15.95  )
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

Am 2022-08-31 23:48, schrieb Rob Herring:
> On Thu, Aug 25, 2022 at 11:44:17PM +0200, Michael Walle wrote:
>> The "user-otp" and "factory-otp" compatible string just depicts a
>> generic NVMEM device. But an actual device tree node might as well
>> contain a more specific compatible string. Make it possible to add
>> more specific binding elsewere and just match part of the compatibles
>> here.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> In hindsight it looks like we are mixing 2 different purposes of 'which
> instance is this' and 'what is this'. 'compatible' is supposed to be 
> the
> latter.
> 
> Maybe there's a better way to handle user/factory? There's a similar
> need with partitions for A/B or factory/update.

I'm not sure I understand what you mean. It has nothing to with
user and factory provisionings.

SPI flashes have a user programmable and a factory programmable
area, some have just one of them. Whereas with A/B you (as in the
user or the board manufacturer) defines an area within a memory device
to be either slot A or slot B. But here the flash dictates what's
factory and what's user storage. It's in the datasheet.

HTH
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
