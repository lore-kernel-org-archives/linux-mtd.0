Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F7FEDA698
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9fx7bZSxOKSSTlu7wWpVVvFZJwGCZUI8JpZZ10GPrKc=; b=n1mYbeEMFQfS/p
	lndRicWDKm4FQe9uowFWLRknXVY4oXKaVEr2X3VA30aPW+AxWbeuYescyzWho9eEVKN4DISZhoYQD
	ixCc8+IvCHQ7qCqo23CzBTlqYcffTZcdt60CZyheQyglObPW7HCbPAh+yrWSm3bNW1eyAKt6+jRj4
	LThf/E1CeN8vvVwV8Wq3YfdCKhcZkGI4ESyqXJyF6Ql512VDMs6gSkip6uE82ZfTQi4eiXRMV+iyO
	FSQLwW8IuU5AXNSD9pd8YE4P+rPKiH27TYXrPGIxD/JLmUyFvwuTlcE/dve6LusrOHrD+xSSNjMAH
	WKdMpbZ779pDMM8XAAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdJ-0000000FZI7-1c47;
	Tue, 03 Mar 2026 16:30:05 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdF-0000000FZFh-1HPm
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:30:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yyUqdUEqhJyknAkJorlxRX2q3YtJbxtKcmib+aj9K9c=;
	b=J8D4EZ6By/kAutGk56KiJkwZi/LnkHlnmvP+lm+lDnFc2ftdzb0zwc4GZrv331+baXn3/c
	1pqto+EsmpSk0m370KTbHaMuq0LkKMDSZKapc3bJGBw569vQWyJtLKo9YPS9BLELBkCuWy
	ZZV8HwVNXxvzskFmDUK4brWuq9S39MrZgeQHz154g19UN7lxIAF7fLzT0MMIGGShavPDkG
	ku1yuGUhHrRHX5g96dQPGt7P6cJrjjYHpbal8e/xvV7s69x8QK15pPF07yTbB/RngcJB/D
	9wCyFMLEcuTNX4p4ruWuEv49q3tVw/NqxcrdqFEMbsqp30uUQoJuYOgULH0iNA==
Subject: [PATCH RFC 0/7] Support for SPI RX Sampling Delay Compensation
Date: Tue, 03 Mar 2026 17:29:21 +0100
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnA20BoV5HfgBXmWHotEFalcbG
 B3iv694fJd3gnISVuirExJ/ReUTCmxdwfx2YWOUpRga03SGDOGqHg+Ngimjuj16CRsu7N0PH5a
 IWztzawhKEBOvku98gnF4wuu6/ojaOc5xAAAA
X-Change-ID: 20260303-fsl-qspi-rx-sampling-delay-9133e51ce503
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=xstZJYw1Dm12lkQHmBUHQZrWV6Wnaa8/ASUkX26e8tU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T9O1gN/bt7Cx5ixWrG/lFfpxen7CC8GVy6s+sJ74Y
 BkXPdm0o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCIz5jEyrC9s2bq4tH1BIFP4
 rRjRk3fZQ0RuNK9pt7r/e1/Obun+mYwMmz62L+gX9mOUC64ut6hj2PSFS6Fks3J2aW9DwY/Lbh6
 8AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083001_798626_2D7E33D5 
X-CRM114-Status: GOOD (  19.46  )
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

This is an attempt to continue the efforts started in [1] to support
SPI devices that are clocked at high speeds and have a significant
delay in the RX path.

This aims to handle the known RX path delay introduced by the SPI
device itself and specified in the datasheet as maximum tCLQV value
by:

1. Applying compensation if the controller driver supports it
2. Reducing the clock frequency to a safe value if the controller
   driver's compensation capabilities are exceeded.

I'm sending this as a new RFC as quite a few things have changed
compared to [1] and a lot of time has passed. Also I'm quite unsure
if the layering for this implementation is correct and wether
it conflicts or overlaps with the PHY tuning series [2] in some
way.

This approach adds a new attribute for SPI devices to track the
RX sampling delay requirements of the device and extends the SPI
NAND drivers for Toshiba and Winbond devices to specify the values
from the datasheets (patch 1-4).

Then it adds calls to a new handler in the SPI controller drivers to
the core and provides a generic helper to calculate the delay cycles
(patch 5-6).

At last it implements the new handler for the FSL QSPI driver in
order to compensate the RX sampling delay, or as a fallback reduce
the clock rate to a value that is safe to use without violating the
RX sampling delay requirement of the device (patch 7).

This does not yet implement the fallback to reduce the clock rate
for controllers that don't have compensation capabilities or that
have not yet implemented the compensation handler. Therefore this
series doesn't cause changes in behavior for controllers other than
FSL QSPI.

Please note that some drivers such as spi-stm32-qspi.c currently
enable a RX sampling delay of one half clock cycle unconditionally
for all devices. While this works in general, as all currently known
devices are in range of sampling the data at this point, when testing
this approach with FSL QSPI it failed at low clock rates (e.g.
100 kHz). This is probably due to the sampling happening too late,
when the data line is alredy changing its state as the delay is
negligible compared to the (rather long) clock period in this case.

This series was tested on i.MX6UL with the following SPI NAND devices:

* Toshiba/Kioxia TC58CVG2S0HRAIJ (133 MHz, tCLQV max. 6 ns)
* Winbond W25M02GV (104 MHz, tCLQV max. 7 ns)
* Winbond W25N02KV (104 MHz, tCLQV max. 7 ns)

The former two chips seem to work fine even without this patchset,
probably due to the actual RX sampling delay being lower than the
maximum value specified in the datasheet. The latter chip fails
reading at 104 MHz without RX sampling delay compensation.

[1] https://lore.kernel.org/all/20231026152316.2729575-1-estl@gmx.net/
[2] https://patchwork.ozlabs.org/project/linux-mtd/cover/20260113141617.1905039-1-s-k6@ti.com/

---
Eberhard Stoll (4):
      spi: Add 'rx_sampling_delay_ns' parameter for clock to RX delay
      mtd: spinand: Add support for clock to RX delay setting
      mtd: spinand: winbond: Add RX sampling delay values
      spi: spi-fsl-qspi: Add support for RX data sampling point adjustment

Frieder Schrempf (3):
      mtd: spinand: toshiba: Add RX sampling delay values
      spi: Add RX sampling point adjustment
      spi: spi-mem: Call spi_set_rx_sampling_point() for each op

 drivers/mtd/nand/spi/core.c    |  1 +
 drivers/mtd/nand/spi/toshiba.c | 48 ++++++++++++++++---------
 drivers/mtd/nand/spi/winbond.c | 42 ++++++++++++++--------
 drivers/spi/spi-fsl-qspi.c     | 80 ++++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-mem.c          |  2 ++
 drivers/spi/spi.c              | 73 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  5 +++
 include/linux/spi/spi.h        | 11 ++++++
 8 files changed, 231 insertions(+), 31 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260303-fsl-qspi-rx-sampling-delay-9133e51ce503

Best regards,
-- 
Frieder Schrempf <frieder.schrempf@kontron.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
