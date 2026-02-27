Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8741EFD9E29
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Feb 2026 01:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zySyHLFW58FILRExe5rdqF3fr83Ve789nIUF8vdkeOs=; b=xfWxqegA6p2hsG
	Z5YP7j4kK1dq3WqulOriZy9PfZgZUlG6dRrijY+0W3VWR9kqEgFq5f0gnC51Gd3nX2jpxxswdT954
	Eq7SgE9VbXXfc2n6RHdCy4f1z6W8S3CYEdfNQXsKlAVQQt7iBr/Zk7XaV71FgM8wafpHIsaxvYfi+
	yuamj9ki7d09iSlYBbeZdc/s+jf7jXwPxD7qumtggBPdSfKWKaqRxTw+36/rTjb7NzcLGqmo/NgpU
	ySqmicHNkmsQMeGoqFaXL+9dvMmUlNIjaHuTpFk7Rl9BavxvTWYidB9mwIOxrQHakuSFOF49Nvst1
	bGbY1eCL2kCSc25tsWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmu1-00000007Uze-41RM;
	Fri, 27 Feb 2026 01:44:25 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmty-00000007UzL-1jYo
	for linux-mtd@lists.infradead.org;
	Fri, 27 Feb 2026 01:44:24 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAD3Ednv9qBpIP9iCQ--.42639S2;
	Fri, 27 Feb 2026 09:44:15 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linusw@kernel.org,
	bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] mtd: physmap_of_gemini: Fix disabled pinctrl state check
Date: Fri, 27 Feb 2026 09:43:36 +0800
Message-Id: <20260227014337.3938091-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3Ednv9qBpIP9iCQ--.42639S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF48tw1fGFyfJry8Zw43Jrb_yoWkurb_Ca
	17ZFs2qr15WFZFvF1Igr40va409ayj9F18ur48X398t34UJrWjqayqv3y3Cr18Xr45KF9x
	Gw13Xr1Y9wsIyjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
X-CRM114-CacheID: sfid-20260226_174422_849243_319318BB 
X-CRM114-Status: UNSURE (   8.68  )
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

The condition for checking the disabled pinctrl state incorrectly checks
gf->enabled_state instead of gf->disabled_state. This causes misleading
error messages and could lead to incorrect behavior when only one of the
pinctrl states is defined.

Fix the condition to properly check gf->disabled_state.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/mtd/maps/physmap-gemini.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-gemini.c b/drivers/mtd/maps/physmap-gemini.c
index 9d3b4bf84a1a..1c34b4ef77ea 100644
--- a/drivers/mtd/maps/physmap-gemini.c
+++ b/drivers/mtd/maps/physmap-gemini.c
@@ -181,7 +181,7 @@ int of_flash_probe_gemini(struct platform_device *pdev,
 		dev_err(dev, "no enabled pin control state\n");
 
 	gf->disabled_state = pinctrl_lookup_state(gf->p, "disabled");
-	if (IS_ERR(gf->enabled_state)) {
+	if (IS_ERR(gf->disabled_state)) {
 		dev_err(dev, "no disabled pin control state\n");
 	} else {
 		ret = pinctrl_select_state(gf->p, gf->disabled_state);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
