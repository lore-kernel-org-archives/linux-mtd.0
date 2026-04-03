Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF339E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ls2SV7HIoWzU+TNsJlVlv7eTr6I1NsPiuL2UZouq6U=; b=FKeGakcKL9cHrt
	IXCWeygkZBrVh+H5dB0qC2HIf0ayyDAWcA+Po9PpZ5SQ7F18Rk/aEN89Hie6WdQY3gvoC4DAyhGXz
	F+g/FuNsKKgpLCRy7+e6is6t1eZF+eT0J2yB445sLRGXbUteIul4HsSmvDQ+7YMA87eLWmpvRRbZV
	CTO8omF/FYpEjIxOq8/Xnw2c2N8zshTaWodQCkmAsSciweCpaq5S6+1QOB+rrbSZCdK14ilr7LFR4
	GCTgz/4LgqBvg9RNIlgXsYP9B8HanXYhHahpVO8EjvvmYDZ7aKm+4U8R2++Loq7uzqz3Melpmzx9W
	W1k4RtJw9WT1MPtksPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h66-00000002HH4-0fsj;
	Fri, 03 Apr 2026 16:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h63-00000002HBZ-07Tl
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AtDuaW75HQVabGFbw4yfNgUHQh/r6FDMUHlhTNsHi9I=; b=FgDqlEI6qPbX8dRVb/HI6DpW6S
	lYePRWbAAXzpTA3Q7kEden2e7Z+M3/4c84CWkT6bwlNpu1w5svjd2I+wNgLotK/bGvgHISruKgB/X
	SLRSEAmVLw4WwoKyjK4hvz4YxJZfG8PwyFdElhb6CtNxno5a6geYsmK1ApGz1QI7W/TZmunpSn6gB
	HCAB1Bep2kpejdtAR0OS0/yyDwHO+R6KFgf4sEONgsTJYG3ZyE9h/lzeOld2g4JoTCj3tFdi16zT3
	AUk5UsuMMhBovqdLA6JCp3/hj0OmAwUM1fK/mLfPoTREZykJrcvq5Vwzht5EJKQ3puJyuriKJFWzW
	d0zWHJUg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5y-00000004ONv-1473
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:10:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4CFF5C59F66;
	Fri,  3 Apr 2026 16:10:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505D4603C1;
	Fri,  3 Apr 2026 16:10:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3AB6104500FA;
	Fri,  3 Apr 2026 18:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AtDuaW75HQVabGFbw4yfNgUHQh/r6FDMUHlhTNsHi9I=;
	b=Zoq8ydzGBO39ExDCZ4mO6pVU+QgDyeIx0qjTXWxWK3D7poKE2FUu9uQ63FFSQYkY42EVTn
	zM80Sd31Wq32YLiI+d/YIKkyHnuDNaLB4b4tPT2y54KrKrOFbh0t/RXOMY0H47VzLI1S+J
	EZNRLBnyT9liXdhn8bVrqEKHSL55QDR58LH49P1AMt/KqlTlfLBVcJAQQdjgs1ygPYbsin
	zk1QxZEdseEt6hUGyKdD5PeFFime4UJ/wi7Dp6RON5wbYbZv880pLcAOpQXli2RXwHwtPe
	pX/DVuVO8d4uPqAy3edNaDAZAWC+xlOBT53S2tLmHjRm1hyLtx2TwQdZ2faePQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:30 +0200
Subject: [PATCH v4 12/27] mtd: spi-nor: swp: Create a TB intermediate
 variable
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-12-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
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
X-CRM114-CacheID: sfid-20260403_171006_851006_E349ED29 
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

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 66f85826ba0d..f068cb9c8f6d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -60,6 +60,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +80,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
