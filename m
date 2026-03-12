Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFCA106ACE9
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBi1NsKXLxP87BhlruPo59ne+DQV9vKRflLQIA7PbEI=; b=LBd2o1wk0UEaWK
	UEe3rAYstt9cFhyg9q+4uT8G22+HTFWJuJ7FDgwBdgXUOJ/adnvwWdlasmabme6Ruex0R0+Ips7e+
	JEnSWIGjIszcXbKAwIGL1pnV1/s0cKbzzPPg+YOu4VjTZ8rMC47hKvznZcviF2DjWX1XdHPWE9/l2
	Cqc17NISEEKu+wBFr+iR6r7TpE2a9O7forvF3VQvp5q6pF40iyg827VXwL6miz4QDSPMYpCjpwLnt
	K2QDHMiFExoedHaSqr2dMURL5vmdoZK5y9inQ7z4LsZSwZ/4qQesiFFWsELwdMxmCTvLri/ZHz/uf
	DRvuwhTiD0oFJpCkLDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdV-0000000FGsU-2Fdi;
	Thu, 12 Mar 2026 20:28:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mdO-0000000FGly-47Wu;
	Thu, 12 Mar 2026 20:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F423C6133A;
	Thu, 12 Mar 2026 20:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B7DC19425;
	Thu, 12 Mar 2026 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773347273;
	bh=Vhnl6dyI6DciWh1R2wyZ1qlkDiUoqFRvSKLSiU1V8ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZK1WltimUAZc0jYB/huW7CthVu5Pu5VFPFyTyvlS4T7HMAkTnJpb74i68i41ylW7Q
	 7fyRQuCh/gLCub/cymRHsmhpsfS8DFpbAqZr1SS92G3+vQpwXbZfJnBMCChrImWhS6
	 V+8bnKKwhWmdij/nWi43ezCIkdrjaJHlgcQy5rFniS8jR/7Rlk/YDXp43NqjK9oYzc
	 FeI0J/rG34AJ6d6heDnhG73A8JiyAlXMohvdqoF701Bc7TYx5fMtntCofNtc6fMrPg
	 EWAXKwA/Mf9O9WCfz+8946sw4KO8eURIrObVsTiW6QjgNpFc+hr+6SFctAmLsbLljH
	 BJiGxYp2Ms+uA==
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
Subject: [PATCH 02/15] mm: add documentation for the mmap_prepare file operation callback
Date: Thu, 12 Mar 2026 20:27:17 +0000
Message-ID: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
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

This documentation makes it easier for a driver/file system implementer to
correctly use this callback.

It covers the fundamentals, whilst intentionally leaving the less lovely
possible actions one might take undocumented (for instance - the
success_hook, error_hook fields in mmap_action).

The document also covers the new VMA flags implementation which is the only
one which will work correctly with mmap_prepare.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/filesystems/mmap_prepare.rst

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
new file mode 100644
index 000000000000..76908200f3a1
--- /dev/null
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+mmap_prepare callback HOWTO
+===========================
+
+Introduction
+############
+
+The `struct file->f_op->mmap()` callback has been deprecated as it is both a
+stability and security risk, and doesn't always permit the merging of adjacent
+mappings resulting in unnecessary memory fragmentation.
+
+It has been replaced with the `file->f_op->mmap_prepare()` callback which solves
+these problems.
+
+## How To Use
+
+In your driver's `struct file_operations` struct, specify an `mmap_prepare`
+callback rather than an `mmap` one, e.g. for ext4:
+
+
+.. code-block:: C
+
+    const struct file_operations ext4_file_operations = {
+        ...
+        .mmap_prepare    = ext4_file_mmap_prepare,
+    };
+
+This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`.
+
+Examining the `struct vm_area_desc` type:
+
+.. code-block:: C
+
+    struct vm_area_desc {
+        /* Immutable state. */
+        const struct mm_struct *const mm;
+        struct file *const file; /* May vary from vm_file in stacked callers. */
+        unsigned long start;
+        unsigned long end;
+
+        /* Mutable fields. Populated with initial state. */
+        pgoff_t pgoff;
+        struct file *vm_file;
+        vma_flags_t vma_flags;
+        pgprot_t page_prot;
+
+        /* Write-only fields. */
+        const struct vm_operations_struct *vm_ops;
+        void *private_data;
+
+        /* Take further action? */
+        struct mmap_action action;
+    };
+
+This is straightforward - you have all the fields you need to set up the
+mapping, and you can update the mutable and writable fields, for instance:
+
+.. code-block:: Cw
+
+    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
+    {
+        int ret;
+        struct file *file = desc->file;
+        struct inode *inode = file->f_mapping->host;
+
+        ...
+
+        file_accessed(file);
+        if (IS_DAX(file_inode(file))) {
+            desc->vm_ops = &ext4_dax_vm_ops;
+            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
+        } else {
+            desc->vm_ops = &ext4_file_vm_ops;
+        }
+        return 0;
+    }
+
+Importantly, you no longer have to dance around with reference counts or locks
+when updating these fields - __you can simply go ahead and change them__.
+
+Everything is taken care of by the mapping code.
+
+VMA Flags
+=========
+
+Along with `mmap_prepare`, VMA flags have undergone an overhaul. Where before
+you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_flags_set()`,
+`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to have the
+locking done correctly for you, this is no longer necessary.
+
+Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM_WRITE`,
+etc. - i.e. using a `VM_xxx` macro has changed too.
+
+When implementing `mmap_prepare()`, reference flags by their bit number, defined
+as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc., and use one
+of (where `desc` is a pointer to `struct vma_area_desc`):
+
+* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list of flags you
+  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_flags(desc,
+  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are set,
+  otherwise `false`.
+* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags to set
+  additional flags specified by a comma-separated list,
+  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
+* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flags to clear
+  flags specified by a comma-separated list, e.g. - `vma_desc_clear_flags(desc,
+  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
+
+Actions
+=======
+
+You can now very easily have actions be performed upon a mapping once set up by
+utilising simple helper functions invoked upon the `struct vm_area_desc`
+pointer. These are:
+
+* `mmap_action_remap()` - Remaps a range consisting only of PFNs for a specific
+  range starting a virtual address and PFN number of a set size.
+
+* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only remaps the
+  entire mapping from `start_pfn` onward.
+
+* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only performs an I/O
+  remap.
+
+* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, only remaps
+  the entire mapping from `start_pfn` onward.
+
+**NOTE:** The 'action' field should never normally be manipulated directly,
+rather you ought to use one of these helpers.
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
