Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFF8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E454661407
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E454661407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4wvPU8tJ0rUE4V3jPoNPpGm2R7eVjB8gI/3996cYq5I=; b=2lsI3lF64bmxLy
	yCU2pv0HujFIAjLUF+xs0OgBOc3Kpt86+2gHAT8lsHLKiAlv6hqk5ckkzzht2ZZDruZF/SHTW0Jc8
	Z6pTcnvPHWYQYD1i+iOIAkqiMO1wHpjDhdAI0UFQgFwAa2wS0pRCPUiwNADoniA6vtaAVfja/DpGz
	Dnth2CPCB2oDwDHpyguU44JbKXkRh3bNVifYc2G3TxBdmfaDkP5yQ5r6jfh85YAO3Lz/haw6VFpe+
	Le0monvIEmpYCD0bWwIeotM3deROHtXuaEGKcdxnYeq50CejUs/syd+ke1TLIIWVqcG1IGtkmYgKP
	WSz44Xvn0oYCDARCe+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYBR-00AuLb-OO; Wed, 29 Sep 2021 11:55:33 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAM-00AtwM-4c; Wed, 29 Sep 2021 11:54:27 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C2A4B228;
 Wed, 29 Sep 2021 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916463;
 bh=QIOhbXTW+4LTUMlGEWB6KTncQEdjxs82r47WlkWtpzM=;
 h=From:To:Cc:Subject:Date:From;
 b=PTRcCeCWPbaNeUFJGtSuQneB/EDyfvdN4ll8NFb8jeYFSNP2dv8+OpvPAEtAaOGD/
 ILxTuNdlM8KvWB2E9+S9lfk2UhzebJ+nOecoREqBVDC2Opjam2gd9JblinMDfPw406
 FC1thpKR8dYPcjQogufcLRZckybbLL8ukMrRuf28=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT status
Date: Wed, 29 Sep 2021 04:54:02 -0700
Message-Id: <20210929115409.21254-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045426_230482_90FC35A5 
X-CRM114-Status: GOOD (  22.41  )
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

This patch series aims to improve a scenario that arises in OpenBMC
and which isn't handled very well at the moment.  Certain devices, the
example at hand being the flash chip used to store the host's firmware
(e.g. the BIOS), may be shared between the BMC and the host system but
only available to one or the other at any given time.  The device may
thus be effectively off-limits to the BMC when it boots, and only
usable after userspace performs the necessary steps to coordinate
appropriately with the host (tracking its power state, twiddling
GPIOs, sending IPMI commands, etc.).

Neither the "okay" nor the "disabled" device-tree status values works
nicely for the flash device this case -- an "okay" device gets probed
automatically as soon as the device and a driver for it are available,
and a "disabled" one gets forgotten about entirely, whereas we want
the BMC's kernel to be aware of the existence of the device, but not
try to actually do anything with it (i.e. probe it) until explicitly
requested to do so by userspace.

However, while there's no support for it currently in the kernel tree,
the device-tree spec [0] also lists "reserved" as a possible status
value, and its description seems like a fairly reasonable fit for this
situation:

  Indicates that the device is operational, but should not be used.
  Typically this is used for devices that are controlled by another
  software component, such as platform firmware.

These patches start making use of this status value in the aspeed-smc
driver.  The first patch adds a companion routine to
of_device_is_available() that checks for a "reserved" status instead
of "okay".  The second patch is a small MTD adjustment to allow an
unregistered device to be cleanly re-registered.  Patches 3 through 5
modify the aspeed-smc driver to allow individual chips to be attached
and detached at runtime, and to avoid automatically attaching any
marked as reserved.  Finally, patch 6 employs the newly-supported
status in adding support for the BIOS flash device to the ASRock Rack
e3c246d4i BMC.


Thanks,
Zev

[0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Zev Weiss (6):
  of: base: Add function to check for status = "reserved"
  mtd: core: clear out unregistered devices a bit more
  mtd: spi-nor: aspeed: Refactor registration/unregistration
  mtd: spi-nor: aspeed: Allow attaching & detaching chips at runtime
  mtd: spi-nor: aspeed: Don't automatically attach reserved chips
  ARM: dts: aspeed: Add e3c246d4i BIOS flash device

 .../ABI/stable/sysfs-driver-aspeed-smc        |  17 ++
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |  16 ++
 drivers/mtd/mtdcore.c                         |   7 +-
 drivers/mtd/spi-nor/controllers/aspeed-smc.c  | 177 +++++++++++++++---
 drivers/of/base.c                             |  53 +++++-
 include/linux/of.h                            |   6 +
 6 files changed, 238 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-smc

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
