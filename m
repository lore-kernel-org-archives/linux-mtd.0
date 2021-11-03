Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0561BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF2F60EB9
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDF2F60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CFKdkbjqqHltXu39QybmnVMnhb93aCmtBPSjK8E5rA=; b=RIXTHSrmpMmanC
	n9+3+6CFeWbQ1UdoE8sQ+JVjfvy2Hb7H62F5HR2q+zyk8CCHU/CTljz3K29kusVWVJ/0IBNdPv7wQ
	+4ReRVoLIhHrCg6qfTqAaQek/as+PuF8AYNN73LlKn+GkCkaA5O+FJBXLUjHgwwNhdirIAxpNq5xb
	2A3cZhC52Zj88fk1QMLlNffEaNULNrsjR+whkr2Y4pEXcVPiKdgRWQZVve8mBdnMOlDEtTzEiehDo
	WI2EdxLSTSSvJ+dRX2YDmaP5iS4PkZe+4NGVC7SBs/VUKtdCLi4IzK9bTh4gz56PABnp4lpcJe90p
	bZzgPhK5RFnXg9NO8+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKGA-005yY1-UC; Wed, 03 Nov 2021 17:41:14 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKG7-005yXB-2L; Wed, 03 Nov 2021 17:41:11 +0000
Date: Wed, 3 Nov 2021 10:41:11 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, efremov@linux.com,
 song@kernel.org, martin.petersen@oracle.com, hare@suse.de,
 jack@suse.cz, ming.lei@redhat.com, tj@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] block: add_disk() error handling stragglers
Message-ID: <YYLJt8qkHccpTycn@bombadil.infradead.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103122157.1215783-1-mcgrof@kernel.org>
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

On Wed, Nov 03, 2021 at 05:21:44AM -0700, Luis Chamberlain wrote:
> This is the last pending changes to address add_disk() error handling
> completely. Changes on this v2 series:
> 
>   o dropped all patches which folks have said they'd pick up on their
>     own trees or that I already see present on linux-next
>   o rebased onto next-20211103
>   o Added Reviewed-by tag by Dan Williams and addressed his recommended
>     changes.
>   o Re-added the nvdimm/blk changes given Dan Williams was not able to
>     remove the driver in time for v5.16
>   o Added new nvdimm/pmem driver changes, not sure how I missed addressing
>     this before.
>   o Just note that I keep Tetsuo Handa's patch in this series as it is
>     a requirement for the __register_blkdev() changes.

I'll just send a v3 series which collects all reviewed-by tags and with
the updates.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
