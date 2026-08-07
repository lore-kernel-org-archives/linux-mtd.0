Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6416AC5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lm3ffpepmrA2e2jLG+qrdGvN1lu3AkT5dlNp+eD6fHY=; b=U92ZTUrds5SuJF
	OHV8Mwym9tHy3vQ1YLDcvgyAOPVFq4CYn3AR37dAqYd+dMgRFlbEKNDejfUXZtUenpVmI+IeulJOJ
	IQrm2Zex3vtOnnyY5fMsknlXD75p13IQJol/d56o7Rz37PTCvQuHpdxdT8GLXLjHzbasyJQNgh1FI
	BQtigeyYmI9ulksrmVzKOkjDINiFyIFxlC1pY65fzelSgUHUNlDwkCoIudOgDPjfvSBqgo6ykwjOy
	BOCJyjogsYiOj2eSNiea4hV1euDlzxeZgrig42LyVCwUSUzlSZ3VyKpfxTP1vWtYJ/1a2RdCW+cAD
	g+SqYhxlwqabRem1Ultg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfB-00000008M1J-218Q;
	Fri, 07 Aug 2026 15:39:13 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMf8-00000008Lys-2PlO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:12 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4a40bcc8d69so2244342b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117149; x=1786721949; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=Xvw+tWcGogWedD5xmOCWXhbP26Ermbs5+AgQX/DPkpvnPIrGqmBICHbL9K3LdnsR/1
         il9g6gOtqEo6hTN0vqXxikKWll7IKejZrOJDeankejqeG53p/zHFsKpdLcxckqOo82OK
         JVeEnQOkYJ6a4QgnPz+RDaZ5HvfXCrI4SubXZjyN6p2U3StTfWPdv6I+Z7eP2s3bjtnz
         4Psu/Q5F/O8/L6Svc6y3xF4WurW2EbuOv3XoZXpc9v2TbTel7WiNUDxuzTEpJ/+QqfJY
         Ci4p6wkyfP2E0nMjpZfpYeMbnVFea0zbItO7guLVAkswqu2mp4yYGAo+C8Kjum7ydEQg
         zdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117149; x=1786721949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=jfmWgQdby+OuIt3Y3qm96v3/zeGorExDWyuU8yoTRJURNFicePXDTQFOKDVWieZuQl
         ARHyogBDACEH5EKmu3aCUGhQkqdf1Z1cpXGx0gRTNIL/WDSoCRnlEgPrOoTV+B4GpRrC
         neqvirn8FVdTX9tNpeqP2eyEGO/v4jBbTWAPf9KhCdtacmT36js+xNufK1nDHhcEeUAY
         RvS9N4dwKxlkFVXQZnHiQah56qGzrKaJiUktjaAtEP8tbEXNPs8y/LIfPsOhpg3mzcAU
         +zN696lrGy2fLPbRseQJGeDhvgrIz4i5cNZ0pAL/GuyJVqEIPvwZzc0ZNwMr0bhg/AK4
         YogQ==
X-Gm-Message-State: AOJu0YxCSl0Sy7VKRt2ax9rZ/1k9LG5cTktToSVW89Bi/WlDtuttBuUc
	Msfp8YEZEOi7C1z9QwfxJniOV2ThrKDREO6yDDVm05Wsa8t3UIsB1Ony
X-Gm-Gg: AR+sD11oxWiB5QPDC3WFW34+9JizG1JK+mN0/OdeHF65cUpSzPtEnL8M98IO4y1ZTqt
	+CV1RVl6ysSSVGqG9na1NxOKnxRL5x0XEmfPsYnGUXlUAmWX6/4ERxL8ST5Qi2ZuZhI9vPT4FqZ
	79r0xBhG/BjEqSgtdQAGKQA2wTU77sLScXYwfYq8erz8gkcmFJbjHuvDck9mmJ2scrWzXk8MqRl
	5C07alW09eUWNvLVMxZjuOVDfwbqi3im+XLJVUaRduB1NDXqAaDkjyDt6o/lhUcinCsbUJQv9F3
	LWvogseN7yO6COjY4iaAhQsJKf+WrAGKVxx/b8eM78140VPVTuFi3uDJppUmPJSrJ/lytwkZ6Hi
	5zV6hvPuuj60p115x60VdpOBgEkqRMb/CLlH+HJxOxlvANkirGQuz5wSIdemSVbGlf5uAtzRQvT
	9hPDKsc6O1pc3UQDGIr0iMxzTJqBkoNWuqxbnMKcsbeSb7+BaameR50k+sL9L0KV6UPZGnzImp3
	boBGlER6DUetlrkzzaYUDprWSvCN6pCrFY7si2hPAjMUiw6U8P0b5cmC81UbbiTLN5nDtUk8jqP
	2CgLlDJKw7l3sTuUkF3abczUxl1CiixUMwI/6OcAhASYsyIFv0QhTMnUlHMB5eL7wB4fbrydQON
	/X2R97csRLDn2Rxx7
X-Received: by 2002:a05:6808:1910:b0:495:f519:70f0 with SMTP id 5614622812f47-4afae01bf6emr13779508b6e.19.1786117149136;
        Fri, 07 Aug 2026 08:39:09 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 07 Aug 2026 09:38:58 -0600
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryKz7pRkqgl21XsUF6mmOqWJJUnFI
 t690Z6gMPB58Hl/Fog2sI1wLhYIduLIo89wOhTQDsb3FrnLDCRICS01xvfNccrhZ0ZvfIeDyic
 VJnbs+4i6Lg3VdUlKd5A9r2DvPO8b1+bHWfKwbdrEW2PgmMbw2Z+YaOv9szcRCiSqKllJoVUpL
 r0z/Dy2o4NmXdcvhh8QOuQAAAA=
X-Change-ID: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083910_647119_FEAC98EF 
X-CRM114-Status: GOOD (  10.63  )
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

The sunxi NAND timing solver currently applies the original A10 NDFC
timing characteristics to every supported controller. The H6/H616 NDFC
uses two internal cycles for several setup and hold intervals and has
different delay-field encodings, so the resulting clock and timing
register values do not match the hardware.

Prepare for per-controller timing data in two behaviorally focused
patches, then add and select the H616 characteristics in the final fix.
Legacy controllers retain their existing setup-cycle behavior and delay
encodings.

Tested on an H616 board with Toshiba TC58NVG1S3H NAND.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split legacy timing setup from the H616 fix  (suggested by Miquel)
  - Move tADL/tWHR encodings to a separate patch  (suggested by Miquel)
  - Keep the timing lookup helper unchanged  (suggested by Miquel)
  - Drop the minimum-period helper  (suggested by Miquel)
  - Align H616 timing-data and capability names  (suggested by Miquel)
  - Add Cc: stable to all three patches  (suggested by Miquel)

Changes v2 -> v3:
  - Rebase onto current nand/next
  - Fix strict checkpatch diagnostics  (suggested by Miquel)
  - Add Fixes tags to the two stable preparatory patches
- Link to v2: https://patch.msgid.link/20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
