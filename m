Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E46DC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+df3EQD+ItsTk8qPRpn8PiG9qWTMtVKFdUZTrbUkTNw=; b=tTvbHUhGSEM9curbIu4fspRxtn
	JDm3Geezp/MQ2Y5EDW6ZV68g/3fcQFiB43ImTFnA4ot4JE237PeKFdOL6GX2GmaolgP1pZOfJc7Li
	RZM9g2UqN6D3WqG8ke1AKJqcwPFOOL3sGpcyGGVL/Np0Zr3STWTYLCX87fuUwKcmt44RJCDR1kVAW
	UyWQlG7B9PL0U/1Xg6+vSJ0ZpjO8ksPa8YTH9LTdoRurXp6+WKPq41hAQHfuvKXj3t8vqS8U2OtKt
	Ia9oSAV7R8j7janKjMjVn+vN2xnVqqUTekRy8oqtMX8srw5bQIfpYXwrUnKMoX+PEdRDzhXlEK0h1
	fOzmUE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7BVa-00AYyI-SF; Mon, 19 Dec 2022 08:28:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7BUs-00AYNF-Ec
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2022 08:27:44 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F2A021650;
	Mon, 19 Dec 2022 09:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1671438459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3XANsyzC7BCc0/K8WZkGEhKwbsMB9/mjHa43kkLcyuI=;
	b=VY1bdCM+ZRdlcgnwn73HCbQ7Fr5XyR2SdP0HOzdwZ2DyPhzzjcQ5R2ZIbaQROAzuVQzuXH
	lcZRYyjH/+IZFDppCMf+GNv4T8khmjYX6Kz0/8g7Lth7KhdSBH4XvWvxhvL9bYEu/QbOtn
	OXlkELpuMYH/HIoltTBhEy5HND3eipVB7LRo+aHLz2I97nq9HxJlkRBCrJxnA0H/6zKv42
	V0QF04jj4icutbuk429Gh/f9BySH1pg8ItIHwLVgMEwMOuRK8X5qPN34o0yB00wd6ttYT1
	+ZqjsV1tOlqPLmomROtZeLR7/qO86CNirhCXk0mUUHa7pj5TTwLeNC5Px9VIvQ==
MIME-Version: 1.0
Date: Mon, 19 Dec 2022 09:27:38 +0100
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
In-Reply-To: <511703b7a86075387b5bf07434077724@walle.cc>
References: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
 <511703b7a86075387b5bf07434077724@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <46ee3e2bac101849af6f39a999bb47d2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_002743_045619_2067285F 
X-CRM114-Status: GOOD (  10.93  )
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

Hi,

Am 2022-12-19 08:29, schrieb Michael Walle:
> Am 2022-12-19 02:55, schrieb tkuw584924@gmail.com:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> 
>> Infineon S25FS256T is 256Mbit Quad SPI NOR flash. The key features and
>> differences comparing to other Spansion/Cypress flash familes are:
>>   - 4-byte address mode by factory default
>>   - Quad mode is enabled by factory default
>>   - Supports mixture of 128KB and 64KB sectors by OTP configuration
>>     (this patch supports uniform 128KB only due to complexity of
>>      non-uniform layout)
>> 
>> Tested on Xilinx Zynq-7000 FPGA board.
>> 
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Datasheet:
>> fileId=8ac78c8c80027ecd0180740c5a46707https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?a

This should be a Link: tag in the commit message.

> Also I'm not sure when set_4byte_addr_mode() is called during init.
> It seems slightly wrong to me because it will check wether
> SNOR_F_4B_OPCODES is set. But in the restore path, it is checked for
> !SNOR_F_4B_OPCODES before 3 byte mode is enabled again. Mhh.

Scrap that comment. I read the code wrong. The place I looked at
just translate the 3B opcodes to the 4B ones.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
