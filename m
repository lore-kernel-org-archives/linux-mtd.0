Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35786CD98C5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2026 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HI/3M/KsKvJF5WvX4xQmC8LmeIkl03zJGsXWVmGqnfY=; b=dtoiuPxnskL6Ll
	FIZ+uAz6T9NmGVtUbXBUbKp2huGCLKP7vSA8Fv2FDWyh6L1FQD8zJO0pdLosUR7wYcpVtlpeOXAT4
	breqSPMNs4G86xxTxsQnHRN1mMH/s/a5vpoR6Nuex7hdp3SumlpkQMuM0JzOXlKukh0P7+nMFJUPo
	MzJPbYed5kY02hYU8dyFpiWj75E8xVni1ap57qeDaaTbvDC3Z+sy193c0pDdQeNDvOZ4TkfSUR1jx
	+TsI8RSUXQViU5MqZsfTHd4pLdssu0yryYmAZyu15ExFZM20TDFRRq/M+Z8/TU3cx/nPGDxHhHiyp
	u4Lfl7mNS0w2GLuDKnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0tA-0000000Dh3K-11cb;
	Mon, 15 Jun 2026 06:33:40 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0t6-0000000Dh2s-44Dm
	for linux-mtd@lists.infradead.org;
	Mon, 15 Jun 2026 06:33:39 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHkcS+nC9q+3qTEw--.38990S2;
	Mon, 15 Jun 2026 14:33:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] mtd: rawnand: ingenic: handle ECC clock enable failures
Date: Mon, 15 Jun 2026 14:33:32 +0800
Message-ID: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHkcS+nC9q+3qTEw--.38990S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww43tr48ZryrCw18Gw1kGrg_yoW8GFWUpF
	WUJayjkay8WF10kw47Ja1Uua45uw1Iv3yxuFy5A3Wv93Z5AF18ta48J34qvFs5Zw48C3W3
	Jw17tF1rCryUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUL0edUUU
	UU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_233337_818145_E42865AC 
X-CRM114-Status: GOOD (  10.72  )
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

ingenic_ecc_get() obtains a provider device reference and then enables
the ECC clock before returning the ECC handle.

The clk_prepare_enable() return value is currently ignored.  If enabling
the clock fails, the function still returns the ECC handle and keeps the
provider device reference even though the acquire operation did not
complete.

Return the clock enable error and drop the provider device reference on
that failure path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index 525c34c281b6..beb033705cf3 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -67,6 +67,7 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct ingenic_ecc *ecc;
+	int ret;
 
 	pdev = of_find_device_by_node(np);
 	if (!pdev)
@@ -78,7 +79,11 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 	}
 
 	ecc = platform_get_drvdata(pdev);
-	clk_prepare_enable(ecc->clk);
+	ret = clk_prepare_enable(ecc->clk);
+	if (ret) {
+		put_device(&pdev->dev);
+		return ERR_PTR(ret);
+	}
 
 	return ecc;
 }
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
