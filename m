Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AEBCA600D
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2026 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DY4RN1qigduesjAloq2WgsBBlgsjsoL2qfhPkbDJ8FE=; b=C+OTChfJBV0uWc
	R7HPFEEx4T6Es9bkJSRG3GnwVNqUdhtIQenEhwWNxh3mMeaolNyfB0MB3E27nRXuqBHpqsMAbsrPs
	b91rQNIFr2joNDHRLs2G+Qgi27WDIhTTK9fPb+kgcJuIDDH/tTf2E7fqMoRhYQ2fAFHrVZqwvoKTk
	LfHGThissmlXYz790/+RlzNbZII7DpaRQCZC8nZb+MG6cXTI7GuW4AnxPcGgTltq9w/QQv4rgVGWG
	8Sy74xdV2ib1Xewbe7DsljGUORH0kqNFdvi0e2TJpCjTG2MSotMsrSdQ5qbTetR9V1Kv187EZ6OPy
	Mf612sC4/qiLl40elBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsnQ-00000004rMT-2vKb;
	Thu, 08 Oct 2026 18:24:48 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsnN-00000004rLm-1iYy
	for linux-mtd@lists.infradead.org;
	Thu, 08 Oct 2026 18:24:47 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTDrn38dqil8QCg--.13270S2;
	Fri, 09 Oct 2026 02:24:40 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: tegra: fix OF node leak in tegra_nand_chips_init()
Date: Fri,  9 Oct 2026 02:24:42 +0800
Message-Id: <20261008182442.2770036-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTDrn38dqil8QCg--.13270S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1UWr4DAF4rAr1DCF4xCrg_yoW5Jw43pr
	WUCa90kw4jkF4xGa4Syan5Z3WYyw1xt3yUG3sa9as29wn5Jr1UGr98GFy0qFs8CFZ7C3W3
	Xr45JF18Cr45ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9jb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU5qeHPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMOA2rHpDmH8wACsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112445_850523_067EC399 
X-CRM114-Status: GOOD (  12.64  )
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

tegra_nand_chips_init() takes an extra reference on the child NAND node
with of_get_next_child() and passes it to nand_set_flash_node(), which
only stores the pointer in mtd->dev.of_node. None of the return paths,
including the successful one, drop that reference, so the device node is
leaked. The get/put pair performed by the MTD core in add_mtd_device()
and mtd_release() is balanced and cannot compensate for it.

Release the reference with of_node_put() right after the node has been
stored, and route the earlier error paths through an err_put_node label
so that they release it as well.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/tegra_nand.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..752ec3768b73 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1086,19 +1086,22 @@ static int tegra_nand_chips_init(struct device *dev,
 	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
 	if (nsels != 1) {
 		dev_err(dev, "Missing/invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_node;
 	}
 
 	/* Retrieve CS id, currently only single die NAND supported */
 	ret = of_property_read_u32(np_nand, "reg", &cs);
 	if (ret) {
 		dev_err(dev, "could not retrieve reg property: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
-	if (!nand)
-		return -ENOMEM;
+	if (!nand) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
 
 	nand->cs[0] = cs;
 
@@ -1107,7 +1110,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	chip = &nand->chip;
@@ -1119,6 +1122,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
+	of_node_put(np_nand);
 
 	if (!mtd->name)
 		mtd->name = "tegra_nand";
@@ -1141,6 +1145,11 @@ static int tegra_nand_chips_init(struct device *dev,
 	ctrl->chip = chip;
 
 	return 0;
+
+err_put_node:
+	of_node_put(np_nand);
+
+	return ret;
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
