Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DCC19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWkv1BmOxhyelgWTQ3tUm+s1x15RqXkQI8myG6OLXA0=; b=3/mkVLscuhHdOM
	wIgUU4yzHYFnle6KVvOuyy6akGIDE2PSkF2sX5u9n3AsGua09vEWfy4zIlfQPLGWAndx0zf/+aquC
	trWyoXdmDX4fvOI+dO32mT8W3+rLL0G4jVp9F2pRSWQJmKDzKcZNwSAh0P5FrX+WV0/ZIbpwALmla
	pUZNkaU40OEgIncv/cjGjJpMsf/xMf+tObiVgJHFkleNUH+il734Rc3JI7+jXMe9DwpevG5h9zBJe
	wfVZVKc9LQcRlVFxGEInomLtsl6u3EQNS930/iZ8iuVyM0+QA78FFfyUQh8rwG75xhy11X8J22ADa
	dlitHD4ENYy7VvSOrp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVcs-006B3t-OB; Tue, 09 Aug 2022 20:14:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVcq-006B29-JO
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 20:14:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id l22so15518439wrz.7
        for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2022 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=n+sIRfD+RQiRGeYS26jphMxCdbHEnhlhpCnFs913kcs=;
        b=jejZm+LsOkP/sKHcTEjTV6a/YYsp2p6PJWvV5Wq5e8AsJrGoqYxITRS6VyHhbYmoJM
         hz3dmUTvecCc+8BvqDnixZPoalS7dbYY5PMNY+/s85jL232ek1hkXHYI1OD5gzRwOV6k
         nlBEF2Gs8w1ocpv5PHneyEd6jUo47n/RFaR13fe5PGUkP23vB2QHFlpqLcpMtJqxujMF
         vfvY2a5JjxDykh1Wn/uI3hDCqNVys2WFTCDMTyXDTQLYOe4LiP+SYg/7YPfwdBLfYmXG
         giw3vBtwH9PmT61uF1ns7I+qhVCoRDczkpafU2m9cP6VaRONGMV3TLZI1ltQQGFyojJz
         UVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=n+sIRfD+RQiRGeYS26jphMxCdbHEnhlhpCnFs913kcs=;
        b=wVxRsnkZjPpnhPlZvQ13pmd3MajEtTeXABt+Y5OsUll4EQxRZ6xBxXhIywyj41omQu
         JyX+LmSyDCm3z2E4Sdilc1aXKAWcXUw7poTGuA3oRJgI7sx1zJWwWqtnuDY665m1IAsU
         mOYc6KafyxbFBGdoIVWmHJ0iJ3/iKi5QCshOrC0wqQXt7Wl8EkIIq4cXjMJV7wcYGros
         5CY9qP/SMqHTZR8RkXSBYKNgJPaKvNKXM/0h38RGGhHI6LI+qD4OSeG8o8stE+RHBuIM
         q7QpWAVELy2H4rqo3CqRt0LsKETEB60GyDYONk3SEFu2rILTVfcYXzW0arX+IakeDGHl
         NY5Q==
X-Gm-Message-State: ACgBeo3WN16T7/UNVUTyhzGlSUACwUSerCPjkTkSoop2n7yPEYIfXvnj
	sQAQQzVt1opGom+3nT/S9weWAg==
X-Google-Smtp-Source: AA6agR6Q0kQEIw5VavO/Vm78ynSFGIF8hJpL/Byv5pZN1uWpXtoptmzd9VDOfD5ycVuA3Pjge+IeXQ==
X-Received: by 2002:a5d:6608:0:b0:220:625e:f4e1 with SMTP id n8-20020a5d6608000000b00220625ef4e1mr16069047wru.252.1660076090308;
        Tue, 09 Aug 2022 13:14:50 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b003a53e6c5425sm24041wmj.8.2022.08.09.13.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:14:49 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH v2 1/3] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
Date: Tue,  9 Aug 2022 21:14:26 +0100
Message-Id: <20220809201428.118523-2-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_131452_656711_663A6065 
X-CRM114-Status: GOOD (  14.00  )
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

The datasheet of is25wp256 says it supports SFDP. Get rid of the static
initialization of the flash parameters and init them when parsing SFDP.

Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
After this patch, it parses the SFDP information and still uses the
same opcodes.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..8b48459b5054 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
