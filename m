Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C362C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A4hSR+B2FbReQ6mT/+iiDyEKlDqFzQGCtNZR6cYnQjA=; b=QpJ8jUl3/g7aYW
	beky1cQMHFaBc7yxr1hUdW51vTUcPrR5kbEsEl167hDqr1r7YDvUyO00p/NEl3AEcuKlviFSjN1td
	fI9erbaIzNdToLf/q8hJ+k6pfRwE5l88ZE70FnqhH4ynOEPY7Ofmh5RZnDclBZEbX75GcfJQbwj7g
	3DeZISZ1Ix0DDgsu0kvbUuGSXtoP2/sOSUbd3eDW/SajjvXV898qmxyEEfHWbIAcITgSTmPgHgilu
	igwTgm4C5amiOnFWfnEoNV5ZxEglJR5LO9a78eswymVrix/NI3gk2g8BwOPeRzMXQ5AYYkrzUyW3Z
	ETf+gzVbC2tBRGVI+6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5P-00000003fwT-0qma;
	Mon, 17 Mar 2025 18:21:15 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5M-00000003ftj-3PTu
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 18:21:13 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac27f00a8a5so401359566b.3
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742235671; x=1742840471; darn=lists.infradead.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=grGRorWL+jLsuZGg/lyAHTXsZEEu7pq9ykzvRuqzUW8=;
        b=Bv4EMqzoQUs+yTlO+zQfHwfLE11HJANBQWfCdyDpZm98kTZB/ZR76Jk6G0C3mDBPO+
         5q9IpNW113Wddwf84ohhHsk+/36ac4P48ZnvrpZobouS74lHzwX8JQ+FHBXbTyj2FZmG
         +2HbreSUjY+uMK3eHQG/UrK9nHBA6m75WV3fFa2mfhxsfJjJ/dx9fivKjviL+F0NYI+4
         kCHCvM5j22Kgn1vOkOmDXTb1y9UZb43Hpc9McGZC/6iLJCEyRi2xpQlIc8XiDUDO1yU0
         xwpOqVINLsl9gafmxTBm7DTm+E6CwDS5iZfXiMbOrKVjE0MOilIlwuwcDvMKbO5jqj5/
         L1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235671; x=1742840471;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grGRorWL+jLsuZGg/lyAHTXsZEEu7pq9ykzvRuqzUW8=;
        b=TyrUfoJTsFNfP2MZiICnZggJmXcACFZFbKPaBqR3vXUnQmJaFwI+uNe2KcYQhhGqZr
         GsPvW3ra7JZty6wbGpicPHd9NI4Mw9ah07Hm5ADRh1GmsdBzO+hBkpc2NYIVM+U4n8Gt
         sxpZLZUwZ8cpK75xlooiQv7+/IjPlAU1pkhPNlBRCclbcRhXoa+iHlJhl0E9tIZuydnU
         66VmxumFJMplCNsj76s6G6aJBVnf5Cs3PPDtE2uvymjpwi0a29EAWQivtXUv2gX8ck0/
         wjdtyZOnBxukGdXUDcLmgJ2PzJ4oZ1PgNXXvM9Sh/HT/kLEkMFAMZms54U0mq4QPlcU6
         UtSA==
X-Forwarded-Encrypted: i=1; AJvYcCUaOiIH68JqG/GsWEwPZol/JuceV+3XiWsjVUcMWfK0LBF2fU5hyeja54AE+gcQaNYyqxPMjL9Yaqg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYfpiiMPawwpOJn9z9KheE9t8TL72RFnbXBH0NGOhvcynD3F0U
	9youDFE04uR/97aj/Gk5KYYwnCbobHhxfZ5EiniVvVFxpKUClp1IDBbXgZY+EClKAbnpwJ/txAS
	NPp3yeA==
X-Google-Smtp-Source: AGHT+IFXgf+FFKDS9FUIxfopm7ozpgUszu4+AGJgwJZ8ktIMjZA6fNUm7hPMKi6uBfRaB0VrSOJ8H3jAGuEy
X-Received: from ejw19.prod.google.com ([2002:a17:906:3293:b0:abf:6652:dba1])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:6a0a:b0:ac2:892f:439
 with SMTP id a640c23a62f3a-ac330444c7dmr1374537366b.37.1742235670887; Mon, 17
 Mar 2025 11:21:10 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:21:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317182107.2060739-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: xmc: add support for XM25QH128C and XM25QH256C
From: Jakub Czapiga <czapiga@google.com>
Cc: Jakub Czapiga <czapiga@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112112_848680_684B41C0 
X-CRM114-Status: GOOD (  11.17  )
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

Both chips support SFDP (JESD216).
XM25QH128C only supports 3-bit Block-Protection with Top-Bottom
configuration bit.
XM25QH256C supports 4-bit Block-Protection with Top-Bottom configuration
bit on SR(6).

Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/xmc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index d5a06054b0dd..963a44c3909a 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -19,7 +19,17 @@ static const struct flash_info xmc_nor_parts[] = {
 		.name = "XM25QH128A",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	},
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x18),
+		.name = "XM25QH128C",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+	}, {
+		.id = SNOR_ID(0x20, 0x40, 0x19),
+		.name = "XM25QH256C",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_TB_SR_BIT6,
+	}
 };
 
 /* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
-- 
2.49.0.rc1.451.g8f38331e32-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
