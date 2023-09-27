Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C83E810A8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYsPQY7rBU+ugzkox0fh7yU9TOFIQok9CDrRsnUPSic=; b=lUyiY2S+l5OaZG
	5DSX5mRwxvwYakaNgHu0yhmZRK0RddhDstwG5Z9q2C0DPWkVlPihI4JyKMaXpjBGW3Rhg1LQyXqLr
	Fv5ZZnqyp2dajdGRxWTmyaLP1aYF65Jv9Ybmwl4or0sUZdMBbKL5Iz+uVpxIqWnJBk4rCjTGeS4Ob
	xP9oFfojiWYHq5Kd3NFSEVXbL/3x253e1U3tNpT63AJPV/957Apx2EIHle5KSnTTSV5U8rfJhQxVn
	EUPiqL9jtDpHmoRWtrUYvYRkEAIjmAOBG2U+a+Lq1561o9c3euubLq044tpSVMggJneHkV1ygz4Do
	35NytUGPEGp83Ffq/99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQD5-000NRa-0g;
	Wed, 27 Sep 2023 08:47:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQD1-000NPt-1Z
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 08:47:52 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1344974366b.2
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804468; x=1696409268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG+aXkNbfbxBluGasKx11ard4exS0JS35Im9h3EpZhA=;
        b=tpvago9rM6zjJf5jCpK2EHsD+T2sodX0LKquj9FIAfD6cysXyUm4hjv2ZNnafk5ZsY
         UG+fHUCynM7ul3Kv5ZOGNr4Q954Fs2aQez/LNO1oUIycnSV1LSZAmhoGz0wU/E7xkDTh
         acgkbj7bhcihiFte8E1DiSSaMImOMJvDbmuVqnZDWflhiDbk07/d31VhOkiQyLcPRbna
         JNE9YC0POmpJaPvjZmpWjPym584SHbsNH2CsUvualLe7ffEIF8xY6j92ls5pg+QM+kHt
         wAOGRYxuoqwGIFyQthDy2T2cwyh5Izg1547qfXimdTp9+pVRjWkYqCaXr5u9RqDrNHVL
         6bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804468; x=1696409268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG+aXkNbfbxBluGasKx11ard4exS0JS35Im9h3EpZhA=;
        b=BrfOjkQYhCMipVfXvy1oKHqRloliX83mmx9iq4zDpjaVAokD4EOtUHYzHh2GKyZZn7
         tiVHM8ujkqnbfaMvfXcMme3hZTAOZwEpyQ+UbD79S4Cjh4vG271zu9Bh4iVWOPDALtxX
         WiAYY72DY4UZZukDx9/6siO1C3eZR6IZG0qbzUTJr79cP8FA+pExAGK+sZHoJi6Di7BZ
         e6h6kU8enhCwl03x8Vpz1nugyh9VepMIierE8hZPunIvacMY9zzRRxTerPBXtBx2Gf4G
         xWWwWc13smFDkYkLUt3ef5+rKpIhb4ClXwOAsAwheWmVwUtxeZUUG7e1clFt2fs8O+tL
         EkTQ==
X-Gm-Message-State: AOJu0YzOUj5ufjnqzdjsd1uNiJeXYm/d0ni5NHPnTn+SiEICSLIH/aC1
	fcr+h18BPvcGnexq5lhOz4vDpw==
X-Google-Smtp-Source: AGHT+IGfbYjgsqnjDdB+1ueCcIXEFM9gahUF8DxTN/prspZwTFUzdbaBaRYAhTpkpvSrHO+dtO6XYg==
X-Received: by 2002:a17:906:2189:b0:9ae:7681:f62a with SMTP id 9-20020a170906218900b009ae7681f62amr1095215eju.44.1695804468278;
        Wed, 27 Sep 2023 01:47:48 -0700 (PDT)
Received: from 1.. ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b0099d798a6bb5sm8988021ejb.67.2023.09.27.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:47:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: atmel: add at25ff321a entry
Date: Wed, 27 Sep 2023 11:47:44 +0300
Message-Id: <169580425755.36479.12426920554100135654.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926131655.51224-1-nicolas.ferre@microchip.com>
References: <20230926131655.51224-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=558; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=KW1K6AmNfX80IsnR9xpUdUv6VGG97t5DOKpqmZ7gNtg=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlE+wuqZPbqnRe2nbZAzVsbQm+067KrUdralogc /U169CXCrqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZRPsLgAKCRBLVU9HpY0U 6QvoCACSUw+04JAcr1Q/YGxqO2jKfbnmEB0GRWZjOqQnb+wovxPsnLphKeT7iLDNCgctgcFSdO+ erxbJ/HNDLdx62Ud7LLWN02rmD4OTHPI3nXhYVBrxnUV+cF79QzhWZd3Btx59PKwILLrdiQnIom U7j4Nr+k0jIsvZcZXi4bDNKSoBn7MS7+QjQ/J5aXZgPYg58HoI3bg/XAI1FXGUC9p4JcYEorpl2 an4XzrDarr66EPcBGxHZMOmwWspTHzqktJy+zJ9aAMKnTO921N6LJjKFPG30JttyPGzz2zpCbse 4F2/94ATMDbCHnur6Ai9LNk2kmu7EN8nSAjMhzIFTwz4Nl5u
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_014751_520140_9FCC553A 
X-CRM114-Status: UNSURE (   7.26  )
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

On Tue, 26 Sep 2023 15:16:55 +0200, nicolas.ferre@microchip.com wrote:
> Add the at25ff321a 4MB SPI flash which is able to provide
> SFDP informations.

s/informations/information

> Datasheet: https://www.renesas.com/us/en/document/dst/at25ff321a-datasheet

s/Datasheet/Link

> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: atmel: add at25ff321a entry
      https://git.kernel.org/mtd/c/8f407eda173f

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
