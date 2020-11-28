Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0744C64E7C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B0722256
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9hVPgvl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eJs+iBkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B0722256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vKcUx1ZYVsBY9GMJrpMY+N0eZUnP8sgYM/bCkh18D1I=; b=v9hVPgvlb5jKppbdevfPXVCDjk
	04W+UHUv2KQ03K0THsVVqfFOPWJ3DzjNQ3mKQIx8/Vetn6U0b4XLljQ45cvOhGy7ISPH/t7GP0lmh
	rLLRWGlICjDPtoBgxCDm/aIaA4gMZ46f2gHhDdFm6z2zsRwBMiL77V1BF37uzi1/cfyyyxfVyCB0U
	nraYBDpVTQpDBjrwxbLeMnnHDKO2rVubOtn518MK1lHpXPyUui59NOzsjRj18jjHJsILqGKLvESvt
	UDIObMhoqkEGBd7KlJ9SNKlDaWsCFJsF0AETSWsB/Fc8oQ9PWKSMzMDR4qKXwZZgKkk2ZGkasnEFG
	MEo2lf+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2sb-0000kv-LX; Sat, 28 Nov 2020 16:15:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sV-0000kF-Up
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=0Ujl5N8juKc7YdWeiKXE35ZfCBKXX17oNrNBcAKARdM=; b=eJs+iBkCcXmuCXezMNfXNybbPN
 MnNoU2ZU/lFD+6CHva9FNik4J5OzMMvZeuv5JB1oR3zQptYicrH9fu702ftSZbP6oXKb7PiJFV94X
 UcE52O6uDK7omj3vVh+DislaFi2U84WSs1R0qoq7rUxujhyur81VoVmgr3aRj57emoG2ZPGfU5SfO
 MHsCxOqNF3W4S5NgfWG3iXjJEwBocS+uY5XI0zdsC4DWvPWUzTrzncOh+H3YaUrEdTOfxhOtZ4QTM
 B2rVkhtKzHEotmcEBI7twOnKiJEmNqOmDh/mSMRsTXHDxNnNwD/0yhYCtqZvQy27P8orJCFvmlvho
 LCQtAJig==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sS-0000BF-3K; Sat, 28 Nov 2020 16:15:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: merge struct block_device and struct hd_struct v4
Date: Sat, 28 Nov 2020 17:14:25 +0100
Message-Id: <20201128161510.347752-1-hch@lst.de>
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

Changes since v3:
 - extend hold time of bdev_lookup_sem
 - use igrab bdget to make bdget_disk and disk_part_iter* safe
 - fix some error handling labels
 - remove a superflous cast
 - various comment fixups

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
