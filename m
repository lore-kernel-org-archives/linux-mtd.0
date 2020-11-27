Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE35C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385BB20795
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z15jaNNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385BB20795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YB9MzUV2ChwuOeMIeo847VI7kZA+PdkC/6j4G0msQmc=; b=z15jaNNvce0+9udeSk5ocQSRQ
	ZRDzLMf066W4Tad8MCEhju6Qh7uC87Q0NVVUWW2rev9x77usTmw1EymIkUXtAM7oJpjpm9XwnR5AK
	85FNqn9pD35uloD4qaN/IA24//Xs8JkO4d3lVui1Xk1k3onUVtwhm8VL67XZvnQnmyohiNhjHTeeX
	ASAJIWeP+xpFNRuRnzWHY3bn3MXyPZs1lkyicSeajklFn+jijEOpT3UllAyYnI7Zq54Mpa1K2joCc
	yMNyvejSuBWUW5A2Gnao7ZqeGBfQIK24fbNjlWJkTslONZFJlOC1UZKR6leUkW+AOtDVinJe4qpyc
	GFHlpT7Cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kifnK-00034f-8l; Fri, 27 Nov 2020 15:36:22 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kifnI-00034J-9j
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 15:36:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5CA0168B05; Fri, 27 Nov 2020 16:36:16 +0100 (CET)
Date: Fri, 27 Nov 2020 16:36:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 37/44] block: switch partition lookup to use struct
 block_device
Message-ID: <20201127153615.GA7524@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-38-hch@lst.de> <20201126182219.GC422@quack2.suse.cz>
 <20201127094842.GA15984@lst.de> <20201127124537.GC27162@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127124537.GC27162@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_103620_478550_3739FF5D 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 01:45:37PM +0100, Jan Kara wrote:
> > At this point the hd_struct is already allocated together with the
> > block_device, and thus only freed after the last block_device reference
> > goes away plus the inode freeing RCU grace period.  So the device model
> > ref to part is indeed gone, but that simply does not matter any more.
> 
> Well, but once device model ref to part is gone, we're going to free the
> bdev inode ref as well. Thus there's nothing which pins the bdev containing
> hd_struct?
> 
> But now as I'm thinking about it you later switch the device model reference
> to just pure inode reference and use igrab() which will reliably return
> NULL if the inode is on it's way to be destroyed so probably we are safe in
> the final state.

igrab always succeeds.  But we should switch to a tryget.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
