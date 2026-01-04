Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FFEC2A06C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jan 2026 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQcdMe6MSwg9SU1gp+sV4A7TfcFLgsMOUsXlq0WgzS4=; b=QXuZSeVWVuTyji
	/xj50SZ85ru7aR472JgXWAOSrqs3wb1qC4ffXUXQOiyHPRX+/WDi7wETb6lEzA26FmG85Sf8WNoVO
	d5Bd0dYuXG0HFSiHs4xNV85SVSRmkOb3+lCQiHohEHgtIDRfu1IgsfPg8D3TklS+NvBUNwCOW9AAn
	6jFqLpieMMupYdhduMWV7hE/PeYhRLV11jv+dDBwVY0FGXFp6aXG0zuAYgRLLtOfwjfrBasO4NVXZ
	3Ouk0vuYb5me5y+5qGemHvruSFocR2yCmAXpBkwhYQf5EkxaQrLO2bpISHr9Gpsi7FUEW2eBcZcOF
	FZibwJLVV/5Vavp7flCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcKw4-0000000A9qc-0ES9;
	Sun, 04 Jan 2026 10:02:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcKw1-0000000A9qH-0vmU
	for linux-mtd@lists.infradead.org;
	Sun, 04 Jan 2026 10:02:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so9620106a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 04 Jan 2026 02:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1767520924; x=1768125724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LxO4CmHvbs5IX2zszHvbq/kpDg48hQV47bQLUQlGXrQ=;
        b=NdrKFrrPuM7eSeXbBfYJD5PjKRaFn4KE3snpBOEbK/Mr+7jgshUNBC1TUQjLktEX1z
         o2HmZn4Nm0OxzG4Mw4qW7uQFym8I/c3zEr9zPDTDJtW/YltgDAM3K0SF7fFzTrA1QUBE
         WQohABOlFhi5A7U+chxL1Ipy/hfWfU0fpC/Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767520924; x=1768125724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxO4CmHvbs5IX2zszHvbq/kpDg48hQV47bQLUQlGXrQ=;
        b=plvedKp8MnfEOU3dY9s6DMl50N+BtWooq2U6WSIOziZ8cmg9ZOMbWC5/8M3xxSFv5F
         IgYE5WmSLmzgCjDX5ifY7A8GPwiQG9hFOimudDlR7lxHv5LHrxA2VQSQb4GKAcjpoVv1
         PgFBgDRVJvQIDRkrPSMMtWXkvMKYKWNSM4l4A2PwT+HDv3q8OpHB9obm1vRJxWw48HHn
         k/RVYwS7l0/AJqpGOjG1GmNfro5iqklz5/Buom4P8swb+mdLXZFXVyYoDM8M8hhsr6FQ
         kCwnBpgVJT29v8cRer5nmkpV81veUzOZxJ1TtH+TwzuP1XyFaVWLYL7d3XeXMROtRYK/
         M8ig==
X-Forwarded-Encrypted: i=1; AJvYcCUj1SiT/opT33TASNYTn6pGa4wl5RKFVGIdWsgwgTgtVACPoG7Yn11OJSTv8nRbe56OndnyoO/U5+s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDNTCv0ZnSMBd+h3o77qYY7YSE0DrWRauSrou6K8DIfj03XZO1
	dglcgfB7bh8p72Vv/TtrTGfFI5jYt3lAbuZ0HuhdzChQpYb1AD0Nz7o/Q9xLLBr9LaE=
X-Gm-Gg: AY/fxX6mx7+on6tsiG4qv7gkbtDfOqWnGJuT/6NEqEhGzupJFcwwku0R3YM9kKrZzaT
	U/cteBzZkGQiZ3VxYJl8YJ8p5STk7SncZoLad4EQdkjqyb4/DEKNamnHr4aN1m3xI0YwtqT7K62
	fPs4asVhs/2kjYx3/8nsvdYI7coJdxEi+bCDLgnJnETFZh4ULbjSGMMyoG0TX+NLlrDdRo7zFsj
	k99pcFL2ufjW3ZW85yHKEx2t/otjp58Mir0Pg72qCffnZkBe2SBKHsee3tnVYVe0kNBvTLhWc0M
	zrdSQ1rCHbw3RpacOo+aMFlAKOcWMMLv1HmVIp+N/IaFsRS+z0UEnkKMWejoClm9MDmZzHpy6G8
	cxI8u3yK9/qyDdDty4z0gcaFLKpA0MJDF+iE9vkP4iTS3Bihy+woiA41M0Bikwf4RdqrGgJ+fgx
	ktHKYtIlFulfAdDseyd8FOzZZZHHiJJusiV7LkBl2zvks4yrNXlvjT3NJvNx0e+dPg5Ksfzyvai
	vI=
X-Google-Smtp-Source: AGHT+IHoffS/7yWJB4nhd2QWoukImGAGgvYz07KAWU1mQA/srAsoHCH79yzY4kDbBdUFKRZOCq1CXw==
X-Received: by 2002:a17:90a:d64b:b0:33f:f22c:8602 with SMTP id 98e67ed59e1d1-34e921cba61mr40911683a91.26.1767520923615;
        Sun, 04 Jan 2026 02:02:03 -0800 (PST)
Received: from kinako.work.home.arpa (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34f4775df7bsm3458539a91.10.2026.01.04.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:02:03 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] mtd: parsers: ofpart: Remove code/data for disabled custom parsers
Date: Sun,  4 Jan 2026 19:01:51 +0900
Message-ID: <20260104100151.1400182-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_020205_487598_39925C8F 
X-CRM114-Status: GOOD (  13.73  )
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

Currently even if none of the custom parsers are selected a struct
of_device_id and a dummy function that just returns -EOPNOTSUPP is
compiled in for each of them.

Its not obvious from the code but struct of_device_id is massive,
196 or 200 bytes (see link), so this is a lot more wasteful than you'd
think just skimming the code and assuming the wasted size is just the
length of the string with some small overhead.

If they aren't enabled use ifdef's to avoid anything being compiled
in and remove the dummy functions.

Link: https://lore.kernel.org/all/ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be/
Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/mtd/parsers/ofpart_bcm4908.h    | 6 ------
 drivers/mtd/parsers/ofpart_core.c       | 8 ++++++++
 drivers/mtd/parsers/ofpart_linksys_ns.h | 7 -------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/parsers/ofpart_bcm4908.h b/drivers/mtd/parsers/ofpart_bcm4908.h
index 80f8c086641f..f96dcd5275a7 100644
--- a/drivers/mtd/parsers/ofpart_bcm4908.h
+++ b/drivers/mtd/parsers/ofpart_bcm4908.h
@@ -4,12 +4,6 @@
 
 #ifdef CONFIG_MTD_OF_PARTS_BCM4908
 int bcm4908_partitions_post_parse(struct mtd_info *mtd, struct mtd_partition *parts, int nr_parts);
-#else
-static inline int bcm4908_partitions_post_parse(struct mtd_info *mtd, struct mtd_partition *parts,
-						int nr_parts)
-{
-	return -EOPNOTSUPP;
-}
 #endif
 
 #endif
diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index abfa68798918..e04eee028f63 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -23,13 +23,17 @@ struct fixed_partitions_quirks {
 	int (*post_parse)(struct mtd_info *mtd, struct mtd_partition *parts, int nr_parts);
 };
 
+#ifdef CONFIG_MTD_OF_PARTS_BCM4908
 static struct fixed_partitions_quirks bcm4908_partitions_quirks = {
 	.post_parse = bcm4908_partitions_post_parse,
 };
+#endif
 
+#ifdef CONFIG_MTD_OF_PARTS_LINKSYS_NS
 static struct fixed_partitions_quirks linksys_ns_partitions_quirks = {
 	.post_parse = linksys_ns_partitions_post_parse,
 };
+#endif
 
 static const struct of_device_id parse_ofpart_match_table[];
 
@@ -192,8 +196,12 @@ static const struct of_device_id parse_ofpart_match_table[] = {
 	/* Generic */
 	{ .compatible = "fixed-partitions" },
 	/* Customized */
+#ifdef CONFIG_MTD_OF_PARTS_BCM4908
 	{ .compatible = "brcm,bcm4908-partitions", .data = &bcm4908_partitions_quirks, },
+#endif
+#ifdef CONFIG_MTD_OF_PARTS_LINKSYS_NS
 	{ .compatible = "linksys,ns-partitions", .data = &linksys_ns_partitions_quirks, },
+#endif
 	{},
 };
 MODULE_DEVICE_TABLE(of, parse_ofpart_match_table);
diff --git a/drivers/mtd/parsers/ofpart_linksys_ns.h b/drivers/mtd/parsers/ofpart_linksys_ns.h
index 730c46812ebf..6537aa37c0aa 100644
--- a/drivers/mtd/parsers/ofpart_linksys_ns.h
+++ b/drivers/mtd/parsers/ofpart_linksys_ns.h
@@ -6,13 +6,6 @@
 int linksys_ns_partitions_post_parse(struct mtd_info *mtd,
 				     struct mtd_partition *parts,
 				     int nr_parts);
-#else
-static inline int linksys_ns_partitions_post_parse(struct mtd_info *mtd,
-						   struct mtd_partition *parts,
-						   int nr_parts)
-{
-	return -EOPNOTSUPP;
-}
 #endif
 
 #endif
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
