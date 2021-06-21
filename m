Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFA0C4743C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B0361003
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B0361003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiB8qH7JyNagDQL/UA49QMPd9QUTlnHVum5revlj7MI=; b=kHTmgAWtZJhs8M
	7MNTTapJHPbn1ditCnCl+RPw9Wmrzl6JtQHUau1jEzSdxCf5EXuYo9DY5cexc2sfYD2a+yqnZURJk
	K3u70vPsyE3tsGvHoeDNVY+KWSFG2op/NHOZ6ROt+moaw2FhdoGW/8daxJVNVGV3F/fcQzwutk7tg
	dSU1PgDJREyoR/V8eb82W3YL4dEZOUv5v7DOLS5gfba1y2fmtslerCFQfnLP5lCWGoqsgc+QgqEVt
	bkqfmgq0LWOOPK61hwB0gN4ivmEcQly/aq/J5TXQVEU+x1obGPHi+U8XZ7CBmq+nKRmpLhHavXXpa
	R6ZNU066rYAaZzY6VEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLmn-003uCa-Hz; Mon, 21 Jun 2021 15:24:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLlv-003tx3-4i
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 15:23:37 +0000
Received: by mail-ej1-x631.google.com with SMTP id ho18so29470632ejc.8
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jun 2021 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2mPGF6e+QaRdPzOU0Ls1i7M7sCtOZoDk9UIo0VumFU=;
 b=D0f9REBDHx92cti3d+c5g+u85IrmzNTLUVgqSLCJkCFqs7Qmk+NgwHo+u15pOFbzS3
 k3hYAKamNb3WBqP4AE50RLDLv7PETChu/ANLkyJ7MZe4Sy+mTvADiJjZA7ugKLx9mewJ
 55oxd5ywg3dUmjblYpGoY0dbSULJe4mLRt4G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2mPGF6e+QaRdPzOU0Ls1i7M7sCtOZoDk9UIo0VumFU=;
 b=LJ+xgudtk8wZoXqM22yGB6K3PAjY6ApFkW8px1Vu0mkYD2suZzjMeNz3hee8PCGByJ
 KQRA5EZv8EsReijTaDLKv0O2/5pNWAnxLbFm9xB0U25Zmpe+VULMSnmVv1UI0i/pQ10+
 pVmYfiZLbvIbdNnmz840K6IoNKEJCdxYxWh1ePwPNMWY631q6rwsd0be+nQRYrx9XP+4
 zydoF6+t4uhl49PFVne1MFL2y8cbiLoCvPBtamQB/D3yz9PS/GtNhmoFOl94wEEYOPG4
 TIDCjDJ2+3EaUJUAZ7REqevp3JW2tR4ga7wHSt+MM5KqBh0Dv4rjlMTIaCQDcPCPFWiB
 QqPA==
X-Gm-Message-State: AOAM532FDhRYmEykLEm6+jS/fc5qBqa0ypirUHMdyS53B3MbJjw8CNrh
 US1M4SzXC3NHAAOxR0Kk9lOw9qk3RDwJgQ==
X-Google-Smtp-Source: ABdhPJyvRXdpqoFTcPfgwW1b53DCxt4JK7wQV4BGMDkeH2iHDruv/mWr06LSt3CoLs2lc8WU1E2r1g==
X-Received: by 2002:a17:906:718b:: with SMTP id
 h11mr8686734ejk.418.1624289013415; 
 Mon, 21 Jun 2021 08:23:33 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id q20sm5021079ejb.71.2021.06.21.08.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:23:33 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-mtd@lists.infradead.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 2/3] mtd: spi-nor: core: compare JEDEC bytes to already found
 flash_info
Date: Mon, 21 Jun 2021 17:23:19 +0200
Message-Id: <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_082335_255031_5129E0CD 
X-CRM114-Status: GOOD (  21.12  )
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

Macronix engineers, in their infinite wisdom, have a habit of reusing
JEDEC ids for different chips. There's already one
workaround (MX25L25635F v MX25L25635E), but the same problem exists
for MX25L3205D v MX25L3233F, the latter of which is not currently
supported by linux.

AFAICT, that case cannot really be handled with any of the ->fixup
machinery: The correct entry for the MX25L3233F would read

        { "mx25l3233f",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ ) },

while the existing one is

	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },

So in spi_nor_init_params(), we won't even try reading the sfdp
info (i.e. call spi_nor_sfdp_init_params), and hence
spi_nor_post_sfdp_fixups() has no way of distinguishing the
chips.

Replacing the existing entry with the mx25l3233f one to coerce the
core into issuing the SPINOR_OP_RDSFDP is also not really an option,
because the data sheet for the mx25l3205d explicitly says not to issue
any commands not listed ("It is not recommended to adopt any other
code not in the command definition table, which will potentially enter
the hidden mode.", whatever that means).

In order to support such cases, extend the logic in spi_nor_read_id()
a little so that if we already have a struct flash_info* from the name
in device tree, check the JEDEC bytes against that, and if it is a
match, accept that (device tree compatible + matching JEDEC bytes) is
stronger than merely matching JEDEC bytes.

This also makes initialization slightly faster in the common case
where the flash_info was found from the name and the JEDEC bytes do
match - it avoids a second linear search over all known chips.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/mtd/spi-nor/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6a1adef0fe9f..21ae655d6a6f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1869,7 +1869,8 @@ spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
 	return NULL;
 }
 
-static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
+static const struct flash_info *
+spi_nor_read_id(struct spi_nor *nor, const struct flash_info *guess)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
@@ -1893,6 +1894,9 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 		return ERR_PTR(ret);
 	}
 
+	if (guess && spi_nor_match_part(guess, id))
+		return guess;
+
 	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
 		info = spi_nor_search_part_by_id(manufacturers[i]->parts,
 						 manufacturers[i]->nparts,
@@ -3031,7 +3035,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 		info = spi_nor_match_id(nor, name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
-		info = spi_nor_read_id(nor);
+		info = spi_nor_read_id(nor, NULL);
 	if (IS_ERR_OR_NULL(info))
 		return ERR_PTR(-ENOENT);
 
@@ -3042,7 +3046,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	if (name && info->id_len) {
 		const struct flash_info *jinfo;
 
-		jinfo = spi_nor_read_id(nor);
+		jinfo = spi_nor_read_id(nor, info);
 		if (IS_ERR(jinfo)) {
 			return jinfo;
 		} else if (jinfo != info) {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
