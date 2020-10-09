Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F96C433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:13:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01564215A4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CksxRQ2F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YEpOOkYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01564215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3I+LtGm58jIibev9Usg9zHcTIcA8nGS8tCVaK3BXG10=; b=CksxRQ2F6f9K8dtMXGGk8Qy+j
	7en7UMbpHlFzNfB/sn3OSUM2ZxQ+PcINw1MM8Spivs3Gd55RW9xUiXnYpYDHoXt24L2yTnvKM6dEY
	wwH4PsmxIJm3jdiP0rEpmpDpdFfXCWA6Knp2XeoJJ/9sbsbh7GLY2BZhxxcNQSXPpnkmj7ejwuD7F
	jNK88abf1jY65tRvHF1wpilfpPrGQr41exA6foN6k0ZJCSnSX3jiHAAbg07YJBo46c7yQ+9TH+MM4
	HGXH2dLcUKrMwLKJJj1UiHeM+Ql47d5/mkeb94jyoQiLyAKzY8ZocL2zgDboClEPiTZ/c+veUhbU7
	JzNEA5YxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQykn-0004y2-0P; Fri, 09 Oct 2020 20:12:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQygl-0000bU-7w; Fri, 09 Oct 2020 20:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kxXPyXVSxQURySsCVyDDf1/2YmYMiHHbJkHA4A0p5s0=; b=YEpOOkYavLUdmTurKr4kSxwHQ2
 pPpqoC5ZfUFIEtgDZ5EGdqBn6p6kSKjZrmaOtS2YUlSF12oACc6FzmkRnk5JADiTwb+ppXa5yU9s/
 K9ZMvQtqWYmjvV12m7AEns6yUUN/JPmA0h5sxfHxmdGPXOTaj8UYKPXqj28V6dxgqbIX1XOT0X0L/
 evxr90rmd2HaeWyH73oMPaARB02PzXculMWr2xlU/fGwU96wdEG8LF2wcVLIcaXgvajVLuawv4GAG
 7MOLkpNJtAVHF3IBmZgD8/it8JyLxde4EKcJaf92PcFlvmS4nKdZ429zvnSq+IXQtkgmGcny6I1ct
 1QozGxww==;
Received: from mga01.intel.com ([192.55.52.88])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyS5-0001i1-HS; Fri, 09 Oct 2020 19:53:44 +0000
IronPort-SDR: /3qPNeOyz35JkS+84wzz8tgKkBj7UL9VSXEzKt1MZT0LHKMbikiDUo8MHwjs/WR62G9xiz+LUM
 KC2SO5pLuzxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976346"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:51 -0700
IronPort-SDR: raa31ON9t7yf3LIgfzeAsEKPUCppaesVfvBVJ2ruufMJvWsy9JzU1jTdgl2++U0w8tR7AuyOxm
 Q4+3OjaqYbiw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298531317"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 34/58] fs/erofs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:09 -0700
Message-Id: <20201009195033.3208459-35-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205318_546885_1467764F 
X-CRM114-Status: GOOD (  13.60  )
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
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Gao Xiang <xiang@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/erofs/super.c | 4 ++--
 fs/erofs/xattr.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ddaa516c008a..41696b60f1b3 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -139,7 +139,7 @@ static int erofs_read_superblock(struct super_block *sb)
 
 	sbi = EROFS_SB(sb);
 
-	data = kmap(page);
+	data = kmap_thread(page);
 	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
 
 	ret = -EINVAL;
@@ -189,7 +189,7 @@ static int erofs_read_superblock(struct super_block *sb)
 	}
 	ret = 0;
 out:
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 	return ret;
 }
diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index c8c381eadcd6..1771baa99d77 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -20,7 +20,7 @@ static inline void xattr_iter_end(struct xattr_iter *it, bool atomic)
 {
 	/* the only user of kunmap() is 'init_inode_xattrs' */
 	if (!atomic)
-		kunmap(it->page);
+		kunmap_thread(it->page);
 	else
 		kunmap_atomic(it->kaddr);
 
@@ -96,7 +96,7 @@ static int init_inode_xattrs(struct inode *inode)
 	}
 
 	/* read in shared xattr array (non-atomic, see kmalloc below) */
-	it.kaddr = kmap(it.page);
+	it.kaddr = kmap_thread(it.page);
 	atomic_map = false;
 
 	ih = (struct erofs_xattr_ibody_header *)(it.kaddr + it.ofs);
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
