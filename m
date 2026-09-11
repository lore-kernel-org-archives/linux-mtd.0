Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CFEC88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jT3Y5Yel6pzvX3QlTqSJrWOROHy3Aftyd+fyTemjF7A=; b=v/2k7GIvMMc92q
	U/b1bgkR6fKag1mbDLvM5kSVRHFi17buQX0v4RSv+1Zdhbl343Eb1kIsXPAUaF92TYy5/PMy/XHb2
	Jx+cN6qSyhVgMKWoxEaMbUtOrPVgtgXT12ANRyMqiwSnKfDJEjV4ootiWBooDYUq12iKG4gg+DSxg
	dunHUzCV7sLXOcbA6nAslml/ELDXiC1lT1tm5+tYUIjuB894ufEOqq5zBu9IEdfCv3bERJlcfdSHJ
	iVWYWvAJB0vF6lYUgThLQtekBeIRjqfcAAIeUpZ7Skxm8tw/m63yXd944ov7Y7yBzXkWkWg5Ihr/6
	HuBnxyESBGkWSfNg8tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54xt-0000000HKZO-4939;
	Fri, 11 Sep 2026 17:23:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54xq-0000000HKYd-11qc
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 17:23:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68351C63A0D;
	Fri, 11 Sep 2026 17:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 673C4601A3;
	Fri, 11 Sep 2026 17:22:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0473111C7A9DC;
	Fri, 11 Sep 2026 19:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789147373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nVEQywkHWgTFcB5dj1gTRbzq3fF/jQKEVnEtk7cJTT0=;
	b=g+ZuitOrIEL6URmzye3fJ9qvLvulzMeaFsDq+x3XT2Bc1JBvC7YCwugIDptkX/KFThUAeg
	BZ9Onvf78saOiTR5PO9x/2Y5f7wR+vGQAK1vvS7wXUoi1jnBsdQFx0C8ZDaHk1cG5zyHZe
	BFLCIKYicYJMgtKPAJwaGNOPxEgVktSjr//yCRw/RTOBg9SVOgPBRY3AX7jWcL3fRVsW3A
	gcIIfs5x0P/1ktb6+dQC47ztMkkmbSvYGaBj18yN7EqRE+adbPwfhV9q2T1Xm8ZiB/4WxG
	QitJOmyzd6TBCfrOSMpvk2CJWNNIJr03PGkr6Jxx55pE6RuBL3CvOWMBPQR7CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2026 19:22:45 +0200
Subject: [PATCH v4] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
MIME-Version: 1.0
Message-Id: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ6CMAwG4FcxO1uzdhODJ9/DeIDRSRNhuBmiI
 by7g5vxwvFv+n/tpBJH4aTOu0lFHiVJ6HOw+51ybdXfGaTJWZGmQpeIMHBMAby8IQ0CfYjwZOj
 e4qDRRzRcemsJVe4PkfPaal9vObeSXiF+1lMjLtMt6oiA4JuiKdFiUVF1qUN4PaQ/uNCpxR1ps
 0XZOmlnyOY/jeZ/y2y2TLaIXcW+Jvbkfq15nr+/IWiVXAEAAA==
X-Change-ID: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_102302_614474_38FA218B 
X-CRM114-Status: GOOD (  16.14  )
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

Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
means they do not have an SR2 to read from/write to. The new generic QE
helper was supposed to accommodate this situation but in the last version
that got merged, parts of that specific handling has been moved to a
more contained location, swp.c (which needed most of the extra code),
yet the Macronix case has been forgotten about in that generic QE
handling helper. Booting with such flashes will always fail probing.

Fix the situation by making sure SR2 reads just return 0 if
unsupported. This is safe since there is no chip with a write SR2 path
but no read SR2 path (which is now enforced in the SFDP parsing step).

This way, callers still do not have to care about the internal device
capabilities. Calling sr1_and_sr2 read/write helpers is safe in both
directions (not risk to get a spurious error). The behavior for SR1-only
chips is respected, the complexity in the core kept to its minimum.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v4:
- Make sure we perfom the "_and_check" over SR2 only if SR2 can be read
  back, otherwise it does not make much sense to do it.
- Link to v3: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com

Changes in v3:
- Make sure the read helper returns a "valid" SR2 in the sense that it
  cannot be random data by returning 0 for chips that do not feature a
  read_sr2 opcode. The major thread was to get a wrong comparison
  (against the tmp variable) in the _and_check() helper.
- Link to v2: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com

Changes in v2:
- Change the approach, see v1 thread below.
- Link to v1: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com
---
 drivers/mtd/spi-nor/core.c | 15 ++++++++++++---
 drivers/mtd/spi-nor/sfdp.c |  3 ++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..4377b73e57fb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -849,7 +849,8 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 
 /**
  * spi_nor_read_sr1_and_sr2() - Read SR1 then SR2
- * General purpose helper.
+ * General purpose helper, always safe to call. Will expectedly ignore
+ * SR2 on certain chips.
  *
  * @nor: the spi_nor structure
  * @sr: pointer to a valid 2-byte array
@@ -864,7 +865,12 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
 	if (ret)
 		return ret;
 
-	return spi_nor_read_sr2(nor, &sr[1]);
+	if (nor->params->opcodes.read_sr2)
+		ret = spi_nor_read_sr2(nor, &sr[1]);
+	else
+		sr[1] = 0;
+
+	return ret;
 }
 
 /**
@@ -960,7 +966,10 @@ int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr)
 	if (ret)
 		return ret;
 
-	if (sr[0] != tmp[0] || sr[1] != tmp[1])
+	if (sr[0] != tmp[0])
+		return -EIO;
+
+	if (nor->params->opcodes.read_sr2 && sr[1] != tmp[1])
 		return -EIO;
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..641f17ad51a0 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -656,7 +656,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	/* opcodes sanity check */
 	WARN_ON(!params->opcodes.read_sr1 ||
-		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
+		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2) ||
+		(!params->opcodes.read_sr2 && params->opcodes.write_sr2));
 
 	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
 	if (SFDP_MASK_CHECK(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))

---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
