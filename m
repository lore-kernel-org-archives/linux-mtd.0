Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB25CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1FyKSq8SHmIHTFsvmusBOSeTD+LzyvPzfUWkAYH7tU=; b=HVWqVUFDOGmvGjr4KeiEKJhP+C
	XRmFTQiRMEHkTaAkUUJoXT3Wv/o9/iAXpWLViaqNIXPKx1b+gTngvbvCixQKArtZXaB9ucgojeGJU
	+b62g0r38ZdLzOyfH4NUm1JiiZ7HMhhft3BQjgF7ZY2abV5U4YLGP4LyLPgEghZ24L50L7MpmbO4H
	If3bC4xv6IkfeFm9kqYj/Xnj/zXKYHeCTekVnp9T9ZhmTYTqYOSdQxaTFAFs7aF5k9k3cil3A7sb0
	zg87ndmk+m/Y0XTBu3HURZfSRhOTqif9Ncimc4kXwhHJoKj3PgivXHFAEHkYTrKAH9cgOzT7GtfCh
	Bm/Bx7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ92i-00AWnx-B5; Fri, 04 Mar 2022 14:36:28 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ92J-00AWdk-QO; Fri, 04 Mar 2022 14:36:05 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 001A722175;
 Fri,  4 Mar 2022 15:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646404562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09h/2Lej8vf+lNermPmvkPu3QY6K/xr74IsvdE6XV3g=;
 b=sLwk7pRN4yjlbUJILZxngDaYPdwHji+G+sv0y5uuI+Bz7Hmn/MbtXvWsNH686S8b6ZgQEH
 JGiytyMcrVGltA2SRPQdr2nkuQYGWqJMc3Hmgaz9+XJiQCEV2T8iCdQ2xjH37w4SQqM99h
 YrgCIrzcB+caTECwCfsAtbwyIhOePsc=
MIME-Version: 1.0
Date: Fri, 04 Mar 2022 15:36:00 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
In-Reply-To: <58af5b61-83a6-38bf-05d1-f1ded5299f30@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
 <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
 <6bb1aafe7e156db8dfcf77f04a9d100e@walle.cc>
 <CAEyMn7aN+wJnYkTJU_nWA9bPzF1sezA9_=E5YG5rnPBLMAmabA@mail.gmail.com>
 <b533feb1c69ddae69dd88a44a902eb47@walle.cc>
 <58af5b61-83a6-38bf-05d1-f1ded5299f30@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <546a7f0f728b01e2283bab53989e5a69@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_063604_220104_93F4A28E 
X-CRM114-Status: GOOD (  24.00  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-03-04 01:36, schrieb Tudor.Ambarus@microchip.com:
> On 3/3/22 18:45, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-03-03 17:31, schrieb Heiko Thiery:
>> ..
>> 
>>>>>>> # xxd -p mx25l3233f-sfdp
>>>>>>> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
>>>>>>> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
>>>>>>> 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
>>>>>>> ffffffffffff003650269cf97764fecfffffffffffff
>>>>>> 
>>>>>> Is quad enable working or has this the same problem as
>>>>>> the macronix flash in patch 4? Judging by the length of the SFDP
>>>>>> this also lacks the required information to select an
>>>>>> appropriate enable method. I haven't had closer look though.
>>>>> 
>>>>> it worked, yes. As I specified in the commit message, I tested it
>>>> and
>>>>> it used
>>>>> SPINOR_OP_READ_1_4_4 0xeb opcode for reads.
>>>> 
>>>> I'm confused, why is Heiko reporting that the CR/SR writing isn't
>>>> working because a wrong quad_enable method is chosen, but here it
>>>> will work. What am I missing?
>>> 
>>> I suppose that the flash that supports the RSSFDP is JEDES216B
>>> compatible including DWORD[15]. The flash that I have is only 
>>> JEDES216
>>> compatible and has not the DWORD[15] defined.
>> 
>> That was why I wrote "Judging by the length of the SFDP". I've
>> converted both the mx25l12835f and mx25l3233f to binary and both
>> are 112 bytes long. Both seem to have the short BFPT table, ie.
>> no DWORD(15). Both seem to have a second table at offset 60h.
>> 
> 
> I've just redone the test, I see:
> root@sama5d2-xplained:~# mtd_debug read /dev/mtd1 0 65536 read
> atmel_qspi f0020000.spi: op->cmd.opcode = 00eb, so
> SPINOR_OP_READ_1_4_4 as I said.
> 
> Michael, you have the eyes of an eagle, only the first 9 BFPT dwords
> are defined:
> spi-nor spi1.0: bfpt_header->length = 9
> spi-nor spi1.0: BFPT[DWORD(1)] = fff120e5
> spi-nor spi1.0: BFPT[DWORD(2)] = 01ffffff
> spi-nor spi1.0: BFPT[DWORD(3)] = 6b08eb44
> spi-nor spi1.0: BFPT[DWORD(4)] = bb043b08
> spi-nor spi1.0: BFPT[DWORD(5)] = ffffffee
> spi-nor spi1.0: BFPT[DWORD(6)] = ff00ffff
> spi-nor spi1.0: BFPT[DWORD(7)] = ff00ffff
> spi-nor spi1.0: BFPT[DWORD(8)] = 520f200c
> spi-nor spi1.0: BFPT[DWORD(9)] = ff00d810
> 
> What happens is that the QE bit is non volatile and it's already set.
> 
> spi-nor spi1.0: spi_nor_quad_enable
> spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable
> atmel_qspi f0020000.spi: op->cmd.opcode = 0035
> spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable cr = ff
> atmel_qspi f0020000.spi: op->cmd.opcode = 0005
> spi-nor spi1.0: sr = 40
> 
> spi_nor_sr2_bit1_quad_enable is called, RDCR is ignored so 0xff,
> but I did a read of the SR and surprise, it's value is 0x40, so QE set.
> This is a new kind of bug :). So yes, this patch has the same problem
> as Heiko's, I will update it. Thanks for the heads up!

I've given this a little bit more thought. I'm pretty sure
the QE bit is non-volatile on most flashes which share IO2
IO3 with hold#/reset#/wp#. Why is the QE bit needed in the
first place? Because it will determine the function of the
pins. For example, all our products will have WP# pin enabled
and pulled low to make sure (parts of) the flash is
write-protected. Needless to say, we cannot use quad mode.

There might be edge cases where we accidentally disable the
write protection pin. I'm not saying it is likely, though.
E.g. on our boards we have a jumper to disable the write
protection, now if linux decides for whatever reason to fiddle
with the QE bit and set it to 1 that jumper might very well
be useless after you booted linux once. Now that does ring a
bell with "linux will just disable the write protection for
no good reason on any flash", if you still remember ;)

Anyways, just to let you know. I don't have any better
idea.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
