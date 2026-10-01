Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515DCA5FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Iyeo48/YUqOChtsLaJ987Op9o+bkDctqtYgqYFtjOZE=; b=mYZz79A0e8E9/9
	e6kCmTzt5cXvkZ9JYqsYJucPLyDZVCeoOHIsCSPMcv4VPBe9CIi1yNl/iQRyX9awi+74PooTVkka5
	NTeayS+baBqlH7R4QW27nVyB9CvcB0MsmCavjXIb1tyvBV4XHOlbaRFQBeOZasvY1UGJXQyWcAmQ0
	BEwCDesDhxgnnoXRXz0tVGQe3HaVsjXcsbYQsgtDoOjzI6Ij3DIyQISUZjtFYs/eilrBfk4WRdUgp
	7jp8qleYXjYjSoCqbrU8OxRjP9StdNMW5EJg2pvuB6Q0T2avzzgOUZax35dIPTYRjEhl6F6Kg0z5b
	gpGgL8fIXkTYYY+OSf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJv9-00000009lSS-3VkY;
	Thu, 01 Oct 2026 16:46:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJv6-00000009lQx-04CR
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 16:46:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0DE54E41121;
	Thu,  1 Oct 2026 16:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB7466035C;
	Thu,  1 Oct 2026 16:46:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70CDA10328310;
	Thu,  1 Oct 2026 18:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790873164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=J7VcLCjkbB4GWjPQlRT2rs76W4soWPFSlS5ezEneZuM=;
	b=h13bTYPOlfHQSJabahSgiuduOM9pkVDavbHx4FySMH1Qi8eO4JHu6ELopsWC2w0fQU6WSJ
	pyGI36KGNMkywQCagCNeN/19OmXxhS1KOxTYRmcA2PRR5N5d1ANpDfjsQWtjaJ74IM4IXO
	7zIOVYXZpuPAUywGiOkcokQ1qm4bLP+xHdnObH72HRF77aFJRVuHoNtt5ul+a/FQRvs+I+
	dRz17U+zpoV39NtpZoV/xzIrWDFGdEG4IBgFSgb0cAvFkjDE2505tACP602V9TCFxjfHzF
	pINUA57JWo8iGd6jLxY2LIgF1SVRjQiZTlSpKcJeIOxmVM1ZQqsgLyfMlRyLfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 01 Oct 2026 18:45:57 +0200
Subject: [PATCH v2] spi: cadence-qspi: Prevent SPI NAND continuous reads
MIME-Version: 1.0
Message-Id: <20261001-winbond-v7-0-rc1-cadence-cont-read-v2-1-703e040b2d07@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw7CIBREf6Vh7TWASqsr/8N0wePW3kRBKaKm6
 b+L1cStyzOTzJmRDRgJB7arRhYx00DBF5CLitle+yMCucJMcqn4SjRwJ2+Cd5Br4BCtAKsdeot
 gg08QUTswneaulptmvVWsDF0idvSYJYf2wxGvt+JKv7CnIYX4nI9k8U6/Tqn+cWZRKu6UVChcZ
 6TZmxDSifzShjNrp2l6AezWrU7rAAAA
X-Change-ID: 20260318-winbond-v7-0-rc1-cadence-cont-read-bfa0d7258496
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_094608_224788_1A1E6CB7 
X-CRM114-Status: GOOD (  18.93  )
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

TI AM62Ax errata i2351, entitled "OSPI: Direct Access Controller (DAC)
does not support Continuous Read mode with NAND Flash", explains that
the CS can be deasserted almost at any time during a transfer (basically
there is an interconnect arbitration every 1023 byte). This is an
expected internal behaviour of the controller, but this leads to
spurious CS deasserts. These are totally forbidden during SPI NAND
continuous read transfers, because they indicate an end of transfer and
the continuous read is then stopped on the flash side.

I initially tried to query the flash type and geometry to decide whether
to apply a spi message size limit (there is a spi helper for that) but
we cannot reliably get up to the MTD structure to discriminate if it is
a NOR or a NAND we are playing with (it is not relevant to limit SPI NOR
transfers, they are not affected). If we actually take this path, what
limitation shall we enforce? The errata mentions 1023B, this is super
low, less than a typical page size (about 2k or 4k, for most of them),
so this is not usable. On my side, I only observed this problem on a
2-page read in octal DTR mode with more than 12 dummy cycles. The
writesize summed with the oobsize could be a relevant boundary, but it
is still quite arbitrary. Hence, I opted for implementing a controller
capability flag, which then is used to decide whether the SPI NAND
continuous read feature can be enabled.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
TI errata i2351 explains there is a problem with CS handling, SPI NOR
are immune to the problem, but the CS being deasserted spuriously when
there is DMA arbitration on long accesses (every 1023 bytes), SPI NAND
continuous reads cannot be leveraged.

Link: https://www.ti.com/lit/er/sprz544c/sprz544c.pdf

I created a 2-page read setup for testing all variants available on a
W35N chip wired to this controller. I reliably observed all variants to
always (in my tests) report correct data, except the 8D-8D-8D
variant *when setting an extended number of dummy cycles* (>= 12, so 24
dummy bytes). In this case, I got the first 6144 bytes correct (over
8192), the rest being full of ones (0xFF), indicating the CS has likely
been deasserted there. This is not exactly 6 x 1023 bytes (?), but
close.
---
Changes in v2:
- Rebased on top of spi/for-next.
- Link to v1: https://lore.kernel.org/r/20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com
---
I do not know if all flavours of this controller have the same
limitation, or whether it is integration specific. As I only found
mention of this errata for the AM62 processor, I opted for limiting the
flag to a single compatible.
---
 drivers/spi/spi-cadence-quadspi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index fe5b094f0b6b..fc0f2d52455e 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1742,6 +1742,12 @@ static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.per_op_freq = true,
 };
 
+static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
+	.dtr = true,
+	.per_op_freq = true,
+	.no_cs_assertion = true,
+};
+
 static int cqspi_setup_flash(struct cqspi_st *cqspi)
 {
 	struct platform_device *pdev = cqspi->pdev;
@@ -1799,6 +1805,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	host->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
 	host->mem_ops = &cqspi_mem_ops;
 	host->mem_caps = &cqspi_mem_caps;
+	if (of_device_is_compatible(pdev->dev.of_node, "ti,am654-ospi"))
+		host->mem_caps = &cqspi_am654_mem_caps;
 
 	cqspi = spi_controller_get_devdata(host);
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi"))

---
base-commit: 1518c0d3f67e728674194fb43911d6bd0ad3773a
change-id: 20260318-winbond-v7-0-rc1-cadence-cont-read-bfa0d7258496

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
