Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB669CD98CF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2026 06:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bFVsmgELJJmlXNF39J7CmfzIDuvWK9C6v++amT1rqmI=; b=lxevsXU7ZyAftM
	IF9/i8vk7xv5HOQ4II4xmhtpkXxJdPhffvJwXDm2gjvF3INvOjq1WQ1gQt+p3i0jieDzsfqi75UL9
	OFAsJ666eyVcFibyfKrlQX4cQttvFPchL7lP6++TAeE5clJvOJq48Yx0C+hnPOBdSTGt31XRZMXQf
	ONdsJBmit0YOqpUgMaD8Q6bAGvVY7U5VKIOig1jiEik+k4kBR3PW9w6rKB5s1hOYGoEBPW9hE9pVS
	aejcuzHHcxnwJ7S8TH1x+2K0zWvXeZfnGzdPMi63UmrpJdScY4RTLygnY1QWaejOG5DGyoBNmi9bU
	aI4Ww8ERHrWFcV0AnwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0sD-0000000DgvV-3d9x;
	Mon, 15 Jun 2026 06:32:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0s8-0000000Dgv0-44FB;
	Mon, 15 Jun 2026 06:32:38 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnGu6CnC9qMHWTEw--.34359S2;
	Mon, 15 Jun 2026 14:32:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] mtd: nand: ecc-mtk: handle ECC clock enable failures
Date: Mon, 15 Jun 2026 14:32:32 +0800
Message-ID: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnGu6CnC9qMHWTEw--.34359S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury3XF4kAF4rWrW7uw18AFb_yoW8Gw15pF
	WUC395KrWDGayjgwn7ua1UC3WakayxK395Wr98Cw1v93sYvrySyFy8JFWjvwnYvrWrGa13
	Jrsrta4kAayUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_233237_398063_710214B7 
X-CRM114-Status: GOOD (  12.09  )
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

mtk_ecc_get() gets a reference to the ECC platform device, obtains the
provider state and then enables the ECC clock before initializing the
hardware.

The clk_prepare_enable() return value is currently ignored.  If enabling
the clock fails, the code still touches the ECC registers and returns a
live ECC handle to the caller.  The provider device reference acquired
by of_find_device_by_node() is also kept even though the handle setup
failed.

Propagate the clock enable error and drop the provider device reference
on that failure path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/ecc-mtk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index c75bb8b80cc1..39be2e3e4ee4 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -265,6 +265,7 @@ static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct mtk_ecc *ecc;
+	int ret;
 
 	pdev = of_find_device_by_node(np);
 	if (!pdev)
@@ -276,7 +277,12 @@ static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	clk_prepare_enable(ecc->clk);
+	ret = clk_prepare_enable(ecc->clk);
+	if (ret) {
+		put_device(&pdev->dev);
+		return ERR_PTR(ret);
+	}
+
 	mtk_ecc_hw_init(ecc);
 
 	return ecc;
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
