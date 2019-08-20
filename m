Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA77C3A5A0
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 03:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0699206DF
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 03:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ubRhP8RU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0699206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.uga.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=M1GXWkn+CHUJPKio4Ao5lD/A+yNF/ZM3QXazVGBjj0I=; b=ubR
	hP8RUTbwZmGMTaf0QadYTrOB+J7DeVctMYakedmQajW1cOgf5/3SgqC3iSPdUd2RcYpJ4TqzVeRCp
	arN5b8jOMTf0vWSUAhSBh8R04ZhEq6B5Key0blUeri5xDE2fiI/BAM6X4m54tiTCARXog+Xgy3BX4
	BaZ1xDGj+FmUeo4omcmF3lmpbg1orYfBHJ87VAKYz/9SklwY0af2SJEYXrPYjf8dK15+HBL9wh5Gj
	GF7jqv0of+ewGdXvbdxyPreRaFf4a+D3y5kIXeWaBzVqyj+9xdgYlQdj+NC5MNetQe22rQuEu6LLp
	2jaMprHWu9H0Lck1ZPkMB5NagcvCJhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzuRC-0001Cl-VO; Tue, 20 Aug 2019 03:03:58 +0000
Received: from mail-yb1-f194.google.com ([209.85.219.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzuRA-0001C3-DA
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 03:03:57 +0000
Received: by mail-yb1-f194.google.com with SMTP id u32so1422628ybi.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2019 20:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T/JaohmNZpvxoXfMBJgKQy6uqfXida8R0ifjCoHqJy4=;
 b=HFDv418xf/5KPJDC8xicZsWj1bRxzYwBHTzLO4a5r+jJD5lWNzOfUuTKuYiZby1XZZ
 QJ3DNMxGxtxDR1qd56+J3Y0W5H8+97c5VN2d8/0RgvCnbvdFkx6iVTdAdkXBiCVu3DRX
 +ZlUMnJIUdoPkT0eNROl/YLw0NZfSIFhl9lzU17llj6+k3ONbpnjyALSdxjxEhcjExXx
 zN3bFiptChsEl1kNPoOF8UXSEwx5teBVghurqaNgUQUIYiy0RkSv3PFP2KYL993O1v5b
 iFqQtoql6YzUPQYbqkEim7kf5FpKZynfyWG2h2TQ6oqhQsg82UjxcLVSZ9vjuxRypJ8h
 a6kw==
X-Gm-Message-State: APjAAAUF0JEXzkQq4nIwjz5CIh8Bb/dbSnJEdQ+/BrGFbdL8OHO4WhK6
 UMhgejtuIlVc8/yi5QlFhnE=
X-Google-Smtp-Source: APXvYqzj92UdY053NzsDDYyHqtOHbL0COKEx87/jaBUtYNVeYaHjYyT4RQ5O34XN5FvlCzo1AmUDug==
X-Received: by 2002:a5b:7c8:: with SMTP id t8mr18452781ybq.113.1566270233627; 
 Mon, 19 Aug 2019 20:03:53 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id z6sm3820879ywg.40.2019.08.19.20.03.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 19 Aug 2019 20:03:52 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] ubifs: fix a memory leak bug
Date: Mon, 19 Aug 2019 22:03:46 -0500
Message-Id: <1566270227-8302-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_200356_446049_F7DCD9B0 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Richard Weinberger <richard@nod.at>,
 "open list:UBI FILE SYSTEM UBIFS" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In read_znode(), the indexing node 'idx' is allocated by kmalloc().
However, it is not deallocated in the following execution if
ubifs_node_check_hash() fails, leading to a memory leak bug. To fix this
issue, free 'idx' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 fs/ubifs/tnc_misc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 6f293f6..49cb34c 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -284,6 +284,7 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 	err = ubifs_node_check_hash(c, idx, zzbr->hash);
 	if (err) {
 		ubifs_bad_hash(c, idx, zzbr->hash, lnum, offs);
+		kfree(idx);
 		return err;
 	}
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
