Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E9CC561F8
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l99G6aHVuGuWuc0MLw+YeAavlHdO+yPQUeO7mXbFlOU=; b=ruaUKa42DNoc0t
	/8O2yLzU+1nfivp/MbBibiDabGD79nQs1rVlldOIXaQsepvKqcKBthk4uGrJ2t5jiJqwIhbcIkCWv
	tc0n8/XxgcJ3LLfMsDaXjmXqYamWHLXArzrL2PJLnNTqZrvbsB7w1uL+HQp3X5w0ft6ap163v5vWq
	V8Y78oJQkcF/85VXHQmt5U6irw/TpxJCnamRmjmNkaRUju62TRlrJJMYCClToBQtrC9zb0BXM0vNn
	OAteUDuXZ9o/AIpbb0a3blffccU2tVEO/eea5uqAhSaMM7H5I+EjXYNW3rMx2iiNNW+nYL9l4Ts5L
	nA2+7xpC2XMLqAXqTnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl1-00000001zq3-0lce;
	Tue, 04 Aug 2026 14:04:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl0-00000001zp6-0knw
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iTQYlBDs/bVQ9FRAwNXdzhTcN1NpJA7o3fDKZXJzBbg=; b=W+1L/s7Hdb0M4PlSynF8w/o2sU
	ZM3ZoTDC6+Lki1Ors9upLbuiYP93UkE0+O9/ArlrUwZfKtgGDEuBKkbf49MQM7r6fR8hVesDKpGVO
	wzzes5u39FVQjpnLQLJpXvYCprT7el2RvCB0xllqMKd4b6r9iOeOCLTAEnKXP/aw7hPSFxJ78Mmb5
	8vawPZdyRegQTzHo3Qtpq0noe6YvCVT0rGggA/zyNp/XKJ3ysChyj+kjc+x2opRkk9z67pWwjVgk2
	ijBXLnYLYqxe5rN5qAt6WbCmD2OpeYBy/FJOgx36nmLVchxuwVNp3BZeDqOa24lnjtHshdA7eKVJZ
	S0OZ+O2g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFkw-00000009yGJ-3D4n
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 249594E410DD;
	Tue,  4 Aug 2026 14:04:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBA5B6029E;
	Tue,  4 Aug 2026 14:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBA6011C32D2A;
	Tue,  4 Aug 2026 16:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iTQYlBDs/bVQ9FRAwNXdzhTcN1NpJA7o3fDKZXJzBbg=;
	b=RgSu9o8YcsqOfjk4eadI6smICgXAdRvY3cWwAXe+RdndfKOqtn18s5ScmJzqZsYtVZfz9Z
	JB/M8Mbvc33kurZeiw4mObreJvC2QktDBtkrqm6V8JhUalpHoBp1YUCJTTHT5WBh5zuseY
	ApkXx3RVuXHSUryEDeZxmeDxG4dslvlZ7vmi6PPNKPkdLAjdLS8xTwgAWzqEtLpVSw4Hc4
	3H2P5wm3XDUoc7cv8JmBW9QbcNHNjCAu0gt+qlFw5SoyXh8wIZvpQSjD9mNlOzvrWxBWfU
	YM2NOw2flon9xEFIi1qxhrmN+Sxk09OqR/4d1wtgV2nYRqP6ojKi6VmBQ9svvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:24 +0200
Subject: [PATCH v4 02/28] mtd: spi-nor: Complete error rollback on sfdp
 parsing failure
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-2-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150435_607128_9BD8660F 
X-CRM114-Status: UNSURE (   8.94  )
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

Make sure to rollback all changes induced by SFDP parsing in case of
failure, which means also resetting nor->flags and nor->cmd_ext_type.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..c39c6833c9a4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3063,12 +3063,17 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter sfdp_params;
+	enum spi_nor_cmd_ext cmd_ext_type;
+	u32 flags;
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+	cmd_ext_type = nor->cmd_ext_type;
+	flags = nor->flags;
 
 	if (spi_nor_parse_sfdp(nor)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->flags &= ~SNOR_F_4B_OPCODES;
+		nor->cmd_ext_type = cmd_ext_type;
+		nor->flags = flags;
 	}
 }
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
