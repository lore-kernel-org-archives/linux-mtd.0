Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0429DC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 16:26:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E60C24818
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 16:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfhsTDB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E60C24818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LIDzy+6fvdfYdqIC9AejqsbjzmvnKpRuqa70M+jjCmk=; b=OfhsTDB00OREZDu/rbRF8ki9O
	VqfcwBtYgwec9Q8j+O1eztZP7PugMFceiS2fKl8CXvlf+BmarjKGyMs41J/jHj2PNrTToSmQ4hSno
	nA7KA+6YND14mKH7CJD9zzS5fo13QYUApZCasXmMPCBAQ0D7OGx7xHoSAVOHppVkKOBYfnrbuDEtg
	7723ylO5FazCReXwOq8aw4pnKJQz2wPuU7M00znnpvlXXzzLrfmeD+hrynLGChw4jtJRaHM6Syq/9
	6vD0R3sDbGu9DoKcltFB82wEA01ghjQG15iVTV/UcC5kDSSdhlSJWzIf84EnrgY7g+bO85/HXDy+F
	cq37ArAyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfQGK-000291-Qc; Wed, 18 Nov 2020 16:24:52 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfQGI-00028b-NM
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 16:24:51 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E61A068B05; Wed, 18 Nov 2020 17:24:48 +0100 (CET)
Date: Wed, 18 Nov 2020 17:24:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Subject: Re: [PATCH 19/20] bcache: remove a superflous lookup_bdev all
Message-ID: <20201118162447.GB16753@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-20-hch@lst.de>
 <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_112450_882563_796E04D9 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 04:54:51PM +0800, Coly Li wrote:
> On 11/18/20 4:47 PM, Christoph Hellwig wrote:
> > Don't bother to call lookup_bdev for just a slightly different error
> > message without any functional change.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>ist
> 
> Hi Christoph,
> 
> NACK. This removing error message is frequently triggered and observed,
> and distinct a busy device and an already registered device is important
> (the first one is critical error and second one is not).
> 
> Remove such error message will be a functional regression.

I can probably keep it, the amount of code to prettiefy an error message
seems excessive, though.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
