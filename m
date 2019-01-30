Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144E3C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62AF20882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jsYZAQq1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVHpYx1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62AF20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOQKqEeQFAkACI85qwgg9gx+R4v7uNLIQeC8lOjIdoQ=; b=jsYZAQq1MCSOwS
	0aZFqbRZXtNk3k2vcWomOQZv+oExK3LrQe0JNsEVik26vSMCICm1z6rj70IxlxtUu4ybzefiexOkA
	PAVcTlIDs0Jjwb4qlNzrEcT/vGoe8A1bCk3HJ4lSXfD+KC2/rg5Lz/hhtZALcXX0CsUO667lWFJrs
	9Be/vuQmGa4Js5fIN8W8NZ+OPKHc06vz7iWZ6P2MoJ9myGklXDjS8uhMHSvulXme8Kd1XLeAhyTXE
	7cUSLOzxm1ig+eHiI+Ms/k34TsJ/AOH5foz83d9scDJdyYk+MobgnqMHd7S1ZaWYK9F77vybqvmg8
	5XR+gFV34HEcdYpFA6HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gorCe-0000JR-7Y; Wed, 30 Jan 2019 14:51:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gorCb-0000J6-NI
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 14:50:59 +0000
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CB3E20882;
 Wed, 30 Jan 2019 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548859856;
 bh=I2mNUizMUdF4Sbvr3crwGZ6ivgszvULLCp9Cz/xQt3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVHpYx1rWMkMg/4qFSp7krwrXdeFXBlbvaCVM6GAYzXXBi1/fZv020gzigD74SfKE
 VZulMT1eYvgQM9pR1vLSWU2GuZwkHljEj7t/+ref7cun20BBkB5sm6YYYP3/aaESRK
 TA3YLLGAOGHoWMqNr5QAPp0x2ciVv/XZl7vsjeQ0=
Date: Wed, 30 Jan 2019 15:50:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
Message-ID: <20190130145054.GA990@kroah.com>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
 <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_065057_778371_33A6CBD8 
X-CRM114-Status: GOOD (  16.87  )
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
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 29, 2019 at 08:02:37PM +0100, Geert Uytterhoeven wrote:
> Hi Boris,
> 
> On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > Did you consider converting this driver to spimem? Looks like the
> > protocol used to communicate with the memory resembles the one used on
> > SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.
> >
> > By doing this conversion you'd allow people to connect an AT25 EEPROM
> > to an advanced SPI controller that does not support regular SPI
> > transfers and you wouldn't have to forge SPI messages manually.
> >
> > Here is a patch (only compile tested) doing that. The diffstat is not in
> > favor of this conversion, but I find the resulting code cleaner and more
> > future proof.
> 
> Thanks, seems to work fine, with the 512-byte 25LC040 I have!
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I did notice that the first two-byte transfer (command+offset) of each
> message is now split in two one-byte transfers, though.

Ok, I'll drop this patch series and wait for the updated version to be
sent out :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
