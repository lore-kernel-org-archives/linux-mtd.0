Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC455C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:43:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA9E60E05
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AA9E60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN4XUvuDwEZ5BaGVQnYF8K96hW75B1ilbFrOS18j5/4=; b=aaoWcVralqb6K2
	XGNjdIzSIVWrB5+tCqh3MX/xaGw9o7keC3HMwHRHg29sTm3gpnpMud421HTWQSRbg4JW5NoP90irV
	U59hFsc//DA0whUoByob1Uvlcl6UimL+MimoxhJJceXLm1u2p1ulXEC643CPHldKTCjIBxuV1Mzj4
	BfQD3LebpHVJQUZxQD0WXxeVSmPPvCHKV5AOKIgikwt0ld6uVeIDekhiLvw4+HWeQhceo/HnuaOos
	38nDDRYVCBFKTJY7F2lKeydvkOZUiT/p70koeefaHr5b74bE4pSbAvvU7Ss+4yU2vCFoHRUcCuuTJ
	qb472Gyo199jfue7oRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdZd-004C1q-Gh; Wed, 27 Oct 2021 07:42:13 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdZb-004C0r-19
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 07:42:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 093C068AFE; Wed, 27 Oct 2021 09:42:08 +0200 (CEST)
Date: Wed, 27 Oct 2021 09:42:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: simplify bdi refcounting
Message-ID: <20211027074207.GA12793@lst.de>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-6-hch@lst.de> <20211022090203.GF1026@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022090203.GF1026@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_004211_255316_1D60FC4A 
X-CRM114-Status: GOOD (  22.87  )
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

On Fri, Oct 22, 2021 at 11:02:03AM +0200, Jan Kara wrote:
> On Thu 21-10-21 14:44:41, Christoph Hellwig wrote:
> > Move grabbing and releasing the bdi refcount out of the common
> > wb_init/wb_exit helpers into code that is only used for the non-default
> > memcg driven bdi_writeback structures.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Can we perhaps add a comment to struct bdi_writeback definition (or maybe
> wb_init()?) mentioning that it holds a reference to 'bdi' if it is
> bdi_writeback struct for a cgroup? I don't see it mentioned anywhere and
> now that you've changed the code, it isn't that obvious from the code
> either... Otherwise the patch looks good so feel free to add:

Like this?

diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
index 33207004cfded..a3d7dd1cc30a1 100644
--- a/include/linux/backing-dev-defs.h
+++ b/include/linux/backing-dev-defs.h
@@ -103,6 +103,9 @@ struct wb_completion {
  * change as blkcg is disabled and enabled higher up in the hierarchy, a wb
  * is tested for blkcg after lookup and removed from index on mismatch so
  * that a new wb for the combination can be created.
+ *
+ * Each bdi_writeback that is no embedded into the backing_dev_info must hold
+ * a reference to the parent backing_dev_info.  See cgwb_create() for details.
  */
 struct bdi_writeback {
 	struct backing_dev_info *bdi;	/* our parent bdi */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
