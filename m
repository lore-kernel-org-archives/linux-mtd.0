Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1603EC71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ds2MJMNErZsggt5F8NCePNDp1lNcULqCXcdClxW92k=; b=gP2ceDOKZIjEo2
	J9sIeb6UAg/qeNvrVEORn8sZ9bTNJ6xKD5x35YWbc9BowzHr0V9DjW0XLD3TlnEH/HBA5mRaZBmw+
	DNftoX/2JUPr/MhuWEyN/NJJOUl95Ng8H5Akkj7XGwiFukQZ+3+diicRwuWP841X9ADhmHQen3QZH
	SG7KuJAEeZNv6J2wTnCoSxL/C8GvHbtl8tCOxEa4POgfLIyOeW++/SwMewPQYHO+VpSWMJNW1f5/b
	rC1B30DTnq98gVGY6WEXKg8t0uBoGPcS94+qToy6ZLZtzqUhIt4ni5E2VqhVCBWwh3/w1pl+kscLx
	AXJxbgwBwQ0GghqudG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqX-0000000AITx-3GBw;
	Wed, 18 Jun 2025 13:28:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhd-0000000A5Ro-2dhA
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lMS/pXtR5fwL/ucwouvgnFv8lBxKiYbXC7dEbGzUabk=; b=jAIGEqfCJjKMIGaFAbA6815Pkr
	VKlufPjvhLxEM3E+YMt9rHZgLLd8YqC4v+ouHEA55t2zEz0yNbiQQEJdI6WmSCKYjzc70ofoSM3U+
	6oW4FePo3R//NXWWmiTfdzkGMD0EZozV8bh9YuO7lYzaRjR1LUSk7bYMBIo3X7j8eD6p6EfH74RMO
	9HartYY521ZJLtLxRSIoCTIhebMCMd4UTK/Mn/1cNrwlq1fGnPjCrodM1HN7+ffzd13F0eOeLcwwH
	opnn/85BA/uk/NWLaoIlC5s76i0c3brGbE1wzHKicpbXccM1PCI6MXAVCJHR4+CZlPoTWJXF8wpU1
	1gucx8vQ==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhb-000000041g9-0H1o
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DBF143137;
	Wed, 18 Jun 2025 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750248935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lMS/pXtR5fwL/ucwouvgnFv8lBxKiYbXC7dEbGzUabk=;
	b=ReCysK3eNS/98qQKJ59qIiZ2mDTh/7ctALlXb4OB3bqeSABHuNY/s/17JpKvhVUr+jq9co
	MM4ArA1+5u7Fe46sPfCFL87o3cUl2qa4bQwNolsGeXVbOHgFJ2ooot0iGyyfWUTn39nojq
	EBOFg9MxnhYYHlFSMDFCfBaAULLqOeGUHYLGnYgLgR/aw1oGJLUNMiNU0SGNfGo8Xnuegf
	ulVR7z9FZb1Ml41e9sVUuLmlbUej1irMuzVBhHFf/dAp9/1Kp74rTQq3A2iRgWquUTNBuO
	30Ix0CVJBC/tvOlzaUPiVeWzxKZXEHIqUbmwZTKNhYIeK/K/JJ3oF6317yRYNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/8] Enhance Winbond SPI NAND support
Date: Wed, 18 Jun 2025 14:14:17 +0200
Message-Id: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJqtUmgC/x3NSw7CMAwA0atUXmOpNhC1XAV1ERJDLUESOeWnq
 ncnYvk2MytUMZUKp24Fk5dWzamBdh2E2aeboMZm4J6PvaM9vjVdcorokBxaIMxh8Xcs8xefpS4
 m/oFhGHkcDiyRCVqpmFz187+cp237AbHezPd1AAAA
X-Change-ID: 20250613-winbond-6-16-rc1-octal-phy-upstream-c8929842ed21
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yogesh S <yogeshs@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfffiedvfeffheehgfevgeelueeihfeiudfgkeffuedtjefhudeglefhgfeuteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihoghgvshhhshesthhirdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepr
 hhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopefuvffnihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131539_362298_9D476ACC 
X-CRM114-Status: GOOD (  13.30  )
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

Both w25n**jw and w35n**jw chips have a "normal" and a "high speed"
mode. In order to use the high speed modes, we need to configure
internal registers and adapt the number of dummy cycles. The benefits
are too interesting for not paying attention to this little extra
configuration. In particular, it is an important building block for the
introduction of PHY calibration on TI SPI controllers. With these
changes combined, the frequency used on these chips can be bumped from
~25MHz up to 166MHz.

This series was tested on TI AM62A SK with a W35N01JW and on Nuvoton
MA35D with a W25N01JW. At low speeds, this series does not bring any
improvement. However when enabling high speed modes (on TI's platform),
the difference is outstanding:

W35N*JW running in 1S-8S-8S @ 25MHz:

	 eraseblock read speed is 9552 KiB/s
	 page read speed is 9516 KiB/s
	 2 page read speed is 9552 KiB/s

W35N*JW running in 1S-8S-8S @ 166MHz:

	eraseblock read speed is 35555 KiB/s
	page read speed is 33684 KiB/s
	2 page read speed is 35068 KiB/s

Enabling high speeds currently requires applying extra patches from TI
to enable PHY calibration. They are currently in the upstreaming process.

Link: https://github.com/miquelraynal/linux/tree/winbond/6.16-rc1/octal-phy

In order to introduce all these variants and derive the quickest one, I
had to improve a bit the helper deriving the time an ops would
take. These changes can go through the spi tree, the other patches do
not depend on them and the performance hit is rather acceptable without.

While at adding maximum operation frequencies, I realized I got myself
confused with the macro parameters due to some of them being
optional (with variable arguments in macros). I decided it was too error
prone so I propose to add these values on all READ_FROM_CACHE
variants (where they are often relevant).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (8):
      spi: spi-mem: Use picoseconds for calculating the op durations
      spi: spi-mem: Take into account the actual maximum frequency
      mtd: spinand: Fix macro alignment
      mtd: spinand: Add a frequency field to all READ_FROM_CACHE variants
      mtd: spinand: Add a ->configure_chip() hook
      mtd: spinand: winbond: Enable high-speed modes on w25n0xjw
      mtd: spinand: winbond: Enable high-speed modes on w35n0xjw
      mtd: spinand: winbond: Add comment about the maximum frequency

 drivers/mtd/nand/spi/alliancememory.c |  12 +--
 drivers/mtd/nand/spi/ato.c            |   6 +-
 drivers/mtd/nand/spi/core.c           |  22 +++--
 drivers/mtd/nand/spi/esmt.c           |   8 +-
 drivers/mtd/nand/spi/foresee.c        |   8 +-
 drivers/mtd/nand/spi/gigadevice.c     |  48 +++++-----
 drivers/mtd/nand/spi/macronix.c       |   8 +-
 drivers/mtd/nand/spi/micron.c         |  20 ++---
 drivers/mtd/nand/spi/paragon.c        |  12 +--
 drivers/mtd/nand/spi/skyhigh.c        |  12 +--
 drivers/mtd/nand/spi/toshiba.c        |   8 +-
 drivers/mtd/nand/spi/winbond.c        | 163 ++++++++++++++++++++++++++++++----
 drivers/mtd/nand/spi/xtx.c            |  12 +--
 drivers/spi/spi-mem.c                 |  27 ++++--
 include/linux/mtd/spinand.h           |  70 +++++++++------
 include/linux/spi/spi-mem.h           |   2 +-
 16 files changed, 308 insertions(+), 130 deletions(-)
---
base-commit: 065b897a1044b1c67ba4d1066ee090097bae1499
change-id: 20250613-winbond-6-16-rc1-octal-phy-upstream-c8929842ed21

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
