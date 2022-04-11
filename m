Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D74AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 05:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beGvSDTmrB6E5AyWhqShJmpfndJjPLdzBeSzxXpvAW4=; b=jYidhdVbyPvt3t
	ER+QBo9VsOteqhbqcJr2dUp/HkztkzswKeUddL6C8k0kOIzdpXZXEF2xxIMHfS5WzX2zefmIC3v0e
	XIkrPgOZJi9UpgoJdI0YVvQTE36DPUSrRHKk8WKB0zoYPpAjSubMcwcAyumVybUzruuiThWsYScAm
	UESjMnnk+MzJEPWx6cy6AZLusK6VEu/zIwpRTJMvR7c8VbklX6RpRnsHo6vn7+vDffw4ANaA0xcpe
	4UN7AtsOjaVmt5qgWZH+rtnJrZYx4Oto2mfz2b2pmEv/laCq9TMnw3VXe13fFpObBm3ABQAwucSBv
	9Smzu5jmRtsJTkjKDeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndmXC-006jww-PC; Mon, 11 Apr 2022 05:24:18 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndmX5-006jrr-NE
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 05:24:13 +0000
Received: by mail-pg1-x535.google.com with SMTP id 32so11090941pgl.4
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 22:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2AuvAtEZGA7Yu3Lbbc0IGmSlm45XDlOn4kuKKbnx7M=;
 b=M3yf1AK9vjEi0+2JU08n49f2q5xlsr6JsU34rSd5Ojge1dHmuJQseU6eV0voaAimyD
 jpYEJT7n0f1L7mJgsERekR6LshdPLO0cHM9UTtlm/3iQh57TV4baMQqkJnVWgvK7f/GC
 grpTBfHz6qpqsupwcHAuT3VP0v/LpzcA4BLxmoTnM3C788krtHbEMMWiX5n/b/6Pe5z3
 ZharKIsJsdwtNqLtCEJTW8pBrkfec/JDPQE5h8upe+Hjkc6a87iSWOLEUCLh4c/VK/8p
 leyi7uz5D8gPifq8hLLzUrPSzZRxNiXT5lGif/2rfNg9OZS74v74kyV9YH+iKWygPngQ
 Gmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2AuvAtEZGA7Yu3Lbbc0IGmSlm45XDlOn4kuKKbnx7M=;
 b=20P5MI4MfTplJ8wsoRBqNPBBBFJcji2eeqNTQo74liDA1NRor7Tw9txXPmSUuTD920
 mIiUfywiJYjEGQ+dhBIqDy3H/NlmxS9AlScrb6BU8Pwa7535B5wGPRWbLCUf8ySsx/7j
 k9G89oLyvdSUbWQysbtJPdS6/q0WJd6hChPrc9Fdw1iibKoWUPP3tPzG11gcDB8aHnfR
 VQGDyrIEWQCO2I9urdyGL+sDQJfC1r7LxolKow3E4lFn/p03i2hh/R9rQ5L22aRn6Lma
 pDDgFARD52G20ETM7B28lj7T2ODFXqGUkuTyu1DkEG9q9BOcbcoamnBYzfqa4ZjE3g3W
 +LTg==
X-Gm-Message-State: AOAM5314pgtIQigLtjkiA6ULrHWJk/TqWj8nOGhJP8bS4c5t/43wBkh2
 1lPtXvyjnXNkZMmh/Z7UyscHUPx12iU=
X-Google-Smtp-Source: ABdhPJyhrq+vLXeeCpgjClLpCuBBEKljNZehyXVfpHEeQDE7p9tPlk+xZSttN95NilIbmosU4vZFKw==
X-Received: by 2002:a05:6a00:248e:b0:505:a69c:f890 with SMTP id
 c14-20020a056a00248e00b00505a69cf890mr7833792pfv.10.1649654647351; 
 Sun, 10 Apr 2022 22:24:07 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 ne24-20020a17090b375800b001cb62235013sm6064261pjb.5.2022.04.10.22.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 22:24:06 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v10 1/4] mtd: spi-nor: sfdp: Use nor->info->addr_width as
 address width for SMPT parse
Date: Mon, 11 Apr 2022 14:23:22 +0900
Message-Id: <9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
References: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_222411_799130_9B77D66A 
X-CRM114-Status: GOOD (  11.68  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

At the point spi_nor_smpt_addr_width() is called, nor->addr_width is set
to 4 while the S25HS/HL-T boots with 3 byte addressing by default and SMPT
parse cannot be done correctly. To solve this, use nor->info->addr_width
as default and current address width.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
This is an alternative way to fix
https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/

 drivers/mtd/spi-nor/sfdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..9f8897e7fd7c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -652,6 +652,13 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
 	case SMPT_CMD_ADDRESS_LEN_4:
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
+		/*
+		 * Let's assume 'nor->info->addr_width' has the default address
+		 * width and it is currently in use, if available.
+		 */
+		if (nor->info->addr_width)
+			return nor->info->addr_width;
+		fallthrough;
 	default:
 		return nor->addr_width;
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
