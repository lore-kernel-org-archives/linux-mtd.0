Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3599C4451C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJXyFICrjxcOIclrphrQsLbhOMkQQ84o0ge+VOhidKw=; b=4E0ef4tdQ6/xZc
	tSSVSIHvGd+6etPA0KiPNWTWlYRsqEYAujr4zDW6EclTovigh9fxSrv+KE36u7Ef02QnqAD8dhD2u
	fCt6rmWZcY0IZf7syp95tkV78tIc7UY3Iv6CaHUIQ0qMMNRTkhhQOPcSQzIC5+nyK0Uj90Cc92+h9
	7BwZFI8FB31BapMMCRi8pxRR0BDGtmZAVw03/uWYX3dyWpv/koO4ZHO0znkUuNyD9aq2wJHpLpp1l
	0nsjAoHlSiAYLNyEnsgKS5UYpwJCexOZaJhK/DqzjT+hDsopPiNQ2QtD3J7n9nTl393W4ErqNPT7D
	7ELhpvlVsJ39XGEeacXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSB-00000002tdP-3jV4;
	Fri, 17 Jul 2026 17:34:27 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSA-00000002tcr-1MZa
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:27 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e6b5737bb2so6635604a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309665; x=1784914465; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=dtw8gPeHYzSD1Mu9EtzTq9QkFEg60p53SlW1YS9FrlXST+SDdHhpQ8pBrGwKRYBV9P
         290J71xaWkxMtlOVDocw9M6K4GkI6q8FVvqz9fGiE2is1GDXiczyWnvLmHgz69AbhYqu
         Jn/ET3IJavj5JZu2yIdTMWGdZMouwPn9Dm9XiwHHC5Q2cHYsCUIElT0gNnSQGa5HTWqM
         ibrJ5sn+SOj462befEP1yV0NFTjYcYeucKpb1QtWmehNpiKP9soACadf1B6JJp7sQJb/
         QtYAOpBEG8nFAUSIPqRACVVT+HNjE+foBa6FZgfzjAzX2uKnbAowq04sw0hSKANiSyhI
         KAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309665; x=1784914465;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=RpFpMNm40BRI4JVYPdOvkmEC7y79d7Slb06TdS1Pd6SQpUkPHlc+gI6qNAKPA4lp3D
         y5zEfOCANigcEdd5WSdssjtj3TJmZrY1OP56t0nSOTTsZP2bEiHlYwu7jgcgsBBy2eG1
         Se2wwv4uLJHccmi7FZzfkxwaQ9o+goZwsW2VKXbc/Ni9loKYzdDIeDUqVZyg0t07OYOK
         VhWPpyU3OGHjOtZa9cmHmwyn1Pwjp3ZxGjqkyqWKaQ+MnxYBUqjDsni/cDnmITd5Tzmh
         9VMOGkxN7KyXKNW3wpuI/WgkdrEwm7BOuRN/js5qJQa6d7RvRBgLdaZ4dqOlUxG/aD23
         7Wiw==
X-Gm-Message-State: AOJu0YwwKv604vEQlwAS6G+GkL/cWWAPov6+U5Stwfsfb2Ix7NXQKWq5
	P3QMiD9jzt47JCAYoFrRJK/9qlReDmXR7x2CE8YpYg1KLBYIxidNn9pn
X-Gm-Gg: AfdE7cmmQOwqRnV+1iy4WduDwtDCWttyLzm6PoNQQU761I4PX1cxstvLN5LxNnTRP/4
	UUL6yc0pChmRMUDg6O6kXF/KHHxjI6qKPB2sIn2MuLzWGQmkXyB/99p3Rkr5vo8rWiDr6z+a2Bo
	CHa+GtbCsykGZTBuQdm/MUbpbpLBef/mlVdqw6nHYEAYvQitCboHb3TUbiIisVxHwf2oAYJF6oK
	dzIK2irchSc3m7ug+y9CVQjN7aR8Tw5cA9RL9qshhslbIMC1LKYqdV3r519fazUNjEt4G7kdVQc
	rFU3DPYUD/J4kUueW/5giEsWL4QLhOYGV77oamno9u5YEUp04C0ZJxF39NI5XMBEjrOq30tgE2x
	i9myDnIpgsz4ajkhCBIZS1H0dSrf3i0zhtB/fgK60hwaEDq6vD4Uj6CZqkEUhj5OKtpporsr1MV
	CrKsbx6ugsH1BzQ7vVr0i/nLoqM84cRL8DMaxnCWige81BUV3Kwc992FfPxyxWzMBfk1DZZZJu5
	BePefrwOoPgbS53MqnKm2GzZXo57sj5ouKjZtBr+uSXESckncZ7vw==
X-Received: by 2002:a05:6830:2e02:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7ed9aa576f9mr2021902a34.1.1784309665179;
        Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 17 Jul 2026 11:33:56 -0600
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvIAWael+Zeyhs5lmYDaaOgTx3
 40bXDicl3M3UCpMCtdmg0JfVn6Libs0MExJRkLO5uBa59vQBdTlMXM1yMooSTJO3tZ5rDyzjIo
 h9snF2DsfMljnU+jJ6+/jdv+7RV401DMM+34AvMI2ZIUAAAA=
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
X-CRM114-CacheID: sfid-20260717_103426_372624_245B2A92 
X-CRM114-Status: UNSURE (   8.70  )
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

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: 6f5156d7a31a8c3b0f34af4675c9299c8f877cbe
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
