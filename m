Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018CEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=edgq4xzdh+3mdX6uQmJKm/xrQXyvPypgCpRkDKGLwkg=; b=YqtfKq36PlCtyF
	5ZfE38a3HbqpB3UJHVNAElzsJ+n0IPbjhS62yvjzsnXmLLqvEbbvklQTkkSIyZR2IvMReVwoB/YVa
	hmir64ktsdDGT3/qrdN+xaV0td7OHCLndRrWUxH+IoMRqdDVWv1YqdlWVMMxMvHYfXaSD+o0VynvQ
	X4yqFOY1Cvu4pjGiCXvRZiLm4qNyi944dhVZmw1pg1l2iwx2PZEeFMI5baG1KMRhiDxmRHkkVJH1l
	fep7AG0iPwAacovRF0b8qW2XoGXDOFM8hQ7O4P/UUpPCZTVdChVUUZieNSgGa2S+JeeVJeHGyWU10
	xNnZ8hzGlWMuabVHseqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4lHO-00BpIX-1N; Tue, 04 Jan 2022 14:59:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4lHJ-00BpEZ-Uo
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 14:59:12 +0000
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-01 (Coremail) with SMTP id qwCowADHz5+vYNRhFHfGBQ--.33414S2;
 Tue, 04 Jan 2022 22:58:55 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: miquel.raynal@bootlin.com
Cc: kyungmin.park@samsung.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH v2] mtd: onenand: Check for error irq
Date: Tue,  4 Jan 2022 22:58:54 +0800
Message-Id: <20220104145854.1987853-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz5+vYNRhFHfGBQ--.33414S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr13tw18Gr4UWrWUGF15urg_yoWkArc_CF
 sa9FyxGrW0yr97u3Zxtw1fAr92kF4DWr1DZa90qrsIq345tFyFq3yDuF15ur17u34UKFy5
 Cry5X3yxAw13JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5XwCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUO4E_DUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_065910_418972_CF151B0D 
X-CRM114-Status: GOOD (  11.27  )
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

As it is possible that there is no suitable irq, platform_get_irq()
will return error number.
Therefore, it might be better to check it and return error if fails
to guarantee the success of the probe.

Fixes: 26777d37216c ("mtd: Move onenand code base to drivers/mtd/nand/onenand")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2

* Change 1. Change the commit message.
---
 drivers/mtd/nand/onenand/generic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/generic.c b/drivers/mtd/nand/onenand/generic.c
index 8b6f4da5d720..a4b8b65fe15f 100644
--- a/drivers/mtd/nand/onenand/generic.c
+++ b/drivers/mtd/nand/onenand/generic.c
@@ -53,7 +53,12 @@ static int generic_onenand_probe(struct platform_device *pdev)
 	}
 
 	info->onenand.mmcontrol = pdata ? pdata->mmcontrol : NULL;
-	info->onenand.irq = platform_get_irq(pdev, 0);
+
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		goto out_iounmap;
+
+	info->onenand.irq = err;
 
 	info->mtd.dev.parent = &pdev->dev;
 	info->mtd.priv = &info->onenand;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
