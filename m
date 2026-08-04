Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D8CC55822
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzGkPnNxN5CxWGa8HwuZghWd+rdjm3CGukvXgB8OWI=; b=H5WtkUaOiv52Fe
	fmvWpYVqbZ5pqJFBeAECW9XFmSAT0WAPZN4/Bzz/J6TFNWj+QQJ9sGhGRSzXL/kThsXXI2ckjCTVq
	6QUxLc8aczAHJ36yJ0mmxN5ogwhpNxU73Vog2+hepGdY8JJu/rtHWhlUAD4eXn1jZ+v+6YH0gSdYI
	GGZbUkzLMEGRf5je9ZpH3bCOhyy4xtCIOfkcGRPK9ihFDedk/JsfgKGBar1bkjjFI2G57CQ5X5sjU
	j31F70k3gHszI/TgGkJO9VlTu55cPVMBVgLw9tVHfpegSlpR0peuR4HoIq+a9c/3M7itP3U81PvKv
	iMcb0rvh668Akl9VbjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl6-00000001zub-0xKR;
	Tue, 04 Aug 2026 14:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl5-00000001zsj-1Lrx
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bAWtw3CGgsPilxjcNtR1KkWLKZETIaXM85za6nTJbqw=; b=dqlEwBCywokNypChGkS8C8FGjT
	VYGC8Lr/cdieg1ELJ5b/9NdAbCyFcM5I53XfBOHMX5ATFYLu3jnJf2tQsmCcI9bMuJLDWlSyR7/Wm
	/HN+bUgvUTVUvjGGjOusNLcW6ih81p3tAdm9DCxeF56I14Eeoq/GT7CIVOmcNmFYmQ4poIYQjwe9v
	85JvabmHL3Sqxk55XTI560xbbqmh4GB/XS1OLi/MU/KVpvlxbRhGszxw4wetZXVjojLMNz6N02unz
	7WH1TxHcOzJDYUQOksZAY1TpZNXLtwgOu1H0jTKjYekzYGjj4d6IhlPtqkUuwN/9pAe7aEMmpVK+v
	tt2q4Ffg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFl2-00000009yHs-27SF
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C19DF4E410DB;
	Tue,  4 Aug 2026 14:04:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93EDF6029E;
	Tue,  4 Aug 2026 14:04:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84BDD11C32D2B;
	Tue,  4 Aug 2026 16:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bAWtw3CGgsPilxjcNtR1KkWLKZETIaXM85za6nTJbqw=;
	b=S9oeOPqq+qQLLj4W1H6tHSHQGUtn+ayG0RM6Vil9iUnRzH7Urrs4AEIpCt/K6TVJvYZGE/
	st1rdLXBt21UnF+e54ZlNxglEMrX2ZnqnEIzS5QQQ+OtOKgsFmnFSALXZWge/xhseiz57O
	OJuxQeTD9YuG8pIdH/nXmAD4Gw77bH4ouOBpImLHN28esjybl/4QGbHU+6VMGtcjKcQziy
	rwWgjBCtjS5E3TnV7JgT3zGzwSJES39qn1JgkD4YDKsUE7X8nRarSmftoPYdloS5gNFfid
	uDyNz1RBw6ITAbv21B+QCS7QNNYFysuEBEsuNTnkSy2wvEdLUhmg/tGospwU/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:29 +0200
Subject: [PATCH v4 07/28] mtd: spi-nor: winbond: Normalize names
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-7-ee3445066e4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20260804_150440_711343_5CC748FF 
X-CRM114-Status: GOOD (  11.42  )
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

Winbond chips cannot just be named eg. "W25Q02JV". There are always more
letters after that name, some of them matter.

- W is the Winbond prefix
- 25Q is the type of device
  -> 25Q indicates a quad capable SPI NOR
  -> 25H indicates an automotive grade chip
- 02J is the density
  -> in this case 2Gib
- V is the voltage
  -> V means 3.3V
  -> W means 1.8V
- The next letters (either 2 or 3 letters) are completely irrelevant for
  the software and purely indicate the hardware package.
- The penultimate letter is the temperature grade
  -> I for Industrial grade
  -> J means "above" industrial
- Q, N or M indicate factory states (like QE=1) and also the DTR
  capability.
  -> Q and N typically have the same IDs
  -> M chips typically have a different ID

As a result, W25Q01NWxxIQ is irrelevant and would better be named
W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
etc.

Make that list uniform before adding more IDs/names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 662a022d36e7..03e59ff3228f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -301,7 +301,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIQ */
+		/* W25Q01NW-Q */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
-		/* W25Q02JV */
+		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -372,28 +372,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIM */
+		/* W25Q01NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q02NWxxIM */
+		/* W25Q02NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
-		/* W25H512NWxxAM */
+		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H01NWxxAM */
+		/* W25H01NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H02NWxxAM */
+		/* W25H02NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
