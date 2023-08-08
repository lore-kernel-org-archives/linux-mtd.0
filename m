Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A5CC001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LweYDgFCBbaamvScZfaOw1UdvGbEn8D12IdjhK+OxJU=; b=Vi7STiCnyIZrNGCqZf5lOptuAF
	PK53e52hzeB3X6csEOX34ktcOqLAhVnG8CPRlDVTuZEaqaQlKP1/Z5T28Y6RrI7h4Q4sHeEtCBuVl
	gqH4rcd0pXXUQtNodsODodvQ2QSH+qKF3vOv09vKoro//ywRexpvsUTVQXQpRHYc+xFuHAu5Q3ouP
	l+41lWFSScN8yQ23xONOgx6tJuxGFegzS/uoPpp6I+y5VkHRArKc+gtrS2Vb1280kp/0SQK+DNXZW
	LMavlhMRGNBhMbTI5xHIxLBg/UFEnadALHiXG3+J4dMTZmcckd2rdeU/zGTlb36leODDSDicLeGq8
	TQQQ9+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIBP-00234h-24;
	Tue, 08 Aug 2023 08:35:15 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIBK-00233Z-28
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 08:35:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 906A3128F;
	Tue,  8 Aug 2023 10:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691483708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yM+N6KznAyUY5zReYKkT+GJCc8ytOytippbM/PD2pmg=;
	b=daGoEjUh4ZuQ/dZCA22+sDBpZQlfrW4kCHmEPlp07z9k71EHM36yfKTSnnG2ddginKxAtY
	Q+Ci3sAa8S/D8OqfVkQUjFbSVxyQIxevPBltK/ochHwv5C14RySJ4Q/vBQT4wJvMTM57A3
	DeTHG4/40nHxk7zvHbUo2E5z2u9twCRWHIDPnphbVCO7rImucw/SqQwvcdKy/Yc3/+4bs3
	kjbaZ3QFtsA8BpDN7da3alCy6vOzd0EK6znFCeb8HEFPtWKQV+x/BzLFWTr/TLpFsD6II7
	QFcejmONfneysOLvR8R1wzq/iS14hp1CRUnJNOy/cAulVEllqrI0S1sF/WoO3Q==
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 10:35:08 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <20230808102401.26631155@xps-13>
References: <20230808075001.223150-1-miquel.raynal@bootlin.com>
 <e618ba6c48d67469b9a2c19ee8bb5a1c@walle.cc> <20230808102401.26631155@xps-13>
Message-ID: <b2153d9bc6be2923f38a170afd82ba6f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_013510_851679_4B0B028A 
X-CRM114-Status: GOOD (  27.08  )
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

>> Mhh, this flash has vendor tables. The sst26vf global unlock should
>> be discoverable. There is a table with all supported opcodes, which
>> could be used to see whether this flash needs the global unlock.
> 
> Is this logic already existing in the core?

No unfortunately not.

> Do you have a pointer?

It seems that we'd need to have some kind of parser support for
vendor specific SFPD tables. Then look for the sst25vf family
and the availability of the global unlock command, if both is
satisfied, set the locking ops.

>> I'd like to push as much as possible into auto-discovering
>> features.. after working on that flash db cleanup.
> 
> I understand, but as I said, testing latest versions of the kernel on
> my hardware is not straightforward.
> 
>> > Changes in v3:
>> > * Dropped the second patch (untested changes as advised by Tudor).
>> > * Avoided playing with locking as I cannot test it either: simplified
>> >   the diff by just using the PARSE_SFDP flag.
>> > * Rebased on top of -rc1 and adapted the patch to the current state.
>> >
>> >  drivers/mtd/spi-nor/sst.c | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>> > index 688eb20c763e..414ee4692fd1 100644
>> > --- a/drivers/mtd/spi-nor/sst.c
>> > +++ b/drivers/mtd/spi-nor/sst.c
>> > @@ -111,6 +111,10 @@ static const struct flash_info sst_nor_parts[] = {
>> >  			      SPI_NOR_QUAD_READ) },
>> >  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
>> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>> > +	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
>> > +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> > +		PARSE_SFDP
>> > +		.fixups = &sst26vf_nor_fixups },
>> >  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>> >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> 
>> Honestly, this is such a mess. There are three identical chips:
>> sst26v016b, 032b and 064b and all have different flags :(
> 
> I only have the 32b variant, but I believe they are all identical. The
> FLAGS and fixups fields are missing from the 16b variant in mainline
> but they are all identical in the linux4microchip repository, I believe
> the missing patches have never been upstreamed, that's all.
> 
> And I am now using the PARSE_SFDP flag as advised because it works, but
> initially I wanted to keep the hardcoded flags.

Ah sorry, I was just stating a fact, not criticizing your patch. There
are also other places in the flash_info db with such a mess. But with
the current rule "not to touch anything untested" I guess that is
what we get. Funny enough, vendor trees seem to fix 'em.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
