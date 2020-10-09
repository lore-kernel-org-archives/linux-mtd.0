Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD3C433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:12:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D131215A4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJIjbK4k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i5zpqyX3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D131215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcVepZp8NC/wAq0SppxPqeU3+vWqh3b7To7sVeGgySk=; b=SJIjbK4ket+CR7OLty+Ml/lmG
	sBVXl1PTdkfnz+JtoVL3rZsttVfMYq0ZRblXPCYx597/YLzWJ/oXEDzcUZcIX/LNeF7eXiBHUrDb2
	79wG6/WBba9yx09I6Cqv4H08Y2F0wHNs5YOe8gADpr4h4mNrEtIwrv5vSQOKINzL2RMynMd7Ve1iE
	jR4qDXcaKOKK+syk6XtXShgMycVnY8JPUIPyQ83t3XLLwETO5DDPjPasd9wBOS+XDP0DkBtGmq/C/
	HyGBTMD2INSqNpECuNWN0bAO/G5LoNpnR+QpkGbJK73IXl8j/66fJvcW8MO2DmUawR6juvQRPIqOk
	+vm4bSrOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyjv-0004JE-Co; Fri, 09 Oct 2020 20:11:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQygU-0000bU-Er; Fri, 09 Oct 2020 20:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=/V3uAD1bxrYj2Ot5J9thLw7J/tBvpnuILEfO6t9xn1I=; b=i5zpqyX3l7PI+TfmMS2AHXKTw3
 +NkWZgTfzCjZ9KiBG2tkdbVK2pX7qyyvH2b3NMuXSxIuYRw/4D8LsgEXtXdE/XXOa8jBu4MV9O4BP
 RCW2rFQojoa4a7IXZu9zRROnzPK+7Xqw7cb344IN/jRnRfayfMPfG8x6FAi33OyruiRGfyTbj9zgo
 6MoPMyKhjqCKdi+UxFJsKgwH4w1p1W6wpyvlKd/z6+x2jS5ZQjVrkmt2iJ4JdLQfHWGDQcotXImkC
 ZGsCgh8JMPmulZvxvn0aIEV5v+inr2CXisUMAl6le5IJj2gFL2Yu+nBYeb9ksjZ9r0bKS9ue5N2v4
 ZEpskGcw==;
Received: from mga04.intel.com ([192.55.52.120])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQySW-0001zp-Vp; Fri, 09 Oct 2020 19:54:07 +0000
IronPort-SDR: FgsNtFecHrW52rBGzYD1CKcpJkamWA0lZ6YwDDX4cRSP0FbVdunwye8k9BYnOiToIldV3woRFu
 XVKlvxznB1ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162893648"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162893648"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:41 -0700
IronPort-SDR: t/zSGeR++7wfj+VtFM7nhfyp5h0blfdWqDlNHnP/5jl48Bm08GFuTiLpDu6MwkEQ7bZpMY8SQr
 l7ztZVCdgy3g==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419537249"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:40 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 49/58] drivers/misc: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:24 -0700
Message-Id: <20201009195033.3208459-50-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205346_228822_F4063F17 
X-CRM114-Status: GOOD (  13.05  )
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
 linux-ntfs-dev@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 8531ae781195..f308abb8ad03 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -343,7 +343,7 @@ static int qp_memcpy_to_queue_iter(struct vmci_queue *queue,
 		size_t to_copy;
 
 		if (kernel_if->host)
-			va = kmap(kernel_if->u.h.page[page_index]);
+			va = kmap_thread(kernel_if->u.h.page[page_index]);
 		else
 			va = kernel_if->u.g.vas[page_index + 1];
 			/* Skip header. */
@@ -357,12 +357,12 @@ static int qp_memcpy_to_queue_iter(struct vmci_queue *queue,
 		if (!copy_from_iter_full((u8 *)va + page_offset, to_copy,
 					 from)) {
 			if (kernel_if->host)
-				kunmap(kernel_if->u.h.page[page_index]);
+				kunmap_thread(kernel_if->u.h.page[page_index]);
 			return VMCI_ERROR_INVALID_ARGS;
 		}
 		bytes_copied += to_copy;
 		if (kernel_if->host)
-			kunmap(kernel_if->u.h.page[page_index]);
+			kunmap_thread(kernel_if->u.h.page[page_index]);
 	}
 
 	return VMCI_SUCCESS;
@@ -391,7 +391,7 @@ static int qp_memcpy_from_queue_iter(struct iov_iter *to,
 		int err;
 
 		if (kernel_if->host)
-			va = kmap(kernel_if->u.h.page[page_index]);
+			va = kmap_thread(kernel_if->u.h.page[page_index]);
 		else
 			va = kernel_if->u.g.vas[page_index + 1];
 			/* Skip header. */
@@ -405,12 +405,12 @@ static int qp_memcpy_from_queue_iter(struct iov_iter *to,
 		err = copy_to_iter((u8 *)va + page_offset, to_copy, to);
 		if (err != to_copy) {
 			if (kernel_if->host)
-				kunmap(kernel_if->u.h.page[page_index]);
+				kunmap_thread(kernel_if->u.h.page[page_index]);
 			return VMCI_ERROR_INVALID_ARGS;
 		}
 		bytes_copied += to_copy;
 		if (kernel_if->host)
-			kunmap(kernel_if->u.h.page[page_index]);
+			kunmap_thread(kernel_if->u.h.page[page_index]);
 	}
 
 	return VMCI_SUCCESS;
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
