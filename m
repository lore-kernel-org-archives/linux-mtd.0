Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBrKLpiU5AM6KCXAJ6NYQfCt19pdK+0CVXDuEr5jh+g=; b=WR2hVIyVGHaSua
	8vuAtvj0xL6z3Umj9VOI6xzSzYxnDGYfPpsG08bk/vyHSwc3I3ymfxUn+UkNqhkYdZYMXjLKiUDs9
	LFT8bDyGogjHFtmzmmdoU950xOhPwWXjRIIfgRkl9GgyUbSI9+nWrk7IgYv6eEmuarxER4na/ZFZm
	c5oTIUB1/jH5HKuot0hOBGynOLcmWE5Q/k9BbCzcTlMeQ+Mz7AzTN5TrDM0DmUbNsmoznsmUpL4pp
	PgCz3t+4S67+RIjZnGbs5uTvAjZbhweSQGYgDz/4q/y1JCLECc+UlytdFx24oaz+O2GVTUzw1RzY1
	g93LgLXUfcX9fEm0pATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwjTe-009Fm1-DA; Mon, 13 Dec 2021 11:26:42 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwjTb-009Fl5-9j
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 11:26:40 +0000
Received: by mail-qv1-xf36.google.com with SMTP id p3so14039812qvj.9
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eD6ckxYOFOb+e8Paz6iMpOBDcRBstNtUogT+wtDanIo=;
 b=YVi7qSMIHAmqR1ziLS+oBD5WujjcwCE+4G3u70/XFkRKtNHL1rmXZEJ6FmKJIFdu02
 G30X1MLGRJxf++u4dAJreJ13q94+xdZEYlYccDmaClkGWseDYg+fD8ts0JDIIZZviucL
 HTEGgM4gQ9sUu8VL3lLv5/VSo1ZfHkDMvbT93gKgQ3pR7xt6x/KZENec/ExMhE0iQFJB
 dwHUJjwa4xgINdLxvcqAJDMxWo1U3CHNleqylIUhodRUv3EH7OHwJQ1IY4STphC/7ly/
 PmlpYT3LHnBODRFdhuqfX5iQhOFE/nphgwagOdAsYTHu7ewT0wzFaDV3M2h2sQVHCnOx
 3RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eD6ckxYOFOb+e8Paz6iMpOBDcRBstNtUogT+wtDanIo=;
 b=D9CLMv3JOy7bPOrHLMpRieqHim6xhh3mLC8+0eU8Do597ZfuOSr9gRsNB/GQs/kVlB
 gJf+rsBnH5wFDkw+D4C9p4JddZCWps9fWBDTZ+RkCn+ih7dWnzyaxa82YG0/u6qT2X/O
 k5yEnubXkfHlTrHuBI8Pmnzb8mdtRyUvxNoMHMuiXq8Rc+MfRhD4DZP0QdUfkZcusAie
 SXXwGd6K7/k4/I7T8bcYTuQs7V7wZZxwe4EvoZoJwpPK0Siv6JcW6Yc3X49YKVIjqPTB
 NbztxL5ujer9zq7ZuVL4R2Zr1XWJngrTCowemqjtJ17wOoo/3sv2bFRWuSax2oO+og88
 suTQ==
X-Gm-Message-State: AOAM533VAWQSAsz/71X//mKqSls8LF6MlqeeEcPwXYunQJAThfwEs9s5
 YTNgEQUtOJw/LbuzXpFafiQ0ogsQYyw=
X-Google-Smtp-Source: ABdhPJyz8j/K09DZ5hzBHAp/+joA+v2M/C1JywjSTePQKxvwDTIJHTjCcK3ctzU6nAsJmW04ncaugA==
X-Received: by 2002:a05:6214:5094:: with SMTP id
 kk20mr40535508qvb.71.1639394798344; 
 Mon, 13 Dec 2021 03:26:38 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id i14sm5900465qko.9.2021.12.13.03.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:26:37 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: cgel.zte@gmail.com, chi.minghao@zte.com.cn, han.xu@nxp.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 richard@nod.at, vigneshr@ti.com, zealci@zte.com.cn
Subject: [PATCH v3 nand-next] mtd: rawnand: gpmi: remove unneeded variable
Date: Mon, 13 Dec 2021 11:26:27 +0000
Message-Id: <20211213112627.436745-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213101519.25f4e2e1@xps13>
References: <20211213101519.25f4e2e1@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_032639_378235_28B13B95 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return status directly from function called.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
change since v1: mtd/nand:remove unneeded variable
             v2: mtd: rawnand: gpmi: remove unneeded variable
             v3: move the update log here
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 10cc71829dcb..ab9d1099bafa 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1425,7 +1425,6 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int ret;
 
 	dev_dbg(this->dev, "ecc write page.\n");
 
@@ -1445,9 +1444,7 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 				    this->auxiliary_virt);
 	}
 
-	ret = nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
-
-	return ret;
+	return nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
 }
 
 /*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
