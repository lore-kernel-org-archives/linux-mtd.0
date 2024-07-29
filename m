Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A38C3DA70
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sm6kX9Z++yNY6G/Y80QIYLlRaRvFexaG/9Jl+sEuPKw=; b=28lI9lWY+K8szT
	H0tef6wVC08+1flme67e6cJpvtD4zZ8qtcr75L9huZSAq9Ymfz6pVGgxofK0pJG1ITb2dnUhkSNJY
	exkKNNq+V0xZANp2ER71g0qR2k30oJexFxgVvuB3/3f1Gx+fhDlgfjspUZsxmJZqsfJ1NHTEGyeuG
	WDwCl9sFY2XQDbp8wJzCn5WJraSZerl6g+rAEbvviqmmO23KYXd47REj4On4Xpt3n9PU4w6T2Qqre
	g5tqI0mcTv2rt155xwCjz+OlwEaR2HYEYXRXALm0nVXNTL0jAYnjXZrV89F2NaBOiVkIsdinorT5T
	bZ9wPoZpO+x31CvGnXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUq-0000000ArXY-0QMr;
	Mon, 29 Jul 2024 10:20:52 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUm-0000000ArWI-3INE
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jul 2024 10:20:50 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240729102041d24648a1b7b346cbd0
        for <linux-mtd@lists.infradead.org>;
        Mon, 29 Jul 2024 12:20:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=495vGKiZDr2z/a92JLNuGqpAjuv9lR4YLKcQxoZ7LDs=;
 b=RQRUhWPcEvUT62EcDqOjQ8F6HdJahWlKIKBdZqgc0IuPPdjoAf57UnfGTCX6C50pOgkYUO
 K2vnWdxii4WUBHo7ACVodkgqJnyMgwZN23yMYnJBB89DNFX3DChHYfNQjG9GHBbmTZVOouXF
 PqIi89F4p5qruyZ4A1Ja9A7NlRjPHlqOEAArK3ORkNzsJZfh1fiR9xHD16J5bHsR0YYYa+kr
 0Kb5fP1k1Mdt4rPunraRq/fXXsA1XjYUYwZ7XXbJeaXIoidxqFtp2TWmOwJOE73Ec6ho3I9s
 BvDAbdC8rm/McRDukhdUSq0G7PA9j2p1DjT0uHVXV1GVwYJs/0EE0lSw==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 0/3] Add support for Cypress/Infineon cy15b102q
Date: Mon, 29 Jul 2024 12:20:13 +0200
Message-ID: <20240729102016.8527-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_032049_429631_D9A60D61 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Alessandro Zini <alessandro.zini@siemens.com>

This patch series introduces support for Cypress/Infineon cy15b102q, a 2Mbit
serial SPI F-RAM device.

As the JEDEC-assigned manufacturer ID places the Cypress (Ramtron)
identifier in bank 7, this series also introduces a mechanism to handle eventual
continuation codes (0x7f) that may be prefixed to the actual ID.

Alessandro Zini (3):
  mtd: spi-nor: handle JEDEC manufacturer bank
  mtd: spi-nor: convert existing devices to use mfr_bank
  mtd: spi-nor: add support for Cypress cy15b102q

 drivers/mtd/spi-nor/core.c     | 71 +++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h     | 10 ++++-
 drivers/mtd/spi-nor/debugfs.c  |  2 +
 drivers/mtd/spi-nor/issi.c     |  6 ++-
 drivers/mtd/spi-nor/spansion.c |  7 ++++
 drivers/mtd/spi-nor/sysfs.c    | 13 +++++++
 6 files changed, 97 insertions(+), 12 deletions(-)

-- 
2.45.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
