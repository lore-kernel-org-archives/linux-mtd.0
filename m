Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F7EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:12:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3CAD206A5
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncFAV6mz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hjkn/Zoo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3CAD206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pVpUkfIGiKP4pGUdD7dPfpx4d/YKpSn2aaV1APEIuUY=; b=ncFAV6mzxHQFJ9gJchLjBcqR0
	99NHjzjqh2poF7fRAWi8CY5nMA+YM8NMUHTxT3H4Ap3nf6id0ZFtb4kYVupz4j5Gg3ZF3E05QGNoO
	NIj0nt7Hv5RxLOMVzKj/sP5+TZeBOVofXTeRty2r4TROiyXSJCYzigZbbtWjUdk1zJn6Dlx6bYz49
	TnUcLYxFpq4TYXivOaw3H1HqPDG2zbRAkk8R+InJOiy/r0hEHFkYoRrFt7HR6IInHXoJ76xQNHsgg
	Rfu+ONtxCtC94+LxPfOCzGhMC6susAmLZlMdCstk+L73yQiA8s8fLgSiTGq1Jn5UqYMwweuod30+P
	syFGz4Wmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyji-0004BE-4A; Fri, 09 Oct 2020 20:11:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQygS-0000bU-Tm; Fri, 09 Oct 2020 20:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6dMo1X+S3X65vpXLFB9qQYYovJrXy3YaCcU7Wb8/Cuw=; b=hjkn/Zoo58TJtIf26VqknlWUWM
 dCrKUyK9PkHEFprTkTP3fE2PwNlvzPV5RUuu+s8jgvQrrvH9BqVqKrVJ0TbH1+0uqnDhujCz+uAO9
 RZXVJhpMSz6eIlPZmHGfejCqrOYaVywnicp30MNHnDKomuz87m/NIXqUm5MKEbXMoTlVu0TNjCigg
 70FTeI3QaJlIyM+aMm0dBISas4ohrEw26Gyr+O/3YMK3N11W7ynB4m5KB7KsImwvCx7cWKo+o43JC
 W1Yv6mR15l9u9z0Sdc4a2D0d5MgoANhlWDPRh6FEbLTkLVnUsG2Q5K5C2uwfaWiviVD3/WuNApsKa
 C75ruaCA==;
Received: from mga01.intel.com ([192.55.52.88])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQySY-0001i1-T8; Fri, 09 Oct 2020 19:54:10 +0000
IronPort-SDR: G/na64/U10UPQyZgpYCNre7hKZegSs3v7yHKCE4e3xfEXVaZlHmruZYOvTpaR7iycHj1EfIbzv
 nOI4pF0+RVnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976426"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976426"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:19 -0700
IronPort-SDR: W4xxziDMxkncUnjnfmhtERgTle+fDEBI/syTBEG/tlt++YK2v+9/w8FvvM36z1FzCpPIzrEgyR
 3zBS2pDk0hzg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="354959339"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:18 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 42/58] drivers/scsi: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:17 -0700
Message-Id: <20201009195033.3208459-43-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205347_944631_3B6E6475 
X-CRM114-Status: GOOD (  15.70  )
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
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
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

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/scsi/ipr.c     | 8 ++++----
 drivers/scsi/pmcraid.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index b0aa58d117cc..a5a0b8feb661 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -3923,9 +3923,9 @@ static int ipr_copy_ucode_buffer(struct ipr_sglist *sglist,
 			buffer += bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		memcpy(kaddr, buffer, bsize_elem);
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = bsize_elem;
 
@@ -3938,9 +3938,9 @@ static int ipr_copy_ucode_buffer(struct ipr_sglist *sglist,
 	if (len % bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		memcpy(kaddr, buffer, len % bsize_elem);
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = len % bsize_elem;
 	}
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index aa9ae2ae8579..4b05ba4b8a11 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -3269,13 +3269,13 @@ static int pmcraid_copy_sglist(
 	for (i = 0; i < (len / bsize_elem); i++, sg = sg_next(sg), buffer += bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		if (direction == DMA_TO_DEVICE)
 			rc = copy_from_user(kaddr, buffer, bsize_elem);
 		else
 			rc = copy_to_user(buffer, kaddr, bsize_elem);
 
-		kunmap(page);
+		kunmap_thread(page);
 
 		if (rc) {
 			pmcraid_err("failed to copy user data into sg list\n");
@@ -3288,14 +3288,14 @@ static int pmcraid_copy_sglist(
 	if (len % bsize_elem) {
 		struct page *page = sg_page(sg);
 
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 
 		if (direction == DMA_TO_DEVICE)
 			rc = copy_from_user(kaddr, buffer, len % bsize_elem);
 		else
 			rc = copy_to_user(buffer, kaddr, len % bsize_elem);
 
-		kunmap(page);
+		kunmap_thread(page);
 
 		sg->length = len % bsize_elem;
 	}
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
