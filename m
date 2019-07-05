Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE085C46499
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 13:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933AF218CA
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 13:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1dPk49c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NzyUrpSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933AF218CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNf7wsmHUVXrZUVureacPDskNVGI6bT15xScMptqulQ=; b=N1dPk49cAyrZ2a
	nXCUYYokU1sYh6xsU0YAn0g/ao1z7NtWUkftUlMJxpskQal+6422YGf4fIL21alJVbAB1CiCCtj3Y
	Gaa6alBevKmvCJTTq5CvlpFevRmm8YQkeCgcVRHFzmXGsysuzif5lkms4QB91gYD8P5KXL+96zYIj
	RhC1a2zubQ87jhKnJjhStUqlULcZ4kPQ8l6QORGM6qn+tEnMM4jBCPI63KVWJz31l6xpJqAA6TVJl
	GEOwag2sBkS0zih5qv3KdBHhPo3+A1l+d30gEPo7tsvD1b1P+QHFQB1ft2sDMYdyQxlZL5l84tv0m
	2etvxL+634Qhia3AVuIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjOj7-00014T-G9; Fri, 05 Jul 2019 13:58:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjM3P-0005PB-40
 for linux-mtd@bombadil.infradead.org; Fri, 05 Jul 2019 11:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4SNChIUfnv28H4D7zgI5TGG3vbmr5daUepkM0Qm/7I=; b=NzyUrpSmRXPh053Kw/prbAQc4l
 +5kFyy0UdCaQHiCEIOn3w8L7GVa8t4COHg/18I9si0qEpyWOWK0ErcgjY1uHhcg9Uey+Oj16GhFFe
 eRLxE6HxoIEmlM171sasllzB0YXnbfZN5Ldczw84Bi63Yu28WhtNaIa6Q386sff2DsNYPBdVo3ckW
 3bzyU6Qzgy8XiUZPahpHmKbG2nsJVuMp+aErcIjfonoZz+KHdmYvHLLvKJVI5HIxrYdGIo9Xq1EhL
 /QG2IFVYPqiQ30Q1VdNaoKoq9P0P7eRzFkTJenJJR/uj+keMHOJUjl1r8Ie8eeGt/36mal0QSJnri
 fqTeyynA==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjM3L-0005Qb-H4
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 11:06:57 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hjM2B-0008LA-W0; Fri, 05 Jul 2019 11:05:44 +0000
From: Colin King <colin.king@canonical.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH][V2] ubifs: remove redundant assignment to pointer fname
Date: Fri,  5 Jul 2019 12:05:43 +0100
Message-Id: <20190705110543.31428-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_120655_603540_8EC6367F 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The pointer fname is being assigned with a value that is never
read because the function returns after the assignment. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix up commit message

---
 fs/ubifs/debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 92fe5c5ed78a..95da71e13fc8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
 		     c->vi.ubi_num, c->vi.vol_id);
 	if (n == UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
-		fname = UBIFS_DFS_DIR_NAME;
 		return;
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
