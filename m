Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C7C3065A
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEh/gH0EQG43M1Elvn2+yi5dhMDuw2ExhWTuay85GOk=; b=NZV+npqhWPMXHd
	k1gsQMFORRwU3n34hAwlHqhRtw1R3FZChFpMXgBNRFWlCVaw6PJD/GYXM5R4GTgVmEK9X8mV8o2HP
	Fvchogag3vE/Zb++YrgqWa4xVJ7NU3YCqt9GSHdBxUKNfdrxPQZgm+msxWW+a46fb5UcmY3JA0D1R
	DATUBdM3g4dHZsc6UKxwT4TT3F/N42Yvh/DfIpr9g5d9+PtbUXWaUr4yytKQ7owpB/22SOw60u88E
	ewzSknSoUYHBy9iKDn896Z6HrQN4XEOqSJylwTr3x1Osl9dGT7thwfWHWd+ACdCWr4NQLp5cVaFL2
	WCgbFCXoHPyaPkxWZr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNVUi-0000000GG1P-19zp;
	Sat, 29 Jun 2024 10:39:48 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNVUf-0000000GG0o-3Pu2
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 10:39:47 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4WB81s03wwzMQKt;
	Sat, 29 Jun 2024 10:39:28 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v2 0/4] Add support for SPI-NOR Macronix OTP
Date: Sat, 29 Jun 2024 12:39:09 +0200
Message-Id: <20240629103914.161530-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_033945_878694_D94EA43A 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

From: Erez Geva <ErezGeva2@gmail.com>

Add support for SPI-NOR Macronix OTP.
And add mx25l12833f with OTP.

v2:
Improve description of mx25l12833f.
Add note about mx25l12833f using the same JEDEC ID as mx25l12805d.

Erez Geva (4):
  Add generic functions for accessing the SPI-NOR chip.
  Add support for SPI-NOR Macronix OTP.
  dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR chip
  Add Macronix SPI-NOR mx25l12833f with OTP.

 .../bindings/mtd/jedec,spi-nor.yaml           |   2 +-
 drivers/mtd/spi-nor/core.c                    | 131 ++++++++----
 drivers/mtd/spi-nor/core.h                    |  27 +--
 drivers/mtd/spi-nor/macronix.c                | 190 ++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |  10 +
 5 files changed, 301 insertions(+), 59 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
