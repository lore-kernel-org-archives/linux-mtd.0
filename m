Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C77AC2F3A6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 12:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6FD20861
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 12:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ad6V9/P3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrE+GK6t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6FD20861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWRbqO4gfklT0ZO2TnztT/E/DMBwAg6Ve4HG5nb7T0s=; b=Ad6V9/P3qNekl/
	MqPce6E4rqvyJrDX9TP4t0fpyeT26J5OzJpgM6SGiikaIt/5fDdjJ+ncdz1BvooQp87Niyira36sk
	VMt0v6vs3F5M4lLplVEzE3xBZvTAncWxTy1c3fIrdizR0owSriJ5rivYQhJyT86j3WPM7t9aOTZSO
	ifnOJ+s3tF/7hx30zBS52ezSZVQvYveqk0aDfvX1dXttV8mtwbGqcEA4Z2xf32IHjf0A/j9taI0Wc
	kusTxn5Uh7VWskiF6rPlQN7U1h4C6By7nnZDKkufNvmt3V55qQ1mYVu4jGY1QQI9Qqik69vKPgKKJ
	XJ8TQ++CCbOi9tAsLtTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glYwQ-0006ba-8x; Mon, 21 Jan 2019 12:44:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glYwM-0006ad-SI
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 12:44:37 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5CD62085A;
 Mon, 21 Jan 2019 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548074673;
 bh=7P1LlYlCrBTvkwD909s74ARuzLFAWWg40f3d7uIwRgg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DrE+GK6tsoXemzdIFesaHxpdRcJUkKhSJmeDsa3WbtlEeWWO3fK06nj6urfkg45Vk
 9AVH2U57GiUv6ax2UHWAE4TWpa9sWEAm6pcVfvRsV0kAcxobWIw2tEWNOjanXLmZuX
 Yojz7EuS0NQn53sQaqWrfzBEPU2mnUVbOiCrUP3I=
Date: Mon, 21 Jan 2019 13:44:23 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190121134423.6c1765a3@bbrezillon>
In-Reply-To: <BYAPR08MB4533ADDA97A62DF732E565B1DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118233943.5f003eef@bbrezillon>
 <BYAPR08MB4533ADDA97A62DF732E565B1DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_044435_177098_34314D1D 
X-CRM114-Status: GOOD (  23.82  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jan 2019 12:28:17 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> 
> >> +
> >> +	 /* Only for legacy planar 2D parallels NAND. */
> >> +	if ((mtd->type != MTD_NANDFLASH) || (chip->bits_per_cell != 1))
> >> +		return 0;  
> >
> >Are you implying that all your SLC chips are impacted by this issue, really?
> >  
> 
> In principle, all SLC NAND devices can show a sensitivity of the erase operation 
> to block filling prior to erase. On certain devices it is almost undetectable.

Can you point me to docs/papers describing this effect? It's still
something I do not understand so I'd like to have more background on
what this effect is and what makes it more likely to happen on modern
SLC NANDs.
 
> Nonetheless, given the expected improvement in robustness and the negligible impact
> of the patch on performance, we recommend it to be applied to all SLC NAND devices.

Again, the impact will vary greatly depending on how efficient the
controller is WRT to data transfer on the bus, so saying the impact is
negligible is a lie. I do agree on the "reliability is more important
than perf" aspect though.

> This will simplify maintenance and minimize the risk of mistakes with parts requiring
> the patch not getting it.

That's also true.

> 
> >> +
> >> +	data_buf =  kmalloc(mtd->writesize, GFP_KERNEL);
> >> +	if (!data_buf)
> >> +		return -ENOMEM;
> >> +
> >> +	memset(data_buf, 0xFF, mtd->writesize);
> >> +	/*
> >> +	 * pgs[] contains pages need to be checked. We firstly check
> >> +	 * page13,because, for the most of cases, PEB being erased is
> >> +	 * not partially programmed. If page13 contains data, we directly
> >> +	 * return since it is not a partially programmed PEB.  
> >
> >So now you say the minimum amount of written pages is 14 not 15? In your
> >previous patch, the magic number was 15 (and the commit log says 15 too).
> >  
> it is still 15 pages, page0~page14. But it is now odd pages, there will one less odd pages than
> even pages.

Why only odd pages? You did not reply to this question yet, and I
really want to understand why.

> >> +	 */
> >> +
> >> +	char pgs[] = {13, 0, 11, 9, 7, 5, 3};
> >> +	int  c = ARRAY_SIZE(pgs) - 1;
> >> +	int i;
> >> +
> >> +	for (i = 0 ; i <=  c; i++) {
> >> +		ret = nand_read_page_raw(chip, data_buf, 1, page + pgs[i]);
> >> +		if (ret)
> >> +			continue; /* Read error, we just skip it now. */
> >> +		if (check_page_if_emtpy(chip, data_buf) == true) {
> >> +			if (pgs[i] == 0)
> >> +			/* page0 is not programmed. */
> >> +				goto free_buf;
> >> +
> >> +			/* Mark page need to program later */
> >> +			empty_page_mask |= (1 << pgs[i]);
> >> +		} else {
> >> +			if (pgs[i] == LAST_CHECKPU_PAGE)
> >> +			/*
> >> +			 * If page13 is programmed, this block has
> >> +			 * met the requirement of robust erase.
> >> +			 */
> >> +				goto free_buf;
> >> +		}
> >> +	}
> >> +	/* Corrupt page0 and page1, in order to simulate an
> >> +	 * uncompleted eraseing scenario. Just for case of
> >> +	 * power loss hits while below programming. in this
> >> +	 * way, the PEB will be re-erased again.  
> >
> >Looks like the "erase the first 2 pages" thing is here to corrupt UBI's VID and EC
> >headers. Is this really needed? We should definitely not assume the NAND user is
> >UBI, and that's exactly what you're doing here.
> >  
> We must deal with all sorts of power loss, if other NAND based file systems
> Have the same behavior with UBIFS to deal with un-completed erasing.
> This is not just for UBIFS.

I do agree with that, except you're doing exactly the opposite: assuming
UBI is used and corrupting the first 2 pages is enough. That's just
wrong, and it's a typical example of UBI behavior leaking into the lower
layers of the MTD stack. To make it clear, incomplete erase can happen,
and wear-leveling/FS layers should be able to deal with that without
expecting the NAND driver to corrupt the first 2 pages of the block.

> 
> //Bean


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
