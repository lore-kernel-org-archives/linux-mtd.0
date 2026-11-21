Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C048606A698
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c17iqLwj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgXZFqLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IRH6hJKAicPwQZawZwacXqq1Wq5eAeX7E4V0x2GLtYE=; b=c17iqLwj2fyPtMgcsSVa45D7Hh
	YZsi5ULaKJZf7Ea9JoMM0+W+iJ8KJcYPzg7WB2Zs4Dm0jGBu84wZJA0CKzaw63SWPjLQbUOrcf2WP
	JKw9Cn4JUIST4j0h1QsEqssFs+oeuXcoLJCPj7W3a/JHQ/v2SFTfwjw20Wh2cWdtEXOWt1QEYcERx
	agRBZEDf+xeVNw3QxXMnLGorh1ibm16cMQLKu7RXb/7e9oOZbFPm549MhjYlb9YFMS0zT0j126yvR
	yDeE+tZeck7vm+JbyKx1E00OKd3yNV5yB2UY3RrW/uznloJh1BwHg/kSuBd4Sn+C/37ZAaGNT0eMW
	9XZnHCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZgT-0000000GbqQ-0aeg;
	Sat, 21 Nov 2026 01:14:29 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdX-0000000GZaN-1zD9
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:48 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4c5d8c7f326so664250b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223486; x=1795828286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=GgXZFqLwFTbQ4uWt32J2GSGVCJyngPIv23K0jdleo7RMq/8LI8Wvw+KZ3N2/Lb23qr
         wvfdq7DX3r3V4CLk9jQg/TvZExq0NOMssyb9KqxuIfxNYg4R0JhNrlFqHGWLaWz/J7WM
         Juzt3HBD4BAS3Tl3xRPKD4lWorl4i5cARkWKghjIGK3A6OsXDn/va9AXLn7554fBZjbt
         3Z6yRGlW6WudERTp69HY/2LLfjuUJ5s5zCeM4nHy0ReL5M6WTRXXACB0WNs/m9ogttZM
         N5x/yjzbVovSluqqAvZoAxhbniNQICig2R2wS5j4TAv66FH35IyLLhVdY4J4XfUJi2Cy
         EonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223486; x=1795828286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=x+tMhVo9yidKECNZujocVsRVxKqhTFufYxdnwRsepvB4UQUv0k3BCLHdjGz5Utrq1O
         rcfHoAemVv+l4398zI5i4Tt9uEmVc23lFwl7qIPqkJBzCk/cUp4N+5RK7w4mdACnxKOH
         06XuaXvD3xlzz1p/G9N2ogWO2rhGOG6JlPYp2Ax1V0z5MDWHF7QHy6oavRSyyxqOeaxO
         2TWffNGtuyl6gVsUQfLB7pPKGk44qCHA5HWDr0ZSnlapMdrvZ8+A2VjowVDaYh99asUh
         ur1OAwU17R2SCFeIl6y2ZCSGXu99dRTBwanTUfzNJseMNXwcctL/q4B3rRGHkTl81ygH
         E1Nw==
X-Forwarded-Encrypted: i=1; AL+hErE1V+LMjILeUVjwrgLuLp3M8rGJMEUCznSXpcD0R2kipY3sd7lwk2otunoVMeiPjdrZIHxO+2s/HyE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9bb5lkPzJwf0M30jQ5ez14XDYTbG8N3tKvc549O0ty4vWauqmM
	NVKTuaLty488ulSFi+V9Re9D6mzKAOMRiwtWgisxQZknLrRqZBGnAZPR
X-Gm-Gg: AYBFou1hmhEMi2seTreMbTcukm9l4vSZPzS0SSNH/MMLtPY3P8LQ/93qkh4RHcXX6PV
	vAqjsjpxwQZeey8fcA9kS4FuYDp3Z9e4fjgTyzfOu/Zh5aIRAMdliDNimwwIJ26Rk2ylQc82qB6
	sX+EoivYqPpeJDuYLd7LlUvRrhVD5Z7Lh5x1jg6p+p3j9eYQmDKi7ns2JuZmMWf9tP4FTgGEzjn
	l/eWkIk3EuS+GIBCCYUhiMRhfxCdVoxVNaM7TIj7e/ugbDF1ux329WioQg+FqddrhfeVxN0Y+P8
	At0xPC6kKPHgysC+RekTSLHu02vEF83TOa6fPoAiFuJhWZ+AxDA7IAdWzzcysSb+aq6jnHa++05
	KvhXUZvKPiH3GT9wBEvMi1Vq8HdktnxSw9Fh8SOs9Gp6fxHYTvB3dOG7ntSQHBZ18eIEZJGglgl
	56zRbKOSki+GO8kRuMzJPT1WNi7LgVw9hCytSBLaCtxJJ3Pp/Uf+hFCGrtrQJoC6rRnR1u3riQ/
	gt0wKe2nEHHaBzdzaqcVIdTqdSIDSVzxsZQdPOBg9h3iUyqJkEt4fTc4BLhHq7GllxQA1aGWItp
	/Uz1AQO29N86r0B48I0TP7Hf7/xswjzp+jMNPL1Eum2YF19PzJkZtYwbo7Ptx8B9+lkAB+0wrEr
	tJDllMJzr3j1xQ6g+eH6P3yEhEjzBbNO8PgWzieF14bhZV3WJ14+lB2PNHBL4D7TyYsOZysUQ//
	XnX+lNR68Y+5f7IxeYG1ayFUaNQJJnJct/Q2hLuRT2UoMjA7RFfGr8
X-Received: by 2002:a05:6808:6410:b0:574:16ef:89c6 with SMTP id 5614622812f47-57a0ab2e12amr5993188b6e.35.1795223486363;
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:45 -0700
Subject: [PATCH v11 22/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-22-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171127_656517_F26C6524 
X-CRM114-Status: GOOD (  17.94  )
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

On a controller with several NAND chips, I/O to the first chip can
overlap identification of the next one. The driver registers each MTD
device as soon as it has scanned that chip. Normal I/O holds the
controller mutex, but nand_scan_ident() does not: its RESET and READ ID
operations can change the chip select and timings under the active
transfer. The transfer can also interfere with identification.

Scan all chips before registering the first MTD device. Track which
scanned chips have been registered so that a failure in either phase
cleans up every scanned chip and unregisters only published devices.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 73d6cd89ca19..abea2ab0cc42 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -274,6 +274,7 @@ struct sunxi_nfc_timings {
  * @sels: array of CS lines descriptions
  * @user_data_total: protected user bytes in a programmable layout
  * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -284,6 +285,7 @@ struct sunxi_nand_chip {
 	u32 timing_ctl;
 	u16 user_data_total;
 	u8 user_data_step;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2563,8 +2565,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2644,13 +2648,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2658,6 +2655,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2669,6 +2667,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
