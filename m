Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6F3C3DA41
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyrcDP4IaT9May1nJI8YYiGls7yRm3lQhzslGxqxC3A=; b=isylZ2Mk7wUL3C
	CILerVKdwnc3Dv4tDsmgg+hQejeY7ALoCYAfrlIx3RyxV+tyx+4lSRsd7+NPrqOcz+EKQSq8ohKsI
	3xambZRzGxAGNshrJY7/t2V7IvI6gBeJ/DUy20AdEyR6OV6ozo9FiE8/RgLOB023XZone53C+C4p8
	5lt/FKwvSHLVTimnUYMj3qFxpVynsnIIqLooInftjkgV/vg/x3r432v/rMAuc5d7MxNMmwXuv+wIZ
	zDBLODcZV3zBn1Jx3o+3IXN+Bo8gCKfAvzeqDoyJaVHOo3f+3XNWPHysJ5hv8EuSLrQ4QbOSXwlLV
	e23KK2wUQ9LCkVHhvucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPr-0000000E1hy-1oWH;
	Thu, 11 Jul 2024 13:00:55 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPI-0000000E1Ue-03nm;
	Thu, 11 Jul 2024 13:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XeZX/fN1JLnmI+FO4xROcdTsrgS/vV35tYbkT3yOVA8=; b=1EIEvOmvQ7ULVcq45LRry6nK+v
	VWNoV6X660XoREPEAEvVqgKdJ68SLIs6yKVHRwIOgq9d6avjydiTEOwFd9+9ds2HWkFYTdBY+qVCJ
	4f2VRs1dG9MMp6DHEGCzSuIYTQZKu2JeelQZtDfR9e+ZFTsQBx5dzSgLN8linWJDHfgJNT8yC4Whs
	c/m6KpDD80YNKKl22TY0clTUz8JEsw1LdtlRVLVIBnDH0Fp1nYC3FAbFwoQqiSQFRXh9opvBzjpAw
	OxnXbMEmrjNaSJmD6F5ygxKJsUj6pSOzhYigSnwEZHhjwwC1ZbTfzXJzRN+kxyOzOj/ROEvA78AgE
	UR4K5seQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPG-000BSC-IH; Thu, 11 Jul 2024 15:00:18 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPG-0003Cy-14;
	Thu, 11 Jul 2024 15:00:17 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:03 +0200
Subject: [PATCH v3 03/15] mtd: spi-nor: Align default_init() handling for
 SPI_NOR_SKIP_SFDP
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-3-99353461dd2d@geanix.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=1243;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=E9Xx4YsmdLPl9JM6Nb956eFYmxW+WJmiJqnM9qnOYgU=;
 b=iK/XDkcF02QhGwuqjgh2t6l5BJL/gsQcEG0/ScrlXESFe8xr/g+CctSmS5HLiXLNi/HxeDhFX
 5CtBi7zMusPB9+er3muBMrXmcaN/Ifhs4E9uKWeaWXMdIXDmshi6FUW
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060020_097257_C97052B9 
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

Currently, flashes declared with size != 0 in struct flash_info and without
SPI_NOR_SKIP_SFDP in no_sfdp_flags is initialized using struct flash_info.

Flashes declared with size != 0 and SPI_NOR_SKIP_SFDP set is handled
similarly, with the only difference being that the ->default_init() hooks
is ignored.

With the only in-tree user of SPI_NOR_SKIP_SFDP is the Spansion s25fl256s0
flash, which does not have either manufacturer or
flash_info ->default_init() hooks, it should be safe to align this, so that
they are handled in the same way.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 39b28700ce28..d58f107f62ec 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3029,8 +3029,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		}
 	} else {
 		spi_nor_no_sfdp_init_params(nor);
-		if (!(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
-			spi_nor_manufacturer_init_params(nor);
+		spi_nor_manufacturer_init_params(nor);
 
 		if (spi_nor_try_sfdp(nor))
 			spi_nor_try_sfdp_init_params(nor);

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
