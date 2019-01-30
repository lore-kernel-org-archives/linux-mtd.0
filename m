Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608E3C282D8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 15:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A61218AE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 15:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gedeRwhp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zJa+P08V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A61218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEEKuWtMJshtUHANCJUTTumsFSsicQqmTjCxberKLYY=; b=gedeRwhp9WSgQm
	dVC+QljIvFTM73XZqlAlX5lHFlmWHcYw0W24LVqmJgJw2QzEQHfbtDN59Yq21MzJaObzwOfImlKnM
	+dcNwVSUCkbZSTdVndil2eqCWO61xdcdlFmFxERnPIDMZ5dfdAoHDUumvpDWUgoGGFgExQGEXK9aP
	YTSp+Kth0zP9o8FrTkezf5oO5q50GNQLJW6Wo8+mWrSUehVarKbepDKBVkXdhLOJSsZA6ySNg5V4z
	T8LsPOwJ/CmmIS2jLzfSJ/WUSkmEblBnYkA/TYxAiY0X/XEmIjWDl4O1EYYOePwM9LCAkLKYf7jg1
	NjvOtL10u8/B4QnfGTMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gorkJ-0001ml-JU; Wed, 30 Jan 2019 15:25:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gorTu-0006r0-3P
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 15:09:01 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A6F720989;
 Wed, 30 Jan 2019 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548860929;
 bh=7tSXuv1G3q0TZTT11mY3TM9600zhP/Lt29G6XlH6Kvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zJa+P08V6zahu54Z+HGd75lTdIj/T+74SYRgRGPlnEWi6yJXfEbdzChLO00T4VR5j
 GrnCi/uWar3GTTSFFbEhKAOKmjZ1mxcmpjzcVOobcDZJZztW9eWlzzw+sloSxNCZj6
 Y9U/CZj6ahHYenu5hXpbzPDKnnWTWHEQUnkIsdtw=
Date: Wed, 30 Jan 2019 16:08:39 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
Message-ID: <20190130160839.55f99e63@bbrezillon>
In-Reply-To: <20190130145054.GA990@kroah.com>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
 <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
 <20190130145054.GA990@kroah.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_070850_361768_A0E85E4D 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Greg,

On Wed, 30 Jan 2019 15:50:54 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Jan 29, 2019 at 08:02:37PM +0100, Geert Uytterhoeven wrote:
> > Hi Boris,
> > 
> > On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > Did you consider converting this driver to spimem? Looks like the
> > > protocol used to communicate with the memory resembles the one used on
> > > SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.
> > >
> > > By doing this conversion you'd allow people to connect an AT25 EEPROM
> > > to an advanced SPI controller that does not support regular SPI
> > > transfers and you wouldn't have to forge SPI messages manually.
> > >
> > > Here is a patch (only compile tested) doing that. The diffstat is not in
> > > favor of this conversion, but I find the resulting code cleaner and more
> > > future proof.  
> > 
> > Thanks, seems to work fine, with the 512-byte 25LC040 I have!
> > 
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > I did notice that the first two-byte transfer (command+offset) of each
> > message is now split in two one-byte transfers, though.  
> 
> Ok, I'll drop this patch series and wait for the updated version to be
> sent out :)

I'd like to further simplify the patch by using the recently introduced
devm_spi_mem_dirmap_create() function (queued to Mark's spi/for-5.1
branch), which means I'll have to wait v5.1-rc1 before sending a new
version. I'll let you decide if it's worth applying Geert's patches in
the meantime.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
