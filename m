Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2751C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DubMePl23GrlaWqowoFGweii+Iq//A4n6nvlUAiV0Tk=; b=32UxsKFjvqWaP0
	Arnlq13jbEDljvyoWBHBrsEphp9FUhKCSMRvnRs2l+DUxnh290oqjWZd8jmWNwndriuuQQofeQn8f
	FyQiSSm+oe+xP/45t68bs3dSuYkbw8IQLQ/7xzp9m8Aqrbxk9yDShmcIL/K20Ka8YAJ1gYj2s+N2G
	ymYiDDES88/Q24Y79VVdTLtABf6A/ukVfToKe/3bUQBDG54Kez5QexZQjKiETzsmGaupm91pxlgSZ
	g3niRaIn+ZTLikoe9OZxZ2lgbzs+gEExA/VLOZuhI1oZpYD4O7AynpiNKYoEYZrN9XP1DxqJ0R+F9
	qUFV6viGqYvTmD/i6mbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZr5-00000000W1v-25ND;
	Mon, 26 Feb 2024 12:13:11 +0000
Received: from mail.tecon.ru ([82.112.190.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZqm-00000000Vw1-1lya
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 12:13:02 +0000
Date: Mon, 26 Feb 2024 15:11:47 +0300
From: Dmitry Dunaev <dunaev@tecon.ru>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Puya Semiconductor chips driver
Message-ID: <ZdyAA7+OmFcBgOuR@tm38l>
References: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
 <20240226104101.1848855-1-dunaev@tecon.ru>
 <33c0c516-1f5f-4cf5-bd3b-70b61372a53c@linaro.org>
 <ZdxxZb+fbzXv7ZNk@tm38l>
 <cb237d49-6f0b-4f3b-8f84-7b23495a61be@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb237d49-6f0b-4f3b-8f84-7b23495a61be@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_041253_215308_9A5E6D32 
X-CRM114-Status: GOOD (  23.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 26, 2024 at 01:27:35PM +0200, Tudor Ambarus wrote:
> + linux-mtd
> 
> Please do not send private emails on matters that are not private.
> 
> On 26.02.2024 13:09, Dmitry Dunaev wrote:
> > On Mon, Feb 26, 2024 at 12:43:58PM +0200, Tudor Ambarus wrote:
> >>
> >>
> >> On 26.02.2024 12:40, Dmitry Dunaev wrote:
> >>> Add a SPI NOR manufacturer driver for Puya Semiconductor chips
> >>>
> >>> Signed-off-by: Dmitry Dunaev <dunaev@tecon.ru>
> >>> ---
> >>>  drivers/mtd/spi-nor/Makefile |  1 +
> >>>  drivers/mtd/spi-nor/core.c   |  1 +
> >>>  drivers/mtd/spi-nor/core.h   |  1 +
> >>>  drivers/mtd/spi-nor/puya.c   | 64 ++++++++++++++++++++++++++++++++++++
> >>>  4 files changed, 67 insertions(+)
> >>>  create mode 100644 drivers/mtd/spi-nor/puya.c
> >>
> >> what changed in v2? why do you need these entries? Can you rely instead
> >> on SFDP to initialize these flashes?
> > 
> > In first patch I missed core.{c,h} with Puya flashes structures.
> > 
> > And about SFDP on Puya flashes. We try to call DP command on p25q16uc
> 
> what's DP command? SFDP read?

Yes, SFDP (0x5A)

> 
> > flash and got no answer. It may be a bad chip pack or other matter but
> > now we need a manual description for this chips.
> > 
> > If this issue occured only in my case we can skip this patch.
> 
> It's first time I hear about puya semiconductor. Please follow the
> documentation that I've sent in the previous email and dump all the
> required data.

I can't send sfdp data block because I can't get it from my Puya chips.
The datasheets for Puya chips can be found at it's original site https://www.puyasemi.com/h_xilie715.html
but at now there is an error to access to any pdf files on this site. The saved datasheets can be
downloaded from sellers, for example https://datasheet.lcsc.com/lcsc/2304140030_PUYA--P25Q16H-SUH-IR_C559219.pdf


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
