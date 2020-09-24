Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930E4C4741F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F03023772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDvsDdxs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r2w8hhD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F03023772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JiDkZroF9R98bDB7LlKv/eXGyY/ywMfF1voyj/eCShM=; b=eDvsDdxss5oq0LuCjPrR5Dl+2i
	8DG4Nh9iemSRLaN6ZHmRQ4dP/bYrvkUUo+z8Mgy9lijlm7b35ONdGGdnC7655nyq72ABw9InSH1dL
	hVB4N/2AtUCS2IbPwJgEIwYWP7QWYkfYo6Z/uQnkE2hP+Ivvyvg/ovXRBiDby3drkmlpgUhsAwaJX
	9Z0byjDy7Nx/Pt0Cw0a53trNW7/mNMq4k1H1nphrM5LbQlLBCYp2k41DDVHJUl422OW8942Qi1SoL
	3QnUI3usIgZyIalj4s3UWCWqEAuK/pTV379tRTX54321mCwrUJLYk642A56LR+VDoOcVMDexWFTTn
	rLen7JEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL6Y-0004l0-53; Thu, 24 Sep 2020 06:51:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6W-0004kM-6d
 for linux-mtd@merlin.infradead.org; Thu, 24 Sep 2020 06:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=5cv5XM1WbeIcMKM5m6HEEjDcYpaEJfjGWw9dDjM6nfI=; b=r2w8hhD+ZBoRdDKl0qZXo3vF81
 hM/13MLXzpPkHMHSdkeatYWtW/3Rk3FztSV6U5y+CbAh6t7JHsfTFWVb3fcVheFT1g+IP1CUvdL/M
 qf6RvhVVVcfKzIDmXfduJ5W90Ne2Xmv0UFnYt+mp024P858pnetDNMffHtNWZutPuWI481/Ixizft
 VzlRi+PBja8K/ca/ZHfPdeq8UXLIZ3VY+HnhwsTOu5umASFwHza1/IftOvz3nrDcW8iJ2OvWsxcVr
 FHnaTnZTbgNXfbL0liL+h4MJ2F/DEq8P/XjVxB+RLUSVk0zwY6gebGFkYLAM8tqFMr4ps3to5Wmm/
 AERB55ug==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6T-00019A-6Y; Thu, 24 Sep 2020 06:51:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: bdi cleanups v7
Date: Thu, 24 Sep 2020 08:51:27 +0200
Message-Id: <20200924065140.726436-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jens,

this series contains a bunch of different BDI cleanups.  The biggest item
is to isolate block drivers from the BDI in preparation of changing the
lifetime of the block device BDI in a follow up series.

Changes since v6:
 - add a new blk_queue_update_readahead helper and use it in stacking
   drivers
 - improve another commit log

Changes since v5:
 - improve a commit message
 - improve the stable_writes deprecation printk
 - drop "drbd: remove RB_CONGESTED_REMOTE"
 - drop a few hunks that add a local variable in a otherwise unchanged
   file due to changes in the previous revisions
 - keep updating ->io_pages in queue_max_sectors_store
 - set an optimal I/O size in aoe
 - inherit the optimal I/O size in bcache

Changes since v4:
 - add a back a prematurely removed assignment in dm-table.c
 - pick up a few reviews from Johannes that got lost

Changes since v3:
 - rebased on the lasted block tree, which has some of the prep
   changes merged
 - extend the ->ra_pages changes to ->io_pages
 - move initializing ->ra_pages and ->io_pages for block devices to
   blk_register_queue

Changes since v2:
 - fix a rw_page return value check
 - fix up various changelogs

Changes since v1:
 - rebased to the for-5.9/block-merge branch
 - explicitly set the readahead to 0 for ubifs, vboxsf and mtd
 - split the zram block_device operations
 - let rw_page users fall back to bios in swap_readpage


Diffstat:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
