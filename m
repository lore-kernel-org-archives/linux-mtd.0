Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE25CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 03:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Maal+qrOzJQb8ZH6mHw3kwuSWifaTnzHWcONjL+vQ3w=; b=L86t7CdMSEEW74
	cL9NS6vIVizgE3QrS7BEUrLAv0B5p7syEk1nyIGaNKQLRLzdzgk1UNeaHbd9ZLRaXVs7BXegc8fSQ
	znRjCTHl4fkaMdF0mO8kzw1q4UK+siioVeZ7HDsMMj5RAHhuMBP2hY7FZN/hDKyAuCVqGWwXVMnOx
	Q891yKcaY6ABCP2cPLU674eB+RI/Dd8Ng4scrWOL4CaY+8FgeM+hbk7l+NBNRaUIb7EKjYUMxCFV8
	qHKShwj8hRP8do57QmRwc0MdldR4x/5/bx3briTr1AeDso5RsfvlV6ksjpHT575aY3pTGGl0cAuhe
	dNfQAMxXMgpxAHyCSnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9p-0000000BnLQ-1zde;
	Wed, 10 Sep 2025 03:06:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9m-0000000BnKX-385I
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 03:06:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32d3e17d927so4173769a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 20:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757473561; x=1758078361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQTQWVOok5Rz5EsWa62UL+1rMIHEWSusnO/rTh03xFQ=;
        b=XtYYFpz4FySLuE+oGBRfzuFjYLvgXqfxnXmTu3RQo5yYRwzrr7jJyvjjyDzJCOuY08
         wkwR7oLM/dRsJ0ZldBlKQFkJA/c9V1VMkoCB83OcPu/n0kVyErcfypOQDBpau3AeLgyg
         phOP/RiT1jnR8y+CU+kX815yOg4LusMPa87yclyl1LjFYAKLoDTyOUHUe8qHUmrnxvSB
         GTmNRDCMYrMQPiqtW8EpehNaEqf+7hB58UJ5/846Hz7mWT9fLysGJEIO0aXTnyjm5Gfz
         HTKSvEDvH6x6SNZHda1FfDjo4BsvNKcVUcRI9DOeptZQcUin3o93mlQ7BAzVmCx1+l6p
         J8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757473561; x=1758078361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQTQWVOok5Rz5EsWa62UL+1rMIHEWSusnO/rTh03xFQ=;
        b=gfi3knzVBzzRXxgCgBgHSJ9cUDRmDHwYISASHsH2mLo4JUpaliksXAG1cLauV7dHhF
         OwuOAUIVCZLpEKtygKoofpwUO62NZaGBaTUEai+io0vES0G3pvJLnwCslzz8w3a5n/04
         Q8BY8w84YSHhVhjlc8QVNQNFe78ZRF26V0r8z9JQ+wiby1yLDmaGQ+iwgStZ29YA7gjW
         DJC8NFPvp5w2vVDG2cPcFoVjGzQ+WlE2xPWK7jVH7ON1dhvAnd8IaBAeOrqhq5LgrMtm
         ZjINN/Az4YcODZF92FgTGbqvcMwc+jxcIJBdp0SnRo76Vy7OMPbXW9HLV1rPsCsLqN7m
         mazg==
X-Forwarded-Encrypted: i=1; AJvYcCW33ieldZIbEf6vfI+LfLF9D8Z8TZghyWWlZi8f1obYjefPS5VYDSAOdcnvypUqvXmtBW9aFjAF9qY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoeVVPt3sEhaFb70174gSAs01CF/aMM6YiXmVeEM2sY1/v3Fhs
	MhOtCdH2UhRLTXBxVwsvPpLnD81Am29wwCO/2um/HyXJorQYGdr9S0LJ
X-Gm-Gg: ASbGncsEznQ6dT9Vp8uhVpz68t6p3J5QVkqNu/93dAqE50f2Y2BxXpYFUB1nzXD8RpK
	bzjxXDml2Ew6Ho8m68z3Id5lxTVGSv0yUX7+nX6cHFT1xgS55rMyqT1q7CN41LHy7T7PTSmoepV
	mfZu5dbVhhjx2kZpALohl6FJa3OZOHi4E/K/XsSPxn8AndjRTwdJvKAm7KXEIAB+Al4f+4uSQOD
	Xrg30VYRirvzYJNk7eCxv/dDOmWBY5MEMrJxFXkmsma1Rr3JwCG+rCKtwdNhXBoa/IAJfE+tOuE
	aZr+dArFl8VrUo4Po5wm14+83HtKxMLNvUOGMHaN/y0aiDCKQe6tOVFB1sXwF36+xIBq8f//YV4
	jkp+hTdaIi/lrAL6rkQaFasru/THdfzZQsNcU53FGrUFQfS27EflGJmhJFT34xJRDMcY6mbPenL
	zNMj+PUPWHljjOoSp3UgQu5TbWG+WYG/f7xFOLYbm028gh4fPcFtaXCEk=
X-Google-Smtp-Source: AGHT+IEQfzBjwOqCuuatAsbH0lkQs589LNfHL0lVajH292OEXnFVwAmGYUIRPLqbMCBNk93dfO2O4A==
X-Received: by 2002:a17:90a:c2c7:b0:32b:df87:1ede with SMTP id 98e67ed59e1d1-32d43f18a2bmr19741918a91.12.1757473561477;
        Tue, 09 Sep 2025 20:06:01 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466290d84sm3539093b3a.65.2025.09.09.20.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:06:00 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id A4845800FC;
	Wed, 10 Sep 2025 11:10:33 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: tudor.ambarus@linaro.org,
	mmkurbanov@salutedevices.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 10 Sep 2025 11:02:58 +0800
Message-Id: <20250910030301.1368372-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_200602_788313_3D04F1E1 
X-CRM114-Status: UNSURE (   8.29  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Introduce randomizer feature for SPI-NAND devices.

Add a new DT property named "enable-randomizer-otp" to enable the
randomizer feature.

v2:
* Create a global NAND DT property

Cheng Ming Lin (3):
  dt-bindings: mtd: spi-nand: Add enable-randomizer-otp property
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Add randomizer support

 .../devicetree/bindings/mtd/spi-nand.yaml     |  4 +
 drivers/mtd/nand/spi/core.c                   | 24 +++++
 drivers/mtd/nand/spi/macronix.c               | 89 ++++++++++++++++---
 include/linux/mtd/spinand.h                   |  7 ++
 4 files changed, 114 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
