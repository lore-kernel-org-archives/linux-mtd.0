Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C97EC43211
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R9Hg25WqZpDoNjPXgB5mvkAy/NVDZeLF17+v3sm3ZP0=; b=gbU1x5SaeB76Jf
	Pf93yGBuM9AwODWwZq6dUIUklBRH3D+fW0Kilh8BM2m3suDUtICFd8K+BHjQRAf5wFUjmcvz8KDOO
	uvR5bo5UZ4cm5S89xAF1GRZUoBMo7Z1itarPlLLm/ippGMY/TbT+LC8yZfAIzD1c15OoYgtaDSQtB
	TNq1R6FFDHLvRPuEe8pCU9Iy3eSQV1WSGtLn7D6Vl4b0wkBGzoKNygFsRyzyRz7qtdLZ82I3e/71y
	xTgIM4ZPf2NwfsIwUtluIBjBa3WsD3njkSFydq4EKeOPt0tx6vYq70dGnyO07tMsHyEqRi73v5CqE
	L00wXTEfrfUqz4PgJWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8Fi-0000000BXFt-2K9c;
	Fri, 26 Jun 2026 15:13:58 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8Fe-0000000BXFQ-2Nyt
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 15:13:57 +0000
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-01 (Coremail) with SMTP id qwCowAAHoMgtlz5qlbRrAw--.16713S2;
	Fri, 26 Jun 2026 23:13:50 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] fix: mtd: mtd_device_parse_register: fix refcount imbalance on   add_mtd_device failure and multi-call scenarios
Date: Fri, 26 Jun 2026 23:13:49 +0800
Message-Id: <20260626151349.50859-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHoMgtlz5qlbRrAw--.16713S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43GrW3JrWUJrykAF15CFg_yoW8tF48p3
	98Wa95A34jgr4j9w4DW3WDWFWUWF92y3yrur47Gw12kws5G34YqFZ8KFy7Ww1UtrWxCF4j
	qF4xXws5Ca18A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjd-PU
	UUUUU==
X-Originating-IP: [117.182.75.66]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgMKA2o+h0EucAACsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_081355_097937_DDF1BCA1 
X-CRM114-Status: GOOD (  11.31  )
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

add_mtd_device initializes mtd->refcnt via kref_init unconditionally. The
  cleanup in the out label only calls del_mtd_device when
  device_is_registered is true. When add_mtd_device fails before
  device_register, the refcnt is left at 1 (leak). Conversely, when
  CONFIG_MTD_PARTITIONED_MASTER is disabled and the device was already
  registered by a prior call, the error path incorrectly calls
  del_mtd_device without a matching add_mtd_device in this invocation,
  causing a refcount underflow.

Track whether add_mtd_device succeeded in this invocation with a
  registered flag, and only call del_mtd_device on error when registered is
  true.

Cc: stable@vger.kernel.org
Fixes: 1c4c215cbdcb ("mtd: add new API for handling MTD registration")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/mtdcore.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 576537774628..59d8a6c61f55 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1108,6 +1108,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      int nr_parts)
 {
 	int ret, err;
+	bool registered = false;
 
 	mtd_set_dev_defaults(mtd);
 
@@ -1119,6 +1120,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		ret = add_mtd_device(mtd);
 		if (ret)
 			goto out;
+		registered = true;
 	}
 
 	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
@@ -1136,9 +1138,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		ret = 0;
 	else if (nr_parts)
 		ret = add_mtd_partitions(mtd, parts, nr_parts);
-	else if (!device_is_registered(&mtd->dev))
+	else if (!device_is_registered(&mtd->dev)) {
 		ret = add_mtd_device(mtd);
-	else
+		if (!ret)
+			registered = true;
+	} else
 		ret = 0;
 
 	if (ret)
@@ -1170,7 +1174,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		nvmem_unregister(mtd->otp_factory_nvmem);
 	}
 
-	if (ret && device_is_registered(&mtd->dev)) {
+	if (ret && registered) {
 		err = del_mtd_device(mtd);
 		if (err)
 			pr_err("Error when deleting MTD device (%d)\n", err);
-- 
2.39.5 (Apple Git-154)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
