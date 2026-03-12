Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1AE106ACE9
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gwBNf48HQdHdrC7JWivlkgkGk7rdY6iLprjCIEJEofg=; b=cLAEv5kReOk+QI
	lmKv/0ZNv4gdntAzhQ2+0NF6gWG1Ft0buFt4wOpRbvNUpIdgUg58rkCb+2GLI1AoVshNP/lTsn3S1
	I68PXnTGjC1GWLBlfdbDBUwRdWqvm3MiKn6rM+1bx4THudki8K0xDtQ4LQbL9ZGW43zQFf1GWIeaz
	zB++8G5C++az0GcR/APZ83SKVCSf/DT/HQ6KV6sHCEnLIFajk6Fcc1c0+GdbSKz7ht4UTOdkcqOhQ
	BCi92sCfAoRlh5iRQkseoWSK0Fem4b5AcNbz1ReWb2kVlwFD8jkLg5Z202A0NkmKOSDCgASMcz6ej
	OMKkkewIZj9wmmdJy73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdM-0000000FGl8-2Yj1;
	Thu, 12 Mar 2026 20:27:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdJ-0000000FGjs-3MXw;
	Thu, 12 Mar 2026 20:27:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12A1E4417D;
	Thu, 12 Mar 2026 20:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0DDC4CEF7;
	Thu, 12 Mar 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773347268;
	bh=UHRT8qRmUgXL60CxpkG8XqJ40rRzobM0A/lzS/hpZy8=;
	h=From:To:Cc:Subject:Date:From;
	b=craZlvZb5CGklOhHfqyBv/N2B4J7VOxsEGxAyy49uaJyF1Jyg/1A800kZeyO1k4yW
	 d4nk35Hw7zkQKIqmK7i3AotkuZ9aCNg5kxBohTKgQiC/uPu/S8LiGo/e5ToGK1QfhL
	 xDjyWyVf4HhkL/qRL1ZknbK8aS+MIfLKHEYCRjLEBYMJlSBM9eRsvDIYzl4YfSpmsj
	 iB7IBjXqGYz+BNhwdRbqTNlG379au2uoUSMc6AvVYa8NoaP28LQ32Omvd8/6aW2CWE
	 MvfLMlDkSAkFhGIFTmwORZMdnQ9l/wOcUhOFUQoYNegqsXtG1QaNKdM6TFCpqdII1U
	 /nFm+u8VpBCFA==
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
Subject: [PATCH 00/15] mm: expand mmap_prepare functionality and usage
Date: Thu, 12 Mar 2026 20:27:15 +0000
Message-ID: <cover.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_132749_880975_122CA3A9 
X-CRM114-Status: GOOD (  16.53  )
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

Importantly, mmap_prepare is invoked prior to a merge being attempted, so
you cannot manipulate state such as reference counts as if it were a new
mapping.

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

Lorenzo Stoakes (Oracle) (15):
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

 Documentation/driver-api/vme.rst           |   2 +-
 Documentation/filesystems/mmap_prepare.rst | 141 ++++++++++++++
 drivers/char/hpet.c                        |  12 +-
 drivers/hv/hyperv_vmbus.h                  |   4 +-
 drivers/hv/vmbus_drv.c                     |  27 ++-
 drivers/hwtracing/stm/core.c               |  31 ++-
 drivers/misc/open-dice.c                   |  19 +-
 drivers/mtd/mtdchar.c                      |  21 +-
 drivers/staging/vme_user/vme.c             |  20 +-
 drivers/staging/vme_user/vme.h             |   2 +-
 drivers/staging/vme_user/vme_user.c        |  51 +++--
 drivers/target/target_core_user.c          |  26 ++-
 drivers/uio/uio.c                          |  10 +-
 drivers/uio/uio_hv_generic.c               |  11 +-
 fs/afs/file.c                              |  20 +-
 include/linux/fs.h                         |  14 +-
 include/linux/hyperv.h                     |   4 +-
 include/linux/mm.h                         | 158 +++++++++++++--
 include/linux/mm_types.h                   |  17 +-
 include/linux/uio_driver.h                 |   4 +-
 mm/internal.h                              |  41 ++--
 mm/memory.c                                | 174 ++++++++++++-----
 mm/util.c                                  | 213 +++++++++++++++------
 mm/vma.c                                   |  56 ++++--
 mm/vma.h                                   |   2 +-
 tools/testing/vma/include/dup.h            | 143 ++++++++++----
 tools/testing/vma/include/stubs.h          |   9 +-
 27 files changed, 933 insertions(+), 299 deletions(-)
 create mode 100644 Documentation/filesystems/mmap_prepare.rst

--
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
