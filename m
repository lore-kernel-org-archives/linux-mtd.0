Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829EBCCA47F
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wZHOiC8lOczn8/tLfFQXorjDRt55vms5wFHpRAe+DS8=; b=bEs7WwGWfnqypP
	a/9VJCZkq87ZuO0JFxJX4+32KdVF7UkPBkPiV7jykHSpxYL9qlE6YtAJI+vSa2h6II1b/qXqffaan
	219GgWQIrQfXmMJ6SqAqWIDrEpEpZx99PERtsDd2G9gO3SInvxLSTDBG46RMAS78bRE5BOmLudKYt
	wPuTG1GWtWOo00ckDk5I12mLmYxn+uj4NLeuwIZX2La28AU1hO0m/tELx9QHjfipRx5yYnYRbGuyn
	tjR8DjiWBuTNHo7Khy5GLT3K9lFegiCW0127z9OWaaHo9Zety/dk2F2V9Co1wkwPcTQfbE88N79HD
	Nd4WBQEfMJdJ6T4x+XPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mI8-00C90t-Rd; Sat, 02 Jul 2022 23:12:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mI6-00C8z0-5L
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id ay16so10294680ejb.6
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzk0+Vxi71Pub0ZkiSwkLXSH/y4ORS5C+17h3e17Dxg=;
        b=Uy72K6Ks6msSG4PAFeH7ClB2jPVidM1WTYEdtFISTRooGCrXC62LlhkOu5iD1VXDgu
         x9RM4zu8pcMlLQc8ARfDuFLJinI1jMBr/O0i/wdAAdFsdQBN8xPS5gNpe1S5dOzRCuXP
         KwBXd5xaCZ+HBKX10x8omVtUPXZFzyyIuo+tSoxNqOE5Pb4W1OhgYIVl7Unz1fmL6ff8
         jZLgqF/o6VDQUgw08JKfzGITq3nFIM+DhmVZFkzceYE+LlgIA9wOFd7dzQak+81jpkgT
         kYLZcINa7ddqUJ0VT3aHq41G3fH7LRuOL6JOPZjBlV5rC4ezolw4D0HXCHhSUl1ro6Yi
         HG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzk0+Vxi71Pub0ZkiSwkLXSH/y4ORS5C+17h3e17Dxg=;
        b=5S7cdnGHGQReWSv4u5pbj6nsKKJZaowoUjs72LywKGuaX9A6GZ7a4MKL9psoOLvxvC
         e6I+2t2ZbeWD9EStkhU207jJi4DsQIgrBIaHbIE6H99zte5cgfiRMMQg7tbHyTHYSE2F
         huH4fPrGOUU8lzy7ZDQ2BiNn2q7MuNJFD0FOS6z53GarHIrc6iRHKozxz0khhNiExw1e
         VdWAcWhL+i3Tq2dlEw8/stJhpkZ2pvOKPzsU5GZV4Brzoe33p6V3rWwYE6PJH3+b3yPu
         HVfSDt6HLAMiAMMwUBT1CR4YLZSPR8ZLss3FS8ae+xk/H80ZalCASgYWctvopTSnNBIO
         c2HQ==
X-Gm-Message-State: AJIora/ltL9TCqqx7EutoR0GmdF8ajXB+fxgKrGqpOCH2Te0vKO/6dhW
	ve104ozi5HDdRt3n0WLboXgeCc9uPvY=
X-Google-Smtp-Source: AGRyM1viR73Qu1u7FTg69uJgtEsw+275wE8OAb8mDOIOrGlBdlBUamZM8GMZCjrMH3PLCj3SP0ApLw==
X-Received: by 2002:a17:907:3e08:b0:726:2af1:1d5f with SMTP id hp8-20020a1709073e0800b007262af11d5fmr21760647ejc.235.1656803560144;
        Sat, 02 Jul 2022 16:12:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:39 -0700 (PDT)
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
Subject: [PATCH v3 0/8] intel-nand-controller: Fixes, cleanups and questions
Date: Sun,  3 Jul 2022 01:12:19 +0200
Message-Id: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161242_263316_A1183BF3 
X-CRM114-Status: GOOD (  23.71  )
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

Changes since v2 from [1]:
- Renamed the binding file (in patch #1) to match the new compatible
  string as suggested by Rob
- Added Rob's Acked-by to patch #2 (thank you!)


Best regards,
Martin


[0] https://lore.kernel.org/linux-mtd/20220628163850.17c56935@xps-13/T/#m4b2b6e1c970adf074a17ab9568637aff90e6ca36
[1] https://lore.kernel.org/linux-mtd/20220629213508.1989600-1-martin.blumenstingl@googlemail.com/T/#u


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

 ...l,lgm-nand.yaml => intel,lgm-ebunand.yaml} |  8 +++---
 drivers/mtd/nand/raw/intel-nand-controller.c  | 28 +++++++++----------
 2 files changed, 17 insertions(+), 19 deletions(-)
 rename Documentation/devicetree/bindings/mtd/{intel,lgm-nand.yaml => intel,lgm-ebunand.yaml} (91%)

-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
