Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A517CA5FCE
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqkUDJKX90IIctXg+zj0n/zBS91kO4qJ8CEaoOJbZS0=; b=Rcc85RJDTCcwnQ
	QvuG5dqvnVV7/lCPIksT3X4huZpWszGtlqoTSaGxQVKQwVYcYsk3laKBPSjeqwA9tlx+gbUgaJT7a
	m5LRMMJhrXbBMcXBAvnBRHbFD4omBqR4t20pZhtfFhwlm9WA/bNKa+Bzbj2UEc3hLBZEHdVq9pT8q
	z3uvFunV8VGq8xAnf6yUrYM6wgjNIfaE0TKV9EZsX41dc16YDM/75R+CE1IgbPNO3GFV4UyQmFhHp
	+2Fc17ciKIZ+KzToebAO4ZwEfi1WB1H2tj1HWHyPjLN0dZz033ZsQswkTwRp+l0GRVl7iGNtek13+
	gd9UeTk24TiBKglHk+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdoL-0000000FqnW-00QM;
	Mon, 05 Oct 2026 08:12:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdoI-0000000Fqkb-1MeW
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:12:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB3834E4118F;
	Mon,  5 Oct 2026 08:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89156604FE;
	Mon,  5 Oct 2026 08:12:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE261103306FB;
	Mon,  5 Oct 2026 10:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791187951; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DxrPLHNuoTp6uL4jQVhRWLuES52892SNnqiNXDDDmIc=;
	b=1ue8Dun9YsnOwbjZTQ5DBjmyAyX5Abujbyi9oUPK+hE9k7kg0keiPq45MKLt3DLeYvKXmw
	zIk/ZKg/yunfh0wPpCzyhTPPCkavmmA0gcnnJpk49s4uYSBznRLu8IgH+dAhSboTwvdyy+
	FlHv3UBDeXrxtv8iT2p82nfCdJhapS7CU/P/894ebnxJiJd+ZdBBwfJaqO2tfrTToNBrEd
	ll3aQxq0hcQWVFQxA1QkPdjtlwdXB1oc0raSafkC71JQnEFZF0xWwMzpQpSDykz8wzt3vh
	YuV6glIpvfSFnJXyB65ZTiYGSCu5Wcpvc71a09GprLL09xTiYO7E5swyT3qfpQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 4/5] spi: cadence-xspi: Don't use infinite timeout in register poll
Date: Mon,  5 Oct 2026 10:11:39 +0200
Message-ID: <20261005081141.33688-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005081141.33688-1-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_011234_513490_D11DA57D 
X-CRM114-Status: GOOD (  10.18  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

The functions cdns_xspi_is_{sdma,stig}_ready() take a 'sleep' argument
which, if false, would result in the polling being a busy-wait.

But it would also switch to infinite timeouts, which we don't want.

Note that this code is dead right now ('sleep' is always true) but this
will change when panic write handling is implemented.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/spi/spi-cadence-xspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 7cf52bcb05df..09ed2afbd4af 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -374,7 +374,7 @@ static bool cdns_xspi_is_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 		ctrl_stat,
 		((ctrl_stat & BIT(3)) == 0),
 		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+		MRVL_XSPI_POLL_TIMEOUT_US);
 }
 
 static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
@@ -386,7 +386,7 @@ static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 		ctrl_stat,
 		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
 		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+		MRVL_XSPI_POLL_TIMEOUT_US);
 }
 
 static void cdns_xspi_trigger_command(struct cdns_xspi_dev *cdns_xspi,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
