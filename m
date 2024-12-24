Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A241E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8jmIzICRnABcYJ+25G50VBUXco5ALRMeeyHGbbhj9/w=; b=UWmPNeni/sL8JT
	xQd8c8GyTqyQC0jLzpRZRMKvSxEOl9XfmYC0GOGhOfsv1FA8u5eZ7uGvsTLk3w7C5BpQKQwSn/t5m
	Or4K5stB/wj5ivJZwdEoQKL1/M8m2ti6hWeFsEMnFhX1PDvO5Nep5J+CGIe/9qTyboP07f9rUZo3z
	jlvxP9ErTstTnt5C2/358sAmErtWmvxCYkQRVS41Im95aSDo+WA+xhkGoL6qYXQ46EjAaOgPMc1PU
	g/FJMk5UWJcpv7PLvvGVm/SRY1vGpN5V7Jvj9TFy7Jo7ojLP6U2LqcgSsH3cQ/1EqNV7IhYKgXQBc
	RwZs4xLaRMjTGLmNxn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84d-0000000CLJi-3PYl;
	Tue, 24 Dec 2024 16:47:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84a-0000000CLIe-1hCL
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 16:47:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F2A61C0004;
	Tue, 24 Dec 2024 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735058874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4+/JxgFM1H7NHJY6m2Q4vAaUKIarp693Sr74UQi2xJA=;
	b=BgKQ4JyN0gL60a99E0wZkNpnCOsFxYvoOLFNDAhplPkkcTg8Ek+wovDdwZCe9isECUmp2/
	xN71bVyTmGz/Rq9XiOGUVjQcBr4+TR9NoRT6/W798nR6DDGVqilHOlQ9Gi9TtiEAFLNunw
	i1ynA4thSay6wIph8hVDgUVJ0h2qfUXGbNRWUybpCyEjE2z8OMVJj3Tv5dqZnEKoi+dELI
	ksn/uWyRzuHRI6wtg1NNX1YjJ8eJosp9S5x+zRKZ7ElT/eyOZ+m6PIClF/0K1X3269CZwv
	VPuHw7svF46y2hORxsRjWddQqhjW+lqNAIvNhdWkdxvXen/aSPuVNIQy+hPobg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: spi-nor: winbond: Add support for flashes with
 several dies
Date: Tue, 24 Dec 2024 17:47:40 +0100
Message-Id: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKzlamcC/x3NwQqDMAyA4VeRnBewcSvoq8gObU23gKSSihuI7
 76y43f5/xMqm3CFqTvB+JAqRRvcrYP0DvpilKUZqKe7IxrwIxqLLujREVpyqMXwKGvYZWWMsmP
 OoR/Sw/s4ErTOZpzl+3/Mz+v6Aez9BmxzAAAA
X-Change-ID: 20241223-winbond-6-12-rc1-nor-volatile-bit-ffa03c566b92
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_084756_600581_EF02060F 
X-CRM114-Status: UNSURE (   5.83  )
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

Some Winbond devices are made of up smaller stacked dies, like for
instance W25Q01JV which is a 1G-bit serial flash memory made of two
512M-bit dies, and W25Q02JV which is made of four of them. Internally,
the dies can either be in the active state (only one at a time), the
others being in the idle state. Problem: there are commands impacting
all 4 dies, for which we monitor the state of the chip reading the
status register, but the status register only gives the status of the
active die. It was observed a possible internal deviation of up to 200us
between each die when doing similar operations, which can lead to
races. This series aims at supporting these chips properly.

---
Miquel Raynal (2):
      mtd: spi-nor: winbond: Add support for w25q01jv
      mtd: spi-nor: winbond: Add support for w25q02jv

 drivers/mtd/spi-nor/winbond.c | 87 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
---
base-commit: cfb48994051444aa6b620e48898f95ea91d193c5
change-id: 20241223-winbond-6-12-rc1-nor-volatile-bit-ffa03c566b92

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
