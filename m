Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D31DEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkW3fSkXs+5oRhQ5GgLiSFAJjlfLOyeJQ+D5FxSSte8=; b=K6AkyqlTEieAnx
	T7VscFffrLigF59i9+lxIHRcDIHF6H1lOc9SSG5Z27kbfiGEUMV90lZEGg7U5/hLSF88PK/8E70Cm
	GT7RmEb8WHX6J47r9Wnr1aoLEVLCgR1xqTxyF+fhZoSBh3crJrK5pNARLfljvL+qeQgDeAKvBWAGR
	gDC+1dym55moRtFjMlDU3JPGiPaV9MRIaVMG6DZ9ICOTFEeBo3rEjStvj/yDBmKZvsukGcZtAvCIM
	8S8wh5IvH/Ooe6BYh78FgCU9c9ROZbh2U29KzTdbijj/XkHU7tjj/H/Q8nF9zQNcSpvHf3kFyXUIA
	YanTFWxo6oP4Su9kcU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqE2-00BdM3-1G;
	Mon, 10 Jul 2023 12:42:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqDz-00BdJ5-1s;
	Mon, 10 Jul 2023 12:42:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so45481385e9.0;
        Mon, 10 Jul 2023 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688992962; x=1691584962;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdvM16o5h23jwD1okqOHQiuKkM8L7IpEOiBotY2IGmY=;
        b=b376hUBVwU5cG0vV849R90AbgHClWR5m0B0ip65d7lLM9lEjoEwc5JayOE5aBw1QWX
         b5bc3XGTXrLab8Vol+LypXiM7YozU6vCehy1UgWdXKnRUbzAxcuf3jD3mHKCLihQnTbt
         2ECT/v7hdYss29tOsNN/+7uQmX9S/toJpC2ipJ0kEYWK7rOYfnP51klWTWVEWZM3inYG
         wvCQZoqU3Ac9v7ROA07LO0/1ACRT258GaaUcxrTdGiCAzpPRx8VNORi88g7HuqMlN/CI
         SbKQahle6Va+QU6n+8MeOKUcO5358RHYMp+fKK3/50Zmoow6bjq6YzhwNI9BeTM73JQp
         4ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688992962; x=1691584962;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdvM16o5h23jwD1okqOHQiuKkM8L7IpEOiBotY2IGmY=;
        b=HUEQdZvp1XggLpschcFjHk5UFJCnmx87qdj6z382NWLi/csjQPoDOxq93GtS8XTnm6
         efGX5ePQ4wSAOMpIj/r8CxUDZeymyMSkscTa1kaExNdmrfbc6RJjAFctEq6m0E2a9akk
         VvkDea50fHR55mOFRjQBRTMzLMwp+atkn0qZgKSwGeWZZGmeb6cSbFNvVigsWqPJL1W/
         fLzGbpnghj4a247+JhvKNVZhMDrcw1NvV1AmdhgrYZYTJRjD6HqAEpZRXMcvCH2zTMPx
         78wE/RI+ZXlKXAhyvS0NxJasU3f4T+y9+LGx7pVwnek29l9ph+bKaBVzdw2R5174xmyy
         7ajw==
X-Gm-Message-State: ABy/qLYCaXNkxyxnaBZR52YiI7mQP+3kFCh6WxLzf14KpWYxtDSl0dhV
	c+A3oZoysjI2uiZe/K71VSU=
X-Google-Smtp-Source: APBJJlHd019CoyCypGiulVzj6NCOiOfzkSWrETKAuTfVD3XhhcYEgNfYy/2loWPSYkCuLickws37OA==
X-Received: by 2002:a1c:ed14:0:b0:3fb:4149:b816 with SMTP id l20-20020a1ced14000000b003fb4149b816mr10732743wmh.8.1688992962064;
        Mon, 10 Jul 2023 05:42:42 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e32-20020a5d5960000000b0031432f1528csm11637235wri.45.2023.07.10.05.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:42:41 -0700 (PDT)
Message-ID: <0d6d0c57-c1e3-6761-9ecd-48176b4b6d4c@gmail.com>
Date: Mon, 10 Jul 2023 14:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 3/3] mtd: rawnand: rockchip: add skipbbt option
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <08f694df-4c1d-f059-43fd-f1aee678062c@gmail.com>
Content-Language: en-US
In-Reply-To: <08f694df-4c1d-f059-43fd-f1aee678062c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_054243_622772_4C310B95 
X-CRM114-Status: GOOD (  12.92  )
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

On Rockchip SoCs the first boot stages are written on NAND
with help of manufacturer software that uses a different format
then the MTD framework. Skip the automatic BBT scan with the
NAND_SKIP_BBTSCAN option so that the original content is unchanged
during the driver probe.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.
With these options the user has the "freedom of choice" by neutral
access mode to read and write in whatever format is needed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V4:
  Reduce subject size

Changes V3:
  Change prefixes

Changed V2:
  reword

---

I'm aware that the maintainer finds it "awful",
but it's absolute necessary to:
1: read/write boot blocks in user space without touching original content
2: format a NAND for MTD either with built in or external driver module

So we keep it include in this serie.
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 5a04680342c3..fcda4c760ffa 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -188,6 +188,10 @@ struct rk_nfc {
 	unsigned long assigned_cs;
 };

+static int skipbbt;
+module_param(skipbbt, int, 0644);
+MODULE_PARM_DESC(skipbbt, "Skip BBT scan if data on the NAND chip is not in MTD format.");
+
 static inline struct rk_nfc_nand_chip *rk_nfc_to_rknand(struct nand_chip *chip)
 {
 	return container_of(chip, struct rk_nfc_nand_chip, chip);
@@ -1153,6 +1157,9 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,

 	nand_set_controller_data(chip, nfc);

+	if (skipbbt)
+		chip->options |= NAND_SKIP_BBTSCAN | NAND_NO_BBM_QUIRK;
+
 	chip->options |= NAND_USES_DMA | NAND_NO_SUBPAGE_WRITE;
 	chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;

--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
