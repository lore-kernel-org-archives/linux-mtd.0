Return-Path: <SRS0=Otrq=PG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37348C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 16:17:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F308660EB4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Oct 2021 16:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F308660EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpBDPQubOLp15xBJ+TLloKfoiUUeMQThkalcO2zb5Og=; b=jKxsY6TUsWQuBh
	s5nZMjvMvvJXlQEX9Ti/tgkRkD8DIdmJ7Fs1DgTMcz/swwy5zjnNa44QrTw2DD2aGSPueXKKG6FJm
	+2OJUNVKCVCUxD28tZPlxmlxXFoWJOu6fweDG3hcp0EHmUaWGGg6GZ0ytGpgmDsGGQnVJi3Mb+4qT
	29e4WHs0Uk7+2hUWg9qShjFMwecJ6nxhcg98xZyL6/p/E4PS1/ofpcPe5Blj7FfO4kIwXxmMwW9YD
	5KoAlTCqje8sO4GJ+Ce3h8E1juPELSOXwitRjwNbsYxS4PjsqB9N1zfUt9ho5yPaw6M0LfH5izaoH
	qnGCXngTbXCyjqqqfQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVIw-00GTpA-2H; Mon, 18 Oct 2021 16:16:02 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mcVIn-00GToq-Uz; Mon, 18 Oct 2021 16:15:53 +0000
Date: Mon, 18 Oct 2021 09:15:53 -0700
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
Message-ID: <YW2duaTqf3qUbTIm@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
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

On Sun, Oct 17, 2021 at 08:26:33AM -0700, Geoff Levand wrote:
> Hi Luis,
> 
> On 10/15/21 4:52 PM, Luis Chamberlain wrote:
> > This patch set consists of al the straggler drivers for which we have
> > have no patch reviews done for yet. I'd like to ask for folks to please
> > consider chiming in, specially if you're the maintainer for the driver.
> > Additionally if you can specify if you'll take the patch in yourself or
> > if you want Jens to take it, that'd be great too.
> 
> Do you have a git repo with the patch set applied that I can use to test with?

Sure, although the second to last patch is in a state of flux given
the ataflop driver currently is broken and so we're seeing how to fix
that first:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211011-for-axboe-add-disk-error-handling

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
