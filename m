Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA57C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb9c3BQKjDGRbUDZCmiCCurlOw7yW5IRwzKfzn4gOdA=; b=s/nLJFs5W4AAPc
	Y+tad87O0d9dCKiRqKp7HX9ZE0aeeaaAsir5LW/cQgcC+w0eqZKO/vzuJnySb8Pdn29FGrDcP6tmV
	2S17chLtm4cu2q1hKlXk7xLANbCVPGvhhitBgzK5AFMrRVwNjD1kpPi3mjw/12C1vtZ+lsOMM8PSr
	29JaAdJctEFDXvW4gnDAU+OLSC/K0HaTCdXnXlhHNroyCBqBwxKB+Yf65DIb69p1Ozdm8zMG6DZT4
	wUh5+rTmdAAFpEbMJMT3Trmi3sGeaI2znTlIzaVhWwg6ZYEOFjDTLFMJ8ub153ELfGfD5TGkqDdTE
	bEgd4Gzs7c97iYdpPqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3SA-002Rkb-07;
	Fri, 15 Dec 2023 08:21:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3S5-002RhE-24
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:21:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso4512065e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628503; x=1703233303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE4J9sdEbAWjadlcgrRDtUX7vxkIo3SYHmREd1D2LhY=;
        b=Zwa6GouBpQwVoWr6UIuU9tRr1YYPK5XyUq+caGSIlvStdliczJqXLCMRM5Da0PQ4/I
         nNE/2KpfFl5bYvenVw1tA9ngQ06JvSRN1wqNXG9spve1mvNZPGYmbtJthz55Ma2pHw8Z
         lOMGF2mGeoNFu0cSyLvajl3fPnjZ4MARsrTs14Ttm4lmepmDT+FHKEypzNAOArg23NMD
         v9dHS7//DssUhKaWaY9bHHQHf94B4tX8Mknf/BHBoPLW9CbhPZVkQ6gbAo5eqbbuCwkw
         c1jkK2dhnYFc9bshaU5iwxyuxgC36La0U/812bgo0nsMSG7tG5CBNoLjR2SbvSkzMRjW
         9T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628503; x=1703233303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WE4J9sdEbAWjadlcgrRDtUX7vxkIo3SYHmREd1D2LhY=;
        b=rKRsszfVyJZUIFb+BomuX5Lbyb36T9kxgv/fnS8fPUg+WEKZYtWQWke7T8Qp+vpoWR
         ETQxuDrvDfK9WSLgGbXwVC17+gi+VOahFUmyEoydx6TTgXkoXoT15bOTqJayNySWNm4s
         GKUGkzM6WthqQ/ECOv/e8GmAZ7tfwMcBuEZ17COvy4fCqZyCburIjHWSQIoTu95DE/FI
         DOp0LVwXQBdh6CR3YPosaZQzcPY62BzmIMMxx1CUxUeFkJW1R4n2R/+5YQqD9uqyFI1V
         rs6qz0KJ63JFArpdMmn+AzTuUzgoayq2BUBMDDmpXBkwe6zpLi3mtRsKF6l8e/0RLErP
         Adbg==
X-Gm-Message-State: AOJu0Yy9DbwXKzzxW0Ye/iGi1gsCnnWnt2K/31F1Hh6eZPPMm6rPV3ME
	lFKsRSpBvXg271k3nIUdSqBA5g==
X-Google-Smtp-Source: AGHT+IGxkZNgiuICrNCLFJ3rZoeDIcqctyrcaLzvdZrAndm8llSBFigGkDTnFtdo2gynrVR2w/tUaA==
X-Received: by 2002:a05:600c:249:b0:40b:5e59:99bf with SMTP id 9-20020a05600c024900b0040b5e5999bfmr4088179wmj.223.1702628503704;
        Fri, 15 Dec 2023 00:21:43 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm30365570wms.18.2023.12.15.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:21:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/4] mtd: spi-nor: print flash ID instead of name
Date: Fri, 15 Dec 2023 10:21:35 +0200
Message-Id: <20231215082138.16063-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215082138.16063-1-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=tudor.ambarus@linaro.org; h=from:subject; bh=fRyfzko8la0oCOG0RX2CCXFxXMrr7i/8B7atPKhz260=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlfAyRihKH+RI8/qRe0hK1IhGDHTic6pMxXPYs5 LnRM+P/4lCJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXwMkQAKCRBLVU9HpY0U 6XD6CACyrcB+g8TzFuiWVZUQywzLCBw9n8J1TZkKlPXDSge9SYaMxQWXrisUVJRyp4TPFDckCcq g+Ogvbm8MrdTNXYi/rZHjVxYxQQ2nF9Dhrwd5tMNv0Y8MlqgIIV7jN2d7BGiBYzyat2z2+LszYE jX1HuX/mcZvyLxPPTZBGP/YXUOzwGr91zgRQE/bOJ1f56TEGN+0tU+MA8J+QjfUyuj8jeowM6V4 YJZCpPqxk/V3XxKTV5S+r2bZDAz81yj+p3coY3DjhNuKvOXec3yzFJPOiIap3byp9xa6+WfA7If 4DC5Q4PsepRygwyOPgCUhGDsdCmPQsrrE4KCTnZ3PBdngr+W
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002145_679403_2E294FB2 
X-CRM114-Status: GOOD (  11.62  )
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

We saw flash ID collisions which make the flash name unreliable. Print
the manufacgturer and device ID instead of the flash name.

Lower the print to dev_dbg to stop polluting the kernel log.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 503fed90c2fa..ca5bd93d1f17 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3558,8 +3558,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* No mtd_info fields should be used up to this point. */
 	spi_nor_set_mtd_info(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
-			(long long)mtd->size >> 10);
+	dev_dbg(dev, "Manufacturer and device ID: %*phN\n",
+		SPI_NOR_MAX_ID_LEN, nor->id);
 
 	dev_dbg(dev,
 		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
