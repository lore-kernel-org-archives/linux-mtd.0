Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA54C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNJkLhbYvM2yAATwtSV+FgFkwIhdeCI8+cgmLaxZ4o4=; b=dNLbdcb0h+Mvmx
	QJt7cFFKdI+YbeJCcLABw3sx+6iZVsqnOSAitAUCIcOQwMLOEm2GzAra6Fm2gtJyWs289cDM9a+RH
	/PjQJ1NoUSBQd1GlijMrqDA4RVKMpg825RN3djLhwC79v+hrSDiVqlOiFdQkVJB5MeWAv9npMCz7d
	Vig4KxVjE9b5k/qardIb5qZyXLvs92lX83jjfrUZtFpOQsRPz0qTbkuJ3ZctsRbxXANkTT0MHxUSg
	FUZ5WkFeuneTjRPVkTtojUnxjaD/xATdNZFbfr2M2G/YOlkp6SxkXgbtbQ64Ztjcl36CQ3FHokpLU
	+0jRA2puDSIpUnb9ipyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njl6s-002WDI-Ho; Wed, 27 Apr 2022 17:05:50 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njkMN-002FUH-No; Wed, 27 Apr 2022 16:17:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 842F2200007;
 Wed, 27 Apr 2022 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651076263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bH236ERFtId0dlFB5w7Um+t9YOETlWqFMja0vZdBWM=;
 b=AhHa/7qYmf+S1v9N7LCIjqXNWFg3Zsj2p8Ht4i3+2f+h3gecumPQjKhkL3rFMr36BKyI2L
 wN98gSrpn/huAqqnOIKPHnmLNeAI7goURKO/AdFRQd8ctCo/Kczm3czNuZFVgHq1qRB7lg
 Uws9h5BWmjiwWHVBozum2b6Uep4QEHV0Q26KDuzBr6yAyIcyszlcmUzqlSpKt83+/mKUBd
 aCDJAi3qmiPk70JSdixfWQAORow32i/3F/Bp3ZT7XpiDH+DSkiNo0E082inMB0D8QJx781
 adTSstgt8+aTIfEdXTCYwvjeBSDwZFnuhFLP0GBTCoUZPIdKggBdBIC/MOHsdQ==
Date: Wed, 27 Apr 2022 18:17:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Cai
 Huoqing <cai.huoqing@linux.dev>, Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:NAND FLASH SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
Message-ID: <20220427181738.2ad3e126@xps13>
In-Reply-To: <YmlPlhKTrRXZo/Sx@sirena.org.uk>
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220427112857.7ddd7fc8@xps13>
 <CAJsYDV+DfBEmWr7D1aO8F=3WMurAg6aEhf5gY86BXOUSyJ2nXA@mail.gmail.com>
 <YmlPlhKTrRXZo/Sx@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_091748_421225_79F2931C 
X-CRM114-Status: GOOD (  18.76  )
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

broonie@kernel.org wrote on Wed, 27 Apr 2022 15:13:42 +0100:

> On Wed, Apr 27, 2022 at 10:04:57PM +0800, Chuanhong Guo wrote:
> > On Wed, Apr 27, 2022 at 5:29 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> 
> > > The patch actually look independent, so if it's fine for you I can take
> > > the two mtd patches and let you merge the spi/binding changes.  
> 
> > Out of curiosity:
> > Wouldn't that break the build for spi subsystem? Because...  
> 
> > > >  rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)  
> 
> > The spi driver needs this header file which is moved in the mtd patch.  
> 
> Ah, that'll be an issue indeed - if I could get a signed tag with the
> dependency in it I can go ahead with the SPI bits?

I pulled the two patches, here is a tag with these patches for you,
Mark.

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/mtk-spi-nand-for-5.19

for you to fetch changes up to 4c5bf4b51c9857e20c5f5e9d74b86aa1bd1def40:

  mtd: nand: mtk-ecc: also parse nand-ecc-engine if available (2022-04-27 18:12:43 +0200)

----------------------------------------------------------------
Mediatek ECC changes:
* Also parse the default nand-ecc-engine property if available
* Make mtk_ecc.c a separated module

----------------------------------------------------------------
Chuanhong Guo (2):
      mtd: nand: make mtk_ecc.c a separated module
      mtd: nand: mtk-ecc: also parse nand-ecc-engine if available

 drivers/mtd/nand/Kconfig                                           | 7 +++++++
 drivers/mtd/nand/Makefile                                          | 1 +
 drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c}                      | 8 +++++---
 drivers/mtd/nand/raw/Kconfig                                       | 1 +
 drivers/mtd/nand/raw/Makefile                                      | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c                                    | 2 +-
 drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h | 0
 7 files changed, 16 insertions(+), 5 deletions(-)
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
