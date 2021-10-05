Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DADAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29E6613B5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D29E6613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U1NJhveHEFLoIBcxP4uwtdUnT2gRkC+cIXvoULJDPpE=; b=h3LZ+upNAq6/Vf
	urmo3i6lsW61MHICkXie2VYAr+wvXaJ88+UdaDKxccGa/h3NRjqYGkhXg0YapuZzHM2dvNYGzToa7
	ven6toOgH9Mb+wSarZjIDckRvEz6qxDsjNDje+ya91Vj2y+OoPfmOcGlThbPwS80sYvQntcsfN9fS
	kbymJ1uMICtAeDxiLQ70NYyQa6sGosiEbOXDM4gdyBgmyXDFUlKgQYiNyJu9K2ZeN9r0sC2imT7CQ
	PB3VD0vKs/3FI7nkdoKOxqgewsWKpKMTbgCsqZuCyN877DTsEH7BNLbcjno+OiSeUxEgutfHyzGHX
	uhZd9LE+uf9Lq5/lHdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgWE-009iOU-Ld; Tue, 05 Oct 2021 09:13:50 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgW9-009iLT-OI
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 09:13:49 +0000
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id ZLT00021;
 Tue, 05 Oct 2021 17:13:21 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2308.14; Tue, 5 Oct 2021 17:13:20 +0800
From: Kai Song <songkai01@inspur.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Kai Song
 <songkai01@inspur.com>
Subject: [PATCH] ubi: Fix a mistake in comment
Date: Tue, 5 Oct 2021 14:56:55 +0800
Message-ID: <20211005065656.13497-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.200.104.119]
tUid: 2021100517132163fb41eca9b96765dce7d25a84d1c897
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_021346_787427_E78C3A23 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes: 2a734bb8d502 ("UBI: use debugfs for the extra checks knobs")
There is a mistake in docstrings, it should be ubi_debugfs_exit_dev
instead of dbg_debug_exit_dev.

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 drivers/mtd/ubi/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 3c0c8eca4d51..31d427ee191a 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -562,7 +562,7 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 }
 
 /**
- * dbg_debug_exit_dev - free all debugfs files corresponding to device @ubi
+ * ubi_debugfs_exit_dev - free all debugfs files corresponding to device @ubi
  * @ubi: UBI device description object
  */
 void ubi_debugfs_exit_dev(struct ubi_device *ubi)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
