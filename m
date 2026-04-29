Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5875DFF8867
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zFvgcK9wWyXxS7TjyN4hRfmrIxcEOYXkuU8afQZOxFI=; b=mJof9t4sgHabSa
	mz5SggU4WYmNkqM5gImbbLIC8ea/kkNP8YS5ugnarKmJL+TFsvFuhUbDNq5vt1+XEkj8FZkFq6inK
	so0IFVrnnwraXy/fF1jMYpktxn9KkiamsnhfF9fdb9/jPQyc+zEMz8qR47KP0SIVUO5fLagQKEGw+
	hnZicp6hmxxawq0YL99ki9TzJOLOP7zA4wr0PJ3rN+hQ/3HQBVt2xrV/AYbqF9FeYDPG+m7x99I1G
	hYd86DKnTWq6V3y/O9J/nz+kkz9SoVRL6rbi0D6K7bh+1g5QeAaAVMz2wcXEtIuF8r/fbDHAfjbJl
	hokScAZbn0D/V475EcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Vz-00000003cnl-2Vvn;
	Wed, 29 Apr 2026 12:59:43 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Vw-00000003cmp-3kel;
	Wed, 29 Apr 2026 12:59:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4EA14841E0;
	Wed, 29 Apr 2026 14:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1777467573; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qwddamSpISS9kQ0XccY8Pom5+hI9vPTaYag3qzKHulY=;
	b=ObJFC/W0mewdEriwwA7IT9ixFazieJhEYi4CzKknr59WWueuXM6YbeU5uQJVkwBAXFq0Y0
	jmhpW2NZptFKIsEmOG3HA9be/2H4gXuxqTUCgJW/Z2Cyah3ak2kOXxXqolsuM5uQZlQvIK
	XLscspxcBiRo+vis18kYBJkKBjduZKwjnzQzcg/wJxErerVEAlQFt7cGvcS5zNpjsBst+0
	4qGUPRSuyY0DSgLa3Aw8rK2lTW/W/Mk6SPOM9ZW5WahDQNxbwbfLk86gOIHdeugaEvrQ76
	h6Y4v6J5ZX8bZBXHfYLRF7InDvy+8vQG/M6gn7JTPjFb6MqVEuPlYVZUThpJOA==
From: Alexander Dahl <ada@thorsis.com>
To: linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support)
Subject: [PATCH] memory: atmel-ebi: Allow deferred probing
Date: Wed, 29 Apr 2026 14:59:30 +0200
Message-ID: <20260429125930.844790-1-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_055941_095495_99CE301B 
X-CRM114-Status: GOOD (  10.28  )
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

After removing of_platform_default_populate() calls the atmel-ebi driver
was affected by deferred probing.  platform_driver_probe() is
incompatible with deferred probing.  This led to atmel-ebi driver
eventually not being probed on at91 sam9x60-curiosity and other sam9x60
based boards.  Subsequently the nand-controller driver (nand-controller
being a child node of ebi) on that platform was not probed and thus raw
NAND flash was inaccessible, preventing devices to boot with rootfs on
raw NAND flash (e.g. with UBI/UBIFS).

Fixes: 0b0f7e6539a7 ("ARM: at91: remove unnecessary of_platform_default_populate calls")
Cc: stable@vger.kernel.org
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    Successfully tested on sam9x60-curiosity board,
    and on two custom boards based on sam9x60 and sama5d2.

 drivers/memory/atmel-ebi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 8db970da9af96..1e8e8aba2542d 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -628,10 +628,11 @@ static __maybe_unused int atmel_ebi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
 
 static struct platform_driver atmel_ebi_driver = {
+	.probe = atmel_ebi_probe,
 	.driver = {
 		.name = "atmel-ebi",
 		.of_match_table	= atmel_ebi_id_table,
 		.pm = &atmel_ebi_pm_ops,
 	},
 };
-builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
+builtin_platform_driver(atmel_ebi_driver);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
