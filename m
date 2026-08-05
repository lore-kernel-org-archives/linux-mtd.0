Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C1C55822
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l99G6aHVuGuWuc0MLw+YeAavlHdO+yPQUeO7mXbFlOU=; b=wTDkzOoMQoa5ez
	gnf6vpNOUFoiHjL9/OIiB/zdfdST2jdtudZrmmfrgkEh5imHQW7LUK3LuGQ7Wv8JGPDp4VMyWNuvg
	9s6CSOpHeglZEincb/1hIM59Cu27gp1tBpSxooJ5H4IlFUVwBhYVhCETeTM6yveHeK+uogDgdh5eW
	YaYKpH9Q87rYMIIdmXJbmu4FEVPYNZoq0uFpQvyObhrFeFZmu77q/d3ovHyv8IBeNNE83NvlR86nt
	yHrWloDI/hlMpYGGj6eaqedfcSiLSVj8eCO9NTkeYtQGRduC7oGPkMuRMyxC8l4Kb8aYVHGuLBUfk
	fcZjCLhXWBp/7/ffsx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaH-00000003SOo-0nwp;
	Wed, 05 Aug 2026 08:02:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaF-00000003SNW-0WQc
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:02:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BD0B1A143D;
	Wed,  5 Aug 2026 08:02:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67FFD602AB;
	Wed,  5 Aug 2026 08:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 693CD11C34364;
	Wed,  5 Aug 2026 10:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iTQYlBDs/bVQ9FRAwNXdzhTcN1NpJA7o3fDKZXJzBbg=;
	b=J1nGLcBN9JGGqLrxyodG3tkVNn4cGbxv6hfTVzqzlEWpjorlwm3VkwyyLx4292XWT5ZT50
	6fzPz2QxZIGcQiYIlcQuG0ZMpR9MY83shS27TCdKsAMxoJU44R8em1DAonzQ+UHsTDQsu3
	vzlchA/N5dUNslvib7RXuxJnrgyXcCRZLDFOSB+GhsMCj/VxINuCIsvKCoeh/vW4xkt4nB
	+mstiHrHc9W7HY/FrQi0gOuTdEJGN5P2jfBUiUetDNhxo22Ujt8uNbopuW6sNBKWQuJRwG
	3C+TO5VgKrh9m+wdSUyImFgvXqzp8LV0EizCGt1Ir8s+e1WaGPtz5JdR5moWkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:27 +0200
Subject: [PATCH v5 02/28] mtd: spi-nor: Complete error rollback on sfdp
 parsing failure
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-2-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010239_311311_A4D37820 
X-CRM114-Status: UNSURE (   9.02  )
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
