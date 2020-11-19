Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941DBC2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DB7246B0
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAQjaZQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0DB7246B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/qZHl2TCMj11X0lRnqbkFNjj1/ZiVJXoa6+Myv/sFp0=; b=JAQjaZQKHjKtpNf4cytq0BVhY
	AmHEkxywQV4/t7aXoPg2IfsGkAws647UlAmbLJwsPvxcU43ewNTDN6XWlGq4ILmsJpQyTcydZfbS/
	LnO/jHTw3dOF+fNgcF21/SYu7Bsas9CGysKvmV+ypLGwN7Suc9sKWwVjwNbHjzbzvoNXk0d9N+Wjr
	p/OjKGJE+wM2Vzl7JHb7GQ3AKmToSms+dm0rdOQnKOQN0omisifdK4FhCAjCVBHXSIfIuVW5HGLbD
	AvC/vmjr/gYhNbPVkxalSEPvo5qsqILrwFBwcRgQSA6+O0h7UVpHu4eUMrn9b6Ndth1jCZ1p3dL/C
	Di4nfJxvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffFe-0006GF-2u; Thu, 19 Nov 2020 08:25:10 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffFb-0006Fh-Ib
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:25:08 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FC9DAD2F;
 Thu, 19 Nov 2020 08:25:06 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C74001E1303; Thu, 19 Nov 2020 09:25:05 +0100 (CET)
Date: Thu, 19 Nov 2020 09:25:05 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201119082505.GS1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-8-hch@lst.de>
 <20201118143747.GL1981@quack2.suse.cz>
 <20201119075225.GA15815@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119075225.GA15815@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_032507_814045_473617B4 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 19-11-20 08:52:25, Christoph Hellwig wrote:
> On Wed, Nov 18, 2020 at 03:37:47PM +0100, Jan Kara wrote:
> > > -static inline dev_t blk_lookup_devt(const char *name, int partno)
> > > -{
> > > -	dev_t devt = MKDEV(0, 0);
> > > -	return devt;
> > > -}
> > >  #endif /* CONFIG_BLOCK */
> > 
> > This hunk looks unrelated to the change? Also why you move the declaration
> > outside the CONFIG_BLOCK ifdef? AFAICS blk_lookup_devt() still exists only
> > when CONFIG_BLOCK is defined? Otherwise the patch looks good to me.
> 
> blk_lookup_devt is a hack only for name_to_dev_t only referenced from
> code under CONFIG_BLOCK now, as it didn't do anything before when
> blk_lookup_devt returned 0.  I guess I'll need to update the commit log
> a little to mention this.

OK, understood. Still it would seem more logical to leave blk_lookup_devt()
declaration inside #ifdef CONFIG_BLOCK and just delete the !CONFIG_BLOCK
definition (to make it clear we ever expect only users compiled when
CONFIG_BLOCK is defined). But whatever... Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
