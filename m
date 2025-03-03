Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E0CC282CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mSh30hQYjP7D8sfbQ4M4+dqWQ+Hn6jd+Aja3jtTFbTg=; b=fjXdB0wc4hgLCE
	GGZCjTPfbpJfifwbJRVQ/3lVz0eKRlzhO0Mk5Qd61LayCmK3oX0vhYbcOPYmbPuSB3RA/kuaHowjR
	Oqa0hT4zm2U9K00ubRk+MCkmP4EcostJNpG55I6CUYCweR2ElWNDs5AZamLIpY4pQNYPuoH89dqUA
	IPq9d3kHLk8gjWoZKWRLzNeqsM8Xhz0sfTtBTRJfAXOYgMEcemVCIiIi2yjVYKKLmTP0eLRO6Kpfa
	uijOlQA8SiKWvhLZd+8byoyuzB/8I1M1f2y/vJOyuzaDH6W+rvZ8DYm4i55SiYXbZA5xSnlPDz7PI
	RNwX60R1CqofdpB7lAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7A7-00000001BAn-15NM;
	Mon, 03 Mar 2025 14:52:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7A2-00000001B8e-2wfO
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 14:52:53 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAAHNPs4wsVn3GcUEg--.8516S2;
	Mon, 03 Mar 2025 22:52:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: Fix error handling in mtd_device_parse_register() error path
Date: Mon,  3 Mar 2025 22:52:23 +0800
Message-ID: <20250303145223.1748-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHNPs4wsVn3GcUEg--.8516S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XFy8ArWUJFyDZF4kJw1fWFg_yoW8Jr1Upw
	45Wayqk3yUKr4j9w4DZrWDCFy5K3s7tw1ruFZrG342grn5t345tFZ8tF1UAw1UKry8Gayj
	qrWSqr4kGa18AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0KA2fFsHQ0fgAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_065251_122626_B3BBADAA 
X-CRM114-Status: UNSURE (   9.26  )
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

Check and log del_mtd_device() failures. Print an error message
with pr_err() to prevent silent failures, but preserve the original
error code instead of propagating the secondary error since
del_mtd_device() is already in an error handling path.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/mtdcore.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..a7b01ed37f42 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1053,7 +1053,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
-	int ret;
+	int ret, err;
 
 	mtd_set_dev_defaults(mtd);
 
@@ -1105,8 +1105,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		nvmem_unregister(mtd->otp_factory_nvmem);
 	}
 
-	if (ret && device_is_registered(&mtd->dev))
-		del_mtd_device(mtd);
+	if (ret && device_is_registered(&mtd->dev)) {
+		err = del_mtd_device(mtd);
+		if (err)
+			pr_err("Error when deleting MTD device (%d)\n", err);
+	}
 
 	return ret;
 }
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
