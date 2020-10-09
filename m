Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A1EC43457
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7383A2158C
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wOqY1Q52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BPIddsLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7383A2158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNdRocqg0Tun6D8nbGNePWX2acoUWir2MYHi2uy/NCM=; b=wOqY1Q528riiE2Jxlz4hL5sEE
	CriOXsOJFsHf6IoDYvpbugqEnNufAyJcVVmcdJDEdcrGZO33GPrbRkouth5InP7QkdjNIpBR9mSqV
	BCwTJ0GzCibZciKw/rp7luNRAPpzRmsjVDFMvyIGVrtv0NwPaaJZjaR72CG9CZihHQQL3cjtOrAvT
	MLM7u1G4+eymyPXFiJvwVCymoK4k08HTopHLoWD1wtTlEOV2XN3u+tcAqkSGda8O5mLTw5eSQvKa7
	/KLpZL2vCU+SVS7k33ip5yoW0sjOGDmSMvKNFCJVzMz+NVo1cM9d7JNXuk3dYo1F3JnNIb/MjwFtZ
	ka39/hIpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtQy-0003cX-Gf; Fri, 09 Oct 2020 14:31:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQK-0003LV-SI; Fri, 09 Oct 2020 14:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7u5VAtMiRg84eQRBFRLzhqfSMq0woXu9gI0XciTFBfo=; b=BPIddsLgHlfdV+iVajjIuvjIRm
 5m+SPjVF5IGNp5DQ+kIQ/W2usaGaZ8ERcMDbBc6laYoBvWK/J00fpvXlRmJKyu/TZj60d+laiyjS8
 VPYfqPFYBB4v583KBV93dh1vEaeFH4YgiWGqEN4ScuGlPPQ8bopka3nZr9ENPNE+sK7/ZWcgsAvKp
 aYlrGkftZt7dinFy3xCdrsc6n9GJkAYH/LbNqLa/jNOCmgSvfxEvf+juWvUVkLbaJIwZevAudngC+
 Y8M9LM2UmRY4e0R2r6XOfH46TIZ4TVlvRvSXGL+a48VhuEyQkj86XyTUBn1brFf7N9OrnKYCobSkU
 +TUEEzrA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQJ-0005uy-PZ; Fri, 09 Oct 2020 14:31:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 06/16] cifs: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:30:54 +0100
Message-Id: <20201009143104.22673-7-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The cifs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/cifs/file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index be46fab4c96d..533b151a9143 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -4537,7 +4537,8 @@ static int cifs_readpage_worker(struct file *file, struct page *page,
 	/* send this page to the cache */
 	cifs_readpage_to_fscache(file_inode(file), page);
 
-	rc = 0;
+	kunmap(page);
+	return AOP_UPDATED_PAGE;
 
 io_error:
 	kunmap(page);
@@ -4677,7 +4678,10 @@ static int cifs_write_begin(struct file *file, struct address_space *mapping,
 		 * an error, we don't need to return it. cifs_write_end will
 		 * do a sync write instead since PG_uptodate isn't set.
 		 */
-		cifs_readpage_worker(file, page, &page_start);
+		int err = cifs_readpage_worker(file, page, &page_start);
+
+		if (err == AOP_UPDATED_PAGE)
+			goto out;
 		put_page(page);
 		oncethru = 1;
 		goto start;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
