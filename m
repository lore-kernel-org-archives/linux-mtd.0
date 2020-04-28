Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4BC83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EF6206D6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFfyc5tJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EF6206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmaE7KjHj6z2tEUUNf0zuzzI/deDbTiQwrncI9AoIjs=; b=tFfyc5tJ/1t8Ov
	ofjM4MHvVucOKmdGYOdO/XWC+46gckzI2/NAl8GnhsPH9m22RoCWQU0BokSYFwzh9LIZSBWHR6lSd
	it3PeZz4Ckb6KApkRKS6RHCA4hWy3wpdQv7rQy5t9PPvV8MpYNAjjFpdCRUZ6OHkDOEDcwHbtPwCZ
	UtZNDu4GyWYWtaQaUE0D70xkZVcxozwEHef4viO9Jkh/wNxdXBa47dTBI26XuAGryjwv5iES2rARa
	2i5jN9EVgE8TgM7ADYUA5Th8RODekboWZ572FcxZ7EkqOXZ7Xv5UQf/tRqaMSIJMCCQ0VhwFAc9L2
	Iwe2k5WxeKQvgRHblLCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJp8-00066E-Q5; Tue, 28 Apr 2020 06:34:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJp5-00065K-OH
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:34:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A18127E99E;
 Tue, 28 Apr 2020 07:34:26 +0100 (BST)
Date: Tue, 28 Apr 2020 08:34:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200428083423.4fafd187@collabora.com>
In-Reply-To: <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_233427_917047_4873C352 
X-CRM114-Status: GOOD (  21.39  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, Pratyush Yadav <me@yadavpratyush.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 28 Apr 2020 14:14:31 +0800
masonccyang@mxic.com.tw wrote:

> Hi Pratyush,
> 
> > > On Tue, 21 Apr 2020 14:39:42 +0800
> > > Mason Yang <masonccyang@mxic.com.tw> wrote:
> > >   
> > > > Hello,
> > > > 
> > > > This is repost of patchset from Boris Brezillon's
> > > > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].  
> > > 
> > > I only quickly went through the patches you sent and saying it's a
> > > repost of the RFC is a bit of a lie. You completely ignored the state
> > > tracking I was trying to do to avoid leaving the flash in 8D mode when
> > > suspending/resetting the board, and I think that part is crucial. If I
> > > remember correctly, we already had this discussion so I must say I'm a
> > > bit disappointed.
> > > 
> > > Can you sync with Pratyush? I think his series [1] is better in that   
> it
> > > tries to restore the flash in single-SPI mode before suspend (it's
> > > missing the shutdown case, but that can be easily added I think). Of
> > > course that'd be even better to have proper state tracking at the SPI
> > > NOR level.  
> > 
> > Hi Mason,
> > 
> > I posted a re-roll of my series here [0]. Could you please base your 
> > changes on top of it? Let me know if the series is missing something you   
> 
> > need.
> > 
> > [0]    
> https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/
> 
> 
> Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI profile 
> 1.0,
> and it comply with BFPT DWORD-19, octal mode enable sequences by write CFG 
> Reg2 
> with instruction 0x72. Therefore, I can't apply your patches.
> 
> I quickly went through your patches but can't reply them in each your 
> patches.

Why?!! Aren't you registered to the MTD mailing list? Sorry but having
reviews outside of the original thread is far from ideal. Please find a
way to reply to the original patchset.

> 
> i.e,.
> 1) [v4,03/16] spi: spi-mem: allow specifying a command's extension
> 
> -                                u8 opcode;
> +                                u16 opcode;
> 
> big/little Endian issue, right?

There's no endianness issue since it's SPI controller responsibility to
interpret this field.
 
> why not just u8 ext_opcode;

Because I see the ext_ext_code comimg, and it's also more consistent
with the addr field if we use an u16 and a number of cmd cycles.

> No any impact for exist code and actually only xSPI device use extension 
> command.

And extending the opcode field to an u16 has no impact either.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
