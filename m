Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B07C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643802184C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="duuAl5wl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoIq5GDJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643802184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJitfCQUKxenAqfOsLgXolQBgm6cDZL9JAYsp55qK3I=; b=duuAl5wli1zfhg
	68SUEt85lER5D2hFsv3XfibZ5BiCGRsAIVBOEyvOf/lsAsMveCW0iPozwjHgZhqs8d6sehH8OL0pq
	2m9nD9EU+PDRlTKHHaFLiHHvTOksnvyvAilfto1bIfFfHc/6fnKCr3AN+aoniycKcN+xfYWW2gmwu
	oQ8T0Ftx/uJhM1l/1GseUAYgIad5r6Tu+M60mcBXcisOfmDy2GSf+vtOXoguG1zvvhStcyI+qKmrG
	Hx/St3x92JGelgddjYsild37ua6pGTXj5D9QXOha+v7Y0ULMcY1OIb+W/9SHkb783DUo1m6lv4pfA
	pnHxj44Ebh3V+VLM5SXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhxj-00070h-0M; Thu, 24 Jan 2019 16:34:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhxA-0006iv-3U
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 16:34:28 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C25012184C;
 Thu, 24 Jan 2019 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548347647;
 bh=vFsmyeu7dH9/EfbBoQqHb0ujB0nfWYVh/XmaF0vGOrU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KoIq5GDJWmEAy1d0yXQZOZlWf2i2C+rIVLLr4jEopAbGIW94fFKE/084WHHGO0a4q
 eJzqQv+F6ypDyIF/j8ZucuStHmLNM8B458ukXMOVB2ENGumI+cKWLHcE2sDl4ndV2P
 EyEm4AppfP3Kvccf4ritBLLbdB+4qWfwEDLS1Yes=
Date: Thu, 24 Jan 2019 17:33:57 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does
 not reset the cache
Message-ID: <20190124173357.2a4d7f13@bbrezillon>
In-Reply-To: <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
References: <20190124142007.11607-1-bbrezillon@kernel.org>
 <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
 <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_083409_007732_F64C93A3 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: Stefan Roese <sr@denx.de>, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 17:16:37 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> Hi,
> 
> Den tors 24 jan. 2019 kl 16:28 skrev Stefan Roese <sr@denx.de>:
> >
> > On 24.01.19 15:20, Boris Brezillon wrote:  
> > > Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
> > > the cache content to 0xFF (depends on vendor implementation), so we
> > > must fill the page cache entirely even if we only want to program the
> > > data portion of the page, otherwise we might corrupt the BBM or user
> > > data previously programmed in OOB area.
> > >
> > > Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> > > Reported-by: Stefan Roese <sr@denx.de>
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>  
> >
> > Works fine (limited testing only yet), so:
> >
> > Tested-by: Stefan Roese <sr@denx.de>
> > Reviewed-by: Stefan Roese <sr@denx.de>
> >
> > Thanks,
> > Stefan
> >  
> 
> Can this quirk be made vendor specific?

We can make it vendor specific, as long as it's an opt-in thing. This
way, the default behavior is the safest one, and only when we know a
chip does reset the cache content on a PROGRAM LOAD time can we add this
flag.

> It seems a waste of SPI
> transfer cycles to write 0xff to the whole OOB area when we only want
> to program the data area if the chip doesn't need this quirk.
> For which logic is this needed anyway? According to the GigaDevice
> datasheet, if a Program Load is followed by Program Execute,
> "uninitialized" bytes will be set to 0xff, which is the flow that is
> used by spinand core.

Except you're not guaranteed that the controller can fill the page in a
single spi_mem_exec_op() call (because of FIFO size limitations), so
you might have one PROGRAM LOAD followed by several PROGRAM RANDOM LOAD.
I guess most manufacturers reset the cache content at PROGRAM LOAD
time, but GigaDevice does not.

> 
> /Emil


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
