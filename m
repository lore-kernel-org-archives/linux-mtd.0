Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A131091909
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjXlL9byi3g2E6P2FsA0dMJYWnkuRU+WUBAB+xmcyoc=; b=KuFW2HDIfH81mn
	C0mzBPu/uuhjXmQtAvD3m6d1iEju6a0Kr4H+6xVnovVR7r5ZAoFX/p9grwU00pFvqLtVa9P7cNEGy
	nNJFZZjqDKHH7u/Pb5dOlY3JeZegBuMVCPMGbAN0NcJFfIqSbSjwAJ0/m/uCGVxSRJVCiAn+iROTU
	gBSMJqKby8ifoyGinRTbTukPPs3HrjNvDZyPWLCMJ6T6d6jETSn7cPc1psD6cI+af70oZc4pu0W/a
	OoUjS0AM4YYegK1EDdl26MN5q6ChWVAbEKmXUw2+r1OxJ6wlnqLif+8ilvLbyEzWWNV1vy48Uxmfx
	yXNOC8CUZ97FwZUGh6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2K-0000000BIdY-1YXW;
	Thu, 19 Mar 2026 18:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2E-0000000BIY9-3Pjb;
	Thu, 19 Mar 2026 18:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72B6D43F9C;
	Thu, 19 Mar 2026 18:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BA5C19425;
	Thu, 19 Mar 2026 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944634;
	bh=5Tw+CvMJ/jv/meNwzLAY6fkMGHWjyuoE3XwxJ8B9LXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaZTObagrzlF+hl3XbFw2JtTCmbKnqNi3t6CqzD4hNYU680kO24lq7WshtcPMpAP6
	 cGDai0fDa2TxZ/S3NYHCSIDdRQgJwU764FLz2pC3hsYA6qrB4ZLj94bm20zPZB2UMW
	 OIBte6f4yK3FFp1Pbn/yYxzVbJghQ4dKcWdYCmz4YqRPsUANonIGgeK5MlXjU+Qadw
	 fUSTxxHimR5oBfPieF/xOzVBgFliUSyS4RXAmbLVPQcRhkUVpE81E03R7REeUr9uts
	 QKBmKC/eHcHVm4TCrshN/g8dlToiHs5ShnSaxrLTtjTqCJ9MGOHHGL+NbcehLC0Ppn
	 EmMKuze7Z5fCg==
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
Subject: [PATCH v3 03/16] mm: document vm_operations_struct->open the same as close()
Date: Thu, 19 Mar 2026 18:23:27 +0000
Message-ID: <808919eaae0b682ec631301b3c06d85c62ba428d.1773944114.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773944114.git.ljs@kernel.org>
References: <cover.1773944114.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_112354_895574_36D1E95A 
X-CRM114-Status: GOOD (  13.50  )
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

Describe when the operation is invoked and the context in which it is
invoked, matching the description already added for vm_op->close().

While we're here, update all outdated references to an 'area' field for
VMAs to the more consistent 'vma'.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h              | 15 ++++++++++-----
 tools/testing/vma/include/dup.h | 15 ++++++++++-----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1e63b3a44a47..da94edb287cd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -766,15 +766,20 @@ struct vm_uffd_ops;
  * to the functions called when a no-page or a wp-page exception occurs.
  */
 struct vm_operations_struct {
-	void (*open)(struct vm_area_struct * area);
+	/**
+	 * @open: Called when a VMA is remapped, split or forked. Not called
+	 * upon first mapping a VMA.
+	 * Context: User context.  May sleep.  Caller holds mmap_lock.
+	 */
+	void (*open)(struct vm_area_struct *vma);
 	/**
 	 * @close: Called when the VMA is being removed from the MM.
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
 	 */
-	void (*close)(struct vm_area_struct * area);
+	void (*close)(struct vm_area_struct *vma);
 	/* Called any time before splitting to check if it's allowed */
-	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area);
+	int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
+	int (*mremap)(struct vm_area_struct *vma);
 	/*
 	 * Called by mprotect() to make driver-specific permission
 	 * checks before mprotect() is finalised.   The VMA must not
@@ -786,7 +791,7 @@ struct vm_operations_struct {
 	vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order);
 	vm_fault_t (*map_pages)(struct vm_fault *vmf,
 			pgoff_t start_pgoff, pgoff_t end_pgoff);
-	unsigned long (*pagesize)(struct vm_area_struct * area);
+	unsigned long (*pagesize)(struct vm_area_struct *vma);
 
 	/* notification that a previously read-only page is about to become
 	 * writable, if an error is returned it will cause a SIGBUS */
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 9eada1e0949c..8ae525ed1738 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -632,15 +632,20 @@ struct vm_area_struct {
 } __randomize_layout;
 
 struct vm_operations_struct {
-	void (*open)(struct vm_area_struct * area);
+	/**
+	 * @open: Called when a VMA is remapped, split or forked. Not called
+	 * upon first mapping a VMA.
+	 * Context: User context.  May sleep.  Caller holds mmap_lock.
+	 */
+	void (*open)(struct vm_area_struct *vma);
 	/**
 	 * @close: Called when the VMA is being removed from the MM.
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
 	 */
-	void (*close)(struct vm_area_struct * area);
+	void (*close)(struct vm_area_struct *vma);
 	/* Called any time before splitting to check if it's allowed */
-	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area);
+	int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
+	int (*mremap)(struct vm_area_struct *vma);
 	/*
 	 * Called by mprotect() to make driver-specific permission
 	 * checks before mprotect() is finalised.   The VMA must not
@@ -652,7 +657,7 @@ struct vm_operations_struct {
 	vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order);
 	vm_fault_t (*map_pages)(struct vm_fault *vmf,
 			pgoff_t start_pgoff, pgoff_t end_pgoff);
-	unsigned long (*pagesize)(struct vm_area_struct * area);
+	unsigned long (*pagesize)(struct vm_area_struct *vma);
 
 	/* notification that a previously read-only page is about to become
 	 * writable, if an error is returned it will cause a SIGBUS */
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
