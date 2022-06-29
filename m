Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tz/5jdP3yTl/DPwinJY0cxJo9/QFHfibg1BkLHnhTM8=; b=2UVrVMdGdMpZMM
	aiKChWs6Cty0wh8EFx2TWK8f97Y9ffPgWFrsjcaqPx0Y3DASTc+lVTP2Y+a0SPSORYKIlnCA623ph
	uTnOOLFf9NhQ1NU8Nbs25Hj4+2C3D6P16alvcHdQPRnXHVVnaL5krwkkXt1096lAHiWxOMJe8ZefD
	1Ak6eNUmlNwKi5cIGyc3DPjjEraOXwyxl2dxfeZ96WkD4wn2opsh3Ya7iU29InaLp02zQdcWBaJUF
	bAaOU+UFVtaIpSmnhNAcGyB3D/PM9Aesu1H+gd+tFbCQNgecPeTNhrTXrZIyWISj7mir3vuI1XqHC
	ma5/uUHdton5ZRskbpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLN-00E8Lg-07; Wed, 29 Jun 2022 21:35:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLH-00E8In-EQ
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:27 +0000
Received: by mail-ed1-x52e.google.com with SMTP id r18so16131932edb.9
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiKkW3yHrZaOOcbsnGJ7HkRfakbETu6k5duCEkXFxQA=;
        b=CUuuBdlRNPLWLJMR1JLJq4smnvGh0RJx2mmdis0JaP8rYXin3oTnaKbbUmYPwOorkh
         KwovYJAhc9vh6+GSEc0XLl5wwxhDV86OjhbOfVXkQPhwWLbk3BQ2y1z444ozVPuIO5Bo
         ogZSK/GoxYxCLOL74AO/dHaXWp0u80R4TzE7R57rq8R/a2y8T990ZQ9mFUp1QCH6Jthq
         7qM/Im8WsK4S/kWeJQmVtgyhOnXd6bbfLYzqQ0dQFN9d9e+k55ZVBNEK1+6TVHnArCCd
         +jFydRDsbiejk2rqysJ0o1z17SVIpMVAh2JwJsD2NHvT1yc6eFmXhE6aSAr7sWNScM0O
         hDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiKkW3yHrZaOOcbsnGJ7HkRfakbETu6k5duCEkXFxQA=;
        b=i2Jcybmksr8TDb4DHNl9S0P5NXbhOTr2wefjv1eizZ+MMlOtvAGxtKG9p9z4MkvY2R
         1oq1/DqnlbYbfhP3V+WK46Rnf4r+NkleZdGQfOLRxdHumIFSXGtlkjDkgfBOgsMTqcUQ
         jWRKNVYdas9IVwrSAAjvepdYnkz/Y7z1B4cyx44yakabGOI5yWuFLiZSMGAWDOcY0M0n
         X434IpwXbdez7nCzcsu03CB9QfIA4JaLNfl4mGOOxbCDXzNm8O3c7HMjGr0MRnQo2Syu
         kqzIpAcaf+T2C2aAS258bxvPAL4Ym+xzb5BcmAPwEL+Xf2TkxKL/p9SLn5Du6jo/3H5x
         4zcQ==
X-Gm-Message-State: AJIora+S8DUca5RKnL1Gr1EFdRekR/6wxEAmcpKeg+YHlYwnTwTJWJVT
	v/v5eNuO9Q/0mc2D8KvJ7aF8hZrkSYk=
X-Google-Smtp-Source: AGRyM1tAIMpGgefHqFCQRWYzZ9NqwtuvUALqqzBrXrxab6zN2iTDYh/IcdKg27jf4rqdsxg3qkPAWw==
X-Received: by 2002:a05:6402:2684:b0:435:afac:3670 with SMTP id w4-20020a056402268400b00435afac3670mr7434140edd.262.1656538519427;
        Wed, 29 Jun 2022 14:35:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/8] intel-nand-controller: Fixes, cleanups and questions
Date: Wed, 29 Jun 2022 23:35:00 +0200
Message-Id: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143523_526071_17B03649 
X-CRM114-Status: GOOD (  23.13  )
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

Hello,

I am trying to replace the xway_nand driver (which is still using the
legacy NAND API) with the intel-nand-controller driver. The Intel LGM
IP (for which intel-nand-controller was implemented) uses a newer
version of the EBU NAND and HSNAND IP found in Lantiq XWAY SoCs. The
most notable change is the addition of HSNAND Intel LGM SoCs (it's not
clear to me if/which Lantiq SoCs also have this DMA engine).

While testing my changes on a Lantiq xRX200 SoC I came across some
issues with the intel-nand-controller driver. The problems I found are:
1) Mismatch between dt-bindings and driver implementation (compatible
   string, patch #1 and patch #4) and hardware capabilities (number of
   CS lines, patch #1).
2) The driver reads the CS (chip select) line from the NAND controller's
   reg property. In the dt-bindings example this is 0xe0f00000. Instead
   it must be read from the NAND chip (child node).
3) A few smaller code cleanups to make the driver easier to understand
   (patches #5 to #8)
4) I tried to understand the timing parameter calculation code but found
   that it probably doesn't work on the Intel LGM SoCs either. The
   dt-bindings example use clock ID 125 which is LGM_GCLK_EBU. So far
   this is fine because EBU is the actual IP block for the NAND
   interface. However, drivers/clk/x86/clk-lgm.c defines this clock as
   a gate without a parent, so it's rate (as read by Linux) is always 0.
   The intel-nand-controller driver then tries to calculate:
     rate = clk_get_rate(ctrl->clk) / HZ_PER_MHZ
   (rate will be 0 because clk_get_rate() returns 0) and then:
     DIV_ROUND_UP(USEC_PER_SEC, rate)
   (this then tries to divide by zero)

For me to move forward with the transition from xway_nand to the
intel-nand-controller driver I to understand a few more details:
- Who from Maxlinear (who took over Intel's AnyWAN division, which
  previously worked on the drivers for the Intel LGM SoCs) can send a
  patch to correct the LGM_GCLK_EBU clock rate in
  drivers/clk/x86/clk-lgm.c? Or is LGM dead and the various drivers
  should be removed instead?
- Who from Maxlinear can provide insights into which clock is connected
  to the EBU NAND controller on Lantiq XWAY (Danube, xRX100, xRX200,
  xRX300) SoCs as well as newer GRX350/GRX550 SoCs so that I can make
  the intel-nand-controller work without hardcoded timing settings on
  the XWAY SoCs?

Due to the severity of issues 2) and 4) above I am targeting linux-next
with this series. In my opinion there's no point in backporting these
fixes to a driver which has been broken since it was upstreamed.

Changes since v1 from [0]:
- Thanks to Miguel for confirming that the reg property of the NAND chip
  is the chip select number of the NAND controller. I removed a question
  about this from the cover-letter.
- Fixed accidental $id change in patch #1 which fixes a binding error
  reported by Rob's bot
- Dropped RFC status


Best regards,
Martin


[0] https://lore.kernel.org/linux-mtd/20220628163850.17c56935@xps-13/T/#m4b2b6e1c970adf074a17ab9568637aff90e6ca36


Martin Blumenstingl (8):
  dt-bindings: mtd: intel: lgm-nand: Fix compatible string
  dt-bindings: mtd: intel: lgm-nand: Fix maximum chip select value
  mtd: rawnand: intel: Read the chip-select line from the correct OF
    node
  mtd: rawnand: intel: Remove undocumented compatible string
  mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
  mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
  mtd: rawnand: intel: Remove unused clk_rate member from struct
    ebu_nand
  mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()

 .../bindings/mtd/intel,lgm-nand.yaml          |  6 ++--
 drivers/mtd/nand/raw/intel-nand-controller.c  | 28 +++++++++----------
 2 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
