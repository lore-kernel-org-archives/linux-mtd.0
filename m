Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D454FC25B08
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwEfYaZ6/ROTee/X8NWzPxrX+TBkxdI1tr+VQhe1fb8=; b=Y1+ROP1duiynQ6
	5AowsFHXtUDn5913TDxuWtdSP1flvwu+H5n3Grr3rzJFTDvoP5XSblwMkmvKvmQNsfh6sco7Y2C9f
	WovANwqdapB58jcyb9c8ZeNq8xWTwwE0CCbo2UNdTTwVQI2CBZc0hPRE4aT6qy0QZgpKMEln31IYP
	krQt7jebaqF3cM5aZkKHciP7AsofVMLsd586f241Pxuo+YxaQW/Z51NYO8lJV6wbqkLh+hGXhZ7go
	BKkClhAPUBgeSBEtJTmy0+zubcQ94FW6r1Uz3Q3HM9ZMA+a9cuhgDCBFRIVcX85f6sxYwseGd6rsC
	bkzOra2+fmRbOdcaqVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVd7-006B9u-3m; Tue, 09 Aug 2022 20:15:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVd4-006B8j-P6
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 20:15:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n4so13740456wrp.10
        for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2022 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fht4T02AJsm7RzN5fUBiXhu56qdywVISHR5D86D3Apw=;
        b=gEw6cjkxWXxas2xdn6RuNkbfUeSd9bj8xuWQIspShEkoneStEVjS2ZX+o4lzyl7oAc
         uJSg5WyRCCUxRPad0T+BR/WmkzdFsCtcVHUvJsQaixLFAaNeJGZsS168NzCBcjKu8KIO
         II4sv3LzNOyCTNZC7PUoWFa7qg95HWKTZMJxy5+SvCId/K975iyN7mZSxPCR9tlNKlGv
         qwhvXDBpT+qG+VdAJ5CeiGvrrQxXiwqjkAKVkThMa32qst0Qxnhaxp1kG8Gm45ETlwDj
         5XXGmw6j1NQJ0SoQXDP9PV0a77HlHiqyPIvyFIAYIAM7w1mOF4XyQTyxkhQ3Dn5Rcpzy
         w4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fht4T02AJsm7RzN5fUBiXhu56qdywVISHR5D86D3Apw=;
        b=7ZpTiNFFLo7kRp5Wd3SU+sqBLvQkrTqR3KFK5WERUU3AIRUqCQtUuU1RPEx8rD7r6K
         60ZACVvJg4+YrKNJP0lbxGvUBa/wPhBFRxDaVDRuVHl5u57baUbUAVblBscn4898ODE/
         J+QJo1xzQkWSPNQqpApdfarWh/0d/6wwb8DcjTmyI8H4aRFCZ8APaHVrT8EPJ/x3tvg2
         nrEVeFt51n9RX133S18d0+uJRwNagN2/OEz5FrQGHZ4M+/XIj4lJ2VBiEEn5P1iDKjIJ
         JoDBunok0CaUAqk7QtxdpEbSbb0GjW8CXWEXtQIurAUJQy1fU9HPxqcbuwGw+vwfL6z5
         tfRQ==
X-Gm-Message-State: ACgBeo0gIUVDFPk6kj0T1nSRAnRsv0MKSQmozoTAWO7OznT62hEayQKx
	wcffFRY3OE71SnwsnpPtu9Hg6w==
X-Google-Smtp-Source: AA6agR4ob8fPym4LPeE8iqiDyhAvDhm1vefWb8U7o4ei9PRaZwpcMvL6xB0SHnLWnkB/tGwNcMzo6A==
X-Received: by 2002:a05:6000:1f8a:b0:223:796f:c1ae with SMTP id bw10-20020a0560001f8a00b00223796fc1aemr179721wrb.514.1660076105156;
        Tue, 09 Aug 2022 13:15:05 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b003a53e6c5425sm24041wmj.8.2022.08.09.13.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:15:04 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mtd: spi-nor: issi: is25wp256: Enable Quad Input Page Program
Date: Tue,  9 Aug 2022 21:14:28 +0100
Message-Id: <20220809201428.118523-4-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_131506_838634_4CFDD4C4 
X-CRM114-Status: GOOD (  12.73  )
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

The flash chip is25wp256 supports Quad Input Page Program but it is not
discoverable from the SFDP table. Enable the fixup flag for is25wp256.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 8b48459b5054..36e6c4a1d022 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -72,7 +72,7 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
 		PARSE_SFDP
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_QUAD_PP)
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
