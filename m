Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF6AC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD+MA+sU1wep6UVUarpM1PHvMQ7iz6zkmkHOTq3898o=; b=Byp8vL2qgm6kN0
	HMpMdPngMij9oZJjZbG0Vbd9qMK9fGsH3xIZbW2mim3rZkX3V91cOmjlGMv+CNljZrSm1J5ZhcJwv
	7AhkdeMMlmxA2kOlBR5XH73kj9wh/l6/GS6GYizElzP7x0RcOMP8B01gGjVPL6tvJH3pHdr1XVjUb
	UgPUCveUAW/K4HbiaYu8MJCfsuInd49bbRrGYReBtQDBV+Y4uiXSzKjEOcuS/fFBlaY2YshrrX6mA
	QTKBc7E9Mm9VSkvXoM/72zLKsd/4yp8C7ij1yDJQtmWJ0zzhL8TZM2QMmhaP0Xwhfa0wjpvb+EFMp
	3oeGRITTqeVFgzXPaI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE4t-000Vnr-RF; Thu, 09 Jun 2022 09:03:43 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE15-000Tor-42
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:49 +0000
Received: by mail-pg1-x52d.google.com with SMTP id y187so21284926pgd.3
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RgA8r+RCZPTdQoBfUu07FuZCEcori04bi1d3bbFFnXM=;
        b=Zk7HU51h2zhdjVmZp7J4PyafVzvR5WIX4KANdn2gY1EuU2lennI+o5AtHRsMiJ8Xey
         e93gPGCBQeI/SBZ7AmOmtvSQ7ggLU/9kC1ryAu9hi6jwofy5Y89OAZPB1RacynuTc8C8
         1VdrlIlc89moT8KCU8NoPBeWUvbUnMpWZoXN5ajy7Z6ErJMKkI4pki+gKVh5fZpS20hi
         DLS8bKOK0HMr2gVchpdGADc05FtDnFXqPTnfdDBuRhuLeY8EpfhLzC+N6NlWvishyduT
         6XJh6V/KBlsxM8wVQSdyrpRUUI2AcqOyejIWIvV+gJ6+24hewW+JLTUljD5AzyjL7GuE
         ggkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RgA8r+RCZPTdQoBfUu07FuZCEcori04bi1d3bbFFnXM=;
        b=QY6OxeyFUOtbRWQHVXEF+jakPke+MAJo9ePAxoOTtjIGt4ufap4Iwx62AXD1eYCCko
         2ZaDTz3txHNRkddINJUwyQcUGZhXzEMvifXSCGd5kwFV8S+Qv8F1JjcIC0S1CY7DP5de
         cj7dxRM/UVHQEDV4FIBAW5l3klUEz1F4ZyoNMNL2pfaM06OlZO/Smv6W1V1+vGRFoWBB
         YPxXzwRpLkwesL6Lp93gCcmtJ8ayJtVv5gi0ALV1ottWoyfCUh7bQu9xnd0xsZhClFuP
         aAP+/2GLuMNZFY/+duHMjHUC7Ux57z5slgR98sgrDGQljDk+iGJ6Um2Sl5qpFjZfrPui
         J5Ng==
X-Gm-Message-State: AOAM5316zodZzxS4na83JNeR0xcKUn0tPJstUuhrgg26Q4ZrH46raQl9
	8lYK/STXX4WXeIR8s1nYkAWdgSu23qk=
X-Google-Smtp-Source: ABdhPJzZ/p72P/0iEsDgvSqHJWOy3fr7BoLIb85YzqfVnat/Vzf4N9vgNhFquyM/4bWToVhucEfRLA==
X-Received: by 2002:a63:6cf:0:b0:3fc:961b:deac with SMTP id 198-20020a6306cf000000b003fc961bdeacmr33033170pgg.180.1654765185565;
        Thu, 09 Jun 2022 01:59:45 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:45 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com
Subject: [PATCH v16 2/8] mtd: spi-nor: core: Shrink the storage size of the flash_info's addr_nbytes
Date: Thu,  9 Jun 2022 17:57:39 +0900
Message-Id: <cb1452fa379323665deaac971be140e203fd46a8.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015947_224385_BA36B743 
X-CRM114-Status: GOOD (  10.59  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

The maximum number of address bytes in SPI NOR is 4. Shrink the storage
size of the flash_info's addr_nbytes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index cd76296d0060..5eff3f636416 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -488,7 +488,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_nbytes;
+	u8 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
