Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FEDC33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B5D217F4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YM/X687A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="QA4SkT+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B5D217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JeR8+Db5+bn1XBeTcYjJg7sLG7Rwp33QFDvqxCZhRaA=; b=YM/X687Afz23r73N0wxOXcK1Q
	qtDMGRVjn91j7uAK0k3nfMqA8LeC29XdD2/RWsPK5nDs4pxXmwAofcDBKZzbReyfMHlSCnrjWPAs5
	RRXacaYR85I2PF8JxNwAhIkx/I0xfMMyhzxg165wsHtiaeLwI2kfn5h2+a+DoorUb8fjlxlWqXoxE
	Ns4SKSB2OK03LGATmdElXCXiT0P0pEydLn6v3wKGD3dzMdUGhqdGFmqql3uR8i4MXeB/+Vagi+mE2
	tQcEssoQrEAnXbhaaVqD9JjkkcK9yNbEVr3HyqRd3ejUNlp65We5muM1GjQLptKqA3oauvZoo1meE
	vGOMhMJdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuXe8-0006Ys-Go; Thu, 23 Jan 2020 08:15:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuXe5-0006YY-Ua
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 08:15:23 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A33B522EEB;
 Thu, 23 Jan 2020 09:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1579767320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFCdWYYyXyOd02T5uZViwXUH5nhLZ6ATOKsclmpVCSk=;
 b=QA4SkT+6ySbjXKL9FAJSy0jK8RhClfMxeUnHobZ5POrHl4ruz9IcmcTDN/hsKvXWqy02rk
 w5AgBnTmlLAp/VewQ7SoSbcwDRJADfYzLXsqE+uebCVc3yvzd0yw3HE/8O0qq/SULDAVQT
 e/hxoUwTBN3efXoCntBGod0JV6zJpEI=
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 09:15:18 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <7004715e639d0d7aadd48ebb82cfaec42e032cec.camel@samsung.com>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
 <0a2c4e9132f7d4f61fd3ce87c5393c65515b937e.camel@samsung.com>
 <1780435.Q0f6Nmcn8h@localhost.localdomain>
 <CGME20200122171949epcas1p207e3296cb8a63135437d2b6380c233e7@epcas1p2.samsung.com>
 <87d1ed5d35cc5cb7addfb60d5dd028c9@walle.cc>
 <7004715e639d0d7aadd48ebb82cfaec42e032cec.camel@samsung.com>
Message-ID: <b5a9cc5b83c1af8afc9ea800bf367220@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: A33B522EEB
X-Spamd-Result: default: False [1.40 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.763];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,huawei.com,gmail.com,ti.com,lists.infradead.org];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_001522_299960_1C11F48A 
X-CRM114-Status: GOOD (  27.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, john.garry@huawei.com, js07.lee@gmail.com,
 vigneshr@ti.com, Tudor.Ambarus@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-01-23 04:59, schrieb Jungseung Lee:
> Hi, Michael
> 
> 2020-01-22 (Wed), 18:14 +0100, Michael Walle:
>> Am 2020-01-22 15:31, schrieb Tudor.Ambarus@microchip.com:
>> > Hi, Jungseung,
>> >
>> > On Wednesday, January 22, 2020 1:42:00 PM EET Jungseung Lee wrote:
>> >
>> > cut
>> >
>> > > > > > +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
>> > > > > > +                                        * BP3 is bit 6 of
>> > > > > > status
>> > > > > > register.
>> > > > > > +                                        * Must be used
>> > > > > > with
>> > > > >
>> > > > > Are we safe to replace SPI_NOR_TB_SR_BIT6 and
>> > > > > SPI_NOR_BP3_SR_BIT6
>> > > > > with a
>> > > > > SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a
>> > > > > SPI_NOR_SR_BP3_BIT6_TB_BIT5, how
>> > > > > is more convenient?
>> > > >
>> > > > Let's think about some flash in which BP0-3 exists in the
>> > > > status
>> > > > register but TB exists in another register.
>> > > > for example, mx25u12835f.
>> 
>> And like the mx25u3232f, but this bit is only OTP programmable! For
>> now,
>> I'd only add support for reading the TB bit to for this kind of
>> flashes,
>> to prevent accidentially program this bit. It would be up to the
>> board
>> manufacturer how to actually set the bit.
>> 
>> Like having a TB_READ_ONLY flag.
>> 
>> Its also some kind of asymmetrical because you can only set it one
>> way,
>> eg. you can OTP the flash to be TB=1. Then you can be sure that the
>> flash
>> will always be TB=1. But OTOH you cannot be sure that a TB=0 flash
>> will
>> always be a TB=0 flash, because you cannot lock that bit.
>> 
>> Any thoughts?
>> 
> 
> Actually, I didn't get the chance to take a look at some flash that has
> TB bit in configuration register. Currently mainline kernel just care
> flashes that has TB bit in SR and SPI_NOR_HAS_TB can be set only such
> flashes(as you could see in comment). It seems neccessary to add
> another functions and flag for mx25u3232f case.
> Is there any flash that has OTP programmable TB bit in SR?

Not that I'm aware of. My intention wasn't to have anything changed in
this patch series regarding these flashes, just to ask if anyone else
has ideas how they would solve the mx25u3232f (or mx25u12835f) case.

-michael

> Tudor and me were saying that there is some flash that has not TB bit
> in *SR* even if it has BP3 bit in SR. So it seems unnecessary to make
> correlated flag like SPI_NOR_SR_TB_BIT6_BP3_BIT5 for convenience.
> 
>> -michael
>> 
>> > > > I haven't tested yet, but according to the datasheet, I think
>> > > > this
>> > > > patch can support 4bit block protection for the flash.
>> > > >
>> > > > In order to embrace the case, how about letting them as It is.
>> > > > Is there any suggestion?
>> >
>> > Ok, this info should go in the commit message, together with
>> > details
>> > about
>> > which flashes were tested.
>> >
>> > I didn't know that the TB bit can be defined in the Configuration
>> > register.
>> > This means that your suggestion with dedicated macros for BP3 and
>> > TB is
>> > fine.
>> >
>> > I looked a bit over your patches, they are in a pretty good shape.
>> > I
>> > saw
>> > something that can be improved on patch 2/3, but I didn't manage
>> > to
>> > finish the
>> > review. Your patches are the first on my TODO list, but now I'm a
>> > bit
>> > busy. I
>> > hope that I'll come with a complete review by the end of the next
>> > week.
>> > I'm
>> > going to do tests on few flashes too, to make sure that BP0-2 was
>> > not
>> > affected.
>> >
>> > In the meantime, maybe Michael or John can review/test your
>> > patches,
>> > they
>> > showed interest in BP0-3 support.
>> >
>> > Cheers,
>> > ta
>> 
>> 
> Thanks,
> Jungseung Lee

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
