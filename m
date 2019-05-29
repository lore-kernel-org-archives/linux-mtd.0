Return-Path: <SRS0=GAhz=T5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40F1C07542
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 07:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3FB2075C
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 07:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPtQ4ST0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3FB2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gxmScRzdkbs8vSq5i0ZhPHplE6TZcez54Lmfup/uYRE=; b=iPt
	Q4ST0FvUR4BUj7fJSibs3hlENZqB+RPH5SJQSMl7sG6/J03mMvj2i3b/2SvJ85LHYi4ZoX0RDyIqY
	Pni7Ur6ofkQ/dTh/a0wj8876J/A+7KXhkmlNsVcnuejdocN72CBvIKWw6ii+AQ8JAzmrB1INnLHV8
	PgpgxAk4XA4L40R8iMOErs/SB1/QSeswhLEvtJnNYIrrQYnqtS7Z/qV3A/p6L7jahZiKZ7CRJVCBX
	vq6QrjuN/iLRhSbUcYd4VhwKBJa8B9lvMwQ9YTZR34GVx8J6ym5u75rla+ty1ZhaV4wGiepxf1ehN
	O/TEXkff4c24li29+xqDoSdk1FbdjOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVss8-0003Ez-D0; Wed, 29 May 2019 07:19:40 +0000
Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVss3-0002xO-29
 for linux-mtd@lists.infradead.org; Wed, 29 May 2019 07:19:38 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95cee326f9a5-dbf8e;
 Wed, 29 May 2019 15:19:11 +0800 (CST)
X-RM-TRANSID: 2ee95cee326f9a5-dbf8e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35cee326e9c7-1e858;
 Wed, 29 May 2019 15:19:11 +0800 (CST)
X-RM-TRANSID: 2ee35cee326e9c7-1e858
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH] mtd: afs: remove unneeded NULL check
Date: Wed, 29 May 2019 15:18:22 +0800
Message-Id: <1559114302-10507-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_001935_589895_E6082033 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

NULL check before kfree is unneeded, so remove it.

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/mtd/parsers/afs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 0c73002..972b260 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -383,8 +383,7 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 
 out_free_parts:
 	while (i >= 0) {
-		if (parts[i].name)
-			kfree(parts[i].name);
+		kfree(parts[i].name);
 		i--;
 	}
 	kfree(parts);
-- 
1.9.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
