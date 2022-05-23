Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44D7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y6ZeqUecsqmTZl5Xk9afOPgHu5xIRovJn7DDUCzEG4=; b=Z1E5VeTKc2KcnwwM3Nm5KXAOHF
	JHOFFlAwSLpPrGarjZ06Mkd19d6C7ild2WtfvVbdghDK+tK/4inRoZ63PWG5ycrQ0iHS2fu3TVNSA
	KTV+h+5nK7+/EhtTI/AAdsmqq27SudyMTT0qJuOskeNyjaWk/f/8T8hA9miJv0oBe0y613fDrdbyl
	rPBN5tq0AqsuB4H8zd6h1RCC7p/bdDADGnGdK+9XhqidI9Hoq12DOrakB0WhCfMLq1OyQIcclJiue
	+qiANXEBRKEwSO0+RwGLQNJxSc6suFBO++i3mt/plhfXhI2b1YrBHUkdD3LajYqj3Ejddv/3WCPYH
	UOCqfjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Ip-002ogN-Cc; Mon, 23 May 2022 09:24:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3TE-002SFd-JX
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 08:31:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4B3AE2223E;
 Mon, 23 May 2022 10:31:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653294676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ly0UmeNynDgNtRQp+orPY0kwugyj6xbwvEBd6Kt/dw8=;
 b=S8m2L8yr2UEIHNSkiZO6wNSyacQ4w1KGb+TFXG8wa4XcLG3owla0hPZQYk/uXETMbN/Bjd
 QE7wXrECymmzPnj6wECr4jlTIF49NbbDS+Nr6bwCHvero0gg6F5hT5tFnbXPwmMa+ab6V2
 BUqomywdACYY1hPUa6Zp2mBK/rkC9+Q=
MIME-Version: 1.0
Date: Mon, 23 May 2022 10:31:13 +0200
From: Michael Walle <michael@walle.cc>
To: Paul Barker <paul.barker@sancloud.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Stuart Rubin <stuart.rubin@trustiphi.com>
Subject: Re: Sending vendor specific commands to spi-nor flash
In-Reply-To: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
References: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <418e465f5156adb340976bac209539f8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_013120_879207_3741C686 
X-CRM114-Status: GOOD (  29.92  )
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

Am 2022-05-18 14:32, schrieb Paul Barker:
> We're looking to add support for sending vendor specific commands to
> Micron Authenta flash devices over the SPI bus.

Please elaborate a bit more on the use case. Is this something specific
to the flash or is it more of a general feature?

> Since we're using the
> MTD block interface to support a filesystem on the SPI flash we need
> to send these vendor specific commands via some sort of IOCTL.
> 
> I can see a couple of ways to achieve this (as follows) and would like
> to get some feedback from the MTD & spi-nor maintainers on which
> approach is preferred:
> 
> 1) Add new IOCTLs to the mtdchar device to support these vendor
> specific operations. An initial set of patches was sent back in
> October 2021 which took this route [1], but no further progress was
> made. The new IOCTLs would exist for all mtdchar devices (regardless
> of vendor) if we go this route and we'd need to ensure -EINVAL or
> -ENOTSUPP is returned as appropriate if these IOCTLs are called on a
> device which does not implement them.
> 
> 2) Add a vendor-specific IOCTL layer to the mtdchar device interface.
> When the mtdchar IOCTL handler is called with a command not defined in
> mtdchar.c, pass the call on to a device-specific IOCTL handler which
> can potentially handle vendor specific commands.
> 
> 3) Add a generic SPI transfer IOCTL for spi-nor MTD devices. This
> would avoid the need to define IOCTLs for every vendor specific
> command supported by SPI flash devices. Instead, knowledge of the
> vendor specific commands would be kept in userspace and the kernel
> would simply provide an API for sending & receiving arbitrary bytes
> over the SPI bus. This is similar to the MMC_IOC_CMD IOCTL supported
> by the MMC driver.
> 
> My preference would be for option (3) since it minimizes the scope of
> the changes we need to make in the kernel. We're not tied to this
> though, so let us know if a different option is preferred.

I'm not sure we should allow a generic "issue anything to the spi
flash". It it is just a one time thing, like for example, program
a password during production, or program non-volatile memory during
production of the board, I'm fine with it. Most probably, calling
that ioctl will also call add_taint(). This will also need to go
with proper userspace util support.

But if it is something for general use, please provide a proper API
and don't write userspace drivers.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
