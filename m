Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD48C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 15:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248B560C49
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 15:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 248B560C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioQj+gDOBcCiFY7RHhzrpiWDsStya4EY5AlquUC4cjA=; b=niBqrGvNBSw+5f
	PBGJxWwIc4zGGKiS3u0bQhDhbs19AXQsUEr0Nk3IA83G5h2RmBLyLjYkSDT2OMcHDtbNOgtxaOQVl
	tV3MQMYWvHcmZT624q0hing4vqHMXjlL6HEp87+Op1OQBtbC3xStjwwiw3cFcIi3fDBXsLf8Ip9O5
	bINPhNFV14pLK5yJicvvKrNt+8zwX4yBiZneu5gsMcfbSXNS4VxgLJQrCiGpax05paPcSAfnyA8Ln
	vJlO3ORoD3Bvbk2Z8zbT04q4arOsB3HFJI3f5DtqZ/tWgQY0ymV5pJ69osvJQQ9rduyllZgopPYyn
	cpPDijjoBoLrcOFiisRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2Mx-00GwiH-R8; Mon, 25 Oct 2021 15:58:39 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mf2Mu-00GwhK-7N; Mon, 25 Oct 2021 15:58:36 +0000
Date: Mon, 25 Oct 2021 08:58:36 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: axboe@kernel.dk, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, jim@jtan.com, minchan@kernel.org,
 ngupta@vflare.org, senozhatsky@chromium.org, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] block: add_disk() error handling stragglers
Message-ID: <YXbULG63hZcBdoQD@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
 <YW2duaTqf3qUbTIm@bombadil.infradead.org>
 <24bc86d0-9d8d-8c8a-7f74-a87f9089342b@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24bc86d0-9d8d-8c8a-7f74-a87f9089342b@infradead.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 21, 2021 at 08:10:49PM -0700, Geoff Levand wrote:
> Hi Luis,
> 
> On 10/18/21 9:15 AM, Luis Chamberlain wrote:
> > On Sun, Oct 17, 2021 at 08:26:33AM -0700, Geoff Levand wrote:
> >> Hi Luis,
> >>
> >> On 10/15/21 4:52 PM, Luis Chamberlain wrote:
> >>> This patch set consists of al the straggler drivers for which we have
> >>> have no patch reviews done for yet. I'd like to ask for folks to please
> >>> consider chiming in, specially if you're the maintainer for the driver.
> >>> Additionally if you can specify if you'll take the patch in yourself or
> >>> if you want Jens to take it, that'd be great too.
> >>
> >> Do you have a git repo with the patch set applied that I can use to test with?
> > 
> > Sure, although the second to last patch is in a state of flux given
> > the ataflop driver currently is broken and so we're seeing how to fix
> > that first:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211011-for-axboe-add-disk-error-handling
> 
> That branch has so many changes applied on top of the base v5.15-rc4
> that the patches I need to apply to test on PS3 with don't apply.
> 
> Do you have something closer to say v5.15-rc5?  Preferred would be
> just your add_disk() error handling patches plus what they depend
> on.

If you just want to test the ps3 changes, I've put this branch together
just for yo, its based on v5.15-rc6:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20211025-ps3-add-disk

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
