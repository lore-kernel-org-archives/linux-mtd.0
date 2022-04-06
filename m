Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BEAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hWZDxAyfm3+E/Hz96xMECEMfmbhx14NYvcBmre2SpYE=; b=gdZ8Jo3BBmWxm/
	cwRJjpDiV7UBalbXmUax/SI9xE0ACWC9X6jBIbRFEZUC0h68dGWg2Hpw8Ttaj9/lqXKezSwtJPS8c
	hci7fVw0Ddm5+PN1FqJU3QTY74Y3OdLQ5GqaHnBvg3UasnkVR1n8nIAeEW4BTeIWozRRfFPBWWEIJ
	Vmsp8mkOqycuvjy0RmFaWLwrt+HDeqLs+6hTHYQXiRk0r7xWJ04keqVyRi1kgdfCzxSqlzCRoBocV
	Css84Eb7iIanCDM2Sgn9k1VCATVAWcODgOP0iENbPV8asMdyymphd3Z80P9jAkHTxpwA9Tg2t62WS
	r6c35eplf0AcLqASK+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncBlK-007mDw-1d; Wed, 06 Apr 2022 19:56:18 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncBlH-007mCw-Al
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 19:56:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z12so5927828lfu.10
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2022 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xEouFCYzQfQXD9Vp7v1Lh4VBFzxjwxpZamBS0BcRz2s=;
 b=RS1Z/i4bvNElABRS7GvZK6cYRJJaZESO/lKQKMxxrdvxOguma6aXn5Yk3yIT7vf0nb
 149Uv/ocqrRHnCOblJPpAlbjF3ty5oDOf93bPVKsbcHaa0k9JpWqiOpLfRotRSNjNwGo
 1P6OjEPAMdYwWqVCNqKNr6FbgfuvY8F6+X1dSuDpllSGsg2YOZ3q9/rSKdJKXjb2kKwu
 dIvQ0ym6R3QoyAK5zL9tNKO1/8t7nLWKnlH9ab2JWk1x+d8IMKebdM7feZnGdk6HA+gl
 DU3WOtbJ/UggKhVI9EaLoH6AXBIXqaL5jNPlgAG3VteHSApzRJR2E8a9E7f5QOVxsMS/
 SzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xEouFCYzQfQXD9Vp7v1Lh4VBFzxjwxpZamBS0BcRz2s=;
 b=fA9Ekf1VShODlviHlhafRAQ6+o9DYsuOU2SLyiNyatGoVpAs5IfBigXDt+ahsajIaI
 4qgGF2GKWsr9cqkB4XZWW2NaGOS0cxWaTV/XtLX6eysZKDi0ZOG8meOX5ZDDand8atzK
 tjsHVnDFTH2SjEabQWB5ANDFlmIQabAsoqFcWi27uFuGpkD7gjVF/mHdrrnvHnCIy23E
 3N/rzj7Tc4gAG7d/UfM7Ax4fjLz4G+lV1W4s6EnzQhjHgXBrYDiMDdk2L9tKDSk+p8Lc
 IEZL6uvwx68y8dPN68oTCd5oYukf/zEJ2Tyzs8xLORFEfsUIbZRwrthUv0vMRng2QaJg
 N6fw==
X-Gm-Message-State: AOAM533gM/90wmsRPMfmPn5OhJZB9HMTz9Ivm6yYenqFgGRGJ7sU7eKt
 uNo4FGYZGDgG/8pHZjRUWTM=
X-Google-Smtp-Source: ABdhPJxh/MsUiI2cH4K5a+lX7WcGBxOf5RwphhWYcOmFap8qqnzmfuKkGM6nOYnGgSDoMjdr9G1oAA==
X-Received: by 2002:a05:6512:13a9:b0:448:9dd3:b84 with SMTP id
 p41-20020a05651213a900b004489dd30b84mr6937987lfa.556.1649274972281; 
 Wed, 06 Apr 2022 12:56:12 -0700 (PDT)
Received: from vmu1804.lan ([2a09:bac0:87::815:6e3d])
 by smtp.googlemail.com with ESMTPSA id
 f18-20020ac25cd2000000b0044a34937c16sm1930685lfq.173.2022.04.06.12.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 12:56:11 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Date: Wed,  6 Apr 2022 19:55:57 +0000
Message-Id: <20220406195557.1956-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_125615_405413_6A2D0CBC 
X-CRM114-Status: UNSURE (   9.99  )
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

MTD partition parser for the Sercomm partition table that is used in some
Beeline, Netgear and Sercomm routers.

The Sercomm partition map table contains real partition offsets, which
may differ from device to device depending on the number and location of
bad blocks on NAND.

Changes since:
v1:
 - Add dt-binding in a separate patch
 - Remove redundant braces and logical NOT operator
 - Define pr_fmt
 - Replace kcalloc by kzalloc
 - Use of_get_child_count() and alloc big enough array before the
   for_each_child_of_node()

Mikhail Zhilkin (2):
  dt-bindings: mtd: partitions: Add binding for Sercomm parser
  mtd: parsers: add support for Sercomm partitions

 .../devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml          |  70 ++++++++++
 drivers/mtd/parsers/Kconfig                                                |   9 ++
 drivers/mtd/parsers/Makefile                                               |   1 +
 drivers/mtd/parsers/scpart.c                                               | 240 ++++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
