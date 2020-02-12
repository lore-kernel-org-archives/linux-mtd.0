Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBDFC35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC44720848
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rndXIEM/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc8R4rHa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC44720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iYiJ6m8KidNCFw30eTR3q/Bx1A6VO99HHgLZXue9C1w=; b=rndXIEM/ijgR9J
	DhMijYgIpTh07n+Vm2yyK4PVeWHJgoPmjZGsL2uP9aKaqa4Lj0t5BA0Rrvhhg/TIo4QWedEwcrxdQ
	hhlwBbGDYgjDbaW6xY9h66igz0YWny/9vZVkJBP10zRs0PF7iFk15pUAFxM9/49ULC0tyNH5deXfb
	/+VXgF3ipDu6BnloSQ5m35Pm1oLbouXOJsKCJ3l7ZpIaxUczyZ9UgeENO3tVtI7ZgGOYnJEiW0yWL
	1xlTbgLNdkoRWcS0x24cKbIK2rNl3YKhQJCb94NAUEnGTAxdN+W2XVQR/vatI2XsgndPWZGpHtHUj
	B7HYt4ZMMYeIr5y8HvQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g5F-0000Df-LU; Wed, 12 Feb 2020 00:40:53 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4c-000830-VK; Wed, 12 Feb 2020 00:40:16 +0000
Received: by mail-lj1-x244.google.com with SMTP id h23so252038ljc.8;
 Tue, 11 Feb 2020 16:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oW56caOZX+W0a5qTNTmAm553uHnVZ0sojrhATf/BGUU=;
 b=Vc8R4rHavMgjLfDyWIJA7RfNKrMHSTOfKVb/Bhz42z8IlQuiuT2Xfrep+KiPCpBCJA
 I5WqwFEaLPuKWnuIKegz8QPiA9hJFK1G3BvqCp2cpVc5rMbUZTGOCJuilepKryfecepH
 nm4xVfPKlBabOGjxOxc+EEKY8H7qwU8mwW7+kyrjOQMzfW9CiABr2wlEqRWqpYGmQWtU
 h8/uWbMCuRwJC2qjZkHhS8Q1/kmzxNNEsInfICF2Cero3pcNhrv9PEyHzQyInuLOKc5x
 G5JdNvW00MCJiUC4n0uOzLFu8KKwAy1MeGoCQ15ccr3q+DpxNnKSKPEBT26htcHIT56y
 iLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oW56caOZX+W0a5qTNTmAm553uHnVZ0sojrhATf/BGUU=;
 b=MusFj3URIYwBZp5USvHNTDFOw19wOPs/kQWmO1UEQn8RkhWRrGSYd8MZfhp2+nfcJ+
 bvoNhKKnWGqP9cUYFTsfi1G4zs0yMF9OvKXs6K7KA182OLo/9PPb9JoeQRnDtuMpLsYH
 P1qlx6jJax+eVqLfpOAo2e6jBKiWnWiLmzcpec/nV6ZxGKmcywzBDwBuhbEFIXtNloNh
 1XFvKWkNjQYdJ/ECSU8AEaArQuCJsTVOHWK/yD9PQLN1yWPczgLCDCNK+dmb3DT0wZHf
 S+fNHciR5p66Mb6KPZFg8mt7GFHxJ8627+TL201QYlb01kJlpBA6Ixz6+DjiejZ+pfHt
 kFNQ==
X-Gm-Message-State: APjAAAXXYFCzY/tpoX9JiNNDpSNYQ/KTcn/e75PdwLPhAGtBoWriwIrb
 lXFxjrMUoTIo4oa3dR536PI=
X-Google-Smtp-Source: APXvYqxhJRYGRxonbi1AgPvSRlgGXbvyTq5eNoX/sZxb7DF1nypyaKRr5DfNACs2Uq9VcgzJ5m8QHg==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr6136584ljj.82.1581468012219; 
 Tue, 11 Feb 2020 16:40:12 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:11 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 00/14] mtd: rawnand: ams-delta: Prepare for merging
Date: Wed, 12 Feb 2020 01:39:15 +0100
Message-Id: <20200212003929.6682-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164015_061343_53DEE8F1 
X-CRM114-Status: UNSURE (   5.90  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In preparation for merging the driver with "gpio-nand", as suggested by
Boris Brezillon and others, drop Amstrad Delta specific bits or replace
them with more generic ones.

The series starts with v2 of a patch that adds write protection on boot,
originally submitted as a part of the driver GPIO migratiton series but
not merged, with comments received at that time from Boris Brezillon now
hopefully addressed.

The series also contains v4 of a previously discussed patch that drops
Amstrad Delta specific partition table info from the driver, now
provided by the board file via platform data, with an OF fix added in v2
now excluded to a separate patch.

Remaining patches are new submissions.

Janusz Krzysztofik (14):
  mtd: rawnand: ams-delta: Write protect device during probe
  mtd: rawnand: ams-delta: Use struct gpio_nand_platdata
  ARM: OMAP1: ams-delta: Provide board specific partition info
  mtd: rawnand: ams-delta: Drop board specific partition info
  mtd: rawnand: ams-delta: Enable OF partition info support
  mtd: rawnand: ams-delta: Push inversion handling to gpiolib
  mtd: rawnand: ams-delta: Don't hardcode read/write pulse widths
  mtd: rawnand: ams-delta: Make read pulses optional
  mtd: rawnand: ams-delta: Handle more GPIO pins as optional
  mtd: rawnand: ams-delta: Add module device tables
  mtd: rawnand: ams-delta: Support custom driver initialisation
  mtd: rawnand: ams-delta: Drop useless local variable
  mtd: rawnand: ams-delta: Make the driver custom I/O ready
  mtd: rawnand: ams-delta: Rename structures and functions to gpio_nand*

 arch/arm/mach-omap1/board-ams-delta.c |  47 ++++-
 drivers/mtd/nand/raw/ams-delta.c      | 237 +++++++++++++++++---------
 2 files changed, 198 insertions(+), 86 deletions(-)

-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
