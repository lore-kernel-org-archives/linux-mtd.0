Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544FFC31E57
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 11:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270662084D
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 11:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwA3AX+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270662084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i46NlrxZHlHnRUKRn/UvRQVnksa2+MUd2cEd2q8bPuU=; b=uwA3AX+RKvPLpT
	9SK+MK0VVk18oyVVVlPoW+Po0ACqmT/rXKWxOz3eaBMRY/YQ5G2jVVIvKehIJym8BeneO44JXp8se
	djvLEzUUUaZP63z0Zk0XRboxjchWytwtqUFgk5bTGOl1JM1mGabQT7gbnrVIW9VNGHbb0XNEWLpyW
	C8mwrF7/E3T8kBKzmcvtR9uzWUaCHc+qpuyT/DUHWylXtN4MndydMqF9SmevqcnJhtbZOT+KAQzlR
	MnAy3EWVv3+tF1WtS1Ij2FlwdeSm3KjBipDUYOHQ5m/4TWr9QP7KSia2HkvgMIdEL45ThHV0Xh3cF
	TuK7zg+VQ8p5qO6f7Q5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcpY0-0003Ad-8V; Mon, 17 Jun 2019 11:11:36 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcpXx-0003AD-Qt
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 11:11:35 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MvrVJ-1iRlfZ1c0t-00suZC; Mon, 17 Jun 2019 13:11:14 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: rawnand: ingenic: fix ingenic_ecc dependency
Date: Mon, 17 Jun 2019 13:10:48 +0200
Message-Id: <20190617111110.2103786-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3d5kPLvVE+Mc9VocHJ5QL+VG4ICGCL+ttTF1bO5RPZrywWViORJ
 J4UEAky7/1X2kY+6uHvrmIHQ7XjrD2blLBlde7aWejVbivUNHuxVqJ64iuGvyWcy6MGyobe
 b3z31TVpq0hJMmVqt1VT9ov4znfRlngYBsN+8AmkjxP/RiF758Gygi5TAFP2MyREaWJ05bQ
 zaAhuK21CjxYLMTKfVXOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zmaDm1J/3pY=:C/lRGG3LiVMmI+mYfDDOhB
 yTIvj0o/OjngHQQTEqmUTTGy/WInYst1DqPO24w3furPv5tYb26El1BOBWOPeZcgMNUMXh9nP
 SkHTyj/K0Udn6oU5dU28acZP8LsYqiQURxAnoNAYAHnq9psTFySd1DQNudIt7kncrP/o/bQpG
 6dd1RBjadw1Am0ex7q0lqYsllDzQEtiQXlCNr25WC9WmnDeahuGsTc6AD8lwt7GIa03V0ds1n
 rMZM9f7KjIvyupa+BPGfEF+AXatKuAczzwXi1jYmrCFS+TZY4s7UBDB2j0Yfv32nk7PwPbMzN
 Ucvh0jNCSah3wJuJOy+o3JllX5vvpGNeQgWmXBSH2Z+lQor5CJ8XF78/lcSm4uQ3hnj+K5xmJ
 ozSVZjZdwOSweZSH+p88q/aibNg1VQhd94eYaYc+Q1hf+7tyrEukvrZG6bkhmYMMYy+jVNwaw
 xlN48l+Ck8xJBOXy3eEtJ7hwz/h3pIqWuQjXcMDiz9Bjyp7JFFtJ8Cp5fT/aB5iu6c2Zc1DXO
 4Z3Ez8WGh17giu/cZzddQXnJs6nwnbhPd8JKnBxngvu/LdSr/uAq0P0YzVaIumJM6hOvd7lo5
 FEpB3XEjVjTIeBy12G49jsAw/6QIR16G1pK6grnUK4r25Ta9SlQ0uOhuYgk0ckCijuWDU7pbJ
 V2TjwiRJSNdfuapuKyl4QTBKADC8oh4Kfk6uyBYxtfxQGT02i+CV5IhjRiMyTvRz4HNTt3grF
 TNwW/xc9cuUgfKnro1uyx+qJRCAbvY3GuZN7lA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_041134_173277_AA4D5124 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ecc code is called from the main ingenic_nand module, but the
Kconfig symbol gets selected by the dependent ones.

If the child drivers are loadable modules, this leads to a link
error:

drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function `ingenic_nand_remove':
ingenic_nand.c:(.text+0x1a1): undefined reference to `ingenic_ecc_release'
drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function `ingenic_nand_ecc_correct':
ingenic_nand.c:(.text+0x1fa): undefined reference to `ingenic_ecc_correct'
drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function `ingenic_nand_ecc_calculate':
ingenic_nand.c:(.text+0x255): undefined reference to `ingenic_ecc_calculate'
drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function `ingenic_nand_probe':
ingenic_nand.c:(.text+0x3ca): undefined reference to `of_ingenic_ecc_get'
ingenic_nand.c:(.text+0x685): undefined reference to `ingenic_ecc_release'

Rearrange this to have the ecc code linked the same way as the main
driver.

Fixes: 15de8c6efd0e ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/ingenic/Kconfig  | 2 +-
 drivers/mtd/nand/raw/ingenic/Makefile | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig b/drivers/mtd/nand/raw/ingenic/Kconfig
index 19a96ce515c1..66b7cffdb0c2 100644
--- a/drivers/mtd/nand/raw/ingenic/Kconfig
+++ b/drivers/mtd/nand/raw/ingenic/Kconfig
@@ -16,7 +16,7 @@ config MTD_NAND_JZ4780
 if MTD_NAND_JZ4780
 
 config MTD_NAND_INGENIC_ECC
-	tristate
+	bool
 
 config MTD_NAND_JZ4740_ECC
 	tristate "Hardware BCH support for JZ4740 SoC"
diff --git a/drivers/mtd/nand/raw/ingenic/Makefile b/drivers/mtd/nand/raw/ingenic/Makefile
index 1ac4f455baea..5a55efc5d9bb 100644
--- a/drivers/mtd/nand/raw/ingenic/Makefile
+++ b/drivers/mtd/nand/raw/ingenic/Makefile
@@ -2,7 +2,10 @@
 obj-$(CONFIG_MTD_NAND_JZ4740) += jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_JZ4780) += ingenic_nand.o
 
-obj-$(CONFIG_MTD_NAND_INGENIC_ECC) += ingenic_ecc.o
+ifdef CONFIG_MTD_NAND_INGENIC_ECC
+obj-$(CONFIG_MTD_NAND_JZ4780) += ingenic_ecc.o
+endif
+
 obj-$(CONFIG_MTD_NAND_JZ4740_ECC) += jz4740_ecc.o
 obj-$(CONFIG_MTD_NAND_JZ4725B_BCH) += jz4725b_bch.o
 obj-$(CONFIG_MTD_NAND_JZ4780_BCH) += jz4780_bch.o
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
