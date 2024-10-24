Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12792CE8E67
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGpzD7YGzqw6YsKHqm1C6dirtNu3RDKVopTaNA6V2IY=; b=ZkwM78fZN0UWBK
	jlK8WnZzWmbdqzJf6B4VHz0hzPk/Ena/hG6PsyweYviqWMZEPoxqunWcH68lTEkRXdH46AeCAk0r2
	Yyq9fgpp6gPWupGlh9uUvstZIVtcmo6P5OVCTO3l1l4ied0kYygr1gZajy3CTVkfSHci/dLszOjvr
	S/hCdSotAE2hHPjNwvLJ6dIYl/seM/i4KO+UWFci0s68gz02zkHXGME0m/sDO++pPIk1jKkd/uMkp
	pzwdIce7NM8Vd/odn4Ff9LKYDSedkTyAAt/kuC44jVbAkZOUIufENzQok399VOw6BG8Rc0k4Oiy94
	rp6PG3FOBCsTAXSqfvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wO0-00000000FzA-3RhA;
	Thu, 24 Oct 2024 11:52:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wD5-00000000EjX-261o
	for linux-mtd@lists.infradead.org;
	Thu, 24 Oct 2024 11:41:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so8500055e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2024 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729770057; x=1730374857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idzdbKFgsUG7OY55yXSHUR0pooUCkPncNXEk/U6JGi8=;
        b=EOB3W+tTmjrd77xboG65kPsVvkZVZrtxdqukic/iQ+OqgIUKY4A5u8q4qdOJnnZNNV
         zzr6JmpNKvMpOVPgXFWPWLdV3jhVLZfsb4IEv9LVXDQFAFo7xJMxRUASdj4NdvbcSRQX
         q69HXD77r9y64D6dtbdrpiyDFqwKjZUXBa5pGmuwW6pdl3iMWwmd27Vb+Aydc3+8DI5Y
         itZcnpQuegdV4OoKSo8elzxYBk48B7/x/M4ryMRv5fKlgV3qil9z5PCWwYHZOTgcdUoo
         3kWhOYYwvzXIyGBcQ9IhmOaASBb2bASIn9CDblpvjBcE2xG5qh7nP/cLYPYj5eaYbCse
         /RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729770057; x=1730374857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idzdbKFgsUG7OY55yXSHUR0pooUCkPncNXEk/U6JGi8=;
        b=CGORWrKnJMAiXvZPBOftDNS0kkCggLAkm3/i0dPLECk2jzQRsC7vHSExVHHTQoyDdc
         9gsDSNM54DAGj7tii8JxpJKLurdmf5hX9aSXhhfgsHa4vjr2XRfvuSQfTFr6OXp6cZL3
         Z0UTLiswC/+5HyhgvdawKY61ytw8Ev2XJBJAJSk/TgTDfKndFOpbu1R2LS45WsnS+S+w
         eu5Z1z8QX3AQgItb7n/L2I/1UYGRaakbXcO9UQI0MCMjtzNov8A5PoIZxq2Z2sZ8UUyi
         xbKnPzcf6IEjlh1uLpqWLms8bAuvgS9T6hcq9z2rYM5t/iAaPFP205yK7fryt5hWtSue
         Q0TA==
X-Forwarded-Encrypted: i=1; AJvYcCW5KZO486p5cpb09q300VwbwzhwcKIsBnq/KRjxuhRyNjfEJ9nO6iYCkh/wriGScV2oEMhj0Nn1iQs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu522/T7AKf2eQ7XV1fzIWgPBTj84vQDcgAT4NOQ+YOX4R/lSN
	YQXwQ+auWzZwMBzWhUKFP8/mf7RzMmxxOXf1mvd7guTiDzlCM1L+bAMpBiC+
X-Google-Smtp-Source: AGHT+IFCf69WqMZ4s8O5S2d78OdM8YtP+bJ7yi9UW7qwMQdIAywbaUYKtN2mQ9IT6hphj1T44Cy3xQ==
X-Received: by 2002:a7b:cc88:0:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-4318d7f2fe8mr10377555e9.18.1729770057089;
        Thu, 24 Oct 2024 04:40:57 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bde267sm42396385e9.13.2024.10.24.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:40:55 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: macronix: enable dual and quad read for MX25U25635F
Date: Thu, 24 Oct 2024 13:40:21 +0200
Message-Id: <20241024114021.17567-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_044059_568205_858E4B2F 
X-CRM114-Status: GOOD (  13.65  )
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

From: Parth Pancholi <parth.pancholi@toradex.com>

The MX25U25635F supports dual and quad read operations. Set the
corresponding flags to enable these features in accordance with
the hardware capabilities. This change also enables dual and quad
read operations on the MX25U25645G, which shares the same ID and
has a superset of the functionality provided by the MX25U25635F.

Link: https://www.macronix.com/Lists/Datasheet/Attachments/8663/MX25U25635F,%201.8V,%20256Mb,%20v1.5.pdf
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..be55558c8ad0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -129,7 +129,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x39),
 		.name = "mx25u25635f",
 		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
