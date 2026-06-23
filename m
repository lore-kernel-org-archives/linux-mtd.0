Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA3BCDB466
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2026 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p7NAAw02NdHQXpGO9mKTYqc5fHqsiIpZ4o5eAdfQG/0=; b=4JjnsR5AObHqm0
	82GSyMXsroYU1srUgR52qlFbPB5qcLd+xhCJn+uaq8Pg3tCzVSxIVji18hcaMPcNOZAAxTAq+fC1A
	j7PPgeKn1+GoAh7Hnf11ewFz2YVSKU5+sVBNdRoL/zgkSduHCyr8Y0LslrdF3d5oyHFYWTzakNfTd
	Vwrl+06mmnM370cWIICTdZmU9W3yKnw6Y6Ha6EElagiKA9deSxHL8p3DCfnWsGA7P9p7wOgnC1DzJ
	K4nI+u80uSLhWwGQvn/FBg88t8PpxVFEyyu99VMGr0MSIjQ6FYMy5FGP9VYDjVExHAvF5GKuA6eST
	osfs1I1Axz6bgnABgV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqKd-00000005Z7I-2QzC;
	Tue, 23 Jun 2026 01:53:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqKZ-00000005Z6e-232z
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jun 2026 01:53:42 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3RMge5zlqnrXCFA--.10036S2;
	Tue, 23 Jun 2026 09:53:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] mtd: mtdswap: remove debugfs stats file on teardown
Date: Tue, 23 Jun 2026 09:53:17 +0800
Message-ID: <20260623015317.23393-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3RMge5zlqnrXCFA--.10036S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury7JFWkKr1kuFWDCFyUJrb_yoW8WFy7pa
	n8Wa9xGws5Ar17ta9rC34UAFyfJwn5u3yUG3yUu3ySvw1fAw13ZFyqyFWFqryxWa4kGFWU
	Xr4rJw1DJr1Ikr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQo7
	NUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_185339_898634_EA4EDCBD 
X-CRM114-Status: GOOD (  11.94  )
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

mtdswap_add_debugfs() creates an mtdswap_stats debugfs file under the
per-MTD debugfs directory, but mtdswap_remove_dev() never removes it
before freeing the mtdswap_dev.

Store the returned dentry and remove it during device teardown before the
driver-private state is freed.

Fixes: a32159024620 ("mtd: Add mtdswap block driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260615090850.80659-1-pengpeng@iscas.ac.cn/
- call debugfs_remove() unconditionally, as it already handles NULL and
  error pointers
- use an octal mode for the new debugfs_create_file() line

 drivers/mtd/mtdswap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 866933fc8426..f33f753f0a9f 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -125,6 +125,7 @@ struct mtdswap_dev {
 
 	char *page_buf;
 	char *oob_buf;
+	struct dentry *debugfs_stats;
 };
 
 struct mtdswap_oobdata {
@@ -1262,7 +1263,8 @@ static int mtdswap_add_debugfs(struct mtdswap_dev *d)
 	if (IS_ERR_OR_NULL(root))
 		return -1;
 
-	debugfs_create_file("mtdswap_stats", S_IRUSR, root, d, &mtdswap_fops);
+	d->debugfs_stats = debugfs_create_file("mtdswap_stats", 0400, root,
+					       d, &mtdswap_fops);
 
 	return 0;
 }
@@ -1463,6 +1465,7 @@ static void mtdswap_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct mtdswap_dev *d = MTDSWAP_MBD_TO_MTDSWAP(dev);
 
+	debugfs_remove(d->debugfs_stats);
 	del_mtd_blktrans_dev(dev);
 	mtdswap_cleanup(d);
 	kfree(d);
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
