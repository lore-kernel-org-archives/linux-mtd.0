Return-Path: <SRS0=kP7/=XR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BBCC3A5A2
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 06:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E6A20830
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2019 06:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAR5imTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E6A20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zG8C1iWyuue+i+8V0cDnaQHMFNmV3GjoVzCAY9+4+PQ=; b=RAR5imTSWvSAxl
	Wgiq8IRGQCPK/ZYR50B6VYYzDCMsCaJofDUKg1gmaylf7cmaKLS0KSApS0ObJ9bDwAYXOCzVIqO2N
	hOP++KiSCHu/6PqTlL3lfj0tVFbv782KLpRyWzGzOLW8mtUTZgju6HcTx01bHY8hqct9Sp7lsMTCS
	3K6a+bmTqBOVM6VdryEmawdTrDxIHR8IaDAOsxqu+GTWdaMBdcrQw8gLrQNNBxjWpM79wPSCcmLIj
	mvOURPYd7k6SG/B/ywAnvbQIDUVg+QMeQUFKNH8hzo8HLcOVbi3xnDA/1kxN+5FWtUO7AuDEQeNAI
	UfF9+xBvtbr2yu2flUPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBvWA-0006SH-CJ; Sun, 22 Sep 2019 06:38:46 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBvW7-0006Ro-2g
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2019 06:38:44 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 04315E8AA83B1E129DA4;
 Sun, 22 Sep 2019 14:38:35 +0800 (CST)
Received: from SZXY1Y004550421.china.huawei.com (10.61.99.243) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Sun, 22 Sep 2019 14:38:26 +0800
From: Huaijie Yi <yihuaijie@huawei.com>
To: <joern@lazybastard.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <richard.weinberger@gmail.com>, <vigneshr@ti.com>, <richard@nod.at>
Subject: [PATCH v2] mtd: fix oops when writing to phram device on arm64
Date: Sun, 22 Sep 2019 06:37:51 +0000
Message-ID: <1569134271-1652-1-git-send-email-yihuaijie@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.61.99.243]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_233843_293812_BF027891 
X-CRM114-Status: UNSURE (   7.04  )
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
v1->v2:
fix this only on ARM64 arch.

 drivers/mtd/devices/phram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286..89ca8bb 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -98,7 +98,11 @@ static int register_device(char *name, phys_addr_t start, size_t len)
 		goto out0;
 
 	ret = -EIO;
+#ifdef CONFIG_ARM64
+	new->mtd.priv = ioremap_wc(start, len);
+#else
 	new->mtd.priv = ioremap(start, len);
+#endif
 	if (!new->mtd.priv) {
 		pr_err("ioremap failed\n");
 		goto out1;
-- 
1.8.5.6



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
