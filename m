Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8199109190B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZCcUZ4UC0Sd5L2s1fJD4Hizqb3nlpp2RULhM0l0dWbc=; b=i3SHtKJdyMdP9i
	EdmELW69XGTy1UbQ/od1ilaycaQnwQiPedoqiGS6anTKyvyiGH1TF+bjMkpdk+wMtwq4rRLLoS2gi
	aheqxDy4iSHACN0lcicjZGNZdxDh+vDkly+NUhI56Zu32mhvEhq8Gys1xxUd2GvRf1eUDI6QyQ7ju
	mHyBs/MG1CpLYuGX0zKlmAf/3/CMU/1JZW3oC0zl11UFHnkm8TpobOh7nMRCpT2V7hEWdr+nMRFkm
	VvvnxGlR+/zX76Kd4reAXXetFcJHc8KjX8/CG9+ARJBbBiHX1fwBC6nDxJ6ZK9GcLVDnW3or5c8sf
	P2wKIsHcwxWJDB56sGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2A-0000000BIW7-0zTU;
	Thu, 19 Mar 2026 18:23:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I27-0000000BIVN-2iiN;
	Thu, 19 Mar 2026 18:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34C76438FA;
	Thu, 19 Mar 2026 18:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF4EC19424;
	Thu, 19 Mar 2026 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944625;
	bh=hUq23NX3AUF/Z/nd3f+apZh8oyr5ochA07r37x4M5ug=;
	h=From:To:Cc:Subject:Date:From;
	b=k72tqnwuSjAIoaoFYpnmAJc5NqF2RHzpf2m0/2v5FHjqFYrvF9hFpFABSV0ibMtjI
	 v5ABOEragkIvhSQcUDiYsI2HJhw45Kwl3+zk237y/4tjTATs5TdNmP3sOChEeowL0j
	 aF2jYijp2yjfKoeeFK5r4Blr/10cTIPfZxwMhCmDiuBv8H7oliqmyrAE8CKe2gk/Df
	 hif2oRVLCDoEd+7O09ruZk1Sqb3i4NACbtkHiyNTqml2Yjk84myr5XNmRq67QmIQvh
	 5rosWsQJMLdf0p2r46AtulRsJmHTQ5LCq29emURnbAQO3W3H4Een9shDvkQqdUHUth
	 LEQrKOSjYWzGw==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v3 00/16] mm: expand mmap_prepare functionality and usage
Date: Thu, 19 Mar 2026 18:23:24 +0000
Message-ID: <cover.1773944114.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_112347_729034_F0118916 
X-CRM114-Status: GOOD (  24.63  )
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

This series expands the mmap_prepare functionality, which is intended to
replace the deprecated f_op->mmap hook which has been the source of bugs
and security issues for some time.

This series starts with some cleanup of existing mmap_prepare logic, then
adds documentation for the mmap_prepare call to make it easier for
filesystem and driver writers to understand how it works.

It then importantly adds a vm_ops->mapped hook, a key feature that was
missing from mmap_prepare previously - this is invoked when a driver which
specifies mmap_prepare has successfully been mapped but not merged with
another VMA.

mmap_prepare is invoked prior to a merge being attempted, so you cannot
manipulate state such as reference counts as if it were a new mapping.

The vm_ops->mapped hook allows a driver to perform tasks required at this
stage, and provides symmetry against subsequent vm_ops->open,close calls.

The series uses this to correct the afs implementation which wrongly
manipulated reference count at mmap_prepare time.

It then adds an mmap_prepare equivalent of vm_iomap_memory() -
mmap_action_simple_ioremap(), then uses this to update a number of drivers.

It then splits out the mmap_prepare compatibility layer (which allows for
invocation of mmap_prepare hooks in an mmap() hook) in such a way as to
allow for more incremental implementation of mmap_prepare hooks.

It then uses this to extend mmap_prepare usage in drivers.

Finally it adds an mmap_prepare equivalent of vm_map_pages(), which lays
the foundation for future work which will extend mmap_prepare to DMA
coherent mappings.


v3:
* Propagated tags (thanks Suren, Richard!)
* Updated 12/16 to correctly clear the vm_area_desc data structure in
  set_desc_from_vma() as per Joshua Hahn (thanks! :)
* Fixed type in 12/16 as per Suren (cheers!)
* Fixed up 6/16 to use mmap_action_ioremap_full() in simple_ioremap_prepare() as
  suggested by Suren.
* Also fixed up 6/16 to call io_remap_pfn_range_prepare() direct rather than
  mmap_action_prepare() as per Suren.
* Also fixed up 6/16 to pass vm_len rather than vm_[start, end] to
  __simple_ioremap_prep() as per Suren (thanks for all the above! :)
* Fixed issue in rmap lock being held - we were referencing a vma->vm_file after
  the VMA was unmapped, so UAF. Avoid that. Also do_munmap() relies on rmap lock
  NOT being held or may deadlock, so extend functionality to ensure we drop it
  when it is held on error paths.
* Updated 'area' -> 'vma' variable in 3/16 in VMA test dup.h.
* Fixed up reference to __compat_vma_mmap() in 12/16 commit message.
* Updated 1/16 to no longer duplicatively apply io_remap_pfn_range_pfn().
* Updated 1/16 to delegate I/O remap complete to remap complete logic.
* Fixed various typos in 12/16.
* Fixed stale comment typos in 13/16.
* Fixed commit msg and comment typos in 14/16.
* Removed accidental sneak peak to future functionality in 15/16 commit message
  :).
* Fixed up field names to be identical in VMA tests + mm_types.h in 6/16,
  15/16.

v2:
* Rebased on
  https://lore.kernel.org/all/cover.1773665966.git.ljs@kernel.org/ to make
  Andrew's life easier :)
* Folded all interim fixes into series (thanks Randy for many doc fixes!))
* As per Suren, removed a comment about allocations too small to fail.
* As per Randy, fixed up typo in documentation for vm_area_desc.
* Fixed mmap_action_prepare() not returning if invalid action->type
  specified, as updated from Andrew's interim fix (thanks!) and also
  reported by kernel test bot.
* Updated mmap_action_prepare() and specific prepare functions to only
  pass vm_area_desc parameter as per Suren.
* Fixed up whitespace as per Suren.
* Updated vm_op->open comment in vm_operations_struct to reference forking
  as per Suren.
* Added a commit to check that input range is within VMA on remap as per
  Suren (this also covers I/O remap and all other cases already asserted).
* Updated AFS to not incorrectly reference count on mmap prepare as per
  Usama.
* Also updated various static AFS functions to be consistent with each
  other.
* Updated AFS commit message to reflect mmap_prepare being before any VMA
  merging as per Suren.
* Updated __compat_vma_mapped() to check for NULL vm_ops as per Usama.
* Updated __compat_vma_mapped() to not reference an unmapped VMA's fields
  as per Usama.
* Updated __vma_check_mmap_hook() to check for NULL vm_ops as per Usama.
* Dropped comment about preferring mmap_prepare as seems overly confusing,
  as per Suren.
* Updated the mmap lock assert in unmap_vma_locked() to a write lock assert
  as per Suren.
* Copied vm_ops->open comment over to VMA tests in appropriate patch as per
  Suren.
* Updated mmap_prepare documentation to reflect the fact that no resources
  should be allocated upon mmap_prepare.
* Updated mmap_prepare documentation to reference the vm_ops->mapped
  callback.
* Fixed stray markdown '## How to use' in documentation.
* Fixed bug reported by kernel test bot re: overlooked
  vma_desc_test_flags() -> vma_desc_test() in MTD driver for nommu.
https://lore.kernel.org/linux-mm/cover.1773695307.git.ljs@kernel.org/

v1:
https://lore.kernel.org/linux-mm/cover.1773346620.git.ljs@kernel.org/

Lorenzo Stoakes (Oracle) (16):
  mm: various small mmap_prepare cleanups
  mm: add documentation for the mmap_prepare file operation callback
  mm: document vm_operations_struct->open the same as close()
  mm: add vm_ops->mapped hook
  fs: afs: correctly drop reference count on mapping failure
  mm: add mmap_action_simple_ioremap()
  misc: open-dice: replace deprecated mmap hook with mmap_prepare
  hpet: replace deprecated mmap hook with mmap_prepare
  mtdchar: replace deprecated mmap hook with mmap_prepare, clean up
  stm: replace deprecated mmap hook with mmap_prepare
  staging: vme_user: replace deprecated mmap hook with mmap_prepare
  mm: allow handling of stacked mmap_prepare hooks in more drivers
  drivers: hv: vmbus: replace deprecated mmap hook with mmap_prepare
  uio: replace deprecated mmap hook with mmap_prepare in uio_info
  mm: add mmap_action_map_kernel_pages[_full]()
  mm: on remap assert that input range within the proposed VMA

 Documentation/driver-api/vme.rst           |   2 +-
 Documentation/filesystems/index.rst        |   1 +
 Documentation/filesystems/mmap_prepare.rst | 168 ++++++++++++++
 drivers/char/hpet.c                        |  12 +-
 drivers/hv/hyperv_vmbus.h                  |   4 +-
 drivers/hv/vmbus_drv.c                     |  31 ++-
 drivers/hwtracing/stm/core.c               |  31 ++-
 drivers/misc/open-dice.c                   |  19 +-
 drivers/mtd/mtdchar.c                      |  21 +-
 drivers/staging/vme_user/vme.c             |  20 +-
 drivers/staging/vme_user/vme.h             |   2 +-
 drivers/staging/vme_user/vme_user.c        |  51 +++--
 drivers/target/target_core_user.c          |  26 ++-
 drivers/uio/uio.c                          |  10 +-
 drivers/uio/uio_hv_generic.c               |  11 +-
 fs/afs/file.c                              |  36 ++-
 include/linux/fs.h                         |  14 +-
 include/linux/hyperv.h                     |   4 +-
 include/linux/mm.h                         | 159 ++++++++++++-
 include/linux/mm_types.h                   |  17 +-
 include/linux/uio_driver.h                 |   4 +-
 mm/internal.h                              |  41 ++--
 mm/memory.c                                | 175 ++++++++++----
 mm/util.c                                  | 251 ++++++++++++++-------
 mm/vma.c                                   |  53 +++--
 mm/vma.h                                   |   2 +-
 tools/testing/vma/include/dup.h            | 152 ++++++++++---
 tools/testing/vma/include/stubs.h          |   9 +-
 28 files changed, 990 insertions(+), 336 deletions(-)
 create mode 100644 Documentation/filesystems/mmap_prepare.rst

--
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
