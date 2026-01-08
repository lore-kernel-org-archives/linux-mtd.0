Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67ACD1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNdiKd2q3aONv9sOW3+yz7WxdM7I0Pbdbsh3po09M1E=; b=3oNHo0d16jSN1E
	xuXvMRfO27vQObvuQlQ//+JWnA+vDomxgmjgIAzfrAOzBYC0LxS1XSmvSgloBwjwNWVEmlzUuM8uW
	cuBHdvFhv2CujtH4q662LHiwUkAQN244LF66FxEd5z7v2w+nvs2UusxMRjv5Bc2gLUt5/t+P3uZTc
	9mbts2jbkoZXq1iPccmuRi9Iu/3fBORaDtLnS6zP/4Jtaa1wDBHs9oGTUe5G7fiVn0KciyRVEt/CF
	arV3yMbuPumQckgCLd7KIxQ0tnj6tuhi0jrIPasb+h8Az3kg7h7iuCVs4plSX8DHv9By+2IVz8QS5
	BydECsC1re6X3JFw/lXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLi-00000000FBh-12QG;
	Thu, 08 Jan 2026 16:59:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLb-00000000F6k-1iPk
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:58:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C7481A2717;
	Thu,  8 Jan 2026 16:58:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5FEA6072B;
	Thu,  8 Jan 2026 16:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EDC0103C885C;
	Thu,  8 Jan 2026 17:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rre/i4KjHYI+91ZaQYrTCZUTDkibP+vKxwiQw3sQxfU=;
	b=q7H/PymZqr9DX0coX0Laz9UCpddok1wUdbm8d2kk0H+8Wntj0sGsUJO3eXDuavtQfcI8pt
	z/B6Q5r+/w/2Km9D6mtYJWlxHm606DY482Etq01POMuYc/EitvyrKNuLoZuB1SprqeZRJk
	Hgm14sue1qle17G8kRkw5iKsieHy5K/VhMRZWtadRl27JRF31qk9nMg948T/TWtQ8q/Qfd
	i5uRQxuOHk7DRV+s7bVMBnloXyKaAyBTHoWCu0c4Jg04WzLnTBBlgjWYMLJSTiM6FGl/AX
	LYrxP6DVMvmMih+afPiVGNyrdjGHDZ6ffOp0Wuk0/rkfzJhovJeNd27fSNk/zQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:38 +0100
Subject: [PATCH v2 05/27] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-5-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085856_032176_DF2D9309 
X-CRM114-Status: GOOD (  10.63  )
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

The "params" variable is used everywhere else, align this particular
line of the file to use "params" directly rather than the "nor" pointer.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index d700e0b27182..69830ad43990 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -139,7 +139,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
+		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
