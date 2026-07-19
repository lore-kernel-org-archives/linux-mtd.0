Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E3AC44523
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2026 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F90ur9KIFt+zOm8Rzec7FSbKC9LbR3UWq+Bx7a9vnzg=; b=DR/ycbKjHNPp8Y
	i7gGceiz76RpxWB3r1SE2xsFT1pAKT9mqkhlcd2EnpsLKddHvueF6s+RRiL6neuprqg2obBXHcYpR
	SKaNUay51MUJVkHgr0fRrk7sCQb5piZwEfrMgOJw2MOStCSoT2boyWqA66JgUYZhS2nzAKqJzm2E5
	pKnifVKkMT+lz1DaoxI0/tACXrPxxEMo6f+T7duJYTrobAAhIAUlk3ow9SdncmkWdfPra/NzZ/K77
	i13yNkIr7unr9xPsndBJN//jHcfw83VLWlDOGD2zaxS50hnUVcChb8wo6R35tp8s6Yg8oJQGeEN62
	kybhUPp9u2In1IVbra6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG1A-00000004fDL-0R4k;
	Sun, 19 Jul 2026 01:08:32 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlG17-00000004fCx-04l7
	for linux-mtd@lists.infradead.org;
	Sun, 19 Jul 2026 01:08:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so4639694b3a.3
        for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2026 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784423307; x=1785028107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIdLJQoDNc4JYvLBvL2oNFaPJGBiZwdyTA21ZB8ViqM=;
        b=HqqKQftNtLNCNIuduJo3IXfqZZb7mMFsey6ZP1Yzno+hcMIQOKhzIoG127KdGbMk/j
         y3vGE+IAiDo8BRbYPZPO6hqXqSdRYsXfhaP4y57T7teeKETU7H0O7QEx94XR7xAlOxyQ
         Rq54mAuL4nHIEOR7M1obp+avUY8d5fQ0NET6p8mSvVFD0n1PGfTNxR1wfU4Nu5TDQGXQ
         /ujSEO6ekgoLQKVz4Uy0nxAWbxGHrazFwNy1CWWz9qDMVPxY76mm5PM4XbhbMJE5Kbez
         F6MchCIIm7UX0DJvHkF2w70x9ewsg5+54QBQvwTVeraVlrme3tHOKVifVxIfWMhyfLbA
         pmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784423307; x=1785028107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIdLJQoDNc4JYvLBvL2oNFaPJGBiZwdyTA21ZB8ViqM=;
        b=PVvjaqeXYkkZWvRo43EpV+9yfozMACRyKQdaypyQ4TgNU/051l2kpAprTlK86r0wUJ
         RJuxJXFgLvtf7IEbZQhrgmdlF69E+P2yC+FKcfJowC7KppvDJEQujW2gH5QDXk9QQChM
         RAj3aRZ2p6VUbV1kzHR24NLwWx04rbtl8M4gAidOnTOq0jaO8ZCJcYo45e/rB5tIqokq
         MBzGwUdOrHtb4ZlC84B34G6RXmMeMAM09dHW7t5XKZ86Qty2UzSeyDFL2qDot75PKU6q
         +HzktKdd2MXvuWlaC+jE2SuqURCpGAdKIiMvXauEUKI6en5oXMooj4GfHw2+VXJ6+5RP
         heZw==
X-Forwarded-Encrypted: i=1; AHgh+RoiCAq1oXoTT+Y1gXszveCfkQrdCsec5TPAsR/C4Bo0FYeTgQ5o+CoKz/HjGco6jBmXfyoaDCcdVQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YygF5+W6x4wFgS3q/Jz68dJ+NmqEW1TY4yuLm2M8s/9khy+7LCs
	ljC7jix/TdLkiTRaPdtPYsN3dEXX0SZGPfFSSBAmkK+X2wLxEuJioyr5
X-Gm-Gg: AfdE7clbNna021C9NV4C2BmXBNEPkbIMY0D2mZT4UXmcIu0yU576iGbYB9lpODGx1hv
	uw4m8Z2A3tJNsg4wlo1H0z+m8yA2C80+I2+tNq9ErtyKT70OJizVN+bsaVUkAdZneShoIOs00f/
	BEM4k/J+sSRinOK9aZaEecm6tyQmsLckCp7iIS/YXM/uFVuK9jJU/vk/WWIxyG3Xjeml9BuLggR
	JykwkxYlFGK/G0JODuTD6m5NOTd8LRAsxBbl+KbSUHS760B8+4i1gpb7ZjLkkuEIOpyMXYsApRc
	ilpR1ZtQOAlQPdGy5G0dmZcv+CEUQ9sD1kTKwuP1t9OosKluAkYCYqcOmwytsOIExuHlsG8fEb+
	NpJSM7KBiLvKdpxA5NkYk+NunX47Hj8fhTsftWFEfwdrWMjUM8C1q6RUbQsD66MZWd/YQ2lv9b6
	SJI6gT7ZYhPOYXslmNQm7PNqoVCjY1S9dt/MGfDFid751b1aS9RVS8l4MknBJT3fB1gt8=
X-Received: by 2002:a05:6a00:887:b0:847:8d2d:713c with SMTP id d2e1a72fcca58-84c295016f5mr8267340b3a.50.1784423307388;
        Sat, 18 Jul 2026 18:08:27 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9af73sm3446544b3a.53.2026.07.18.18.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 18:08:26 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] mtd: spi-nor: sfdp: bound two optional parameter tables
Date: Sun, 19 Jul 2026 10:08:18 +0900
Message-ID: <20260719010820.1924739-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_180829_082608_1C265673 
X-CRM114-Status: GOOD (  11.08  )
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

Two of the optional SFDP parameter table parsers allocate a bounce buffer
from the table length the flash reports, then index it at fixed offsets
without checking the table is long enough to hold them.

  spi_nor_parse_profile1()  reads up to DWORD5,  never checks the length
  spi_nor_parse_sccr()      reads up to DWORD22, never checks the length

The length is a u8 supplied by the flash, so a device that advertises
either table with a shorter length makes the read run past the
allocation, and a length of zero makes kmalloc() hand back
ZERO_SIZE_PTR, which the parsers then dereference.

spi_nor_parse_4bait() already guards its table this way with
SFDP_4BAIT_DWORD_MAX, so both patches just apply the same check.
spi_nor_parse_sccr_mc() is left alone: it derives its highest index from
the length it allocated with, so it stays in bounds.

The two parsers were added at different times, so they carry different
Fixes tags and are split into one patch each.

Found by code inspection; I have no xSPI or multi-die part to reproduce
this on, so this is not runtime tested.

HyeongJun An (2):
  mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
  mtd: spi-nor: sfdp: check the length of the SCCR map

 drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
