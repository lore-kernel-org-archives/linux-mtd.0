Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3328CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5HT+Ff9tJSQhGi6qJYRkx9VP0H2BmaliaHtuhMLDtM=; b=paHPRxfJgwZw4crSApTzUnIJKM
	XwLXfXvFx6n83IUT7m8s8RlHqROBYTDH7JqljRbBt3UpmIKK7Tmvc3EyNPaGL0er6BRAkO9t5Sk0C
	wlxiNeqHlG9cl8biN5aDda1HTHf7B4zJeT8GKWLIjgesiTzJJ6yMf6ibh+Y18bHcuMy9Ip9mqWtmz
	z89J0Yn2LycrriP5WsawH2w0JHWgjHr2E1igkIQ7TgPn8hGUk/51H19YZaEwnIsy7hXbbyAg/6mZI
	/yw6Kc/mLkQ+Wu0IO23/4A010qpO7CEMLOtbtsuPz+jhMwPw9udgcBCVNrSRIxQe69n9iUz+dBecO
	6cRIJBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OTu-008GUR-0P;
	Fri, 10 Nov 2023 10:11:18 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OTo-008GTv-2w
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 10:11:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B12755D8;
	Fri, 10 Nov 2023 11:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699611060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0xFjiIFSD5filA1PVVjQV2FcRJZkfsau4Nsg7iZLDs=;
	b=fZ+mEubzdSiREbMnoU6w7eJFH0E3gvRxEKygNGG8/GDWiB8q+RxPTEoW+Gg6x7zarr7E/X
	S7XKZpfwXhb4p3p4hsPP5L4P3fqPHaivCe/lixztsgemltBGbeBj+wUZMQFbTq67tBNalV
	/qGw7dmQattNcp4yXY5Mstawa8982tDeKZSITk9cRirofPImIGo4+F0TfLnHg5K+WOM/Mp
	rbp0x3+unmpO3S2MKKDgqxw67HhBd9nIeDKbt+7u41bn5y0/F3XwOIe7PIwxqPP2n7kLot
	BUzeQhZJX2dxXIiC1MkmXoYa+I1Q+B5E+wnNv2Jh976mzlm+OdXZthsJNR5SOA==
MIME-Version: 1.0
Date: Fri, 10 Nov 2023 11:11:00 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Message-ID: <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_021113_600228_5F4582AC 
X-CRM114-Status: GOOD (  31.78  )
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

Hi Biju,

>> >> Thus I was saying, that we probably wont support that and the easiest
>> >> fix should be to disable this behavior for the atmel flash (there was
>> >> nv setting).
>> >
>> > The fix up is invoked only for quad mode, I believe it is safe to add
>> > fixup for micron flash As it is the one deviating from normal
>> > according to you, rather than adding fixup for generic flash like
>> > ATMEL flash(Now Renesas flash)
>> 
>> Could you please try setting bit 4 in the Nonvolatile Configuration
>> Register (Table 7) and see if the problem goes away?
> 
> You mean, if it works, we need to disable reset for all the boards, 
> maybe at bootloader level??

Not necessarily. First, just to confirm that it is actually the reset
circuit. You can also compare the part numbers of the flash. There
is a flash with IO3/RESET# and IO3/HOLD# (and a flash with a dedicated
reset pin).

If that's the case, it looks like a hardware bug on your board. You
left the reset pin floating. So you'd also not be able to boot from
the NOR flash, right?

> OK, I will check that. Currently I have read that register and it is 
> showing a value
> Of 0xffbb. I need to do write operation. Before that how do we recover 
> flash, if
> something goes wrong during writing for NV register?

You should always be able to write that register from the bootloader.
Maybe also through raw commands (like sspi in uboot).

>> Also could you have a look at the schematics, does the IO3/RESET# have 
>> a
>> pull-up? If not, who is in control of driving the correct value here? 
>> If
>> it has a pull-up, I'm puzzled why you need any other setting than HiZ.
> 
> Unfortunately, there is no pullup on IO3 line and also there is no SoC 
> pullup.

See above.

-michael

>> The correct fix would be to the information about the missing IO state 
>> in
>> the "struct spi_mem_op". That is, what should be the default values of 
>> all
>> the IO lines which are unused. For example if we have a 1s1s4s
>> transaction, what should be the state of IO0,
>> IO2 and IO3 during the command and address phase. If we have a 1s2s2s,
>> what should be the state of IO0 during the command phase etc.
>> 
>> That can then be used within your driver to set the corresponding IOFV
>> values (for each spi-mem op).
>> 
>> But I'm not sure if other SPI controllers will support that, though.
> 
> Currently driving SoC IOFV register, it fixes the issue and it is just 
> one time
> operation during post sfdp. I take this as a SoC feature which other 
> controllers
> don't have.
> 
> Cheers,
> Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
