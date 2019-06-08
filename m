Return-Path: <SRS0=FMIu=UH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2050EC468BD
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 10:57:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C7F214DA
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 10:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hb/Jwme8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C7F214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AODOeDYZ3O29HRpcN+vdpXuZQiOiQ87Pd3LdI4FfpPg=; b=hb/Jwme8ADd5UI
	ujdNebAwA+5fVonq9dgUfSHKre+qoQgBtt3R/Hx/wFSMXce6hF70h2wIMDea7f2OHaQ7ZkN6rvSBS
	XiKhLcCOj4AkPwdepo9VISRW+tJXVZwx7cixeHlQnBoJSB3qE532HE/1WdxLx5MfjbVOjzMCGVvxs
	AItEKqTBebBevYoAnkZhLyf90DzdtRLlW4VjSW8hxwXU9Owsir9K44GjNxacPidpTJhPlGkikD+u3
	btRlNbSuMtzyrZrJzbRaRtz9pLwFfgCBI5IDlP4ibnRAvT+KEuZkIy7GtFbMqEfhqizB3PLhSyEt2
	SXNdPkXIetJ0d+4B6tZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZZ1v-0000rZ-80; Sat, 08 Jun 2019 10:56:59 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hZZ1h-0000gl-QY; Sat, 08 Jun 2019 10:56:48 +0000
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
 by pokefinder.org (Postfix) with ESMTPSA id D0A142C3637;
 Sat,  8 Jun 2019 12:56:40 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 00/34] treewide: simplify getting the adapter of an I2C client
Date: Sat,  8 Jun 2019 12:55:39 +0200
Message-Id: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_035646_162389_3A3B5A1F 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-rtc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

While preparing a refactoring series, I noticed that some drivers use a
complicated way of determining the adapter of a client. The easy way is
to use the intended pointer: client->adapter

These drivers do:
	to_i2c_adapter(client->dev.parent);

The I2C core populates the parent pointer as:
	client->dev.parent = &client->adapter->dev;

Now take into consideration that
	to_i2c_adapter(&adapter->dev);

is a complicated way of saying 'adapter', then we can even formally
prove that the complicated expression can be simplified by using
client->adapter.

The conversion was done using a coccinelle script with some manual
indentation fixes applied on top.

To avoid a brown paper bag mistake, I double checked this on a Renesas
Salvator-XS board (R-Car M3N) and verified both expression result in the
same pointer. Other than that, the series is only build tested.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/no_to_adapter

Please apply the patches to the individual subsystem trees. There are no
dependencies.

Thanks and kind regards,

   Wolfram


Wolfram Sang (34):
  clk: clk-cdce706: simplify getting the adapter of a client
  gpu: drm: bridge: sii9234: simplify getting the adapter of a client
  iio: light: bh1780: simplify getting the adapter of a client
  leds: leds-pca955x: simplify getting the adapter of a client
  leds: leds-tca6507: simplify getting the adapter of a client
  media: i2c: ak881x: simplify getting the adapter of a client
  media: i2c: mt9m001: simplify getting the adapter of a client
  media: i2c: mt9m111: simplify getting the adapter of a client
  media: i2c: mt9p031: simplify getting the adapter of a client
  media: i2c: ov2640: simplify getting the adapter of a client
  media: i2c: tw9910: simplify getting the adapter of a client
  misc: fsa9480: simplify getting the adapter of a client
  misc: isl29003: simplify getting the adapter of a client
  misc: tsl2550: simplify getting the adapter of a client
  mtd: maps: pismo: simplify getting the adapter of a client
  power: supply: bq24190_charger: simplify getting the adapter of a client
  power: supply: bq24257_charger: simplify getting the adapter of a client
  power: supply: bq25890_charger: simplify getting the adapter of a client
  power: supply: max14656_charger_detector: simplify getting the adapter
    of a client
  power: supply: max17040_battery: simplify getting the adapter of a client
  power: supply: max17042_battery: simplify getting the adapter of a client
  power: supply: rt5033_battery: simplify getting the adapter of a client
  power: supply: rt9455_charger: simplify getting the adapter of a client
  power: supply: sbs-manager: simplify getting the adapter of a client
  regulator: max8952: simplify getting the adapter of a client
  rtc: fm3130: simplify getting the adapter of a client
  rtc: m41t80: simplify getting the adapter of a client
  rtc: rv8803: simplify getting the adapter of a client
  rtc: rx8010: simplify getting the adapter of a client
  rtc: rx8025: simplify getting the adapter of a client
  staging: media: soc_camera: imx074: simplify getting the adapter of a client
  staging: media: soc_camera: mt9t031: simplify getting the adapter of a client
  staging: media: soc_camera: soc_mt9v022: simplify getting the adapter
    of a client
  usb: typec: tcpm: fusb302: simplify getting the adapter of a client

 drivers/clk/clk-cdce706.c                        | 2 +-
 drivers/gpu/drm/bridge/sii9234.c                 | 4 ++--
 drivers/iio/light/bh1780.c                       | 2 +-
 drivers/leds/leds-pca955x.c                      | 2 +-
 drivers/leds/leds-tca6507.c                      | 2 +-
 drivers/media/i2c/ak881x.c                       | 2 +-
 drivers/media/i2c/mt9m001.c                      | 2 +-
 drivers/media/i2c/mt9m111.c                      | 2 +-
 drivers/media/i2c/mt9p031.c                      | 2 +-
 drivers/media/i2c/ov2640.c                       | 2 +-
 drivers/media/i2c/tw9910.c                       | 3 +--
 drivers/misc/fsa9480.c                           | 2 +-
 drivers/misc/isl29003.c                          | 2 +-
 drivers/misc/tsl2550.c                           | 2 +-
 drivers/mtd/maps/pismo.c                         | 2 +-
 drivers/power/supply/bq24190_charger.c           | 2 +-
 drivers/power/supply/bq24257_charger.c           | 2 +-
 drivers/power/supply/bq25890_charger.c           | 2 +-
 drivers/power/supply/max14656_charger_detector.c | 2 +-
 drivers/power/supply/max17040_battery.c          | 2 +-
 drivers/power/supply/max17042_battery.c          | 2 +-
 drivers/power/supply/rt5033_battery.c            | 2 +-
 drivers/power/supply/rt9455_charger.c            | 2 +-
 drivers/power/supply/sbs-manager.c               | 2 +-
 drivers/regulator/max8952.c                      | 2 +-
 drivers/rtc/rtc-fm3130.c                         | 8 +++-----
 drivers/rtc/rtc-m41t80.c                         | 2 +-
 drivers/rtc/rtc-rv8803.c                         | 2 +-
 drivers/rtc/rtc-rx8010.c                         | 2 +-
 drivers/rtc/rtc-rx8025.c                         | 2 +-
 drivers/staging/media/soc_camera/imx074.c        | 2 +-
 drivers/staging/media/soc_camera/mt9t031.c       | 2 +-
 drivers/staging/media/soc_camera/soc_mt9v022.c   | 2 +-
 drivers/usb/typec/tcpm/fusb302.c                 | 3 +--
 34 files changed, 37 insertions(+), 41 deletions(-)

-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
