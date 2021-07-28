Return-Path: <SRS0=tD4Y=MU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078D7C432BE
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jul 2021 10:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CCE60F23
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jul 2021 10:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3CCE60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUSp4y/wSKa9w3gyT0bwTsYIDEbLe4eVMQqChfrhP/0=; b=gnM7y1bXcnZkGRTlOd7bIykszs
	YkWouH2D8GiEgWD+cQ3gdi0EIxZCdSRrJuBGOdMQwLMVkLD+8rluEWUXz6OcgKqLQpaC3beoJ85Ps
	SJq9XVhJkLjxonIBWio9MBwHzdt4ldHIm1IZppYRSgDwYAxb/Ppdc6Y2jF5f0Y7kUjzNstuE8zZgS
	3hYfCdqTfmIsC3UzcapYjfO8e4nIFf1j0eS/dVxp6ItW4RnCV3q2mCZdGK6JccOI/o9OKcwsLQj35
	eUtLcsrC3+4Y7pRGEeQYgNcazoMyY+etambPfSqVBsQ+yK35stwopJpMW2GN6vG8aoUK1jvmVzB6l
	aHnNxV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8gML-000J1y-0G; Wed, 28 Jul 2021 10:00:17 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8gME-000IzW-Jf
 for linux-mtd@lists.infradead.org; Wed, 28 Jul 2021 10:00:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2F77822172;
 Wed, 28 Jul 2021 12:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627466408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1GoZExlDzTQpKZA+eG2D88Yx9YFdj8G9GDiUD8vIq0=;
 b=CPaVtWOQXWhptSMQBNQn6zwEqgjJ4u+oO/QSpZ0VsTQz85C+YCdPWXRe7Eg/Sg8SPosAZX
 YS0pfTSLIK2/7A+EkwHGLSjzIZLKbvZ5wTZLSYRNXF6T23BLTGmEAFMUNSLBaYCUt4nEse
 fQzIkaYV7oS7DuKGWP2MDx6EGtFE3iI=
MIME-Version: 1.0
Date: Wed, 28 Jul 2021 12:00:07 +0200
From: Michael Walle <michael@walle.cc>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of mt25ql02g and
 mt25qu02g with other mt25q
In-Reply-To: <42380415413178b18e940ae80298c22c51275b95.camel@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
 <42380415413178b18e940ae80298c22c51275b95.camel@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cebfb4138908d085791c5c2fddca939d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_030010_873601_B86CABFF 
X-CRM114-Status: GOOD (  16.85  )
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

Am 2021-07-27 12:45, schrieb Matthias Schiffer:
> On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
[..]
>> > --- a/drivers/mtd/spi-nor/micron-st.c
>> > +++ b/drivers/mtd/spi-nor/micron-st.c
>> > @@ -181,11 +181,11 @@ static const struct flash_info st_parts[] = {
>> >  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>> >  			      NO_CHIP_ERASE) },
>> >  	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
>> > -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>> > -			      NO_CHIP_ERASE) },
>> 
>> This bothers me. I'm not sure how this will work. I see that
>> chip erase is command 0xc7, but both the new and the old flash
>> just supports 0xc3 (DIE ERASE). Did you test these changes?
> 
> Thanks for catching this. I overlooked that the 1G and 2G variants
> don't support the same erase commands as the smaller versions after
> all... It is possible that I only tested this with partitioned MTD, so
> I didn't hit the whole-chip erase case.
> 
> Which command should I use to test the chip erase? Will a `flash_erase
> /dev/mtdX 0 0` trigger the correct operation?

I guess so. Looking at
http://git.infradead.org/mtd-utils.git/blob/HEAD:/misc-utils/flash_erase.c#l226

It seems you should see a different output for either erasing individual
sectors or the whole chip (as long as the kernel doesn't the invidual
block erase itself).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
