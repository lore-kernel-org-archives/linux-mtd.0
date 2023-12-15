Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2F4C46CC6
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDlft5mJn0gDoDvSkGvzOpqEQYaJRfEyeShheF0CFyo=; b=MdwMeuSoc7ILxI
	hu1SqKUxFns37xdgb175Xq7oPOnwwZP0wqc/4KZ26bcG+f+APYS3dABSow6PFtWnzRWvj4jlmZNnx
	59AyqQ2QGdGUNKFBjfQFvLaVh4/EwSDq8nq2HDgLtXBq26zOXXKR0Z+9/qbhXinaVox+/G2uMdQVU
	O/vETOeptUB0NitgJkEMBxT/jVcr+T57HjsYk1gk7w0OP15YgkVn6Xwyj3VflYmhUss2cUzUwAnPE
	WV+m4bxWnz4ezDZLMtjgjm+zhwki2XKqrMYlh+guWbNglbACB9y5huI8ZMJ2/yOkxgNmoqttBOcNe
	GZOnOHtW7KWxXL2tZgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Md-003EqE-1C;
	Fri, 15 Dec 2023 12:32:23 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7MZ-003En7-2B
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:32:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B87791BF20F;
	Fri, 15 Dec 2023 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702643538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlO9c0S5HZPIZWQNNP4CRaSyaJKuJjI07FGIgD70qWE=;
	b=VptOXuHkGakzoUqE2KXejehznM+5B5rf+jb6yOVW597wY1OH/v/pveyeK8LI4FfRuWBSQU
	bQNPEjBSbJUTeC1i9/U3c4HhgN9eCtQZfGHx0NpDj4NYTIe2a5L5v7KUcQUoqPmuYKlvfE
	7BfJBo2Me+H540h1LoUAIkuophB6KxoqYQ0lr0ZFT5uppCjh23DmTjqj7VtEHHIJ5VSxc9
	3YN6aQrpulkkNf4nNqlgfUmMbdJXIIaKeqZ6dcXANaikTlEaubeccr/PxurBlhFaDhza6m
	Kfu9+dTvDuUKp1r9ycAtEqbkgjN+U0c3PzA9BaqmvJms39pOCwHR4m9o+rBfNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] mtd: rawnand: Prevent sequential reads with on-die ECC engines
Date: Fri, 15 Dec 2023 13:32:07 +0100
Message-Id: <20231215123208.516590-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-1-miquel.raynal@bootlin.com>
References: <20231215123208.516590-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_043219_846112_29855968 
X-CRM114-Status: GOOD (  11.10  )
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

Some devices support sequential reads when using the on-die ECC engines,
some others do not. It is a bit hard to know which ones will break other
than experimentally, so in order to avoid such a difficult and painful
task, let's just pretend all devices should avoid using this
optimization when configured like this.

Cc: stable@vger.kernel.org
Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 1b0a984d181d..139fdf3e58c0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5170,6 +5170,14 @@ static void rawnand_late_check_supported_ops(struct nand_chip *chip)
 	/* The supported_op fields should not be set by individual drivers */
 	WARN_ON_ONCE(chip->controller->supported_op.cont_read);
 
+	/*
+	 * Too many devices do not support sequential cached reads with on-die
+	 * ECC correction enabled, so in this case refuse to perform the
+	 * automation.
+	 */
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE)
+		return;
+
 	if (!nand_has_exec_op(chip))
 		return;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
