Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1874BC832FB
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5A62242F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdunoBWS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vFvv1eb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E5A62242F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UT4ayzeDfTfak/jqwH6Qe5TsMtoAjAAguKYG6CT4W3k=; b=LdunoBWSgKdJIzkk3wFUYxVQz
	NmAsrcqqtBBmCGXVGqY6lFqSxo5tLv2fMCGvtkDlI7QaSQVLVkl1JiTbN3AZFySqb47AvZYflrrIa
	3XUnEwbhgHcge9RRq4Dhh3ub69BnnOFluIxz6HVIgbOnDH4kBhmDGRgDKFLyAoojKzmn7/K1q4gA2
	iDL9DeTzhX4VuPT0nn+r3RGw3xzr6DCp7+UVJMdSLmYpJAE0xRzC5TtYYwj6xLv+boaSKZes/Wdku
	y6fc61yrR4hcx5qbkQcEnSo1PyOAaeKOhDNiNp4u3q3PdjGhUljoovmLz10uOGUDpCiXtlZqprizR
	GQcJgW7Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyQA-0000Tj-J9; Fri, 09 Oct 2020 19:51:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyQ1-0000PK-NJ; Fri, 09 Oct 2020 19:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Pq+5H0Tb8kpWR+AdJnT+a+sSRzDgUP6g7wD70nRElTg=; b=vFvv1eb6yy+bwBjEYgU2xQFZf5
 CgrdA1tqNTZ4FII/rBDPFn3DftIZAWik28FYA2esl8BLk827h3UllFTDjryTFSwyxVqeM9RBXWitX
 AltWpNcwTuXS5ir9mXySL9b4eP6xuqtpzoijYz/ZEmu4P9dheb5yxhlYTyWmxMxDQE6gzD6KQoiQZ
 J3P87zccx9sEFASxuVPKDOBwiGFMbjdWV007EW7TcYktGhad+YcosavOTa1Vm0vUgTut3J0jm4p68
 DRtluy2RJAWcOq7sFvpekdqavl/qkL1hN5/DsiVODuvEkq4/rgUP18aUGso+z4OsUhWEl+BSXKcaX
 zDblgyjA==;
Received: from mga02.intel.com ([134.134.136.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyPv-0001DQ-Ot; Fri, 09 Oct 2020 19:51:08 +0000
IronPort-SDR: C0HkVHoSSuE3pj8h3jrLTLvHLMXHqN6C1YRRHZkdSwVe8n5bBmja3j6Wm22oDYYzcBSdT7w57r
 HybUKPR8Qbpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="152450757"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="152450757"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:00 -0700
IronPort-SDR: /j9oTf64Lc/fwCVe0LT3Z3/pz5zJXnOJNQAbfqyJqoBSoEhIO3zt/eOhOuH8Xl1K1eBwx2q0zq
 2edyiKrU43UQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519846797"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:59 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 04/58] kmap: Add stray access protection for
 device pages
Date: Fri,  9 Oct 2020 12:49:39 -0700
Message-Id: <20201009195033.3208459-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205104_647000_C6B528DF 
X-CRM114-Status: GOOD (  22.59  )
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

Device managed pages may have additional protections.  These protections
need to be removed prior to valid use by kernel users.

Check for special treatment of device managed pages in kmap and take
action if needed.  We use kmap as an interface for generic kernel code
because under normal circumstances it would be a bug for general kernel
code to not use kmap prior to accessing kernel memory.  Therefore, this
should allow any valid kernel users to seamlessly use these pages
without issues.

Because of the critical nature of kmap it must be pointed out that the
over head on regular DRAM is carefully implemented to be as fast as
possible.  Furthermore the underlying MSR write required on device pages
when protected is better than a normal MSR write.

Specifically, WRMSR(MSR_IA32_PKRS) is not serializing but still
maintains ordering properties similar to WRPKRU.  The current SDM
section on PKRS needs updating but should be the same as that of WRPKRU.
So to quote from the WRPKRU text:

	WRPKRU will never execute speculatively. Memory accesses
	affected by PKRU register will not execute (even speculatively)
	until all prior executions of WRPKRU have completed execution
	and updated the PKRU register.

Still this will make accessing pmem more expensive from the kernel but
the overhead is minimized and many pmem users access this memory through
user page mappings which are not affected at all.

Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/linux/highmem.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 14e6202ce47f..2a9806e3b8d2 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <linux/hardirq.h>
+#include <linux/memremap.h>
 
 #include <asm/cacheflush.h>
 
@@ -31,6 +32,20 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 
 #include <asm/kmap_types.h>
 
+static inline void dev_page_enable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_enable(global);
+}
+
+static inline void dev_page_disable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_disable(global);
+}
+
 #ifdef CONFIG_HIGHMEM
 extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
 extern void kunmap_atomic_high(void *kvaddr);
@@ -55,6 +70,11 @@ static inline void *kmap(struct page *page)
 	else
 		addr = kmap_high(page);
 	kmap_flush_tlb((unsigned long)addr);
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially enabled.
+	 */
+	dev_page_enable_access(page, true);
 	return addr;
 }
 
@@ -63,6 +83,11 @@ void kunmap_high(struct page *page);
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially disabled.
+	 */
+	dev_page_disable_access(page, true);
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
@@ -85,6 +110,7 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_atomic_high_prot(page, prot);
@@ -137,6 +163,7 @@ static inline unsigned long totalhigh_pages(void) { return 0UL; }
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
+	dev_page_enable_access(page, true);
 	return page_address(page);
 }
 
@@ -146,6 +173,7 @@ static inline void kunmap_high(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
+	dev_page_disable_access(page, true);
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(page_address(page));
 #endif
@@ -155,6 +183,7 @@ static inline void *kmap_atomic(struct page *page)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	return page_address(page);
 }
 #define kmap_atomic_prot(page, prot)	kmap_atomic(page)
@@ -216,7 +245,8 @@ static inline void kmap_atomic_idx_pop(void)
 #define kunmap_atomic(addr)                                     \
 do {                                                            \
 	BUILD_BUG_ON(__same_type((addr), struct page *));       \
-	kunmap_atomic_high(addr);                                  \
+	dev_page_disable_access(kmap_to_page(addr), false);     \
+	kunmap_atomic_high(addr);                               \
 	pagefault_enable();                                     \
 	preempt_enable();                                       \
 } while (0)
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
