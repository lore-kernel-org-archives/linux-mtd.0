Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA33C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 21:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4k1Ej587dOMynYHKWC9bZWwJKZbdmJHaR37QxlhItKU=; b=sklen4MrbCXny7
	30iEn7/ijymf/+tBuQUUXctt8E0kPAcH6iJv87QQsEj6yl8KgunTqWTAjeLpTHRx3uEg6yt05Hi/M
	lqkTygEI8rGKEhbiokTJ+dS1729n5H8hzU+uwIYLPpU4ZYtwkMh2Y2v5tdFb1pXysWmOBGwN/Tboh
	VpqcKEqzelLtYp6EXKZeTkEm4G+x1bhrFtoteckbbQGCFWPZtJT0oaRqfnaBgCuAVEg9wNeA/nR4k
	NMRUb51uUTCL0jYcRzYjUFwMXkcsj6WQnMLUJf7G7Kg6/IbXk5aMFdWOorictOISk/PkiZdTkVPNB
	RfiQsD9qYU91+dYy43og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF8t-0091Wm-1X;
	Wed, 19 Jul 2023 21:55:31 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF8o-0091Rk-2L
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 21:55:29 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id MF8dq7PjtT4RdMF8dqgUPy; Wed, 19 Jul 2023 23:55:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1689803720;
	bh=HzYBbxpYE3IX2TCrR04zl6ewdpf4XKvAL64ilNVr08Q=;
	h=From:To:Cc:Subject:Date;
	b=W1NWYKvSI/IzA7HjoHwC98Y8+GYqVdCL4/63SaTE73QP5Tg/gmXrjVOb2UzIVucqK
	 8kirPYqzz8TCyTkAtxGHAzDl47IEL+CzjI52G8Oms5gj3loRQVbGTGE7lfJlF1Lu2Y
	 +uL94r2Li4n6CHv1cgQX/Ca8F9guUE/gCpQayQta9w0n65amj58int/64YPOZdkddz
	 Qwq8YRpSE1FmGApi1LQcuMRCksXOwW31Ge2Ys14pHP/f4q07yN+lt3vq2gK/AkFGvL
	 zHFqET3z6QgoEznR+fT8w90jfHYLXCQTiHjB6CasG3lG97yta0aCEWYSQnYg4TIF+B
	 a/0WIDdo1ndBQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Jul 2023 23:55:20 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
Date: Wed, 19 Jul 2023 23:55:01 +0200
Message-Id: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_145527_231434_BA82E828 
X-CRM114-Status: GOOD (  12.33  )
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

'op-cs' is copied in 'fun->mchip_number' which is used to access the
'mchip_offsets' and the 'rnb_gpio' arrays.
These arrays have NAND_MAX_CHIPS elements, so the index must be below this
limit.

Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
would lead to out-of-bound accesses.

Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/raw/fsl_upm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f1810e2f2c07..0c67fd1347c4 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -135,7 +135,7 @@ static int fun_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	unsigned int i;
 	int ret;
 
-	if (op->cs > NAND_MAX_CHIPS)
+	if (op->cs >= NAND_MAX_CHIPS)
 		return -EINVAL;
 
 	if (check_only)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
