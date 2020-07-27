Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E471C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 07:59:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0BC20672
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 07:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHWByKCv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0BC20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CtUPnvlJ5gz4tSHiKejbTPrB388+Brqvko5eqiMaG8Q=; b=SHWByKCvC3qLbyiqHKmw2MlOO
	AjF1ZSCIkSE9w/IlwteKisvgKqmPdPx4/CNOaBSpLTAhWUi7fcpa2r+F+TSDajGsX2398UwOtmDbS
	HKewb4j/XbA3wYXCaAgpmTE+L7+0ZDhJ9uyxTn/cg2tiHNvX3wSKTrs+rpgefCpvwzzdGr53M5fzP
	d8re97UJdaXrmfoVxc3PEe9IsN9MsnKLBCyBRniD3bJPCLjv99eMJ2dSJLuhvFV20qOJ6qOGJVmCi
	YRW8uro21Qm54RIUJmQQ8zUsmoLUOC9DJaPhTOKFsrKGqOsEba8C8/EpZ+xUeswuz9BUKiQQKeC9d
	R4IURpQGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzy1m-000791-KC; Mon, 27 Jul 2020 07:58:30 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzy1k-00077i-C7
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 07:58:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 630C468B05; Mon, 27 Jul 2020 09:58:22 +0200 (CEST)
Date: Mon, 27 Jul 2020 09:58:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH 10/14] bdi: remove BDI_CAP_SYNCHRONOUS_IO
Message-ID: <20200727075822.GA5355@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
 <20200726150333.305527-11-hch@lst.de> <20200726190639.GA560221@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726190639.GA560221@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_035828_540385_8E11D83C 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jul 26, 2020 at 12:06:39PM -0700, Minchan Kim wrote:
> > @@ -528,8 +530,7 @@ static ssize_t backing_dev_store(struct device *dev,
> >  	 * freely but in fact, IO is going on so finally could cause
> >  	 * use-after-free when the IO is really done.
> >  	 */
> > -	zram->disk->queue->backing_dev_info->capabilities &=
> > -			~BDI_CAP_SYNCHRONOUS_IO;
> > +	zram->disk->fops = &zram_wb_devops;
> >  	up_write(&zram->init_lock);
> 
> For zram, regardless of BDI_CAP_SYNCHRONOUS_IO, it have used rw_page
> every time on read/write path. This one with next patch will make zram
> use bio instead of rw_page when it's declared !BDI_CAP_SYNCHRONOUS_IO,
> which introduce regression for performance.

It really should not matter, as the overhead of setting up a bio
is minimal.  It also is only used in the legacy mpage buffered I/O
code outside of the swap code, which has so many performance issues on
its own that even if this made a difference it wouldn't matter.

If you want magic treatment for your zram swap code you really need
to integrate it with the swap code instead of burding the block layer
with all this mess.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
