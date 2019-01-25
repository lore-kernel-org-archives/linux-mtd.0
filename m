Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DA3C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 16:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2624218CD
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 16:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GetgHWcz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMGaP0a3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2624218CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POjPhvP+AElcpOjpqf2kc0UADYBtsBtgQSXzGcT/Z90=; b=GetgHWczWsX3aZ
	aALWBa7PA/Aw/n1HW6wJlNn4wx/iVA5WoWjETLz6s3JuUsmj3GzfscTI1nhmHMOBKCt5S2dbYGvre
	ITWSb4MsqAQiFvWNacmKVneRKnZIWngf86iTas2YbOPbT3MhkWCHca5WMN12J8+mROGqBzrwytbop
	7X34LRnDGWTRpdlKCflWVty7LV3CHvavisByVu5KuaEqtvw47PzVde9ElQ/E40NO8ygW3beM91Ken
	ROp+pus3loOqwdlUUn7dQYdPK+KVHaPUUPRaBhjT6rqj3T03J9tg7h0MFN6yDIkVW4fYBGHZWZOnG
	C8Q1o+YYsxk5dP/jXJYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn42S-0003aA-8I; Fri, 25 Jan 2019 16:09:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn42P-0003ZW-AI
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 16:09:03 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 309C4218CD;
 Fri, 25 Jan 2019 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548432539;
 bh=4AYDE7Q2U9ps69hXCAJLNw6MCXL2nRTllN7Qw+k29lg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jMGaP0a3FAsVLj+hLoLaI2P7etfN5qBcdL5ce3O0cElCu79jQiKr99Ay27IsZkjTc
 7gNBSJnvtutqwcUdWkVrO4c2+hGWfXe76Jxiu4zxoRJMqg/YSyy3cDJj/7limPuqMd
 9itZpbKDTVLBF9VclHUG2OkcFv4PKsHhtz3ljLrA=
Date: Fri, 25 Jan 2019 17:08:51 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does
 not reset the cache
Message-ID: <20190125170851.3d918da5@bbrezillon>
In-Reply-To: <20190125120910.59c33a4b@xps13>
References: <20190124142007.11607-1-bbrezillon@kernel.org>
 <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
 <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
 <20190124173357.2a4d7f13@bbrezillon>
 <20190125120910.59c33a4b@xps13>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_080901_376444_673A7EAC 
X-CRM114-Status: GOOD (  18.77  )
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
 Emil Lenngren <emil.lenngren@gmail.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Jan 2019 12:09:10 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
> 
> Boris Brezillon <bbrezillon@kernel.org> wrote on Thu, 24 Jan 2019
> 17:33:57 +0100:
> 
> > On Thu, 24 Jan 2019 17:16:37 +0100
> > Emil Lenngren <emil.lenngren@gmail.com> wrote:
> >   
> > > Hi,
> > > 
> > > Den tors 24 jan. 2019 kl 16:28 skrev Stefan Roese <sr@denx.de>:    
> > > >
> > > > On 24.01.19 15:20, Boris Brezillon wrote:      
> > > > > Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
> > > > > the cache content to 0xFF (depends on vendor implementation), so we
> > > > > must fill the page cache entirely even if we only want to program the
> > > > > data portion of the page, otherwise we might corrupt the BBM or user
> > > > > data previously programmed in OOB area.
> > > > >
> > > > > Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> > > > > Reported-by: Stefan Roese <sr@denx.de>
> > > > > Cc: <stable@vger.kernel.org>
> > > > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>      
> > > >
> > > > Works fine (limited testing only yet), so:
> > > >
> > > > Tested-by: Stefan Roese <sr@denx.de>
> > > > Reviewed-by: Stefan Roese <sr@denx.de>
> > > >
> > > > Thanks,
> > > > Stefan
> > > >      
> > > 
> > > Can this quirk be made vendor specific?    
> > 
> > We can make it vendor specific, as long as it's an opt-in thing. This
> > way, the default behavior is the safest one, and only when we know a
> > chip does reset the cache content on a PROGRAM LOAD time can we add this
> > flag.  
> 
> I am fine with this approach.

Does that stand for a Reviewed-by/Acked-by? To make it clear, I was
saying that we should fix things first (with this fix) and only then
optimize things for chips that actually reset the cache when PROGRAM
LOAD is executed. I was not planning on sending a new version of this
patch, unless you see good reasons to do so.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
