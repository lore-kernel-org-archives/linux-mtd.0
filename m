Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10ECEC07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 12:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF4861CB9
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 12:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF4861CB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhZ7UGS7JYL9vVwna0C8d6ftt+z3Imitswy8uHJ96YM=; b=UYqS47arQnixWxKgsDB74Xf0KY
	occnDnC/bt483j/DqMtr1XN3UdEpkBjipo2LbxQBwWU+ohZscZierX5esSq112FeVQ5jxG5aBOgwg
	NrEXtA9+uw4d+wNDp/FjqUYbv4JNGmX4jfCcxvtATJtvHhAMfJPWFOPaCcFAxK0WCDrfnxt90RkvL
	F4LADDhJUtUtIEKiwJLLEevPhI3VEhNAgwmOqmcpN2Q82fghGz0BmN/Rs9O8rCDl8V12KXoLkdkbF
	CPHUQxi/Qlkwdo+zKGukviiJNVo0MmQcUXNPYvtUayv61p+J55ChwqAlGNLhEympTA54iiowrB+KI
	4y8TFYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m16xG-00Eo1E-5W; Wed, 07 Jul 2021 12:47:06 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m16xC-00Eo0B-VD
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 12:47:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 88DFE22239;
 Wed,  7 Jul 2021 14:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625662020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qo7IrCTVE14UKRC2CdDWYJ11m1JINF0MvvrqxzPwY3E=;
 b=lVB/mAdpyGVqTGaBJKxuwnkrbejg7HMYL5m42dvn0PM708h38NRq+Y5cAj8uCtWVAvSNSE
 ZNCGlm3kVF0pEiZKzOgR8jIPUON85s/Lb+v6vP+DKXUn6IA/Hp1XNYIs33qe3kviv2984L
 B/ZggPZUe6XscBGFd4PN8ZjsED2Y1RM=
MIME-Version: 1.0
Date: Wed, 07 Jul 2021 14:46:59 +0200
From: Michael Walle <michael@walle.cc>
To: MODEL WORK LST <lstfazz@gmail.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd:spi-nor:Update Winbond SPI NOR Flash device ID
In-Reply-To: <CALEtjnoT1BP5OHmf3xGBGV4o-Xc-vfGR8eLzdM5-Udc_ujxokA@mail.gmail.com>
References: <20210707101628.GA27472@pn10-Veriton-X4610>
 <35c2e5faa770e228bd16a2186c8caf78@walle.cc>
 <CALEtjnoT1BP5OHmf3xGBGV4o-Xc-vfGR8eLzdM5-Udc_ujxokA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <59959af0f756109b02fb7c19f88c35d1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_054703_221780_9F70DBDB 
X-CRM114-Status: GOOD (  24.26  )
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

Am 2021-07-07 13:58, schrieb MODEL WORK LST:
> Shame on me, I don't use the plain text to reply.
> Please allow me send again.

Please also avoid top-posting ;)

> It is my first time update patch for Linux, please advise me if I do 
> wrong.

No worries!

> We are testing these device by the NXP evaluation board.

Ok, this should then go into the commit message, too. Usually the SoC 
and
the SPI controller which was used for testing go in there.

> But the running Linux revision for that board is still 4.x. To update
> the latest ID,
> should we prepare the system that can work with latest Linux revision?

Yes that would be preferable, either use spi-nor/next or just linux-next
[1]. There, my patches for dumping/reading the SFDP are already 
integrated.

> For the test process, I was wondering to ask mount the device to UBIFS
> is a good way for test?

It depends what flags or features are you plan to support. Ususually,
reading/writing the raw mtd device will be enough. If you also add 
locking
support, for example, you should also test the locking by using the
mtd-utils.

I'd say testing whole UBIFS is overkill. Bascially you will just make
sure reading and writing is possible. And if the results make sense, eg.
does it actually use Quad I/O or Dual I/O.

Also look at dmesg and see if it is probed correctly.

> For the ID, this time we add new ID that is not include in the 
> flash_info[].
> And we would keep our device who share the same ID have compatible
> with each other.
> Make sure the FW or SW only need to maintain an unique for each 
> density.
> If the same density device have different behavior, Winbond would apply 
> new ID.

Oh I wasn't clear here. FW is not firmware but your 'FW' model. Eg.
the W25Q32FW. In my experience it shared the same id with W25Q32JW,
if I remember correctly.

We do have many problems with vendors sharing the same flash id between
different flash models which then have different features; we have
a hard time distinguish them at runtime because they appear to be
the same by looking at the JEDEC id.

So if you are aware of any other winbond flashes which reuse the
IDs which you are adding below, that would be good to know.

And to make you/Winbond aware that this is not really good and
if possible should be avoided for future chips.

> Or have application note for customer to aware the difference.

The problem is not the difference, but the fact that we cannot
detect it on runtime.

> For the SFDP, I would check how to work and fill the information.

Great. Thanks!

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
