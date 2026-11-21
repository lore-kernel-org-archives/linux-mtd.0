Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BC606A6A0
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r2W7sHRq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f9o/UoS0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zdJMKPesl6xDet+C+LEp4arL5jYtQAIUOW1VPaicVF4=; b=r2W7sHRq3A+GQSTE8xWO5SpWuQ
	2blWuSNDSmde29qxif+P3siShO3X+5ZtcTpZnhF+ZfIL6kdiqurJlKbQzmQawTrxFPp0pHUUJtYZ4
	mWi816vnGKEjjJmEgjvT6mBIM7QfWQfgkyNzbAXtvhgOY1cOZPLIXtr+6dY8b8+5IiO5CUVa0UPwd
	c03UTg+TbAWTz3fbRN9VKjg090kHXpxJIX5NMZyGbwS4Cz0gmY3voHOBa29Rq7QhvE8FYN3cGMril
	b5nU4D+6r4jl9WF7WsiOqrmgeRI4s4EmEkQvkPS6vikPfGWl8cJ3iczw7lXnMRhG9gzE3Xq+v0n4P
	2QJqXe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfj-0000000GbKe-2Z8r;
	Sat, 21 Nov 2026 01:13:43 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdV-0000000GZYE-36yr
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:30 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-56431524c22so678551b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223485; x=1795828285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=f9o/UoS0QEpQKDLFQPmtuitTrHhqN+/LCzbpPqO/QItJab5KOnhosohyfYboMsnUwE
         wHv7DSBcSLAVB88JGF2RbVwGPRT84TpxX98/1gShidYL8bvqmInLExl61pE0qTefEq1d
         ZadDn/UTSbaTDscw3iCWW5X41Z3o8dmFwUOHrfAyrSmoMVJAi2X9tg8kZUjYeSAOmTvQ
         C3AkYhWSXGxi81p7mz7+usMx/3539m8+tDmkXRDX9eObVjkdwXdDLY/+RxLrmVXZs00z
         f9OwaRqXgW6ozyV8qj+f+fPBavTsKkcGOTdRH45Rsjav2sOxj9RY31zXUPNtwK6DbrFh
         os0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223485; x=1795828285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=ogLgp5NJrQsF7Sockv6eAvgEcY3wHRfZRavUzuDTpkRrViJBLn+ayMEWSqzQT1H6Ev
         uFPF4EJfOC2O/K3HDj29bW/xrA4bFBk6fE1YGq1bRHBpqJmKF7AW9Ezq4gw3ZBqgX0MN
         RbsfIt4NtI7Qu3TwMyeeJe/fFMd/M9pe/06GdbHniyAH3UyBjkP5n1hMck3hRHHJCaPn
         iB78CxtuKKHye/x/dmreWAqW8V02y2XxS/NGCo2K3d+DAeptERgNKjPRtSWxBx3t/02Z
         JcfwiWmdtGStXmDquAx7W5kSnnym4hGnK05YcpaleSrNGPllbhplqXvBaJBQusmX7OI+
         HNIg==
X-Forwarded-Encrypted: i=1; AL+hErFwgqCHwzJrl44sR7w0u1cc5ZcHWbpDCTXFvr/2VkQeGE8Ci/GvAfDaL0ordLnREPhZjRPs63U+/7w=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZARUIRaeRPSvOGlteIOh45iQtMgwglk0b+uHKPxAejOtBEy/A
	YFieMuFkqFPMUSRK5dvOp5xien0F5q0Oj/xLxzZgJ7pRLgiYqzFUmoUk
X-Gm-Gg: AYBFou03Mrmb5raVtEUt0mXWp4jEvuGKGkJVIGIaRwoirSIz/THKs7Xh9LI0SDrPRvP
	94ph1Ln0BB28dx04+NgSN1Z8UVSmTxmyooMM3pHRY1aGHqNiT+JmF/Q9zOZL2+HrUFUoDab22iR
	rDxSrWyl3f9eAMk7Fs71NoZQUgI9HKHLbby5PevfEnV8aWO4TuAtFN+6q4SVeieioC8C1EfiiRx
	CoHAqKYNQMX3GleuntGHWvnDJ+xuKYP8MFdGb0vd7hcf0aejVH8nbroFhm9SCS1F/7vMfXXebww
	uAzi7HSgkkhTT8V7zCJ735v4xMD224SBNj9J2iDuqemKrlXfweSFZxghkRwWuIQUSJ6B7mLv9Qu
	gD+amfBslXy37K78HVgydW3Xyjzih2o6vtFQJoN6fCCHgiz+s6BhdPLc/ZIcY31Tn+bjohLhcro
	4JH+3HA19AQhorE3wZXjTONJFNLVwG7IqCEOFy18/Gqtr3jhUX+u+8KYGJbI60GGGT+XZEPT37W
	XHr0LZLt9avNQ4G+8s1nwDF1HTJGFE8nRMX8zVVtqyJqgnwgPNaDLaOzP/QTFHLITvc6FqmlYY+
	XcAL7SU/vVjs4gipK6sTpiczVRGmtJl5n7KTBtMRvFyuQl/dZoCv7HheC6Wuqj2d2rx9OC7poU5
	h2MSj4DITh2lxl0oBDsCezkwaqHIR+UJyUSJhmA9/OHUAJdvIvhHCZWt66Zk0UN77a6TxO0J0p8
	wSwjTSf2Gam/u1I+7u7aaSHrFCoAllWfNSRaYE/F3nzHg5ba4n3lNP
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id 5614622812f47-57a0c7bef2emr6229820b6e.64.1795223484984;
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:44 -0700
Subject: [PATCH v11 21/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-21-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171126_252379_B1E6B0A1 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A disabled NAND child can prevent usable chips on the same controller
from appearing if there is no chip at its address. The driver scans
every child, even those marked disabled or reserved, and aborts probe
on a scan failure. If the chip does respond, it is registered despite
being marked unavailable.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4478189bf920..73d6cd89ca19 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2661,7 +2661,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
