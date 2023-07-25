Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1719C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J27DV3Fah5y022OVpbcnXZLRwJeuI+l9QalfSmBD2s=; b=qNoPVC8COF5Mso60WSSNcL3B/E
	781myTd/hbUfDXq7xW2zqY+VGLVqMvi1U3CxgNk584tFU74nhxFyGd7Il1xyPuULjI8goZppicjG5
	NaBLyhQ8Kdksgg9CsWk0exCB8XTTvUO5eGOO/1prHTf2dKvQ5QzI4YW+h8ff5kBXVHmfMGDLKIxQv
	IlwRx9HKd+TVm+gOo0F84wSx/RBdlOxktZcVAUR1bI2Oefc7R5sQw9icNmNsj3LezsIwMZuQVops8
	H3ODxBOHJyD78SIJzdIajwpcNSVloSHr+5NfRD0809gvtA+zfa4rYQIkHDe0kOPcsG9hgTMokWKe4
	Q0ie1Nfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEVe-006yXC-27;
	Tue, 25 Jul 2023 09:39:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEVc-006yWl-0u
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:39:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C3E5C5E7;
	Tue, 25 Jul 2023 11:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690277948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sU/re2gDPIRR5CQFG2K93MtypClELYbljif7MiensHc=;
	b=XwZsN2ULZ49V6PbinnicLUZoBzKQ7RNoOiXY8UhGzLW3AB+nWYiE5RvIcYNUKxvoXNjzz3
	oIlGSnB19ZB6WMdZSPpUI5yrxELpt7DRK1w7bto4bcPF8nUDPpFvT7QFwL7G8lbAf/hqRr
	m3cPld6pCyegLkrccwzzDurrnR/yfYSaBuX0Pq57MmoCYdQU5TCXIAqYu7BdmYhp5ifkYS
	nTTs85taCsSNRHczYeDGSaKamfoithXUINWsGP4OI5SCSsKhKu95FmDbzpak0+lzM80hcV
	UJkLcdF3VPFQy3Y6NNYp7b9BabHZXbTK/VDY4JCO7uwjvj34sRk4RvDSlLYIag==
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 11:39:08 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <CAAQoYRkCPsfxEzRGJ+fdtztCGtC7PwAVEekTAdb2KYGhF39bHA@mail.gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-3-jaimeliao.tw@gmail.com>
 <eb15e38a6bd4929c0afb41cf1c652d98@walle.cc>
 <CAAQoYRkCPsfxEzRGJ+fdtztCGtC7PwAVEekTAdb2KYGhF39bHA@mail.gmail.com>
Message-ID: <7a895a53594b607614e0b7518127bfbb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_023912_475295_1A84A86D 
X-CRM114-Status: GOOD (  23.01  )
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

>> So the stack die information come from SFDP? Can RWW also be read from
>> the SFDP tables? Do you have vendor SFDP tables where this information
>> can come from?
> For this introduction, it just introduce Macronix EPN naming rules.
> As I know, rww didn't include JESD216D.

Yes, but you might or might not have proprietary tables in the SFDP, 
which
might inidicate wether that part has RWW or now. Thus I was asking for 
that
document above.

>> Again "us" as in macronix? but then, there is no trace that this 
>> commit
>> is comming from macronix.
> It is relate to Macronix mail issue, so we prefer send patches on 
> gmail.
> A question, how could I mention the commit is comming from Macronix if
> I still send patch from gmail?

Yes see my former mail.

>> md5sum is missing and please use either xxd or if not
>> available, "hexdump -C".
> Ok, I will update content of SFDP dump with md5sum and
> using xxd command.

Thanks!

>> > --- a/drivers/mtd/spi-nor/macronix.c
>> > +++ b/drivers/mtd/spi-nor/macronix.c
>> > @@ -179,6 +179,33 @@ static const struct flash_info
>> > macronix_nor_parts[] = {
>> >       { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096)
>> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> > +     { "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096)
>> 
>> Please use INFO(0xc2843c, 0, 0, 0)
> Sorry I didn't get it.

That should come from the SFDP tables.

>> > +             FLAGS(SPI_NOR_RWW)
>> 
>> Maybe one of your proprietary tables indicate RWW capabilites?
> As I know, RWW could be got on datasheet only for now.
> So that follow the existing rule using FLAGS for it.

So you didn't test it? Then I'm inclined to say you should
drop this flag from this patchset.

>> > +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ
>> > | SPI_NOR_OCTAL_DTR_PP)
>> 
>> No NO_SFDP_FLAGS() for new parts.
>> 
>> > +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> 
>> You should have a correct "4-Byte Address Instruction Table", 
>> therefore
>> you don't need the FIXUPS_FLAGS.
> 4 bytes opcode flag could be get by parsing bfpt.
> But I think it would be great if ID table include it as well.
> Because of some flashes in market may not define SFDP table.

Which ones would that be? Are there any new flashes without SFDP
tables? And even if, it should be added if there is an actual board
using that flash without SFDP. I'm against just adding flags just
because "there might be something out there". Ideally, there shouldn't
be any entry at all.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
