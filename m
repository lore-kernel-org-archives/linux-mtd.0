Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50012C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB2A61101
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 16:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FB2A61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgWJElCI26v0YpCkvbpbq5Rn0/LFIci3P4Bw/c1KxeE=; b=fZbQuZkni0EscK
	pnm1O8lG7XNcVyFeXlt/xEvXEcRbWB5tCzxCZEWtXie3U3/bXfCz+FVKhO3oLq5tHwOtAA/g6cvd6
	fG/kZaGSFLaefv1nDAG6qSWs+dcTJELE5IR+cZONhMrWO7EXm/HRJi5fyazJCZPffiaVK/6ed4V6k
	9iXhHS5vQ9s0XWCEj3mg7o5IRR7sAOA775OKSQbEVUI6MNXbfQv0Tob/z54pmxp9T21sNLnbmT0/T
	IFQFm15GdIOaYjNnPLbIaAaIXeVa3yXNBH1yFa7pM8McpRTOIjBOmE7JM5KGoNPjnO0jyygOkjagJ
	PiqcSgmY4ZD1U46UvTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miJbD-005spn-1v; Wed, 03 Nov 2021 16:58:55 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miJbA-005son-1Y; Wed, 03 Nov 2021 16:58:52 +0000
Date: Wed, 3 Nov 2021 09:58:52 -0700
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
Subject: Re: [PATCH v2 01/13] nvdimm/btt: do not call del_gendisk() if not
 needed
Message-ID: <YYK/zBcQcuEx5B5j@bombadil.infradead.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
 <20211103122157.1215783-2-mcgrof@kernel.org>
 <20211103160243.GA31562@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103160243.GA31562@lst.de>
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

On Wed, Nov 03, 2021 at 05:02:43PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 03, 2021 at 05:21:45AM -0700, Luis Chamberlain wrote:
> > del_gendisk() is not required if the disk has not been added.
> > On kernels prior to commit 40b3a52ffc5bc3 ("block: add a sanity
> > check for a live disk in del_gendisk") it is mandatory to not
> > call del_gendisk() if the underlying device has not been through
> > device_add().
> 
> And even with the sanity check is it wrong, and will trigger a WARN_ON.
> So maybe this commit log could use a little update?
> 
> With that fixed I think this should go into 5.16 and -stable.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

OK true, the first WARN_ON() was added on v5.11 through commit 6b3ba9762f9f9
("block: cleanup del_gendisk a bit") though, before that, it is still
wrong. Will send a v3 for this patch alone.

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
