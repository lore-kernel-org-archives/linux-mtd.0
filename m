Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8BCC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BE8610EA
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45BE8610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98zfnnZ+ReJBPoBncJ9p2logHlkLvXTGiSAcN1634dA=; b=C37MLh14ySkmGi
	PoAJyLiBb3dP1dAVbO5kl2tQP8aPP4yOKWlxbkgrha2Klq/4czpNIUZEoMkAGPaTmWDKYD7RBt5zq
	XN48VaN2VbUxePjg5hrEiJCK4p/jJDi5iTN0jIcTtKpdB/lQn8+OnDs8lCmTFOQlMYM9z1rcJTEhu
	uRwDFYGTQ6NgKDGD7fxrlIUFlRZ5El61Hmzzc7gNffPypLcC67H/pPVOadYP+ja8bdGN4bWgk8BUy
	PxPtrIUByvk4DE82pzon1s4iG4OTbWmK1zmin9w1KVYn02zgHVcS2cAxpKhuRXYAkNe0ab4IIlALc
	eKr4bMgWlYVwoOqVr6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miJQG-005pCj-0z; Wed, 03 Nov 2021 16:47:36 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miJQE-005pCH-7O; Wed, 03 Nov 2021 16:47:34 +0000
Date: Wed, 3 Nov 2021 09:47:34 -0700
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
Subject: Re: [PATCH v2 04/13] nvdimm/blk: avoid calling del_gendisk() on
 early failures
Message-ID: <YYK9JtysvnF+xctB@bombadil.infradead.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-5-mcgrof@kernel.org>
 <20211103160547.GD31562@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103160547.GD31562@lst.de>
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

On Wed, Nov 03, 2021 at 05:05:47PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 03, 2021 at 05:21:48AM -0700, Luis Chamberlain wrote:
> > If nd_integrity_init() fails we'd get del_gendisk() called,
> > but that's not correct as we should only call that if we're
> > done with device_add_disk(). Fix this by providing unwinding
> > prior to the devm call being registered and moving the devm
> > registration to the very end.
> > 
> > This should fix calling del_gendisk() if nd_integrity_init()
> > fails. I only spotted this issue through code inspection. It
> > does not fix any real world bug.
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Should this grow a Fixes tag for the commit adding the problem?

Given this driver is going to be removed, do we care? The only
reason I re-added the patch was Dan could not remove the driver
on time.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
