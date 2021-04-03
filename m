Return-Path: <SRS0=kPH0=JA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03936C43460
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Apr 2021 06:11:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD15600D4
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Apr 2021 06:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD15600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r/SutdYZlwvNBcTx+p93k+h7NlPR3eyxCZUvfZ0+OU0=; b=OUpQIM9/ObSXu7sdiXQo2prlO/
	Zu1F5hTZz8HIjW4qhl6GrodSuRhohr+tsTRbvp6isXBPoZtAFK9ILe8amKdboWKUw3L51oPEiYgmp
	E42c/ttgXBJcTaWzW/o1E9aAnUnvi1OqBCqOfQgTupJhefv04m1Yvf5X5fzwr7XyzxUvnUzALw5d3
	gC74lTwcwDm5KAy1Dt4aByEuNKE1IsjdyKAdnDQ5HEAbzjXTJDRakE4qYcKn9y9KnruS1Xo8eLLmT
	Fp8b1k0dk2NNeDNv4n65HlDJE5mvvR2nTXbna9naRMAaZJ7QbPZoAvk9yOp+6Jzn5vbYk3SDs7RQK
	MquhHKkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSZTM-00ELDT-Kf; Sat, 03 Apr 2021 06:09:28 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lSZTH-00ELCo-1r
 for linux-mtd@lists.infradead.org; Sat, 03 Apr 2021 06:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=qvyDwjK3gB
 UMTEGBVUtjhKDw8xoAbkmOgHLuEiQzyI0=; b=aDf5WqUXQcYzjU906LFwIrXNti
 1V7A3eKqAQARjHrDn5lS745f2rvKBm01WsvzQJLaug4CmPMdnYZ7CAQ3X0RBWaqh
 6I8R+hzb6yDq6iWYtVA4R9tMYZ7g+NY4hXwN78R7jjrZaCKXpdPyGZ10WwpNs9F0
 A6IFLP1/41Q5HysZo=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygC3vn6DBmhg3HGPAA--.1127S4; 
 Sat, 03 Apr 2021 14:09:07 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: han.xu@nxp.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: [PATCH] mtd: nand: gpmi: Fix a double free in gpmi_nand_init
Date: Fri,  2 Apr 2021 23:09:05 -0700
Message-Id: <20210403060905.5251-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3vn6DBmhg3HGPAA--.1127S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWDGF45Wry7WFy7WF4fGrg_yoW8GrWDpr
 Wa9anrGF4qqrWkt3ZrZa1rZr15Aan5Wry8GFW5W34rZFnIqr4j9F9rtF12vF47uF4UtF4x
 Xrn8Wwn8Ar4UAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUjylk7UUUUU==
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_070924_498748_5E57D88F 
X-CRM114-Status: UNSURE (   9.38  )
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

If the callee gpmi_alloc_dma_buffer() failed to alloc memory for
this->raw_buffer, gpmi_free_dma_buffer() will be called to free
this->auxiliary_virt. But this->auxiliary_virt is still a non-NULL
and valid ptr.

Then gpmi_alloc_dma_buffer() returns err and gpmi_free_dma_buffer()
is called again to free this->auxiliary_virt in err_out. This causes
a double free.

As gpmi_free_dma_buffer() has already called in gpmi_alloc_dma_buffer's
error path, so it should return err directly instead of releasing the dma
buffer again.

Fixes: 4d02423e9afe6 ("mtd: nand: gpmi: Fix gpmi_nand_init() error path")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 3fa8c22d3f36..4d08e4ab5c1b 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2449,7 +2449,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	this->bch_geometry.auxiliary_size = 128;
 	ret = gpmi_alloc_dma_buffer(this);
 	if (ret)
-		goto err_out;
+		return ret;
 
 	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
