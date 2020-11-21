Return-Path: <SRS0=xNak=E3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C48CC388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:13:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42253217A0
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x11cAwC4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pGx8zMSj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42253217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=znUtWx/00cu2nGpP6WG0jyU6rA1I+ndpbLa8W1A3CYQ=; b=x11cAwC41BPCgHTQzpXktLD3w
	AC6c5qX8DUpq6DdoR7og88sgpbEUfSJ3VAggD+8pA35d+1c8vgQuFnhwcNaQ2gv6hncvcpoxuZgUi
	tR0Y9oUdPFdAnSswGWQlcYf1OAOt/OKQyQ0BacPiWLQvXj5viiP04MVwA5hwsA5YHXK+Yq6NjVqsg
	qLM9CtuCj1eU8LdQbTBUxSMCCXJlOgRko+9igDEpinCp5so06XU6rb3wXV5oAHhp1pbm5QwHA4/pU
	nw2Lp7XD1ydRTJZiUEb8BKRbRjYQ6fLlP3ZLfZPcxnowqqL0Ch7CFRvDIBidoB0bfDR1axJwoAdQr
	L2fhaa8Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgc3M-0007zD-8f; Sat, 21 Nov 2020 23:12:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgc3C-0007x7-Nj
 for linux-mtd@merlin.infradead.org; Sat, 21 Nov 2020 23:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WxEoaLD4KxXy4hYyuj+02iCTv0K0pSQLkqPe94yBbac=; b=pGx8zMSjlrF1NMZS+unTIykJwB
 VhFMd7qu2rsN5xwrBo3B1AJuyCM7wYC/upLuG96grtvnMj4nk6t4KyInmMU9ldXhwQxS94UCMMAEu
 657+dWcAg1uDmW3Oa0ptNWTNZ3TTl4wLiQSkumh08mbtpuA22HLfG15bzaYJ/VBaNwkvrZ4SHaWI0
 HQ+eIXN5omXdry0h8a6ZUaTEm/PPZs8lFwWQ3b7dHL0zPxFK0wAjzffujrskkDB4fI60cErQ1FyfQ
 I38ROfh0g6b/LGSFmdYV/jq/vi2Gqd9Xa8unAuNy4VFLmSuaf7KDzf5KS36JB6T4UHxj0u9QgK8Dk
 Vh0UOtYw==;
Received: from verein.lst.de ([213.95.11.211])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgVgQ-0001aD-IL
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2020 16:24:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 951F467373; Sat, 21 Nov 2020 17:24:11 +0100 (CET)
Date: Sat, 21 Nov 2020 17:24:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201121162411.GA18475@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz>
 <20201120153253.GA18990@lst.de> <20201120155956.GB4327@casper.infradead.org>
 <20201120200548.GA27360@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120200548.GA27360@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_162418_856352_945EF6A9 
X-CRM114-Status: GOOD (  18.48  )
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
 Matthew Wilcox <willy@infradead.org>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 09:05:48PM +0100, Jan Kara wrote:
> The code is already switched to it AFAICT (the lock is really only used in
> the two places that write i_size). But the problem is that in theory two
> i_size_write() calls can race in a way that the resulting stored i_size is a
> mix of two stored sizes. Now I have hard time imagining how this could
> happen for a block device and if two reconfigurations of a block device
> could race like that we'd have a large problems anyway...

Now that you mention it, yes - i_size_write needs to be under i_rwsem
or an equivalent lock.  We could look into using i_rwsem also for block
device, but for now the spinlock seems to be doing fine.  Note that
in current mainline we only have such a lock protecting i_size of the
block_device inode, but none for the size in hd_struct.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
