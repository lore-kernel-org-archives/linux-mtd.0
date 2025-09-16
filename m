Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F41CAC592
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Sep 2025 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BggSXWTh7FDivw6iTnBRebknDahnDWTfnOjY4AXwAe8=; b=1RL4pPb3oAqsDQ
	7dLYlfDWwe6eqUXAAizM1lh8YXfSGVrez8MidupiFNBv3mPBZ0TfElFf9wJ0gn5jKFXpcRiDf+JGO
	e3HdVuOKQKZXZwlbE4zway9dG29y+3Qlfjmnw+RoI6s8PJN4SVYVvfO4xKMCe6YEhcGFomia83xfc
	9I0pWPrKeeT9sDyzklwDwUZxub7ekvBWy7D2nG8szX0rfzHnb/WTz6KhMEG5DfVI7y0uK9cjtVuoB
	RVOZEE+OSd8otLcvlhoSNpwfQgLopj8EtfYYUh+s6RcwUVdlPVlhG6gevZET3G0J25BnTMP8jLzKc
	dCX3rmq+W/kJfXGWnKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYDg-00000008OOu-1ONk;
	Tue, 16 Sep 2025 16:07:52 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYDd-00000008OOS-3iFD
	for linux-mtd@lists.infradead.org;
	Tue, 16 Sep 2025 16:07:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-352323388b6so38189521fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2025 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758038867; x=1758643667; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/0W2L9OlAywXpF0HxvS+gWrdQm+yMEFpV/GktPNazQ=;
        b=RZ0vjfRvo7ba2FEXK6u2adMzvJUNqUAIMH6Oq457atA+X0DrNHXEoT8EMfGv7rdghb
         qTxQOgA+y+W7vRb+TiWLYVlaJs+beYnaElRQ4HJ1uqs1W5Acns2cA2X9WJvS5Vs3607b
         4gQLZsfN8fTeAbcYNLbHsWLZO7Tz5gs66epv6RB8xhKKxAxkJSLqAEG2Y9Z9itoK0L5b
         /KMEZbZimts04Mq3J25EMmZ06Xzpzm+WUcGYVtYyUg0dQg8jaOCJ3kpWxXwykhUXCwA3
         vW6gJwU8Hmr9RTV2kmy0JUX38JiaDHvl+5vn6Sxe8gJ7+wH7lgdmUcv3gOLp2vSGFSBC
         MgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758038867; x=1758643667;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/0W2L9OlAywXpF0HxvS+gWrdQm+yMEFpV/GktPNazQ=;
        b=KfFzQOAGrd+OVGOpQV+lazB7IsVK9Po8vu9Qwc3KEOqq9Fb7tey2Ze8R6b1m+SBue5
         D5xg79KqZcLzBSJatubv5yJAOP8Kvxo4j6oH+Da/3DIkokhJNLCdT0j9ap97LotwfsEf
         6tfNYg93TTWucL9CBOSomx7RDa+2GJTB2dBIM0+qEjLO6Kn4iHa+pZbs16vEJV1bji5W
         ttKOfTmbpoRQSzPPqerEC33tP5Mh3vcyNvFusuLf4IrtMMFfGV02SQB6lLEOihYJF2kB
         ty/sV0LR/UyUQw8jnvDu3VCuQMScbuCASmT9wOWc+xMGHY7K1qXndOdQvyqwdYoKFVUn
         Skbg==
X-Gm-Message-State: AOJu0Yy2HXPZXEW1bYy+nr9aJEdPtDIVRKjNTI+Mdf8mEjZt/BjUwiw5
	5OR5fjGF5JL2n6BrvYHMffbCiUfhfqDtwy3f/SGuVeEEXbD+fzoRX1/0sQSgmMruOzeW3tGZzPL
	dKXSL7H8=
X-Gm-Gg: ASbGncugUyCi4iCTNQZhU5KGcN+xmY0/gJW19QQ22l0F6qrafrmH3/byRuxSDP2OKHm
	peqj6AYuQlccLTw76tawXhHRQutHKMsQEq+8aPugGD9oMlgrtZhAIXeirUBN+6Zyuf2VTq9DyWW
	Pw/6+tuLioqMf5NJ5zVohli0jkYndmhPF02SBAk36RML4ZQBWpkQssj51BrinNBUy9uSG7RZC90
	aNfXDGhxIFfPMxUwHtDzR9XLG4QDfh1qu9/Np+f4Po+axc0ua8y2aYlLzf6pX2f7pAsg1InQRWA
	vZZJmjyLtOgAsoq5O/vhB1LIEv0e22dPyLuZeIsjOI0gQwbpOwlAz3QUWiGe8MWRgiVe0VqC5j0
	X7RJWQKyBdKWQ/As1qhmAQ2ctlBaleHMU8p4jTkUM32xs+Fwk0U+esthxxwj/dnttWSU=
X-Google-Smtp-Source: AGHT+IGhvr8U/FqO72QNvVOlNymqj+FPYnXU6PzK71FX6MNafUcnCAiOiJDfXKt2I3Er1bgMXYwDWQ==
X-Received: by 2002:a2e:b893:0:b0:355:2a10:f45f with SMTP id 38308e7fff4ca-3552a10f5d4mr37991311fa.12.1758038867171;
        Tue, 16 Sep 2025 09:07:47 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a82065asm33455861fa.34.2025.09.16.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 09:07:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Sep 2025 18:07:37 +0200
Subject: [PATCH v2] mtd: rawnand: fsmc: Default to autodetect buswidth
MIME-Version: 1.0
Message-Id: <20250916-fsmc-v2-1-fd6c86c919ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEiLyWgC/12MQQrCMBBFr1JmbaQT2hJdeY/SRdpM2gFNZCJBK
 bm7sUvhb97n8XZIJEwJrs0OQpkTx1BBnxpYNhtWUuwqg251316wUz49FjU7NITWIA4eqvoU8vw
 +MuNUeeP0ivI5qhl/718go0I1OFM3d6bv9e3OwUo8R1lhKqV8AY2PyZOZAAAA
X-Change-ID: 20250914-fsmc-bd18e1a8116f
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_090749_965315_592E156B 
X-CRM114-Status: GOOD (  13.72  )
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

If you don't specify buswidth 2 (16 bits) in the device
tree, FSMC doesn't even probe anymore:

fsmc-nand 10100000.flash: FSMC device partno 090,
  manufacturer 80, revision 00, config 00
nand: device found, Manufacturer ID: 0x20, Chip ID: 0xb1
nand: ST Micro 10100000.flash
nand: bus width 8 instead of 16 bits
nand: No NAND device found
fsmc-nand 10100000.flash: probe with driver fsmc-nand failed
  with error -22

With this patch to use autodetection unless buswidth is
specified, the device is properly detected again:

fsmc-nand 10100000.flash: FSMC device partno 090,
  manufacturer 80, revision 00, config 00
nand: device found, Manufacturer ID: 0x20, Chip ID: 0xb1
nand: ST Micro NAND 128MiB 1,8V 16-bit
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
fsmc-nand 10100000.flash: Using 1-bit HW ECC scheme
Scanning device for bad blocks

I don't know where or how this happened, I think some change
in the nand core.

Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Drop surplus semicolon.
- Also add NAND_BUSWIDTH_AUTO if 8bit buswidth is specified.
- Link to v1: https://lore.kernel.org/r/20250914-fsmc-v1-1-6d86d8b48552@linaro.org
---
 drivers/mtd/nand/raw/fsmc_nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index df61db8ce466593d533e617c141a8d2498b3a180..b13b2b0c3f300c7a611a36a402f1587d28166fab 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -876,10 +876,14 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {
 			nand->options |= NAND_BUSWIDTH_16;
-		} else if (val != 1) {
+		} else if (val == 1) {
+			nand->options |= NAND_BUSWIDTH_AUTO;
+		} else {
 			dev_err(&pdev->dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
+	} else {
+		nand->options |= NAND_BUSWIDTH_AUTO;
 	}
 
 	if (of_property_read_bool(np, "nand-skip-bbtscan"))

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250914-fsmc-bd18e1a8116f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
