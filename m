Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92966C47422
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96ABCP9+UXNg6YFZZDtfYWDVpNduSF9CDtvvVYle5a8=; b=oK+gC+Yx5F195RPCJlj0/jt9Lq
	lmq69oT05x9SlOu6RhQuF/Kwh7FgsQ9lMVv+CsJmGjTd5iVONVnWtwwHe+U3To+0m9YYkJ6Jz5eFc
	c4rZYIN/mDyN1XZFZ0JSeAfgYUF/rlr6e9wxJl9Sa3EvBo42W/vM9eJSpVxVsU3sVXY1oAsp09iO8
	v+Qww2/BeSw/i28fZYzPWyexXK54IgSa08CpM4WslDoqJlZGYGAlT+LjG50tl5/OrhJppfVswHJb+
	lGcyNp0NF7mW4XUbTRGCH597AaYOQzbGLO3CrH9bBVX3CfzC4MJV3HdKFcVw5vAPhOszJ4FO90e2h
	lCamWR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRcDa-009qCV-29;
	Sun, 21 Jan 2024 18:06:50 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRcDU-009qBH-0o;
	Sun, 21 Jan 2024 18:06:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AB16D71;
	Sun, 21 Jan 2024 19:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1705860391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LUlRcO6qAUslB/aQvN4+sncIp9HuXImWqN6ii290a0=;
	b=dbZCBvB/tmsgJl20VVAvUddw5aNNE6egHwf0Na19PhkIglL6ehnwTzxLpop0zmv0cXC0Nu
	iO3dPOywTLOn7ibsBQXExorSg8oN3hv5wjRi7GmBCXPro+RqCco4nQjju49zx5nGo4cD6w
	eFqoqxSyvJUXQeBccdkxnnQ0dO1cTRqtP2y/kPUG75RkBRUTUlUYyxY/+esELRuA+jBmkF
	uqgBW8ppJHC23L2OaH6lz1e2uPczEyMt5varDkqct2DYwS6c0U6yLN3n5AjgLX+3pfgJok
	puFUea6zpmr+OtBh44bT/X02Hm2P0zrdX3HieqGZRQQAoJwAnv//pn8cf/lX6A==
MIME-Version: 1.0
Date: Sun, 21 Jan 2024 19:06:31 +0100
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
In-Reply-To: <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
Message-ID: <9806d99fab46c928f337b30b21057b3e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_100644_489953_5A219DBC 
X-CRM114-Status: GOOD (  15.01  )
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

>>> FWIW, the problem is due to
>> 
>>> +#define SPI_CS_CNT_MAX 4
>> 
>>> in the offending patch, but apeed2400 FMC supports up to 5 SPI chip 
>>> selects.
>>> 
>>>   static const struct aspeed_spi_data ast2400_fmc_data = {
>>>          .max_cs        = 5,
>>> 	^^^^^^^^^^^^^^^^^^^
>>>          .hastype       = true,
>> 
>>> Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the 
>>> problem,
>>> though of course I don't know if increasing SPI_CS_CNT_MAX has other 
>>> side
>>> effects.
>> 
>> Yeah, I was coming to a similar conclusion myself - the limit is just
>> too low.  I can't see any problem with increasing it.
> 
> It would cost a bit of memory and somewhat affect performance sine many
> of the newly introduced loops are bound by SPI_CS_CNT_MAX and not by
> num_chipselect.
> 
> It also might make sense to document the new limit somewhere. Prior
> to this commit it was not limited at all.
> Documentation/devicetree/bindings/spi/spi-davinci.txt lists 5 chip
> selects in its example for the use of cs-gpios.
> Documentation/devicetree/bindings/spi/spi-controller.yaml also does not
> list a limit.

Given that, that the rest of this series is under discussion (and esp. 
whether
it is the correct way to do it) it might make sense to just revert the 
picked
patches.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
