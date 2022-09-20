Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1637AC6FA90
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BG+BTRecTGPJAK4Xd3+QR7tY3jznKY1XwFZAFJ6Sb6U=; b=is8DBL033DOogX
	jw6vxM4C7gK9h57D3Gqeiyq2bIZy5kM7mBjRGYdMjV2TpYs5pjo+3tyFRTz5od91YSsZecpS79MXo
	JlGNqiyP5EXi9SndiJsQWbWrADGI0FQP/kiCv06r1ht3cnZN8J4akM1mSKUI7FaDQiTA75wSUf9Lq
	jf8fdShLQ5SQETkQqxTJgxbDtWDpUykYYdhnR7a93XxDMp5UVyBuu+yN+JTbUDFF9I5s/PpMfpqH/
	dAlA7LmbpdcmciFpRLSubO43NaAxGJTLRX2hxMNvJc52K3Qx1hg5YkNfQtPlHZyE6wXtdRTgH+Z6f
	AnjAuQxybfhWl2RygrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiI9-005oct-L3; Tue, 20 Sep 2022 18:48:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiI1-005oZ6-Iq
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 18:48:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id az6so2731615wmb.4
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=e1rax8zHktkJE4NlsAmrfBmfy6JQLwKUdVTmbuE0Kvk=;
        b=hF571VujJCMDxHcL33xXykpja1h21tI7IF5yEPnBBYncPApGh+8n57VgyUlTu+m3yX
         wns7sSyA3Oug+os9C3c7qMqW79l4cj5reKYE2Ouc/wFN8PAQQcjeJZB2zME9NyX4GMY+
         TnUNugxpJMyKaX08YJLgZrChhBULnCHcIu9v6OSOffTu7aGJndgpEi8Z0xAU6ZDPHqlV
         JLlu2ajyA1yroEGrX1aIdMInErCeqvTSxr44265WFwqp0tN2HRpsl04/yFuQQA1jMJLT
         VFyej89biFNpTlhvnGzlJx0so2Rb3j1fGr+vyBD4YpjgYpPde+fVVxbcsnacpADRRE2M
         LJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=e1rax8zHktkJE4NlsAmrfBmfy6JQLwKUdVTmbuE0Kvk=;
        b=fdiyQRWozBo+MkumZeySsNJvsnmx2xu3/etwKxLwjMqnw8Hup8ixezurcphqC2k3pL
         MPkOtHAYmmZ6q4DBBbhaL/+dY8/tB+NLTfPGuqtkxa+bMmlMQvcEgX+S1jfWTJGe2Owe
         mUIu0lk6XUUKBFdYphEykkZu/uKkP3HayLAeJBCgTKBd5afbMWxmouqMsnXjag4W6CNy
         zFhffxeNuoblkNEdfx0Q81jsLuE8d59sotXxvIfielXoA/Z3wXK9DcErjw7gGDLbVmMz
         1j9WHiVYLSRxOU2cyb74ZLo6xh2EEpryPBZMRnaR/ip1UcIAe1SjU2r+1/KQslofegqs
         mjbQ==
X-Gm-Message-State: ACrzQf33M9GECL6j0EvXWedJsR78pUHJP444GDxZ+aOoe73hyMSnSq+u
	dBXi2kK17nEI0yiAh70QY/c67w==
X-Google-Smtp-Source: AMsMyM4Tw/NhBtw2kzdJcNMS4tkb4L/Hz8kHuIiUNdJMWTGNUCY8P/Fe189L7qnKquwt04na0P0VEw==
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id bd21-20020a05600c1f1500b003b48600fd7emr3570480wmb.40.1663699689952;
        Tue, 20 Sep 2022 11:48:09 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003b4c40378casm469974wmj.39.2022.09.20.11.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:48:09 -0700 (PDT)
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
Subject: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
Date: Tue, 20 Sep 2022 19:48:07 +0100
Message-Id: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_114813_644790_8E90B56E 
X-CRM114-Status: GOOD (  14.62  )
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

No change from v2, just resending again with the next patch.
Results from the tests given by Tudor in the following mail.


 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754f..8b48459b5054c 100644
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
