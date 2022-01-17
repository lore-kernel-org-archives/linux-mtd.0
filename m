Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90479C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ENvE3N993FEqizYZRTTqJQz1f7bT9zCxWIHjz3qFvo=; b=1kDxV91YXPoHhP
	pisMp6Knot+3rUBrsOBvbuVnWwnJiO00gJseEi4xu35BCFBXXukAbHmzSwOV1QWyrKWrLZwndQO6j
	d4X0N4br2mNFyAQLOVJc2+GDhEMY7q+mawoI+rB+9dJWfmxfTJt1Igk3+6sALa10fjumK/ybE769y
	quP6YIrCz6KQJq2d6VY9LSF9cFH2/AhUaKDBD+XRUlgxBTn4wPwUYPym5F/BJQCGznsKLFH/J+nkx
	LyOLmcLU8ed/SNas+EQ0KGAchnOxYuKSNr4g4o7g2CKaqhPuWLnNAAfRDxEVqPgqFbg+ZmfiOAylf
	6GhAI1zVgsK6Uev3vZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Q23-00Ecwo-AD; Mon, 17 Jan 2022 11:18:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Q20-00Ecuj-2g
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 11:18:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id b13so64321136edn.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7hXtz38xI39sb/l7IV7cpsFMcqJ4/30G12fzT7qLAPw=;
 b=VnZMWJJPppDz6zU/SauFyWdqQcazAIoL+9JIIIQlg9xNZMHRMtj3b1d13VjYmluaPr
 MeKxtTx24Z7UAJMbv+v3H6jkONGZCVgf+ff89Sm2dRE5thDY1r6FcKKDEIj7vRl5VUkG
 5H6rBG2mRe/hdhcpJ++jKMY22GAgauMiQXwUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7hXtz38xI39sb/l7IV7cpsFMcqJ4/30G12fzT7qLAPw=;
 b=ANm9ZyjxX9ad0mPGEsF3TgJv7HcAFZsAhkp5gt2Fex0m1eD9SPIMkEOAnUu2n47TPF
 CILT2DyVQVxg4gBHipaaKien+65VpAe3odSQwKU2Jesldjc0LIS9jOC/SdLa7ezk5/rX
 nz0ueu5FF2mFY9EarmcRPHhmK/xqRiRn2KUTlDv+fLhEhMtMRYc/uQZrDEoefm9S6xpr
 qvT2Bs5jSGIOWqxZdIKea6Lfod+ZUPYPVm6auA31PX6+tNnnKi+rJXeyHYBV7Ei1SaiU
 Ev41o2EAwQMSaV3p2wSF9vk+6H9y0lyx4IcTSQHYVdO65UFooE+jyzthFktMyp6PnwAA
 tjJQ==
X-Gm-Message-State: AOAM5302xqxSygbW9I0vGUZVW+qhmX4W/LKzmXcZOvLCLbXqyus3bNNL
 H6pIh0vPx2CQrqz9BAoy8jKMbA==
X-Google-Smtp-Source: ABdhPJy9p4muRxfjQF96SruKy8vlk8bAz/98oyel7N3eUnloHeqIJB3RVUTA9t5CPd6kk9zHFHU0RQ==
X-Received: by 2002:a17:906:4a4d:: with SMTP id
 a13mr10764683ejv.223.1642418313594; 
 Mon, 17 Jan 2022 03:18:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id f11sm5142713edv.67.2022.01.17.03.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:18:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2 0/5] Fix and improve gpmi nand on mx28
Date: Mon, 17 Jan 2022 12:18:24 +0100
Message-Id: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_031836_130944_3AB4329C 
X-CRM114-Status: GOOD (  13.53  )
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

Starting from [1], the series fixes the timings setting of the gpmi
controller for the mx28 architecture, also adding support for fast
edo mode timings. The whole series has been heavily tested with the
mtd kernel test modules, and with repeated write cycles on nand.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org

Changes in v2:
 - Reparent by device tree instead of code (drivers/clk/mxs/clk-imx28.c).
   Suggested by Stephen Boyd.
- Improve the commit description.
- give examples of frequencies on my setup.
- Add the patch to the series.
- Fix commit description.
- Add an example to the commit description to better understand the
  problem solved by the patch.
- Split the patch.
- Improve the commit message.
- Move the patch to the end of the series.

Dario Binacchi (5):
  ARM: dts: imx28: reparent gpmi clock to ref_gpmi
  mtd: rawnand: gpmi: fix controller timings setting
  mtd: rawnand: gpmi: use a table to get EDO mode setup
  mtd: rawnand: gpmi: validate controller clock rate
  mtd: rawnand: gpmi: support fast edo timings for mx28

 arch/arm/boot/dts/imx28.dtsi               |  2 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 70 ++++++++++++++++------
 2 files changed, 55 insertions(+), 17 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
