Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB2FC2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXl07vW/glOMAd4b9ear9UIsEhsI+KNF0koFyiIOpjE=; b=XizVs50xUAb0NV
	DZFSTIfdrmquROwzRHBLFJK1AEwM+qAMF8ZnBXoswybL5po860vZalNxsPZtbKk1iZWZ0NGSM+AD9
	+FKT/AgYiOch5KS/DBxVj/7DdQd7Gx6ydszD/9/tEPyQDtyIY01DUHbnuEgCBf7A0OiRqvHFcpQyp
	wsTdIHIzZvOwMqPH5MW+fdqBBCf38VdeWU4NdXXXlNdk+WXMSAL8mBDa8YvqqfjxHJTdGbSa9aDEE
	hiT1ojAz7YS9vP8c+uMzKaF1JLCPux4NYL4h3CE+TCz343ChsHmkngPwv6XtXO0BWmlbNwAJduMsZ
	QqMB+dFNOCEDYfAW6mZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCD5-0000000Dv0h-0hge;
	Fri, 28 Jun 2024 14:04:19 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCD2-0000000DuzA-0ydl
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 14:04:17 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4W9ccK4ZHBzMQKt;
	Fri, 28 Jun 2024 14:04:01 +0000 (UTC)
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
Subject: [PATCH 0/4] Add support for SPI-NOR Macronix OTP
Date: Fri, 28 Jun 2024 16:03:24 +0200
Message-Id: <20240628140328.279792-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_070416_300398_7787201A 
X-CRM114-Status: UNSURE (   7.36  )
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

Erez Geva (4):
  Add generic functions for accessing the SPI chip.
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
