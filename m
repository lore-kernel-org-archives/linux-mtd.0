Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C6C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O78rk+7e9RgEt6+1rQC/qK5KmHxKYLDmyVmKWcy+iJ8=; b=WShFogBMdcnHwyHiUsREF6w9zI
	YSmZFLoK7KFt8LzPCzqce5LltYZo1c8IzXm3mVJPPpKhofg8fWACsFfeBG0l5hkpevZzQb3SR6TEA
	GsXWFVrvNuvSz13yJYr3KKx6Juh0Ycdqq8kYZDRtyC2PfZhxRqaZgCqO+4i5srk0LwG17B7kX/ZtM
	GrIVOYwbKjYS7xY9q/z5+6jNn0F8T3Qy6+hmG1CUO/xcickQCIGAJUbIMwhakJHkU+92nLjm6sUWS
	Fy7hx9/ExVPK//2jQ3Xkm7Fzo9fC/UFZvWAJNnf5rn5izJ/Jz4I53ipBoFKMiKgoPC26wZHj9XTip
	00Hga2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPoaE-007EFN-JZ; Thu, 03 Mar 2022 16:45:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPoa1-007EBj-MW; Thu, 03 Mar 2022 16:45:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 71A832223B;
 Thu,  3 Mar 2022 17:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646325928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHxDkaaZRW9SaFJw2wf/xNPJbPSXHcfUFTXjfSI66b4=;
 b=WWMv90Hitf/Fv7j7VhhYHuKwHYYIvYzuL6U797fmSo3PKiPI9phZke8Y54TmeE4Duf/C8a
 +N0kSHvOBsXg80eiajPb5vOtdIAXDD5N8KWt+9lnyUtaMct3SuIq9kTvX7XBYEfOjP4YLZ
 jp9EIr+INmry8oqc3gXRplJTT2gfz64=
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 17:45:27 +0100
From: Michael Walle <michael@walle.cc>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
In-Reply-To: <CAEyMn7aN+wJnYkTJU_nWA9bPzF1sezA9_=E5YG5rnPBLMAmabA@mail.gmail.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
 <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
 <6bb1aafe7e156db8dfcf77f04a9d100e@walle.cc>
 <CAEyMn7aN+wJnYkTJU_nWA9bPzF1sezA9_=E5YG5rnPBLMAmabA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <b533feb1c69ddae69dd88a44a902eb47@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_084529_930777_F13DD572 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: sr@denx.de, vigneshr@ti.com, Tudor.Ambarus@microchip.com,
 jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-03-03 17:31, schrieb Heiko Thiery:
..

>>>>> # xxd -p mx25l3233f-sfdp
>>>>> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
>>>>> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
>>>>> 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
>>>>> ffffffffffff003650269cf97764fecfffffffffffff
>>>> 
>>>> Is quad enable working or has this the same problem as
>>>> the macronix flash in patch 4? Judging by the length of the SFDP
>>>> this also lacks the required information to select an
>>>> appropriate enable method. I haven't had closer look though.
>>> 
>>> it worked, yes. As I specified in the commit message, I tested it
>> and
>>> it used
>>> SPINOR_OP_READ_1_4_4 0xeb opcode for reads.
>> 
>> I'm confused, why is Heiko reporting that the CR/SR writing isn't
>> working because a wrong quad_enable method is chosen, but here it
>> will work. What am I missing?
> 
> I suppose that the flash that supports the RSSFDP is JEDES216B
> compatible including DWORD[15]. The flash that I have is only JEDES216
> compatible and has not the DWORD[15] defined.

That was why I wrote "Judging by the length of the SFDP". I've
converted both the mx25l12835f and mx25l3233f to binary and both
are 112 bytes long. Both seem to have the short BFPT table, ie.
no DWORD(15). Both seem to have a second table at offset 60h.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
