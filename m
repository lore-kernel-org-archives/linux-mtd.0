Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D44C46CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmPSBeh2GMHVnjThpaOp6B1nf8tUqjasbeLjwY+SPBg=; b=nNz57hFEfgWovx
	KQoz+AU+nXsMAGJt2V7KuaVYxQ1V33F2WoV84ASAXbhEGniOOSk5zm3KNRsR/cs9nQFpHLZdrcG/2
	ElB2kAQBWNLP+3kGoAnImKXQRXKCi5+H0GheZWQbR9M/9FKFlWvhYzQB+efkRBAfyCF/cXtbkgEj5
	pOhHu5vH8d0QdOs+pyulJWBXmXdutSdJvVgoL7Y0RUJpf0/7EEDCwSyAAhwQ8fUL5crB4CsiedH0o
	LxVdjOm0njIj4LqsrImypMiJMU4lfnpLwNwIDt/SuIxTf2aX3QfioFbMf9VZ+eICjXEL4oiwONHi0
	esM/p5Ycqhn9VZ/F4p+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3SC-002RmL-37;
	Fri, 15 Dec 2023 08:21:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3SA-002RkH-13
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:21:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c31f18274so4779985e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628508; x=1703233308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuJawO4SusZv8/FICQYIvQK4zSxUomciGjXfeupkpPM=;
        b=htGG4gSknCMI+Wyn4z1ZLAmHIvA0ahAPQ1VQGBNABHoZQgs3XrubeUU1+5niGMc0BR
         AUDBa9V5z0+86ei5Nn4ZJZp4mUWIpEVoRpUWaAAvj/cLcXqIBacg/Z96pwsFUEqVNHbq
         x+UawS+F0KsfFZSIsBqDR0ZZXUc0CFJcfphNmOKpIFC0Q96kle+AGsVea2AheAfWiO0u
         y6s7y29BsM2tSPdy+XDttrI3XPsYR9mb4YQ+BD+v0ZSH1UKjBXSHcIMvQF+j9pMH+f/g
         jfsxQlZcZ6lOAp4IUZ5NjIlrFXSt/bkQh85V3nTU5Mh7pWK3ZPHLzEEYy3W3sAlMb1Yk
         VQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628508; x=1703233308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuJawO4SusZv8/FICQYIvQK4zSxUomciGjXfeupkpPM=;
        b=KFzUSZ5Fhd3LsOmArhKkhCY91MtcoWlngpJhhJ7cqlV1Bnker69jSyYkQxDjW6Qyy6
         /SNdLQLGVnpO99ZgRCp/CwGh8jKFKWNQqsXF1KBHkAV9noUrqmFUSvbIEi1p8AUCpgvQ
         y+OUWvav7SfkVbrX8a00pkLbNDFEFI9gi483wkY7Pk3Yp9XFByrTf369vPs47VFisEJ2
         qD995z6TEnWCMlE4I3ThVVH3gD0+yOfKTODMVvAniyUF6yWHkgsbfyDoYLKSOGaP+gll
         1kyf4STGy7qnew3iHAmJ7ackm4I2BKr2CftP2X+cyaDIaWuwHpBkyfqdUm7hJWkchFUD
         +bmg==
X-Gm-Message-State: AOJu0YwOzUAaS9cOFVgMKuugM9/6YjD6UHkDL6+uWjpXiP4Vxgw4ns1N
	b10YINVTEnLGk0ofh4YP7h9Fhw==
X-Google-Smtp-Source: AGHT+IEbe2QkPEqCtjPj/fi/n5kO4uAzZ+iTCV7x1AVruE2cmQ2PU5UDSwoezU/9v/C8IO+qTKl4vg==
X-Received: by 2002:a05:600c:292:b0:40c:260e:1bf6 with SMTP id 18-20020a05600c029200b0040c260e1bf6mr4922669wmk.192.1702628508089;
        Fri, 15 Dec 2023 00:21:48 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm30365570wms.18.2023.12.15.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:21:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
Date: Fri, 15 Dec 2023 10:21:38 +0200
Message-Id: <20231215082138.16063-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215082138.16063-1-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=tudor.ambarus@linaro.org; h=from:subject; bh=g4bufmfMS6w03D11CI2uGLsvxqA3io9spWS2c3zko/k=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlfAySTlx2lf9cwP4qqsgz/vxDdsVq7T1ap/JJI BpGZZFzFMiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXwMkgAKCRBLVU9HpY0U 6Te1B/0RAVmyu2FL3aavzo1rPOrgqcXWHparU1NyB6HBFb6+5q5BQ2Sglzlrm7fsREvIdcQni3f k/SwZgWKcJ8caUR4mZJJnTTwuV9e+Y3hPkLUNlK74SBOzxZ3UuvugVxykGAvUYjT1vhUixxKLnH p17ELt0f8QR9bxPhHZ8rn/S25uX/36CcDFIrtOK/bdvW6Sbv2q3wZPXfnNlMfZzi2e12t+ok4Mj lMkdls5z5E54mrtjOfxS+isLi1qEOaro8jjw9i4RvgZA9fl1AH5/xssRUE4oCrV7uZYivrvG/nu /e7opM8CRO2jk2kLLEp/XqNtuIuWWYgomUXVDUeeWabi/K4T
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002150_365087_E22BDF7B 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

The mtd data hall be obtained with the mtd ioctls or with new debugs
entries if one cares. Drop the debug prints.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ca5bd93d1f17..a708c3448809 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3561,22 +3561,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	dev_dbg(dev, "Manufacturer and device ID: %*phN\n",
 		SPI_NOR_MAX_ID_LEN, nor->id);
 
-	dev_dbg(dev,
-		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
-		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
-		mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
-		mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
-
-	if (mtd->numeraseregions)
-		for (i = 0; i < mtd->numeraseregions; i++)
-			dev_dbg(dev,
-				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
-				".erasesize = 0x%.8x (%uKiB), "
-				".numblocks = %d }\n",
-				i, (long long)mtd->eraseregions[i].offset,
-				mtd->eraseregions[i].erasesize,
-				mtd->eraseregions[i].erasesize / 1024,
-				mtd->eraseregions[i].numblocks);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
