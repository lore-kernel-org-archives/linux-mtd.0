Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA67C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 15:34:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FDA922D0A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 15:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w/vFJb89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FDA922D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kxEDPGiR7SCdiPS5ep0Oe2C/TfS6WYV/pDgWiUslnyg=; b=w/vFJb896rfCcfMm9oHb88a0v
	8MsHtgQobmmR7OCeCLq8bhgLfqt5BXx67ZN0JY2W76gwK/SdQnOkC0N4Wrxroiq5QhiW2CB5zCM+u
	saRnnaE4YuXYfBs9IuJGj/zmUqHq17vKmZzc8lZrB43ifpq5i4NrWVbExs/gEU1VJohjWqPhb/XgZ
	eXejnRWSLWOoBeR8HtVBMpP3nLH5PLVUTAjazLJZVbmTWp4vTh1xqckgh/htwBYNJuoy7sZUubi29
	agCm3ulrAtqTdLKo4F1vauRZOCj+Cw9mRQHXlbxAuCyav9XM696Sm1QNZGtPfj8Jf647XxlnmmrYU
	FUvhX2Aow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8Pb-0007ui-Ok; Fri, 20 Nov 2020 15:33:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8PC-0007lz-VM
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 15:33:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id ED47B67373; Fri, 20 Nov 2020 16:32:53 +0100 (CET)
Date: Fri, 20 Nov 2020 16:32:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201120153253.GA18990@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120112121.GB15537@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103259_204540_649882FA 
X-CRM114-Status: GOOD (  12.47  )
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
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > it?
> > 
> > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > rather awkward lock ordering problems.
> 
> OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> on 32-bit it is needed to prevent torn writes to i_size, right?

Exactly.  In theory we could skip it for 64-bit, but as updating the
size isn't a fast path, and struct block_device isn't super size critical
I'd rather keep the same code for 32 vs 64-bit builds.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
