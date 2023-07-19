Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DABC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/4ljozqnU100cpmX5FjBPPetVccdiI/dXtu8/PlDrWc=; b=B8ANVQRn8EcqJO
	HCGhAKnGH+H0omJD5Pt6h3DInZJ+/YoiA3gHUBPZXbVk2AKCdg6FlgpadaW8/GcqEb7MC+ATQn1Cs
	FRXyHjKuQx50HEi0NFGMr44xjJlWKucwgeX04GHYBc6V2MV+WvD9h74R5emL21dAMEJmGGdzCgKIs
	BNJYW+4YcoeoKsrAgMNZ/BkVqFt2OTxqg4DJ9YOdhtOWo60Mc2SvTg/0gS7GctywkddRpn4eUW9pc
	pGTvAT/0ntJ2pssNW1zNL0RF5lhBI2xdJzyLXPtCqyLJbD+O9PlGkzBVI2JzemBt5K2jTlNy7Zw1+
	ZXXZPT5CMyOkZMaQUJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCPx-008bNk-14;
	Wed, 19 Jul 2023 19:00:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCPt-008bMe-1Q
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 19:00:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87CA5617BE;
	Wed, 19 Jul 2023 19:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4308C433C7;
	Wed, 19 Jul 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689793252;
	bh=m8elIMgvNx0HITJE8wfTnOPbpAfIc6OxVFEIrgi6Ew8=;
	h=From:To:Cc:Subject:Date:From;
	b=DjlKZMgfXAhCiIO7wXFE/nLLfkycJD34db9ewHFpZ9oT9ADKGwF1dnYTDthUFvL9q
	 L4duYNtIxCemXki5jslS2vAAhMOgdhrFlpZrxBvGx8eqQod0lhKKmtWFzlbUtUCDpC
	 etDaMPL+oXFbmsEGkdJ8KgRACK9zXToeo3M0FA0UHF1RjXLaKupxXcPgNttkdiCPEL
	 mtdYGpBxr/gtUp+sG9k2rfwLvIpJSRaGT4UheoGgE7mlA6FiHHTctW6MUly2M3+V8x
	 DAI4aUx1iOKYyvCeIfFigHmEPXItG9RYLkP8PKJ57cOEdyEtLrxkSQiU1eMn/hp3hw
	 nFXkNu+H55+eA==
From: Arnd Bergmann <arnd@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peter Foley <pefoley2@pefoley.com>,
	Pedro Falcato <pedro.falcato@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Mark Brown <broonie@kernel.org>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: avoid holes in struct spi_mem_op
Date: Wed, 19 Jul 2023 21:00:25 +0200
Message-Id: <20230719190045.4007391-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_120053_573830_025AC315 
X-CRM114-Status: GOOD (  18.41  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc gets confused when -ftrivial-auto-var-init=pattern is used on sparse
bit fields such as 'struct spi_mem_op', which caused the previous false
positive warning about an uninitialized variable:

drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]

In fact, the variable is fully initialized and gcc does not see it being
used, so the warning is entirely bogus. The problem appears to be
a misoptimization in the initialization of single bit fields when the
rest of the bytes are not initialized.

A previous workaround added another initialization, which ended up
shutting up the warning in spansion.c, though it apparently still happens
in other files as reported by Peter Foley in the gcc bugzilla. The
workaround of adding a fake initialization seems particularly bad
because it would set values that can never be correct but prevent the
compiler from warning about actually missing initializations.

Revert the broken workaround and instead pad the structure to only
have bitfields that add up to full bytes, which should avoid this
behavior in all drivers.

I also filed a new bug against gcc with what I found, so this can
hopefully be addressed in future gcc releases. At the moment, only
gcc-12 and gcc-13 are affected.

Cc: Peter Foley <pefoley2@pefoley.com>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110743
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108402
Link: https://godbolt.org/z/efMMsG1Kx
Fixes: 420c4495b5e56 ("mtd: spi-nor: spansion: make sure local struct does not contain garbage")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 include/linux/spi/spi-mem.h    | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6d6466a3436e6..8397cf3cc3306 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -361,7 +361,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
  */
 static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 {
-	struct spi_mem_op op = {};
+	struct spi_mem_op op;
 	u8 addr_mode;
 	int ret;
 
@@ -492,7 +492,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
 			  const struct sfdp_bfpt *bfpt)
 {
-	struct spi_mem_op op = {};
+	struct spi_mem_op op;
 	int ret;
 
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 8e984d75f5b6c..6b0a7dc48a4b7 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -101,6 +101,7 @@ struct spi_mem_op {
 		u8 nbytes;
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 __pad : 7;
 		u16 opcode;
 	} cmd;
 
@@ -108,6 +109,7 @@ struct spi_mem_op {
 		u8 nbytes;
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 __pad : 7;
 		u64 val;
 	} addr;
 
@@ -115,12 +117,14 @@ struct spi_mem_op {
 		u8 nbytes;
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 __pad : 7;
 	} dummy;
 
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
 		u8 ecc : 1;
+		u8 __pad : 6;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
 		union {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
