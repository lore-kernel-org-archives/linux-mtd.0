Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D7C43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGrp7PeX7iVPmDsELPshy6RgJIjKe3asheokqHwUpFs=; b=GDkCKQ8I/cYg60
	PyH7M0XGWAd97zUFZjwbL9MPctMZJ584+Xd1p5uwAaDdQhIdfJibeJfr4GWYWTq+Zldd6L1EUkbNV
	3i8FESTU4MuZ0qSfUs/ovJKSD/I5jmrTVyds/cGDYlEDGPB+0EH9iNC0L4hkEy/7Fda5+M6Yj0+pv
	/8trcckT11EBvPkpQG7c3hXkMLuBc8EMQIfILL5C69U8/UUB18zwR4yX2EUh09Gaz0Tk2zvmz5RIN
	fpZaVzJPBkz3YWogYShlBs71uwtZoJ2449L8D0iJa6lno6zLohFzJUpWsxt8cTQj55NtQamJy2tlM
	hO6oZpPaNaZlb9fnWPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEp-00DtDS-Di; Wed, 08 Jun 2022 15:04:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEn-00DtBr-Jh
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C8q0R+e/rBy0+WV0269yeWJ3JYLa6mvxcMU049tzAMQ=; b=CS/ArOOFgUazhgBuVIhXoz92Iz
	tLP1+UzjBKtIQ7Dy/5NVLgAnvWWvYfAukTChPBXBJHel7m/rRcIG1jTO3m2SVgS4dQ2RCnrpnI/2B
	9iKrigIdgG1UysTmv8VlwqX324N8NrztRT9jaBzDbk+mLDdYbNW5pr4mZOlj2VneHAgPoio17IYwj
	m/4vzv2MBPDQc303p8MvgJU+5ViW9y/S2mis6sPjvcMV3XgTzYLKOwdVsPPuf7dw1p/zkAkFsZwEO
	lx/oyhsuVa0FzBkMKs3shdhPr6iBtAans8vQe+2EUQiQ7GyfqEuQkKrwSdQNjedKZMBZwIoJM8JrF
	UgeRmSEA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCt-00CjFE-KF; Wed, 08 Jun 2022 15:02:51 +0000
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
Subject: [PATCH v2 00/19] Convert aops->migratepage to aops->migrate_folio
Date: Wed,  8 Jun 2022 16:02:30 +0100
Message-Id: <20220608150249.3033815-1-willy@infradead.org>
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

We're getting to the last aops that take a struct page.  The only
remaining ones are ->writepage, ->write_begin, ->write_end and
->error_remove_page.

Changes from v1:
 - Remove ->isolate_page from secretmem
 - Split the movable_operations from address_space_operations
 - Drop the conversions of balloon, zsmalloc and z3fold
 - Fix the build errors with hugetlbfs
 - Fix the kerneldoc errors
 - Fix the ;; typo

Matthew Wilcox (Oracle) (19):
  secretmem: Remove isolate_page
  mm: Convert all PageMovable users to movable_operations
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
  secretmem: Convert to migrate_folio
  fs: Remove aops->migratepage()
  mm/folio-compat: Remove migration compatibility functions

 Documentation/filesystems/locking.rst       |   5 +-
 Documentation/filesystems/vfs.rst           |  13 +-
 Documentation/vm/page_migration.rst         |  33 +--
 arch/powerpc/platforms/pseries/cmm.c        |  60 +----
 block/fops.c                                |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |   4 +-
 drivers/misc/vmw_balloon.c                  |  61 +----
 drivers/virtio/virtio_balloon.c             |  47 +---
 fs/aio.c                                    |  36 +--
 fs/btrfs/disk-io.c                          |  22 +-
 fs/btrfs/inode.c                            |  26 +--
 fs/ext2/inode.c                             |   4 +-
 fs/ext4/inode.c                             |   4 +-
 fs/f2fs/checkpoint.c                        |   4 +-
 fs/f2fs/data.c                              |  40 +---
 fs/f2fs/f2fs.h                              |   4 -
 fs/f2fs/node.c                              |   4 +-
 fs/gfs2/aops.c                              |   2 +-
 fs/hugetlbfs/inode.c                        |  23 +-
 fs/iomap/buffered-io.c                      |  25 --
 fs/nfs/file.c                               |   4 +-
 fs/nfs/internal.h                           |   6 +-
 fs/nfs/write.c                              |  16 +-
 fs/ntfs/aops.c                              |   6 +-
 fs/ocfs2/aops.c                             |   2 +-
 fs/ubifs/file.c                             |  29 +--
 fs/xfs/xfs_aops.c                           |   2 +-
 fs/zonefs/super.c                           |   2 +-
 include/linux/balloon_compaction.h          |   6 +-
 include/linux/buffer_head.h                 |  10 +
 include/linux/fs.h                          |  20 +-
 include/linux/iomap.h                       |   6 -
 include/linux/migrate.h                     |  48 ++--
 include/linux/page-flags.h                  |   2 +-
 include/linux/pagemap.h                     |   6 +
 include/uapi/linux/magic.h                  |   4 -
 mm/balloon_compaction.c                     |  10 +-
 mm/compaction.c                             |  34 ++-
 mm/folio-compat.c                           |  22 --
 mm/ksm.c                                    |   2 +-
 mm/migrate.c                                | 238 ++++++++++++--------
 mm/migrate_device.c                         |   3 +-
 mm/secretmem.c                              |  13 +-
 mm/shmem.c                                  |   2 +-
 mm/swap_state.c                             |   2 +-
 mm/util.c                                   |   4 +-
 mm/z3fold.c                                 |  82 +------
 mm/zsmalloc.c                               | 102 ++-------
 48 files changed, 367 insertions(+), 735 deletions(-)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
