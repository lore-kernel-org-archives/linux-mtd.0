Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A6BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A962610EA
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A962610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ob1G8wNMuT5HUp9fHan77EwBckPMa7e+iM2x4iq8J48=; b=Gq8eJHCIIRU214
	557pNMO8hRh0XDwafsN7hmASkTwDkwQdR0urQSKPztCrx7Dpm7PgHWFc3YbX3hCX8rLry1ITPURHb
	ORZ0fc7ENza3tP0fHX88sBLM8EXV2Mw5EaloXr2X8o8Va7nO66LQlDimHX9gfjbKMOTHZEPk7r4y/
	R2fDT0/7DM6/3qLNFiHsTKLCdv8KrUmHwG8G/sh8QSwIDgMpQ/+dj8VZwnACJwuvoQWHBNK0totVy
	hAckhOnfkz4C5JmOcNey8Pa7qWact9e9tePWmidfgfyVsZJdzg3xQvybsMHlnSamkZEsFnA3Yyk4R
	F00I1T8ZXI0o4HTqwFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miJNg-005ohI-Ku; Wed, 03 Nov 2021 16:44:56 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miJNd-005ogn-8t; Wed, 03 Nov 2021 16:44:53 +0000
Date: Wed, 3 Nov 2021 09:44:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: axboe@kernel.dk, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, efremov@linux.com,
 song@kernel.org, martin.petersen@oracle.com, hare@suse.de,
 jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/13] block: make __register_blkdev() return an error
Message-ID: <YYK8hY/giSBFN8YJ@bombadil.infradead.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-13-mcgrof@kernel.org>
 <20211103160933.GK31562@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103160933.GK31562@lst.de>
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

On Wed, Nov 03, 2021 at 05:09:33PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 03, 2021 at 05:21:56AM -0700, Luis Chamberlain wrote:
> > This makes __register_blkdev() return an error, and also changes the
> > probe() call to return an error as well.
> > 
> > We expand documentation for the probe call to ensure that if the block
> > device already exists we don't return on error on that condition. We do
> > this as otherwise we loose ability to handle concurrent requests if the
> > block device already existed.
> 
> I'm still not really sold on this - if the probe fails no bdev will
> be registered and the lookup will fail.  What is the benefit of
> propagating the exact error here?

Here's the thing, prober call a form of add_disk(), and so do we want
to always ignore the errors on probe? If so we should document why that
is sane then. I think this approach is a bit more sane though.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
