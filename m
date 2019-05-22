Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5ADC072A4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 06:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0A021019
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 06:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7UpURNd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0A021019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pN1gBi6BZNVmxwffA0xs2zcNmUuUQwaqjV236wYELRA=; b=n7UpURNdL+A1Hro4fLX/BpI9k
	bz6lzWk6UewK9q75HUKO3o2z2R9pUugwpCw3y3aF5qc0aj/xVkwuSzWX6pHkBYw111hJ6TB1hoWCA
	iAszM8kCIqiYeQ1Pkoi2JbimhaaYnNg0pNHm66NbhdBrmBm8nf2qH/qZSR1BeLIH4e10uOIAv0wDw
	EC78NMih5mrSlmuZtLDhyXwedxItX5fHU2Bd9TwsWfBHmswvdgZ8sISoYuv9OUsFz8XLvJ3k2cqhd
	q4JXiEKDMC3NiJ4M3WCrZhkFa8UmVjd0VZEJi84t+rFIHoKZrM/qq2McbBcJEQbbfqC2RYUIcaaBk
	BGnjJ3LNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTKKA-00049V-A2; Wed, 22 May 2019 06:02:02 +0000
Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTKK5-00048s-Qw
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 06:02:01 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 88021516CC;
 Wed, 22 May 2019 08:01:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id gLwQp6ocrRCj; Wed, 22 May 2019 08:01:27 +0200 (CEST)
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: dynamically determine the max
 sectors
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20190522000628.13073-1-chris.packham@alliedtelesis.co.nz>
From: Stefan Roese <sr@denx.de>
Message-ID: <e4fb784f-ea00-6281-409c-d440ce13eb50@denx.de>
Date: Wed, 22 May 2019 08:01:26 +0200
MIME-Version: 1.0
In-Reply-To: <20190522000628.13073-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_230158_026130_50A207FD 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22.05.19 02:06, Chris Packham wrote:
> Because PPB unlocking unlocks the whole chip cfi_ppb_unlock() needs to
> remember the locked status for each sector so it can re-lock the
> unaddressed sectors. Dynamically calculate the maximum number of sectors
> rather than using a hardcoded value that is too small for larger chips.
> 
> Tested with Spansion S29GL01GS11TFI flash device.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

This hardcoded limit always annoyed me at that time, so thanks for
"fixing" this:

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
