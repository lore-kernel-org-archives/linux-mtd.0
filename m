Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8920C00306
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D0A214DE
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjBOw6KE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kl4bnPES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D0A214DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=smnkXmAvjXfQ1NnXM9/xQHtxQy0xvQ4nhM5J8DuE78E=; b=mjB
	Ow6KETfMoG+82kjeY99hxFVml+5QFmf7dcmUro1y9ZMyksHGn+9mcR6ZsAfithVpN+DYQz5I598FK
	m+mlrlBi+lWFTsXDhp2qVAS5N+S3vCBvpmrOTgJba8u05Xtl70Afvl2yblewuHa+vSejMTjSpJPSZ
	VD/dOJi5ZLaTzoFXGPkotQBdUSuLWf9LMxb8vme4eVtpr7Z78xL55VFzufIpy81NnP3l/1sGhDtzn
	fTlXtv/ziapFwl81NMRF7hWWW6GZtyEypbV3ii6p7/IWQBZgHN5xVIa6H24d4C13gB3kK33IWaJqV
	j9rIaxnyYeGj8FqRLJxkOTXa4i2HRew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uSU-0000qn-1m; Thu, 05 Sep 2019 16:18:06 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSQ-0000p9-16
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:03 +0000
Received: by mail-pl1-x643.google.com with SMTP id k1so1512009pls.11
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mukYH+OPB5B2Q8cIXti1kEopT3yxftlik4aW1yItWl0=;
 b=Kl4bnPESFCY769er88olLvIMydPIt7MSvRLFnbrMUBFJe2XGXC8oNJ+eB44CxUq8Z8
 icVfI4Z7Zv2fzyYYpmgSfOeLpo80hrioId35SGiSFn9P8y2EAYTnu2zhJFWW2+ZCCuVB
 Acsg/wxujlaWpromsOPO/XEkL8skQ8K6nxVzl/UgdDGnWguc6yvHxK/Wv797MeTMZZKg
 uTS6IS/ihZs3WKvkhpct4BSG3iQljiRqCPgkcGGvlkMO9io8/jgOGOyYiaq1v5JzqePy
 StJEuicwLxbARj/KoZGqt30jsFFl3ji38xfmmhdmOvICWnSF2ih5SFi0lKIRKtupViAc
 aAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mukYH+OPB5B2Q8cIXti1kEopT3yxftlik4aW1yItWl0=;
 b=X0TQjt1vXdIHbezSHVy+ivxGMmntcSR+zAuPZ8+KRsDFkrfGAnia6gYBEiFBFQqsT3
 VNwpvPkIYI8sqQAAR+otR+dQUnwLJU4D019Q56lSjTiGY76y9dnmj9PSztBh7W/W3rvN
 HpOTrCY6i5eLdE7bFYZoMPC4GDbEn67hZshZ4TffXUOJHXVKmriV1fYoLZvI3LkBqwaq
 lVuIlwbY+2L8fm2mq/7dpO+tD1NWffGWmXf2SQv1rzr3t+DlzLg/xzWjmjDJ1B42Ac/E
 8Hj0RA0AerTPjGi19mLer9I6lrqZO/5kkusZgYbN/tjwBj6HbqUXbjapxcLe11pVhN1n
 bZPw==
X-Gm-Message-State: APjAAAXJBVkqRotBHJJELSZdHLWr5cRh10wwNlEl/hkW1i9JErkHNWji
 ftexf9Y6NCrovZbp1PDRzLJ7Aw==
X-Google-Smtp-Source: APXvYqzStzXxTWL+1VFEsqINN1zYVOMyUuv7eD3n8K9EXYt6eOChXB640bT4MB9P7QjeXftsWyVKSw==
X-Received: by 2002:a17:902:b583:: with SMTP id
 a3mr4258322pls.52.1567700281066; 
 Thu, 05 Sep 2019 09:18:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:00 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 00/18] Backport candidate from TI 4.14 product
 kernel 
Date: Thu,  5 Sep 2019 10:17:41 -0600
Message-Id: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091802_138240_90DD055F 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These patches are backport candidates picked out of TI's 4.14.y tree [1],
with most of them already found in the 4.19.y stable tree.

The set apply and compiles cleanly on 4.14.141.

Thanks,
Mathieu


[1]. http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=shortlog;h=refs/heads/ti-linux-4.14.y

Andrew F. Davis (1):
  ASoC: tlv320aic31xx: Handle inverted BCLK in non-DSP modes

Arvind Yadav (1):
  ASoC: davinci-mcasp: Handle return value of devm_kasprintf

Christophe Jaillet (1):
  ASoC: davinci-mcasp: Fix an error handling path in
    'davinci_mcasp_probe()'

Claudio Foellmi (1):
  i2c: omap: Trigger bus recovery in lockup case

Dan Carpenter (1):
  misc: pci_endpoint_test: Prevent some integer overflows

Gustavo A. R. Silva (1):
  ASoC: tlv320dac31xx: mark expected switch fall-through

Keerthy (2):
  mfd: palmas: Assign the right powerhold mask for tps65917
  PCI: dra7xx: Add shutdown handler to cleanly turn off clocks

Kishon Vijay Abraham I (1):
  misc: pci_endpoint_test: Fix BUG_ON error during pci_disable_msi()

Niklas Cassel (1):
  PCI: designware-ep: Fix find_first_zero_bit() usage

Roger Quadros (1):
  usb: dwc3: Allow disabling of metastability workaround

Roman Yeryomin (1):
  mtd: spi-nor: enable 4B opcodes for mx66l51235l

Sudeep Holla (1):
  mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone

Takashi Iwai (1):
  ASoC: davinci: Kill BUG_ON() usage

Tony Lindgren (1):
  drm/omap: panel-dsi-cm: fix driver

Vignesh R (2):
  PCI: dra7xx: Fix legacy INTD IRQ handling
  mtd: spi-nor: cadence-quadspi: add a delay in write sequence

Zumeng Chen (1):
  cpufreq: ti-cpufreq: add missing of_node_put()

 .../devicetree/bindings/usb/dwc3.txt          |  2 +
 drivers/cpufreq/ti-cpufreq.c                  |  1 +
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 56 +++++++++++++++++--
 drivers/i2c/busses/i2c-omap.c                 | 25 ++++++++-
 drivers/mailbox/mailbox.c                     |  4 +-
 drivers/mailbox/pcc.c                         |  4 +-
 drivers/mfd/palmas.c                          | 10 +++-
 drivers/misc/pci_endpoint_test.c              | 17 ++++++
 drivers/mtd/spi-nor/cadence-quadspi.c         | 27 ++++++++-
 drivers/mtd/spi-nor/spi-nor.c                 |  2 +-
 drivers/pci/dwc/pci-dra7xx.c                  | 20 ++++++-
 drivers/pci/dwc/pcie-designware-ep.c          | 34 ++++++++---
 drivers/pci/dwc/pcie-designware.h             |  8 ++-
 drivers/usb/dwc3/core.c                       |  3 +
 drivers/usb/dwc3/core.h                       |  3 +
 drivers/usb/dwc3/gadget.c                     |  6 +-
 include/linux/mfd/palmas.h                    |  3 +
 sound/soc/codecs/tlv320aic31xx.c              | 30 ++++++----
 sound/soc/davinci/davinci-mcasp.c             | 21 ++++++-
 19 files changed, 235 insertions(+), 41 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
