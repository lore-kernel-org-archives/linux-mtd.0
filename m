Return-Path: <SRS0=qtYn=W6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A028C3A59E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 02:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFDAF2087E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 02:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDKRKL/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFDAF2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpUT70qc5AU5gMoskBefriBhfOdm4AzRtYjGrJmIsuo=; b=VDKRKL/EFtQlHI
	zZiV8bFys7HE7nKq4PX1vTa3o3a43aDQY3IpaPoRxeixPTBlUzrHU1cyhvNyl2GC3I9rdZjwoYlKM
	lWD9FPQSSRdxm7gx8l4XW0vzhscA9ANOt5qBVYAwAlzyPZDEmnZYd0slj/4WThcB1pn8LfryenGJj
	Z1bJUDKL3R0wS+4QPDbJzEQgQJcsOVw7HB1WivH7BHwl5M1hCI4N7GA7UKXKiAPNKbzZaOtPYJ6eU
	KAf+nD0xsMOxzsuXjq960fGEcJpmB5f9RcTQj5MTx/Xqps2piL5E1P8a7dS4weV/C3V7/eaVjuLu+
	IhXggHQFSWDgIgWBu9MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4ypn-0004JT-Hq; Tue, 03 Sep 2019 02:46:19 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4ypU-00047s-6a
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2019 02:46:01 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 450D8DC4AF3B0BF14816;
 Tue,  3 Sep 2019 10:45:55 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
 10:45:45 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: pmc551: remove set but not used variable 'soff_lo'
Date: Tue, 3 Sep 2019 10:52:30 +0800
Message-ID: <1567479150-97127-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567479150-97127-1-git-send-email-zhengbin13@huawei.com>
References: <1567479150-97127-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_194600_414648_5C85145D 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/mtd/devices/pmc551.c: In function pmc551_erase:
drivers/mtd/devices/pmc551.c:142:15: warning: variable soff_lo set but not used [-Wunused-but-set-variable]
drivers/mtd/devices/pmc551.c: In function pmc551_read:
drivers/mtd/devices/pmc551.c:232:15: warning: variable soff_lo set but not used [-Wunused-but-set-variable]
drivers/mtd/devices/pmc551.c: In function pmc551_write:
drivers/mtd/devices/pmc551.c:289:15: warning: variable soff_lo set but not used [-Wunused-but-set-variable]

It is not used since commit cdf0a7d16980 ("[MTD]
pmc551 whitespace cleanup")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/mtd/devices/pmc551.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 3b89ab2..6597fc2 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -135,7 +135,7 @@ static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
 static int pmc551_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct mypriv *priv = mtd->priv;
-	u32 soff_hi, soff_lo;	/* start address offset hi/lo */
+	u32 soff_hi;		/* start address offset hi */
 	u32 eoff_hi, eoff_lo;	/* end address offset hi/lo */
 	unsigned long end;
 	u_char *ptr;
@@ -150,7 +150,6 @@ static int pmc551_erase(struct mtd_info *mtd, struct erase_info *instr)
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_hi = instr->addr & ~(priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);
-	soff_lo = instr->addr & (priv->asize - 1);

 	pmc551_point(mtd, instr->addr, instr->len, &retlen,
 		     (void **)&ptr, NULL);
@@ -225,7 +224,7 @@ static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t * retlen, u_char * buf)
 {
 	struct mypriv *priv = mtd->priv;
-	u32 soff_hi, soff_lo;	/* start address offset hi/lo */
+	u32 soff_hi;		/* start address offset hi */
 	u32 eoff_hi, eoff_lo;	/* end address offset hi/lo */
 	unsigned long end;
 	u_char *ptr;
@@ -239,7 +238,6 @@ static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
 	end = from + len - 1;
 	soff_hi = from & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
-	soff_lo = from & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);

 	pmc551_point(mtd, from, len, retlen, (void **)&ptr, NULL);
@@ -282,7 +280,7 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
 			size_t * retlen, const u_char * buf)
 {
 	struct mypriv *priv = mtd->priv;
-	u32 soff_hi, soff_lo;	/* start address offset hi/lo */
+	u32 soff_hi;		/* start address offset hi */
 	u32 eoff_hi, eoff_lo;	/* end address offset hi/lo */
 	unsigned long end;
 	u_char *ptr;
@@ -296,7 +294,6 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
 	end = to + len - 1;
 	soff_hi = to & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
-	soff_lo = to & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);

 	pmc551_point(mtd, to, len, retlen, (void **)&ptr, NULL);
--
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
