Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E85CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pck/J1Ml2V7HdySVlGz/8WqNrPgzLkYt7Y0svtqkrbE=; b=jgh7ID9i6Yv50V
	poABsj8bzLcxPxpHt6TJ1oi0LWknCVv2cJu0OPHh4OHnzcv3t0TSuvMLVPv3IJzYGu8kEPu5ZdNDg
	AZ6gnVanAb+3QQgPohzWYlIIyoSJ01Y63FbHWIU4vKl+RSMzRi282N3GGS3r3twdxwRbjWKHg9OXe
	DTf6N1R1ApZZpPP4j4/eo5pRk1/ul53xxyxZ5/eQo4lvJSfOWBE0kNk1jyyK2DomSs8ujWvS3vx/W
	B2wYsXhmfX+Y/D++fbbAOQjGNQc0cE2rOT3KXiwt4dvfLf+07/Ms/ezcEn9e7QP8swhcEhKkGRrg7
	ZT6z9IlVSkfh54TSlGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSp-0000000DXF0-0Gvm;
	Tue, 13 Oct 2026 16:34:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSk-0000000DX3h-0ymM
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 786751A121C;
	Tue, 13 Oct 2026 16:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D7E160362;
	Tue, 13 Oct 2026 16:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7180711D71813;
	Tue, 13 Oct 2026 18:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=woBPfE2zyVEwVQtzqHUi3dF9ND0uu7ZMv6floLqY/Sk=;
	b=1cYuobTkBJNXOLk+vInzyitX8iuy26xIWzv4aE5eNRdfF9THPWNNJjN8rHN3+js1yTnUa6
	px6hF4J5AsckjnoLO9IiPBPmaWzkdtNvPH4ue3YRn8uGi9pMH1pnKGFkSAh9EK+buLgpEJ
	opG3s+E3OnTCyEstC0iwqqYmvubc299fcoSh3JCqlRgf7LpOJ6BmiHEyAtaJpK4PF4ASK6
	wKMCQf58UvYVrdIxmSRNlzXtHAYfkBMB9QAnBC4Y6wOSpi/SfCgncctgIZLlA+GDfk+rxF
	H7rhZMO2zr5eUBj9DVomBpE+gAJwBQZE+ju01+UnMlZBpv2BH2xptpDrt5Ga2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:34:00 +0200
Subject: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093450_421502_C6D3A3FB 
X-CRM114-Status: GOOD (  13.25  )
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

During the recent rework of status registers handling, we mostly focused
on quad capable devices, partially skipping ODTR devices in our mental
model. It seems that many (if not all?) ODTR devices have no SR2 read
opcode and have other control mechanisms. Because of that, the current
support in swp.c is broken, because reading back the written value may
or may not lead to the expected result.

Let's extend the _careful() suffix to the helper reading back the values
and comparing them. Maybe this "carfulness" will have to be moved back
to the core, it is a bit early to state it. For now, let's just make
sure that we read back 0s without errors when virtually accessing SR2 on
those chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/swp.c  | 23 +++++++++++++++++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 07364b0a742a..43dffca23102 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -925,7 +925,7 @@ int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
  *
  * Return 0 or errno.
  */
-static int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr)
+int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b64f26b69c05..cee33ca18b04 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -664,6 +664,7 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2);
 int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr);
 int spi_nor_write_sr1(struct spi_nor *nor, const u8 *sr1);
 int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2);
+int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr);
 int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 6c56fda3913e..bc733df203f3 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -240,6 +240,25 @@ static int spi_nor_read_sr1_and_sr2_careful(struct spi_nor *nor, u8 *sr)
 	return spi_nor_read_sr2_careful(nor, &sr[1]);
 }
 
+static int spi_nor_write_sr1_and_sr2_and_check_careful(struct spi_nor *nor, const u8 *sr)
+{
+	u8 tmp[2];
+	int ret;
+
+	ret = spi_nor_write_sr1_and_sr2(nor, sr);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_sr1_and_sr2_careful(nor, tmp);
+	if (ret)
+		return ret;
+
+	if (sr[0] != tmp[0] || sr[1] != tmp[1])
+		return -EIO;
+
+	return 0;
+}
+
 /*
  * Keep a local cache containing all lock-related bits for debugfs use only.
  * This way, debugfs never needs to access the flash directly.
@@ -407,7 +426,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check_careful(nor, best_status_new);
 	if (ret)
 		return ret;
 
@@ -529,7 +548,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check_careful(nor, best_status_new);
 	if (ret)
 		return ret;
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
