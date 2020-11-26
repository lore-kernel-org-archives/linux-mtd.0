Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5686C64E7B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA8621D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOC2CnLy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jDdN7hAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA8621D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=El+4dCpyHU33ONSMtCrGb7iZo1r/zpEMG4eyM+IdaX0=; b=rOC2CnLyhviRrYaTkPzYRrEmQW
	uzcONZXmMsWa/ESo1AJdxTk7kcz6/TXsHpbHsJ2Xguu/m0Yb+a9bTIsTc+sDjWL3OtGACx9hHRem9
	rh14zwhsK/OxGJVveV6a/Ml7Q2LBoP/4tLugZIuPls3Nl3L6toPx7cPe09klktmyC2y0Fc8YCr8To
	nV8M3VrP01ofED3SsKlJ0Pzhpnu/XH0A3o+nteZTe331AzU8OlFDHi3FzX7bThPbmThUm8OpB02IM
	suq1cLqCHDnqBccZYGwy1fhBUtAPa9neM9coukZp9MxTpXkz/JPyDMDDUoFVGWoutSF3lO7gBe8Yq
	DpvECQQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGz8-00082m-9B; Thu, 26 Nov 2020 13:06:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyr-00080N-Om
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=0Gv0fe8by51pBpJ9y/s+Bsc/pkGppT00OZEyWHEsCkc=; b=jDdN7hAOVm64LI4GLxtV8Xg4mQ
 Jhk3sYSO6NihDo6ErowuZ0lfW/FXxua0lGjFFXZ7hTshuIG02Qgh+ZtMvse28KRgXFa6YwznZ+zRM
 3SxJO9yOYalt/DOk9qnsxGmaq7Mm9pzMjycc3T8ZVi1jmSl4nMDZlkZJE3sN2+dyKPgpDMwt3zqvb
 SLuGPt5RBvuzIbdy43KrQgJ8FQup0kday2ag+tEAKT+U9PvPIbgh9dCIaX43s80gP5kUo5vBfWj55
 /k2Iy70DlOmB3z37Z9eoOo/XoZR8yNFXm3CeZynj7ahBX+ghuAT/JfcmZJ2vsfJVhk0COVF7tTO+/
 LxGu4YBQ==;
Received: from 089144198196.atnat0007.highway.a1.net ([89.144.198.196]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyo-0003va-9E; Thu, 26 Nov 2020 13:06:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: merge struct block_device and struct hd_struct v3
Date: Thu, 26 Nov 2020 14:03:38 +0100
Message-Id: <20201126130422.92945-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jens,

this series cleans up our main per-device node data structure by merging
the block_device and hd_struct data structures that have the same scope,
but different life times.  The main effect (besides removing lots of
code) is that instead of having two device sizes that need complex
synchronization there is just one now.

Note that this now includes the previous "misc cleanups" series as I had
to fix up a thing in there with the changed patch ordering.

The first patch already is in 5.10-rc, but not in for-5.11/block

A git tree is available here:

    git://git.infradead.org/users/hch/block.git bdev-lookup

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup

Changes since v2:
 - keep a reference to the whole device bdev from each partition bdev
   to simplify blkdev_get
 - drop a stale commen in freeze_bdev
 - fix an incorrect hunk that ignored error in thaw_bdev
 - add back a missing call to mapping_set_gfp_mask
 - misc typo fixes, comment and commit log improvements
 - keep using a global lock to synchronize gendisk lookup
 - do not call ->open for blk-cgroup configuration updates
 - drop a zram cleanup patch

Changes since v1:
 - spelling fixes
 - fix error unwinding in __alloc_disk_node
 - use bdev_is_partition in a few more places
 - don't send the RESIZE=1 uevent for hidden gendisks
 - rename __bdget_disk to disk_find_part
 - drop a bcache patch
 - some patch reordering
 - add more refactoring
 - use rcu protection to prevent racing with a disk going away
   in blkdev_get
 - split up some of the big patches into many small ones
 - clean up the freeze_bdev interface

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
