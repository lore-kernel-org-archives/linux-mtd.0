Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBB4C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RP2EMK0v7GLuGhc7d/zDTNw6rMGiMOT9XIj5+YarnF8=; b=1fxvexUu8+9zqu
	cqzAdtlHTQH1D+P8/F39PFWq90VlPbNXOGVdWUfKJMwztcWCwFrcopReyCS06AYuA3h+t9Y18vp5B
	zXX6i8Bz7Pi2g9ns3Z7G11Mn/tlyjH0SESKAa+7mPTE0hsJoteW3YtFk6HHntYO3fUKHoArHWj2E/
	smSHAyyp2AH9bYe4a5uRaElWgAcz8DELhHOrZkinBksB7+HIYqx/eTod59SFe7tcAzx4envYqmtzv
	sp10luHQS+6h7B/Uw/etHQUmAzxXfSmWg1P8JAu0QNjWpdP3HR08NHPXLi2hWcVYLvahav9Wnzd75
	YHpfLbEMSd//pHFsrZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJZm-002k6f-2o; Mon, 06 Jun 2022 20:43:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJXU-002i8d-Li
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=52TXjMDH2lUY3R09liZNjO+IjMsaCFATm2t/b+KQCF8=; b=SZdEFZWXMJtFPOJuECFsGH4n90
	q7ier+E1yPXVQU4Nd1lYIGA05aBdagpFc4iTt8PjgeKc8E++hHnQYInhlsw3wbFpf5nxp3H2fcfme
	0Xx+q8n2owHljzIVuJKc0MDo+cUizE5viLTjZLfP5xwl/nmCSSlMfDWIQiYSrFSnV+41z2epAxAgz
	c5hI+6eJnPB8FSW9f2DBRPcvqpAvUVkxshVm7oCqFdrliaskJ+h+S7JjdTqvzkHPpD7vXrhjHIlQV
	QHRESAfyNVHF1VHQMM7Gir9jrNAHNPAhLTN9Pq43f+cwmm1aYDR8JwDm6N7iYlMQcSUd+o2cWsMba
	zygq/t9A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWw-00B19H-IZ; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 00/20] Convert aops->migratepage to aops->migrate_folio
Date: Mon,  6 Jun 2022 21:40:30 +0100
Message-Id: <20220606204050.2625949-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

I plan to submit these patches through my pagecache tree in the upcoming
merge window.  I'm pretty happy that most filesystems are now using
common code for ->migrate_folio; it's not something that most filesystem
people want to care about.  I'm running xfstests using xfs against it now,
but it's little more than compile tested for other filesystems.

Matthew Wilcox (Oracle) (20):
  fs: Add aops->migrate_folio
  mm/migrate: Convert fallback_migrate_page() to
    fallback_migrate_folio()
  mm/migrate: Convert writeout() to take a folio
  mm/migrate: Convert buffer_migrate_page() to buffer_migrate_folio()
  mm/migrate: Convert expected_page_refs() to folio_expected_refs()
  btrfs: Convert btree_migratepage to migrate_folio
  nfs: Convert to migrate_folio
  mm/migrate: Convert migrate_page() to migrate_folio()
  mm/migrate: Add filemap_migrate_folio()
  btrfs: Convert btrfs_migratepage to migrate_folio
  ubifs: Convert to filemap_migrate_folio()
  f2fs: Convert to filemap_migrate_folio()
  aio: Convert to migrate_folio
  hugetlb: Convert to migrate_folio
  balloon: Convert to migrate_folio
  secretmem: Convert to migrate_folio
  z3fold: Convert to migrate_folio
  zsmalloc: Convert to migrate_folio
  fs: Remove aops->migratepage()
  mm/folio-compat: Remove migration compatibility functions

 Documentation/filesystems/locking.rst       |   5 +-
 Documentation/filesystems/vfs.rst           |  13 +-
 Documentation/vm/page_migration.rst         |  33 +--
 block/fops.c                                |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |   4 +-
 fs/aio.c                                    |  36 ++--
 fs/btrfs/disk-io.c                          |  22 +-
 fs/btrfs/inode.c                            |  26 +--
 fs/ext2/inode.c                             |   4 +-
 fs/ext4/inode.c                             |   4 +-
 fs/f2fs/checkpoint.c                        |   4 +-
 fs/f2fs/data.c                              |  40 +---
 fs/f2fs/f2fs.h                              |   4 -
 fs/f2fs/node.c                              |   4 +-
 fs/gfs2/aops.c                              |   2 +-
 fs/hugetlbfs/inode.c                        |  19 +-
 fs/iomap/buffered-io.c                      |  25 ---
 fs/nfs/file.c                               |   4 +-
 fs/nfs/internal.h                           |   6 +-
 fs/nfs/write.c                              |  16 +-
 fs/ntfs/aops.c                              |   6 +-
 fs/ocfs2/aops.c                             |   2 +-
 fs/ubifs/file.c                             |  29 +--
 fs/xfs/xfs_aops.c                           |   2 +-
 fs/zonefs/super.c                           |   2 +-
 include/linux/buffer_head.h                 |  10 +
 include/linux/fs.h                          |  18 +-
 include/linux/iomap.h                       |   6 -
 include/linux/migrate.h                     |  22 +-
 include/linux/pagemap.h                     |   6 +
 mm/balloon_compaction.c                     |  15 +-
 mm/compaction.c                             |   5 +-
 mm/folio-compat.c                           |  22 --
 mm/ksm.c                                    |   2 +-
 mm/migrate.c                                | 217 ++++++++++++--------
 mm/migrate_device.c                         |   3 +-
 mm/secretmem.c                              |   6 +-
 mm/shmem.c                                  |   2 +-
 mm/swap_state.c                             |   2 +-
 mm/z3fold.c                                 |   8 +-
 mm/zsmalloc.c                               |   8 +-
 41 files changed, 287 insertions(+), 379 deletions(-)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
