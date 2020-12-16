Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC658C4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 13:08:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7EE23371
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 13:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E7EE23371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CT4g+8W0PvB5Wzl15LKyud9opwHpdskBet94GcAiQhI=; b=SNPQYk54y6WUy+njSyG5Dh36Yo
	HoP+mURsaiHMOrb10MPR553jIdoGHqCRo/kGYV17E/6wHqKS7cRUdGT0K9WB6YttKfB7VEuWijexe
	0rn+YzGFYRD1y4AScp3H/U/d4Hgxt6z/isGsSUBIMyfum12j2zRY/7JFB4TbmxfPm2KmTYsc6SKW5
	AOU7VbBRTJS6rX59eZ8wJYL/gosoMkB6RkZjlbB9p2rUKJ992In7C7GfG4WQkpGK3NMs5l6Xk/Qzt
	pcfPAa/VPfu0z09HtHqL4imhrvwsJHFcMgytIBqUtAROxGLy4olaLCkbx/3VzNBKWMX+Pl1QOblad
	nGpRje7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpWWW-0004W7-V0; Wed, 16 Dec 2020 13:07:20 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpWWT-0004Tz-PK
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 13:07:19 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CwwPR6c7dzhnyq;
 Wed, 16 Dec 2020 21:06:35 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:06:55 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ubi: eba: Delete useless kfree code
Date: Wed, 16 Dec 2020 21:07:28 +0800
Message-ID: <20201216130728.14034-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_080718_123457_B6F22D95 
X-CRM114-Status: UNSURE (   6.69  )
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The parameter of kfree function is NULL, so kfree code is useless, delete it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/mtd/ubi/eba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0edecfdbd01f..9c2840ffd2e9 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -142,7 +142,6 @@ struct ubi_eba_table *ubi_eba_create_table(struct ubi_volume *vol,
 	return tbl;
 
 err:
-	kfree(tbl->entries);
 	kfree(tbl);
 
 	return ERR_PTR(err);
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
