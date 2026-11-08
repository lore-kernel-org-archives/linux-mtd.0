Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39434606A31A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DMEEDDfx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=EEhZXpfO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1u958mamd+IBd4dVwGzyjuggEkkXjCTrWic90ul4tQ0=; b=DMEEDDfxycw8wrR6+8u2bhuNvY
	0D+U4iRBfM1G7NJ3twfSf92vXE3Ft+98PNU/rmL5xqsQ8pXWNq/Toze/z1sAo8vvHNoRaTnY9dQvo
	nptOsY+yO4HDHHDru9EAWh1ZU6YcniQlugZz7V1s3CzBiTpDPmmRpjYEW3cxmHCFXvm1R0tkvQpeU
	YjZiVXFGqcjeM6LM+cD7omj47F9UycxueMplv+QRByV0++NH0Kf2JCN4DymDZPva0ppep6eAc2qKY
	38n4Xap8GbH52qLWZqoolzdFO8w9+CzqjoyNxfKEmxrC7FX+XCdtW24Aj0AzqmPEkMdUFOO/mLYOl
	amJs8vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsJw-0000000Fb6O-3EP9;
	Sun, 08 Nov 2026 02:07:48 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsJs-0000000Fb63-3MU2
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 02:07:47 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1010248eec.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 18:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794103664; x=1794708464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAUid8jDWzly69ovFD3scbJRnE8PsLmVF0z4XZSSRog=;
        b=EEhZXpfOVrDZEqpSiNDinYd2otn2nOk55LgBVMMJblplnt26bW8G0yqZNMyNZzAwnk
         qgM/GEUwuCzX/WWeHj8GEGKPXaZJ16P6rrQl3nkzWl7YWExzhlvqwP0vYODxjqpR0RVD
         teqNGpHTbss3FxUp+BYW7nlut0elV/BHoxc8Xdii3sxJ9LQbxIGEhPG3l1JJDpFvzhld
         9L3pe0Vlf0FU7nuuFE8GagSjpUOrz+OJif/oOY7UuWKOcl9M6Md3ds61fkIibtetmsQr
         F5FUiVHUtHsUGMueQmvUs7+WZEFXDWuRWsQm+A6EB2YQAe78FT/Z2erqm2RTNwBgfzWe
         +ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103664; x=1794708464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAUid8jDWzly69ovFD3scbJRnE8PsLmVF0z4XZSSRog=;
        b=zRs84oDUz79lKIwkpCZ4rp6yVJ1zP3VRuR4mWScOyUfZXVhKtLdF2YYh8A9MNMj9pd
         Y4m6qTcfg2bJr4zM8m5BatcVN8lpNnPoSNB6RMIs2tyBCOFgRkB60d8kX78GAUFJ3iTm
         94sJk1pxQA4+tIyvPZ/ROZGk5TgTFEFH38sVSB3rJhNQv3d+QUu2uiR45OtEyDmAshJB
         PgWHKD8biSM+HPRbZrtUQZUmdL5XXhYafmXEF7P1ucXew2bZzwglnVctM+7vVSEOs9cg
         +COFe7hMX+cYHkKmIJFi+9S3SnSCPyTAP9gvDArFjzv9ZavosNJrZV5niqcvLcjtUpfh
         dgQw==
X-Gm-Message-State: APuU4Z+QacbRso9SHA/cTU7/oZwEnfYjaIpMfOIqlbWrjzbuahhS45pn
	dWD1dJiSnY/8TaWcWm2H9oKWnhrQTPMxqe/eWHhaADNJ43vjMJvf+SmMRKcmr0vZcA==
X-Gm-Gg: AYBFou1OPBKnT/nF9lz5CVBpNYOPmU9+LtopTmN92GliySwWhtRNZqF1yFZsqD4fJda
	pOjAUe7tahPCngFDT0zQgwznUFYcrrO0vSX315f2QGlaQLCoJ2mthEaTcNYrckFyc4ki9Hk3X86
	L8jOa8qWIpBDMtkk/AYtPyFxsrcauPZK8pGBTeiMZ6cQtEzcLeEG7zX4XoSS/jzXJ3A6ozPuOcs
	ohF8jknzdYvyYxolUhSUOTBf6XIWEGOp/aHjeBFLjJEUWUH+Cnn1ivUlTgdTyraMI/XbxOw+Y4O
	qmwteI4WuUQQ8kxTKn5l5hbuSqJjs9n2jZscSNl4NzNRsR0nsk4mo0AvWcbbgb32nxfDK0XXZRP
	e0P8sfCHDJO8Uc70NMFu5dM0xumN7/aBzX8vOYJfUxgFxJUijZXVnS8p1stVV+kK3mpFvJkpoi0
	UOrm7uGVsUqbqX0MobQYu+A4ZK8MxMe3RVPHhJZjdxbhnnRBs5RM3K8yCyZwLh1eN3ROhWJDcaN
	6Z+ZKDucYhkTl/4Lel/kCX40pEWlxABpAK922X7kh+EequNiJSUQ6wZfrEQ0Lt9TqtH+n3SNAhq
	9h3JXANh3ImRN0djAtIL9/DwxPLajoCIDtJHuvtfWLSOwGJZYhVuw/BH2MlyCF9F
X-Received: by 2002:a05:7022:170d:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b269b21bf7mr4108916c88.19.1794103663378;
        Sat, 07 Nov 2026 18:07:43 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm2133832c88.12.2026.11.07.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:07:42 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH v2] mtd: spi-nor: issi: Add support for ISSI IS25LP512MG
Date: Sun,  8 Nov 2026 02:07:12 +0000
Message-ID: <20261108020712.897714-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_180746_155696_9E4FC912 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the ISSI IS25LP512MG 512Mbit (64 MiB) SPI NOR flash.

The device provides JESD216B SFDP tables which accurately describe
geometry, erase types, and read-write opcodes. Flash read, write, and
erase operations across the full 64 MiB array have been verified on
hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .name, .size, and .parse_sfdp per modern SFDP discovery
   conventions.
 - Rely solely on JESD216B SFDP parsing with SPI_NOR_QUAD_PP.

 drivers/mtd/spi-nor/issi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 2f057d731df2..d2b812050550 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -101,6 +101,9 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
