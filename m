Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A912C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0043215A4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rpq57i5D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dytVMwdq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0043215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cedWj2DJ6knSg/Gr1y7rlmJSYBvuUJS1UIVCtaUYNk0=; b=Rpq57i5D3h4q8WABMtACZ/ID6
	D123dMQXU+UMsF6dZU4rU0aj+B5QHJcU96bWijTFsrlb+hRjarWdKFM994c8MC6Y1YCyZzq1lht/C
	ZjXu4/joI2C+hI26Fs21MKAKm44FzukWVZ7FaKWpNpaaxESsOWKWhtiwNszPxCcsyxqGvOfHO2AVq
	YeqIyrWCy82JHcKQsUkFNUplBLqVD76Sy/9h7rZyGVnxoU0ERnxKdYpQLW7KbiuDc0+j9X7jVZ5Am
	RUC57QhvV6f9lYEBPBh03JyuiTcrP8GylWfMosgBVEduP+FPczcr8c+svBy2FKeO6LPewUbYHz//t
	1niUIEPQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQylA-0005Ct-BV; Fri, 09 Oct 2020 20:13:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQygq-00014k-Be; Fri, 09 Oct 2020 20:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EGrJxN/ef1abZfWDYFoKJOJ1ngDJ1Mw3IOeqo/qPAOA=; b=dytVMwdq/ogjc4f8Y4fE6ct8M1
 To6yPT4UdRWBQlAiL2tgl24X744ICj3yvBp7a/E6Hp9Q0rUxa0Jiv1kzlJ2XsEvXZvDiCu9jpxQh+
 uX3rNQw9DB5bK9YQefqYvNZ0Q+M0BMWftJqzwnqHTVzp+8cg4ZjXG3kipdgf9B2hwTvc3Qi0bNcWE
 BQ9EfD2rsF538+pHsj7CXDiUc+LP8bMuwY8xDGZizMzE1LxH9uhjSdwCAWPQrO+Gao9fHx0cTOccU
 h4OojmmqUKc4R5IY2CBnxQzDGm3Oiws3f06ju1isfuNM2vbStIwMq10is+hqBIbpXWCIWam+sRYrC
 F4C9eABw==;
Received: from mga04.intel.com ([192.55.52.120])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyRs-0001PO-Kv; Fri, 09 Oct 2020 19:53:35 +0000
IronPort-SDR: hUUXC+D+FgI8Z23M6hl2HlAVOHJ7EhnlJcEI9XhWNr3+lUtN4kxt97Hdx0vttX4Kxe31WjDDaV
 4xTrRYbRCGNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162893563"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162893563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:02 -0700
IronPort-SDR: bH2kRxXxeY8kuFBN5R8RneSpQbEQLW5eawptefbcIpm8xkU067aWcbaReXxx6/6TDXgDaxiIQ5
 8lenxDucas2g==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519847131"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:02 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 37/58] fs/ext2: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:12 -0700
Message-Id: <20201009195033.3208459-38-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205305_942523_8E1E1821 
X-CRM114-Status: GOOD (  13.98  )
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
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS update use the new kmap_thread() call instead.

Cc: Jan Kara <jack@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ext2/dir.c  | 2 +-
 fs/ext2/ext2.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index f3194bf20733..abe97ba458c8 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -196,7 +196,7 @@ static struct page * ext2_get_page(struct inode *dir, unsigned long n,
 	struct address_space *mapping = dir->i_mapping;
 	struct page *page = read_mapping_page(mapping, n, NULL);
 	if (!IS_ERR(page)) {
-		kmap(page);
+		kmap_thread(page);
 		if (unlikely(!PageChecked(page))) {
 			if (PageError(page) || !ext2_check_page(page, quiet))
 				goto fail;
diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index 021ec8b42ac3..9bcb6714c255 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -749,7 +749,7 @@ extern struct ext2_dir_entry_2 * ext2_dotdot (struct inode *, struct page **);
 extern void ext2_set_link(struct inode *, struct ext2_dir_entry_2 *, struct page *, struct inode *, int);
 static inline void ext2_put_page(struct page *page)
 {
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 }
 
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
