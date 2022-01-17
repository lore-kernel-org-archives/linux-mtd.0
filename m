Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C23C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mDbrrBQfUk8GCkNTrYzzyK5gub0KgfviXuaP8I8z/vA=; b=I3pUBXMrlC/8zf
	WIL5Tm2mh70zorjdFeu3/xJSOvUv8tCUKWWAkzKLtI01Z+Z9EweHRIRgeReLWy22+qrwkAG5s/foS
	9APygQBlCpFdIOWngtCqsSoO02cn9Yh+xOVv40OZcLlab4fdRzWPPsJiP95WzGwK0mU1DP/RFqdEI
	KZVSZYf6PK6RNtyivk/PU8EAEtu2kAB8LUjAhhqJsfrOBGsKs0NqTxT/+ETBbIGpvjvP007rUIU8d
	o/VX6OOekiyajy3l5NIM+h8SS6ZDsDZYJvxEm1+Grw2m8PVhN8jGVUGqdIme7Z7s5f1LrD8Hx2uem
	JgSm3s0ljwb1JyV+yLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9UiA-00FYUq-NE; Mon, 17 Jan 2022 16:18:26 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Uhw-00FYPL-Aq
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 16:18:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id c71so67793522edf.6
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4y5Hl3U1xXQXZw23h6/DO7pv/6iLmoZwNHNPhFYyIt8=;
 b=H7Kyile8bVbUB1uHXBaUIRyKZ8c7SBGxw1S9Bq1l7v1qCdkBs3OkvwHPBHe1d9tFni
 P7ZpCPGCpTFPJ3FugYLnQ0uNeH/2X9/xwte20CTIYlILxxuw1ZGakLiHVMgBvDaW/MDa
 hLACj+lIfyO/bcvaSxpTA2shvjDfo1byUl4m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4y5Hl3U1xXQXZw23h6/DO7pv/6iLmoZwNHNPhFYyIt8=;
 b=3Gg+YSHq5HhgQbNsVcg5mmlDYUrqF/Q+l0IXHm285ugO7Yvuk8abaU9pY6Z9hySnev
 eDJ8k82sAP2nvHqp6lvLsvpcmiols2t32OiEIgd9umEXHu3liJJ7s+MxjayrXqMvbkMQ
 Yywj361NzNoeOGEQ+8acSwxNYGa1fKp4mK27hyBeHF0fUpYNw/ooEgNQ8essECJT1laz
 1RhyQiSp08mYvAQPnP1kIJn7hGCDC0fKCtC6RcFb8fdm80HsfPIuCpdyOx74A5gSskO9
 ywLUUWvhy5Bb/AY1Ts5xDIMDnnNXnCjLV6nXnrhYG/7n8gygX1IZMdbyPnZtm6Txv72U
 NoMA==
X-Gm-Message-State: AOAM530tz0X6HUUGbYfBWQrgRm2LbqtJ3cmlpDx0hP7vWEuFRFYbiJfF
 YPyNrGPQiiM0kJaPufASIqgHjw==
X-Google-Smtp-Source: ABdhPJzoKLf0i17Ak3VzqNyVv9Vm8qt47iUJmDiS73Di84vuVY4d6AuUwx7pgXcp35lk5Ixyzj/Ljw==
X-Received: by 2002:a17:906:1145:: with SMTP id
 i5mr16996384eja.317.1642436290556; 
 Mon, 17 Jan 2022 08:18:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id s4sm4147652ejm.146.2022.01.17.08.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 08:18:10 -0800 (PST)
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
Subject: [RFC PATCH v3 0/4] Fix and improve gpmi nand on mx28
Date: Mon, 17 Jan 2022 17:17:51 +0100
Message-Id: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_081812_431914_962EAE7F 
X-CRM114-Status: GOOD (  13.96  )
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

Changes in v3:
- Remove the "mtd: rawnand: gpmi: use a table to get EDO mode setup" patch.
- Simplify the validation logic (suggested by Sascha Hauer <sha@pengutronix.de>).

Changes in v2:
- Reparent by device tree instead of code (drivers/clk/mxs/clk-imx28.c).
  Suggested by Stephen Boyd.
- Improve the commit description.
- give examples of frequencies on my setup.
- Fix commit description.
- Add an example to the commit description to better understand the
  problem solved by the patch.
- Split the patch.
- Improve the commit message.
- Move the patch to the end of the series.

Dario Binacchi (4):
  ARM: dts: imx28: reparent gpmi clock to ref_gpmi
  mtd: rawnand: gpmi: fix controller timings setting
  mtd: rawnand: gpmi: validate controller clock rate
  mtd: rawnand: gpmi: support fast edo timings for mx28

 arch/arm/boot/dts/imx28.dtsi               |  2 ++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
