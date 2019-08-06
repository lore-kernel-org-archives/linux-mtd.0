Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138A6C31E40
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 14:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E712064A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 14:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tysU59gw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="wMlD4JD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E712064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lSyuOAJmsYkNY1M353YprJ4gaTOF7UNoIMeeQ9wAZqM=; b=tysU59gw6lXBLI
	iokJKblGDL94z5GAmgNBZbdBe08c69OJNJX0+cLJPTJiQoycJlw8fBICXOFKmQ17d8dnm2qLG6cPZ
	w/ivYdRxBWKB7rhSRrrlILqN1jcqYwJRMFCEy+qLgtbTCs+91NEkad7UhyseH6/U/K/BvpPnXa6tt
	S2OWA5ZcR1nhdSFeHxxqN9baqgEU4OKr57B69Vt13eYVLvZDRjNx0FsPSibKQOu2UgJIywYCHJevd
	HZZKmBL8/0gIjPpbV1fgXq26HkwNkOe4qp3c1f4zVjzcJCWN3IenMdRrch9HxuU4HYknhdL6Dr9Rl
	gf3ipaGeaor3vpyvLjXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv0Ll-0001PY-2A; Tue, 06 Aug 2019 14:22:05 +0000
Received: from out30-2.freemail.mail.aliyun.com ([115.124.30.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv0Li-0001P8-2H
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 14:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1565101314; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=HiDRwbPx7Zl3IjYbymTfZgEeEbtEHvARqA/eDaPH9KU=;
 b=wMlD4JD+6QCyz/F4fT/Tvpfk3v7C20g4c+lKJCPRyDs6FFteDp7Ra1retlLD5o50Nghs8KKc7CiR1Ni3qH+JZCLMPxxBpJryexPAtXiBHeD3BJRu5TYg54g1ZZdLdD+AU3xeQrEKbWswMa6MahsJb/mM79vKL2/aQPP1ZsMBJJ0=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1588495|-1; CH=green; DM=||false|;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01e07487; MF=fishland@aliyun.com; NM=1; PH=DS; RN=6;
 RT=6; SR=0; TI=SMTPD_---0TYpf49L_1565101303; 
Received: from 192.168.42.134(mailfrom:fishland@aliyun.com
 fp:SMTPD_---0TYpf49L_1565101303) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 06 Aug 2019 22:21:54 +0800
From: Liu Song <fishland@aliyun.com>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Subject: [PATCH] ubifs: limit the number of pages in shrink_liability
Date: Tue,  6 Aug 2019 22:21:40 +0800
Message-Id: <20190806142140.33013-1-fishland@aliyun.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_072202_282274_A1F80643 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Liu Song <liu.song11@zte.com.cn> 

If the number of dirty pages to be written back is large,
then writeback_inodes_sb will block waiting for a long time,
causing hung task detection alarm. Therefore, we should limit
the maximum number of pages written back this time, which let
the budget be completed faster. The remaining dirty pages
tend to rely on the writeback mechanism to complete the
synchronization.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
---
 fs/ubifs/budget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index 80d7301ab76d..c0b84e960b20 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -51,7 +51,7 @@
 static void shrink_liability(struct ubifs_info *c, int nr_to_write)
 {
 	down_read(&c->vfs_sb->s_umount);
-	writeback_inodes_sb(c->vfs_sb, WB_REASON_FS_FREE_SPACE);
+	writeback_inodes_sb_nr(c->vfs_sb, nr_to_write, WB_REASON_FS_FREE_SPACE);
 	up_read(&c->vfs_sb->s_umount);
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
