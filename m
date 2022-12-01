Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D51C43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 18:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMaPjbKN+ZX8bUlmyCRJ4H61wLGry8L0XsL9xSwA7OA=; b=OSC9lHTLkCItfI
	1zKTl2c/3w4RWg/kbc0YluGAjt33ArNGd9iAe1Ml0JY0R/AUSDllSSGYATHrjsw5BbNl9izwQxTj1
	AfZ/CwMYUwhRBCCR93zixwGwKkEAWwVcxfZ3BeidEgksHJV37QZEJVXhT9rF4fiKBLgVOSgy7yJrx
	bT8TyY9cE7zQcwmQyClIanILJi3ExYNRO32ZPzqlBcbTuUia43qZ4Td2PsXBRVGuHmtZGcslmvpg2
	kEPCOSiWKlsl/mtt3MOAznyUdtAkSmApc0Vtd/R/52wB0xAscbF5J3A19dlJu24bWX41CLOZRXDg6
	H4YnR3Pwc08aDz53mZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o7n-009YcL-1W; Thu, 01 Dec 2022 18:17:31 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o69-009XLr-TB
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 18:15:53 +0000
Received: by mail-qv1-xf32.google.com with SMTP id p12so1883807qvu.5
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 10:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pANXxsT6s2u79mRoyA7VZ+6E4AhguQU1FVPz7KDrpYU=;
        b=olNGjVtiPLiNntuyZnuyzwmHYLt0s6oLYFu/0V27voBfVPFapu9jXckEHeCKR8FL3B
         T2tfD4Ozdrh9kaT2P6X7hneUOM4QlKxfnz3VBQsSqtm04pjqyRWRgnHTpZjROk58R6d5
         BHPB9C6rM3xRNba5hfBIZvA1IfroUnyUyVe7iJzzr4sRC3hz3F3JHUX9gLS++kt3yrH6
         KeU8Ba7vuSJWe8YWokOB9+aLE6s4wRJAzo3CeAej4s4SJH9HLTTSccuYczyriCmH66gj
         F5pP+VgbuVupiWARmQLGS2z3iKJh+LucWtVNr7bPUKGq+Sz+fxiQ+suLaF2MyDSwmmOg
         T/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pANXxsT6s2u79mRoyA7VZ+6E4AhguQU1FVPz7KDrpYU=;
        b=U16JST8FOWDbkA16+8LQW6d91+cu8a44CC3P4VF1LTZu6MX/yqATEUHbjpsBftavtM
         m/h2EjcOYnQNKkagoVWbwyAhtIcOEFH040gfnDoCReGd2tGT+Kau+avWtzVm+KMRL8pX
         lrTle8XToIk08j/GsoUDRCiAtgbnJxJFWUQXiftAq1J/6RZ+89xzf+2vkIrxpnGSCCvz
         1niPOl0FTILpjS4oaFFmyLiMIJEAE8gz2zWL7zTz0otKcZDyUeReQ9lXHtrSiZcvt04y
         kVoOcvExmHuKuYxrBRWDxVaPN99BaRyXy4y+V4UhwcQSK6DkCslgyYXdDpkz3Tl4Ldjb
         cAeQ==
X-Gm-Message-State: ANoB5pl/cP+2fCwIBSKVKuCLTtj+YLRPQNwB5No9sDikAU9uOArCdMBD
	WUAZqmzWD1gtAJg5YFpvYZ6FLQ==
X-Google-Smtp-Source: AA0mqf5PrTTB1RgDgjYUeisc+mu8R9Hxa0dB3nk89uv9m8akQnghVEox8A3zsm9NMVFX4/+134jktQ==
X-Received: by 2002:a05:6214:5ec1:b0:4b8:2b54:b798 with SMTP id mn1-20020a0562145ec100b004b82b54b798mr43784980qvb.37.1669918547940;
        Thu, 01 Dec 2022 10:15:47 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8464c000000b003a55fe9f352sm2908912qto.64.2022.12.01.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:15:47 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] mtd: spi-nor: Add support for IS25LX256 operating in 1S-1S-8S mode
Date: Thu,  1 Dec 2022 13:15:32 -0500
Message-Id: <20221201181532.255449-4-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201181532.255449-1-nathan.morrison@timesys.com>
References: <20221201181532.255449-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_101549_957014_D0D632B3 
X-CRM114-Status: GOOD (  10.49  )
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

This adds the IS25LX256 chip into the ISSI flash_info parts table

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/issi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..b4412a9afc4e 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -74,6 +74,9 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lx256", INFO(0x9d5a19, 0, 128 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_OCTAL_PP | SPI_NOR_OCTAL_READ) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
