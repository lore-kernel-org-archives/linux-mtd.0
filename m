Return-Path: <SRS0=X2Oj=XT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FC3C432C1
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 07:24:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B953214D9
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 07:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQIDAEDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B953214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cT1SfRtTaE7Uy7fi7KaFz5KRjlrE4p3lS3c4J4ArJOs=; b=GQIDAEDUUctRhT
	7zvW8XBBN5wKme7cdUz7CgFgdSa9IYjdHsibJYsJ3kaHtMt7EaQ/XAJworWCZ5RvHMdhTrfJeYPso
	dXH/lPjp1P188UoRuOI1C4/pBl6DZ1tl2kGgQFXDB3V8lf1Tp6hTRBCDq2FX1fJnNxV5CvyRx4K2S
	3TjYwX4ybfeQyOwF+4i82IKM5wy7nlBeB6Na+dazNH+COdBjJ2LKCFYIMt7JijRh2lzIYmRO1db+2
	YLlfVKebisf441FXFtRc1AW8n2ysOk4xrMfQvpN3qSC5tM7VU2PYu9+fXZH/XZBaZJGR1fR0AZwQS
	LWg5kiVa0Fm26d0WiuBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCfBp-0001mW-6N; Tue, 24 Sep 2019 07:24:49 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfBk-0001lV-Qd
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2019 07:24:47 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 01B38E9F53F00F1380C1;
 Tue, 24 Sep 2019 15:24:41 +0800 (CST)
Received: from SZXY1Y004550421.china.huawei.com (10.61.99.243) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 15:24:32 +0800
From: Huaijie Yi <yihuaijie@huawei.com>
To: <joern@lazybastard.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <richard.weinberger@gmail.com>, <vigneshr@ti.com>, <richard@nod.at>
Subject: [PATCH v3] mtd: fix oops when writing to phram device on arm64
Date: Tue, 24 Sep 2019 07:24:13 +0000
Message-ID: <1569309853-14372-1-git-send-email-yihuaijie@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.61.99.243]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_002445_080747_19C3FF48 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: yihuaijie <yihuaijie@huawei.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: yihuaijie <yihuaijie@huawei.com>

memcpy() to memory remaped by ioremap() at an address not aligned
to 8-bytes will cause oops on arm64 platform, fixing this by using
ioremap_wc().

e.g.
writing through jffs2 on a phram device cause following error:

Unable to handle kernel paging request at virtual address ffffff800f93700c
pgd = ffffffc00385c000
[ffffff800f93700c] *pgd=0000000000000000, *pud=0000000000000000
Internal error: Oops: 96000061 [#1] PREEMPT SMP
task: ffffffc003549b10 task.stack: ffffffc0b8bc8000
PC is at __memcpy+0xc0/0x180
LR is at phram_write+0x5c/0x78 [phram]
pc : [<ffffff8008484740>] lr : [<ffffff8000d731a4>] pstate: 80000005
sp : ffffffc0b8bcb8c0
x29: ffffffc0b8bcb8c0 x28: 000000000093700c
x27: 0000000000000001 x26: 0000000000000000
x25: 0000000000000001 x24: 0000000000000000
x23: ffffffc5b6db8480 x22: ffffffc0b8bcb990
x21: ffffff800f000000 x20: 000000000093700c
x19: 0000000000000044 x18: 000000000000000a
x17: 0000000000000c00 x16: 0000000000000400
x15: 000000000001e125 x14: 34347830203a6e65
x13: 6c202c6330303733 x12: 397830203a726464
x11: 61202c3030303030 x10: 3066303038666666
x9 : 6666667830203a56 x8 : 0000000298f7fb1d
x7 : 00000044e0021985 x6 : ffffff800f93700c
x5 : 0000000000000000 x4 : 0000000000000000
x3 : ffffff8008cbe018 x2 : ffffffffffffffc4
x1 : ffffffc5b6db8490 x0 : ffffff800f93700c

Signed-off-by: Huaijie Yi <yihuaijie@huawei.com>
---
v1->v3
let user to choose using ioremap() or ioremap_wc() through module param

 drivers/mtd/devices/phram.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286..a5833dd 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -27,6 +27,20 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 
+/*
+ * It is of the form:
+ * wc=Y/N for module case
+ * phram.wc=Y/N for built-in case
+ */
+static bool wc;
+module_param(wc, bool, 0);
+MODULE_PARM_DESC(wc, "How we remap reserved memory to a phram device\n"
+		"\tSay N(default) to use ioremap(): \"wc=N\"\n"
+		"\tSay Y to use ioremap_wc(): \"wc=Y\"\n"
+		"\tOn ARM64, writing to phram device using ioremap()\n"
+		"\tat addr not aligned to 8-bytes will cause oops,\n"
+		"\tioremap_wc() could fix it.");
+
 struct phram_mtd_list {
 	struct mtd_info mtd;
 	struct list_head list;
@@ -98,7 +112,11 @@ static int register_device(char *name, phys_addr_t start, size_t len)
 		goto out0;
 
 	ret = -EIO;
-	new->mtd.priv = ioremap(start, len);
+	if (wc)
+		new->mtd.priv = ioremap_wc(start, len);
+	else
+		new->mtd.priv = ioremap(start, len);
+
 	if (!new->mtd.priv) {
 		pr_err("ioremap failed\n");
 		goto out1;
-- 
1.8.5.6



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
