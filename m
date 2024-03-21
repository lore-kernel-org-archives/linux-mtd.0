Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BBFC6FD1F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 20:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YDIS4bL8LRsuJWkjaG7qFqUEaacfe9IpSqAU1CKH0Tw=; b=jeN7OGiN7fp27H
	L2OsedEtENcoti+aS+U1+7Y2B0q9/SU/wumpkn95Jj9b7nkCT4aehM9w/CkJ2Nnxb+zBWIR3mrEb5
	tkcdZyueb8+He44OemjZ33QUM6cqd8tqY+sFf3mi+SoIHHTW+9Rr/hdkaxJU2UxgW8BmOTCxNmIN9
	bqi3l19z0v1jzExb87RjqlKUHH40YXxQzbYyWTlRxMIBZPSFjYInzS1cCZrFQV5TWUQ2q//ab7QJs
	f8C2Hegagh5HoC5fmB1jxXrHyPF6tsScYB7++3xsp0SWEcS3GZzEiaKCniB9wsj/xpx9gRBHidjqr
	hJ5FCAx9ROi5oX1FG1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOnB-00000004UiH-1DsU;
	Thu, 21 Mar 2024 20:13:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOn6-00000004Ugy-3uSK
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 20:13:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1A06F626FAE8;
	Thu, 21 Mar 2024 21:13:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JxriTs8HOKul; Thu, 21 Mar 2024 21:13:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7576C645094A;
	Thu, 21 Mar 2024 21:13:24 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Vfu0TxaASbAW; Thu, 21 Mar 2024 21:13:24 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 55840626FAE8;
	Thu, 21 Mar 2024 21:13:24 +0100 (CET)
Date: Thu, 21 Mar 2024 21:13:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1722992374.86554.1711052004278.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS updates for v6.9-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: VyzumXf1JtEN0irCPs3T+5iw33+zvQ==
Thread-Topic: UBI and UBIFS updates for v6.9-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_131333_302793_ADB8C009 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Linus,

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.9-rc1

for you to fetch changes up to b8a77b9a5f9c2ba313f2beef8440b6f9f69768e7:

  mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems (2024-03-10 22:14:28 +0100)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
        - Add Zhihao Cheng as reviewer
	- Attach via device tree
	- Add NVMEM layer
	- Various fastmap related fixes

UBIFS:
        - Add Zhihao Cheng as reviewer
	- Convert to folios
	- Various fixes (memory leaks in error paths, function prototypes)

----------------------------------------------------------------
Arnd Bergmann (2):
      ubifs: fix sort function prototype
      ubifs: fix function pointer cast warnings

Daniel Golle (8):
      dt-bindings: mtd: add basic bindings for UBI
      dt-bindings: mtd: ubi-volume: allow UBI volumes to provide NVMEM
      mtd: ubi: block: use notifier to create ubiblock from parameter
      mtd: ubi: attach from device tree
      mtd: ubi: introduce pre-removal notification for UBI volumes
      mtd: ubi: populate ubi volume fwnode
      mtd: ubi: provide NVMEM layer over UBI volumes
      mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems

Guo Xuenan (1):
      ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130

Kunwu Chan (1):
      ubifs: Remove unreachable code in dbg_check_ltab_lnum

Matthew Wilcox (Oracle) (15):
      ubifs: Set page uptodate in the correct place
      ubifs: Convert from writepage to writepages
      ubifs: Convert ubifs_writepage to use a folio
      ubifs: Use a folio in do_truncation()
      ubifs: Convert do_writepage() to take a folio
      ubifs: Convert ubifs_vm_page_mkwrite() to use a folio
      ubifs: Convert write_begin_slow() to use a folio
      ubifs: Convert ubifs_write_begin() to use a folio
      ubifs: Convert ubifs_write_end() to use a folio
      ubifs: Convert do_readpage() to take a folio
      ubifs: Convert allocate_budget() to work on a folio
      ubifs: Convert cancel_budget() to take a folio
      ubifs: Pass a folio into ubifs_bulk_read() and ubifs_do_bulk_read()
      ubifs: Use a folio in ubifs_do_bulk_read()
      ubifs: Convert populate_page() to take a folio

Richard Weinberger (2):
      MAINTAINERS: Add Zhihao Cheng as UBI/UBIFS reviewer
      ubi: Check for too small LEB size in VTBL code

Zhang Yi (1):
      ubi: correct the calculation of fastmap size

ZhaoLong Wang (1):
      ubi: Correct the number of PEBs after a volume resize failure

Zhihao Cheng (3):
      ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
      ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
      ubifs: Queue up space reservation tasks if retrying many times

 .../bindings/mtd/partitions/linux,ubi.yaml         |  75 ++++
 .../bindings/mtd/partitions/ubi-volume.yaml        |  40 ++
 Documentation/mm/page_cache.rst                    |  10 +
 MAINTAINERS                                        |   2 +
 drivers/mtd/ubi/Kconfig                            |  13 +
 drivers/mtd/ubi/Makefile                           |   1 +
 drivers/mtd/ubi/block.c                            | 136 +++----
 drivers/mtd/ubi/build.c                            | 154 +++++--
 drivers/mtd/ubi/eba.c                              |   7 +
 drivers/mtd/ubi/fastmap.c                          |   7 +-
 drivers/mtd/ubi/kapi.c                             |  56 ++-
 drivers/mtd/ubi/nvmem.c                            | 191 +++++++++
 drivers/mtd/ubi/ubi.h                              |   3 +
 drivers/mtd/ubi/vmt.c                              |  75 +++-
 drivers/mtd/ubi/vtbl.c                             |   6 +
 fs/ubifs/debug.c                                   |   9 +-
 fs/ubifs/dir.c                                     |   2 +
 fs/ubifs/file.c                                    | 443 ++++++++++-----------
 fs/ubifs/find.c                                    |  32 +-
 fs/ubifs/journal.c                                 | 171 +++++++-
 fs/ubifs/lprops.c                                  |   6 +-
 fs/ubifs/lpt_commit.c                              |   1 -
 fs/ubifs/super.c                                   |   2 +
 fs/ubifs/tnc.c                                     |   9 +-
 fs/ubifs/tnc_misc.c                                |  22 +
 fs/ubifs/ubifs.h                                   |   5 +
 include/linux/mtd/ubi.h                            |   2 +
 27 files changed, 1060 insertions(+), 420 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
 create mode 100644 drivers/mtd/ubi/nvmem.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
