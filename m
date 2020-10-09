Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB3AC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:57:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EFD20691
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzGiCUuT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EFD20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NmeALfhDuQ3ZVkuZMkZfP5bxJ94jJ9MVwdWWAnlrDrQ=; b=gzGiCUuThQ9Apd8rqHQtqFTnr
	KGNwU5W/tM9Ng/KawN6hlJfvObaSJXv+TEHClZukdWW0MQjTdj8Pd6HaFiAlqp4HDs+9Wp//dMsgr
	ys+RHCLo3bc33ubwGlYZSLGUi31/Hqk8CpHBs4jqtyHaoKt+icFhyOIB9YexKk/btqRa/83bdz+H1
	rSOb3C6QtH3DrFhHTFfGj3n7mXVvP6e/rBMLYSCJClaqqKjNv+7cX3yQCknKMxOoXmt9+URDYLxWh
	hql3JiU8WCrAMAYexYjtYr+4SXJUIZMUxbaaC4HEDCvdzZHIwhO/n4GbrhS5Su1dDugES2OoTI9MR
	mC+IJTrKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyVD-0003PL-Rj; Fri, 09 Oct 2020 19:56:32 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyS8-0001UV-4j; Fri, 09 Oct 2020 19:53:33 +0000
IronPort-SDR: Zi57HQMOHRe8apqaxqw82tNHVCYCV9vt1ddVGvQCSkpRPrxh5o/ldJBmv9xoHxev85sszrXUDy
 g+85DxFTEz7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397571"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397571"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:16 -0700
IronPort-SDR: tpdf2AjeaRc5H+9J2CTgDjuzQWeL2r1NHpqYA6zEYh1sueM+cncDhIB0ZXYbhrsfqtXGL/LVMU
 w/znFNAZKmjw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="518801571"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:15 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 41/58] drivers/target: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:16 -0700
Message-Id: <20201009195033.3208459-42-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_155320_383280_877EB927 
X-CRM114-Status: GOOD (  15.00  )
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
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls in this driver are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/target/target_core_iblock.c    | 4 ++--
 drivers/target/target_core_rd.c        | 4 ++--
 drivers/target/target_core_transport.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 1c181d31f4c8..df7b1568edb3 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -415,7 +415,7 @@ iblock_execute_zero_out(struct block_device *bdev, struct se_cmd *cmd)
 	unsigned char *buf, *not_zero;
 	int ret;
 
-	buf = kmap(sg_page(sg)) + sg->offset;
+	buf = kmap_thread(sg_page(sg)) + sg->offset;
 	if (!buf)
 		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 	/*
@@ -423,7 +423,7 @@ iblock_execute_zero_out(struct block_device *bdev, struct se_cmd *cmd)
 	 * incoming WRITE_SAME payload does not contain zeros.
 	 */
 	not_zero = memchr_inv(buf, 0x00, cmd->data_length);
-	kunmap(sg_page(sg));
+	kunmap_thread(sg_page(sg));
 
 	if (not_zero)
 		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 408bd975170b..dbbdd39c5bf9 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -159,9 +159,9 @@ static int rd_allocate_sgl_table(struct rd_dev *rd_dev, struct rd_dev_sg_table *
 			sg_assign_page(&sg[j], pg);
 			sg[j].length = PAGE_SIZE;
 
-			p = kmap(pg);
+			p = kmap_thread(pg);
 			memset(p, init_payload, PAGE_SIZE);
-			kunmap(pg);
+			kunmap_thread(pg);
 		}
 
 		page_offset += sg_per_table;
diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index ff26ab0a5f60..8d0bae5a92e5 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -1692,11 +1692,11 @@ int target_submit_cmd_map_sgls(struct se_cmd *se_cmd, struct se_session *se_sess
 			unsigned char *buf = NULL;
 
 			if (sgl)
-				buf = kmap(sg_page(sgl)) + sgl->offset;
+				buf = kmap_thread(sg_page(sgl)) + sgl->offset;
 
 			if (buf) {
 				memset(buf, 0, sgl->length);
-				kunmap(sg_page(sgl));
+				kunmap_thread(sg_page(sgl));
 			}
 		}
 
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
