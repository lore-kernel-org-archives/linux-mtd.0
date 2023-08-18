Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09330C05052
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj7OCsLZsZ1B5/uuDGVJv1AnzBLMCBRWf44jCynvEX8=; b=B8Tw/TiOOdy6pg
	0V4+g7DoP1GPpaHmDiVDrcMg9KYkwdI0um46H0cbptIm34E8mNwkD5TdodVL1Cg7m87P3G9mBXJB8
	hmd9XXiyrNRnpuUIWXlNjs/EQjPMaQ4KdE+UhVs2zQZWtr/NgguGy7wVkiMe3gL6kCNOAbA0hbl5Y
	IrGN3rW2+ciZvsJOjntVtIT4zwKGv2vIlt4V1+bmQpbXDZyLtwwLnKy5Rk+ElLnF6gB04HJ7xVAfP
	8LzwosDQo3sae9PCzcpxyF5ac5yYufdkFDjAbmEoXjSaNd9fwwZi2eGOEBzf5ItJMtWu75++FCz10
	W3gQMKBbtdAzxMq8wNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwOA-008BWg-2d;
	Fri, 18 Aug 2023 10:07:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwO7-008BVG-0g
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 10:07:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-523476e868dso885793a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2023 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353240; x=1692958040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brCyjYfKz7oGbPW+1bpZenjUR0IT1+POIU9mu6Z0Dvs=;
        b=K1NTIyrQUn/MezTqz+JEXW8xRzYzvAeYIduPRW1RwNHSfMx09a6TAaayrEGIlXlsAh
         GqFE9TMc2wryWBNXNShvtxxYHj06pJ2OoF29/yFwBuBjzZJfahAVu/Pj78fgHjQk3mAO
         gzJoJ/555/8g6jWt1Qq8ukNvt8ABrWk40dsJGuA2Jgx8LWw7gwwLPmcZx7/PW0IAiJpE
         k+XvxSU9G/anE5xhOa0d/3Cts0sRyEOIm3tDOJ82jCK/CRLTyT/LCVjUwn/GQxhYtfFN
         cWofue9Al2ClFL7vQfY0Rq8E+7Lq/w7Xb1m9LQfh99e0Avs1YHOcV2S+KQtUOyLgxIY7
         4xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353240; x=1692958040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brCyjYfKz7oGbPW+1bpZenjUR0IT1+POIU9mu6Z0Dvs=;
        b=b/NgdIHd7yqVkdpduV85C6Or5/HU9UbBACbG2bidFj6/iks3ySYsPDZXz3nK/qx2I+
         uyUaiU8DdH/5dP2CGkV0fMXzc3IZEMzq5ZUmMAooVkMSqSfiCqzViVv6pXAdjUCIh2Tm
         u6/hRVLOD8rFGlHysoGNDe8dD0t7p89UULD4ugg3XlrDJ1bgTLGIwBREgXKlvIA7EWVA
         Cc7RgKS4cCJ2ipOvrk2Qk+gnSgANzYUQlbrh6+Ezlrtu1e4Z6x4aOUi5y5CH3x7n8EYU
         zHVXhkHDOyIsEydfJu/FzDQezQFGnpDOKQuZnn1PZxWF5ACwN5uKFOy/OH7OVTwoW2Iz
         XvYg==
X-Gm-Message-State: AOJu0YzJNNw5jVRqpRVq3Eq22njs7FBShWHDi37fALUn/uTjc80uO97M
	pH9MKPcmInlpWa+hPzCqeVAL3Q==
X-Google-Smtp-Source: AGHT+IE4dA/uJZVcZWDTT8RlMzphtTC0WyBnIY4s46zuihgI+FJK9EoX/MkC+IIvcfdnIw68SOL/3Q==
X-Received: by 2002:aa7:cc8f:0:b0:523:47cf:5034 with SMTP id p15-20020aa7cc8f000000b0052347cf5034mr2002364edt.34.1692353240357;
        Fri, 18 Aug 2023 03:07:20 -0700 (PDT)
Received: from 1.. ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id j5-20020aa7c405000000b005232e637c24sm892668edq.84.2023.08.18.03.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 03:07:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for sst26vf032b flash
Date: Fri, 18 Aug 2023 13:07:16 +0300
Message-Id: <169235322869.47965.8268381534735835592.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808075001.223150-1-miquel.raynal@bootlin.com>
References: <20230808075001.223150-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2345; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=PlE9VpJ7wzGcqvoEkjebVZWPbtkAr46bZ8tqA/TDmxY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBk30LSyQ07IjUSqKWBdvVoU5hy4VykuuBNMvy54 7N2nv7dXwOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZN9C0gAKCRBLVU9HpY0U 6cYQCACeiFti+LqqkDMpoTCBXDwkzdsYAsNC8pIa2RpFINfsR8qSPODQwGsRVUDZYTDiatkzLLR RuKV/m7yJZn00NZtEM22Umx8n4EAS7HO8gBj0hYh/PnPIwnMtmFjhol9xWGukTYQuH0mF6WWLaU t8DUGt22hkNLMh8sBMQpcOVRLrQZjeVMHDkF2Gedd57UniDJU4yEttIOYsZgYfsSDxhAAoRuFNn ZpreVewlrD6gQfy0PQz5LIqAW9nqj0tP5J7H6qNJuA11TvXVj5UHn7nvlQAbPEu6tAXcd3Ydi5k y2m9z+XV8n/OwgkZeFQvZOlNqJKxIBFYf4V+w/b+6X2Gy9Tc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_030727_252713_83C0E57A 
X-CRM114-Status: UNSURE (   8.59  )
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

On Tue, 08 Aug 2023 09:50:01 +0200, Miquel Raynal wrote:
> Describe this new part. The datasheet is public.
> 
> Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
> 
> Here are the sfdp tables plus base testing to show it works.
> 
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> sst26vf032b
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> bf2642
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> sst
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060102ff00060110300000ff81000106000100ffbf0001180002
> 0001fffffffffffffffffffffffffffffffffd20f1ffffffff0144eb086b
> 083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
> 1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
> 3d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffbf2642ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
> ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
> ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040600fc
> 0300fefe0202070e
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> e7efddddb3d5ee89ca37bf6b6e789645  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: Add support for sst26vf032b flash
      https://git.kernel.org/mtd/c/9d0164c6500e

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
