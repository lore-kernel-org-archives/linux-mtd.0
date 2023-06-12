Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E5AC7EE2F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGvU3aihVQOBeKJI4vP62s94xpxggAEL9BO56i3LaVo=; b=Onklho3bnTtY6C
	G5ebJkQQOXhW500mJ7SyQqFBSq+IFASOFCOVXy5AgrLwoAlToUuwvgY5yUm82Bjr8TOJudiPfPrx4
	NAfwMDC/8BGL5YEb58i0mi/DbF7Lbpi9Eoqe4g5hexsD9mdhMXWmwnAK5cUL74DJBBog29MqCHAP1
	McpmyZaLnNo3qWfrg07ETPPAv+ZU0ba1bob1H/xxB8OkaDoZBD2kltctR04cBatLOr8t8IAdo+vsv
	kofkJyEfFT5GdMl0gnu6E01bNKS+nH4YMcpIQFthGnGObB/TNQ/ut+FJoWjscSBcNvmiFK3N9Gv6e
	0qFk9MPhIY0V/GY/FZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j55-004P19-0I;
	Mon, 12 Jun 2023 15:03:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j51-004OwZ-2T;
	Mon, 12 Jun 2023 15:03:41 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so6215586a12.3;
        Mon, 12 Jun 2023 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582217; x=1689174217;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3hduzuBSaxb22Mp/MQNps6D7J398rtVmcYbSbMQMqAA=;
        b=HZE9ePUeklvDjtpKtqnpLU8kERqxtrhLujkNuviMPAZFzdqmLPnnCpV1xlQ9EVPlXf
         PKZSesP0sKydEdNv6wGB+Ie4WoJRqF11sSX1En2KgXThWdt+9wyOoiaT+lqlcT0iMAnh
         e8Jj26C3s1nB3+JTDTuPyuymr3YxsKiLp7B5MNoZ+GfdAhG52TG6zSeR8Rmis90/jE/g
         jb42By6+iJymx0yBgXE7xa08LuLMnKnLguCQ5NDozgQiTsiwH+N5HoPUcJDulP1PZa1D
         WCIrRh5xLqWjdgfn5BWCYTIbQ/Qzt7+0TXcWZn0TaRrGszi2wVO0B9i95DNip++shVNN
         moQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582217; x=1689174217;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hduzuBSaxb22Mp/MQNps6D7J398rtVmcYbSbMQMqAA=;
        b=FDZnmNUZQpnZeFxmShujhNRyDbp6PpxF1qOEnYpFMCDNQrJ2H7ptOi6GnjS8gB2eQN
         WlfFPcvi76S5SVz1C5DuH4+I+S1RLc+72l1dGjCrAJsyD7WEiQYxY32GztNoQ2kSHNMy
         AfDrVnkjdIQgmkIaYH6i2kKut1TQTaIUwfZrwdrV4U3drYnZtUwuhUD7aiflSMx+HvtF
         7+A9H5rIsHfV+Vn0dvdDOXOpm9FQdMHIKwjLAAy32HNBS4oH3w88TjCpTs/mwohkpLFY
         yPthb2sQSaK8wnGhQQ4ppUn+5BTmOtFrw18hvkXZUuO+W29+ZkfuduiLIWIOnZZRcqfW
         DUgw==
X-Gm-Message-State: AC+VfDwDG+CYFi1Lqnh7dUapy0BqBtJlhgxfqCvYyQprTbs7JpPlyKVD
	NACqh8cIkHF29T3pA5ngPrA=
X-Google-Smtp-Source: ACHHUZ6fqgTKr/hRQnzqwp3paah/caYkP5AtFmnGC+A7mYwkejgfibrJFYryYqFC788qdUmdp0M56Q==
X-Received: by 2002:a05:6402:8c1:b0:514:9e07:f33f with SMTP id d1-20020a05640208c100b005149e07f33fmr4779364edz.20.1686582216923;
        Mon, 12 Jun 2023 08:03:36 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id c13-20020aa7c74d000000b0051823c1a10bsm3454421eds.54.2023.06.12.08.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:03:36 -0700 (PDT)
Message-ID: <86aaf385-3c0a-21d9-46fe-f84ee26efbc6@gmail.com>
Date: Mon, 12 Jun 2023 17:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 4/5] mtd: nand: raw: add basic sandisk manufacturer ops
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Content-Language: en-US
In-Reply-To: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080339_813140_DA85FB4A 
X-CRM114-Status: GOOD (  14.37  )
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

Add basic Sandisk manufacturer ops support to get
SDTNQGAMA timing data with the nand_get_sdr_timings()
function.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Limited to one chip model for now.
In need for someone with better knowledge of the Sandisk product
range to expand and improve. Documentation is rare to find.
---
 drivers/mtd/nand/raw/Makefile       |  1 +
 drivers/mtd/nand/raw/internals.h    |  1 +
 drivers/mtd/nand/raw/nand_ids.c     |  2 +-
 drivers/mtd/nand/raw/nand_sandisk.c | 26 ++++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/raw/nand_sandisk.c

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 917cdfb81..d93e861d8 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -67,5 +67,6 @@ nand-objs += nand_esmt.o
 nand-objs += nand_hynix.o
 nand-objs += nand_macronix.o
 nand-objs += nand_micron.o
+nand-objs += nand_sandisk.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 7016e0f38..e9932da18 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -73,6 +73,7 @@ extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
+extern const struct nand_manufacturer_ops sandisk_nand_manuf_ops;
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;

 /* MLC pairing schemes */
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index dacc5529b..1a89ed796 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -188,7 +188,7 @@ static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
 	{NAND_MFR_NATIONAL, "National"},
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
-	{NAND_MFR_SANDISK, "SanDisk"},
+	{NAND_MFR_SANDISK, "SanDisk", &sandisk_nand_manuf_ops},
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_WINBOND, "Winbond"},
diff --git a/drivers/mtd/nand/raw/nand_sandisk.c b/drivers/mtd/nand/raw/nand_sandisk.c
new file mode 100644
index 000000000..7c66e4187
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_sandisk.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "internals.h"
+
+static int
+sdtnqgama_choose_interface_config(struct nand_chip *chip,
+				  struct nand_interface_config *iface)
+{
+	onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, 0);
+
+	return nand_choose_best_sdr_timings(chip, iface, NULL);
+}
+
+static int sandisk_nand_init(struct nand_chip *chip)
+{
+	if (!strncmp("SDTNQGAMA", chip->parameters.model,
+		     sizeof("SDTNQGAMA") - 1))
+		chip->ops.choose_interface_config =
+			&sdtnqgama_choose_interface_config;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops sandisk_nand_manuf_ops = {
+	.init = sandisk_nand_init,
+};
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
