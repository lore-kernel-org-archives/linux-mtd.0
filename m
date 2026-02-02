Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF61E6529F
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Feb 2026 01:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0jCu7t5rsXvNOUFtuiCtJTDKDoykKBJqfx3D6yi/lw=; b=k1Rx04GZ9jJQRA
	d6ZSfZmDGD6p9l3DNeKDSbJhvKotlDlkeA5uKywb8ZOhkzdrEX1iZiCxWzLsGSfTyatIzqOuKeoTM
	q8/wVHEFL/4w3Wni87lDNpuIqApiSzJwetp6YAvM0a9rPFYZUF/fbpNrgnrDLo1VmWrsAkNF4bkLu
	1kmGEG+N1k2W9aWTx6qXFwbYD+5tFlMhqa0Svti3/EC5PAYyZN+pmZ6l4/7DbSeB9wrmeQGfM7+Sx
	hWxiYeKbYKWJArAMkWSchSuYsdxz0+nDQXUz5sC/3AwfTDPB94BQqY54tpKvLyI2GTjF60piE9pTx
	g6H1/G+kZ98IgeISKn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmisb-00000004J75-2A8x;
	Mon, 02 Feb 2026 01:37:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmisZ-00000004J6I-1xVw
	for linux-mtd@lists.infradead.org;
	Mon, 02 Feb 2026 01:37:29 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACHLmrS_39pVZv0Bg--.4921S2;
	Mon, 02 Feb 2026 09:37:22 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	s-k6@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] mtd: spinand: winbond: Remove unneeded semicolon
Date: Mon,  2 Feb 2026 09:36:33 +0800
Message-Id: <20260202013633.3696155-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHLmrS_39pVZv0Bg--.4921S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DWr4xJrWrZrb_yoW3Gwb_CF
	1IqFWI9rn7CF9rt3WrK395Z34jyw4Uuw4xuF9IgwsxGayUZryxX34vvFnruw1jv345tF98
	A3yFq342yw43GjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7VU1xu4UUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_173727_883853_0E95D8D7 
X-CRM114-Status: UNSURE (   7.79  )
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

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 8430ae307be0..6dfd0dcc8ee7 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -408,7 +408,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 		break;
 	default:
 		return -EOPNOTSUPP;
-	};
+	}
 
 	dummy_cycles = ((ref_op->dummy.nbytes * 8) / ref_op->dummy.buswidth) /
 		(ref_op->dummy.dtr ? 2 : 1);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
