Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E397C83B94
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:56:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA00F225A9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 19:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w2Qk97ia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA00F225A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLJXh3v1Wj0NjHu88bp60rd7kwAEYD8EMyT/w4GaO3U=; b=w2Qk97iajGCRw6lTrUzT9ixSF
	ZmH2RhuVrHWH3OYawD1go65eP5n7cl7fMUba0hBeYtQTmIc9Mu9ar//AiKSq+hmUJtEGMz0DftSfb
	hUTMWK2FsHGvzpNiyNlJqcASCztd76syRSoOl7ZMTcnpQuMN8fTmLJb84x0mbNqCgEQR2RfNBUuoB
	9EpgEnaqzFrsxtlk/tjkFGjpFPQiGzr4WgWtjwowit37UY1Xpzmo/wOsKJ2VdtrD+Edu8UqbqlM8d
	BsjS4qLiF4ruVeP9PTlCTqm8N8Koq2+0urIoUHikuWxBUqDZEeklVmN0fKXl8sQBLD5GjkLWJxXyw
	bIuSecKpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyUS-0002yY-7Y; Fri, 09 Oct 2020 19:55:44 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyRv-0001KN-Rv; Fri, 09 Oct 2020 19:53:16 +0000
IronPort-SDR: 6pXrEP8KNbqMkMPB1Q6Bsvesc95aNjUJsXLn8n2IelLKavdosElzY15kfTx9mVqAIbnk95YMlr
 CqsE3iSSGeXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397380"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:59 -0700
IronPort-SDR: eWSKFRksQmWHvS1j4lFouXjU/VQ78asIZFlodYo3aryNHFOArT/TLAMBqja15iBonRYEaVT+Tm
 vvSyZvytK3gg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="462300719"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:57 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 20/58] fs/jffs2: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:55 -0700
Message-Id: <20201009195033.3208459-21-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_155308_090301_43F29B43 
X-CRM114-Status: GOOD (  15.56  )
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
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/jffs2/file.c | 4 ++--
 fs/jffs2/gc.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8fb89b10227..3e6d54f9b011 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -88,7 +88,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 
 	BUG_ON(!PageLocked(pg));
 
-	pg_buf = kmap(pg);
+	pg_buf = kmap_thread(pg);
 	/* FIXME: Can kmap fail? */
 
 	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_SHIFT,
@@ -103,7 +103,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	}
 
 	flush_dcache_page(pg);
-	kunmap(pg);
+	kunmap_thread(pg);
 
 	jffs2_dbg(2, "readpage finished\n");
 	return ret;
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 373b3b7c9f44..a7259783ab84 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1335,7 +1335,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		return PTR_ERR(page);
 	}
 
-	pg_ptr = kmap(page);
+	pg_ptr = kmap_thread(page);
 	mutex_lock(&f->sem);
 
 	offset = start;
@@ -1400,7 +1400,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		}
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 	return ret;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
