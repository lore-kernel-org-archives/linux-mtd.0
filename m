Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC27DECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 05:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtbgY6BcCrc9m00+fsC8+SXFWzdDEhKxAncRJAXheMY=; b=uOl4WRZJsRyyCl
	fTV/5XA9p9T2bAXd0lgG8fg7kwxf+vUspi3aYwUXrHDpIuv2aju6Gz6fVoqJoG3yZK35N72lWvTin
	MBMYNleyaXpg7Jlswyfh5p0rwio7IkUQUos1nMjbhAt25qQ6vjQVmorWbPC4v7tzH4AMdIxMwaJlq
	3HEUGhLh+7bVSyWxqzMB8pKf+DDUPHnlqgvzHwzTNWTc1bk0a65sR0vzL2RALpnMfETcM39TSFCia
	gTa3W/pLtuPfApBK4RT8CXddP8gLJjL8OMwCi3XyQ1lg4uG7Zj50+4I8Vc9ncKVUgECUQwb1GYvSu
	GcvwYbLVlDS4ulVTW1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpF-003oTG-O3; Wed, 31 Aug 2022 04:59:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpC-003oQ3-NQ
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 04:59:39 +0000
Received: by mail-pg1-x531.google.com with SMTP id r69so12553875pgr.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 21:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=se26G5Twn6NpUdQ1UaezBapVsMs9341KbLDpuQ7TjmU=;
        b=pR6T3Me3wfupcOF6c7yrSqP5Yyb+M39JtVRIVYpKvSf/Sre3yfZyL5tVoun9JXUFYY
         X5IBrPE2ybUjgWHxvvcRNkVDPgF829KiS+3EKedqCfPQPt1tKF1eh06rONf76afg3bdK
         06UF8KhBLOfX9udP+yakEzJ/hJm2T7cxYVxGbROa0kBMG3vHmm/g+CYiuDULWRzVQYEA
         W7unJ4QpgrUhBGSHUOWWb4sBB9mkEwL7O1ktP//3LBy6I3TLlMUpXCXH30YIqgvYy8P9
         VRU78yfRI/bxTcXKcWBNqerZBFDi0RjhC+LxUR0MH8cfkK5/if5W7mjbCMzv3kmvluqJ
         aLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=se26G5Twn6NpUdQ1UaezBapVsMs9341KbLDpuQ7TjmU=;
        b=r9osGiJXuRI5FsH0S6f3ldwv/wE/JtNPvoX1xipLQW8VG/AO81eGKmHHu5HwlDLXIO
         +gydKwvyMHao7eqj/8WaNm/Mz/+LPQSk4jXeYSpPkIE4EH21vFqYQHuNEQYYif3o3EEI
         N97KLUXjfnxg5BjRPFs0Crv+TtYT+IJkTLQ/mWs3bhpFXNrRYpnwMmHnOxy0Tsd4uLZk
         stNnNSpARTF6/o7Lbforj+RVtKDl0wEWE1nw08jLtTLf6ErkgZ3S4EwmPgbfGJFNT0ta
         GlaSB1gu+4jJv2CaLcT95NYzCJhdZCLfZ/fWXh35Zyrtb0uGYphpZ7oyaP6FPMHGRFCs
         gUlQ==
X-Gm-Message-State: ACgBeo1jcWvt5E/megWManphfDwzi1nQdC3pFrLcEHhi5iQ6LMpk30E+
	sUNxHViNOcG3BeDvPLVod03Z1rs39eU=
X-Google-Smtp-Source: AA6agR4jUtEqOLVLrcSh28htcRV5hLSQJalzKZbnQkRD9oeBMbheIb9LmnsPKVxHcxMlj5DWxKnRVg==
X-Received: by 2002:a63:dd08:0:b0:42b:ce4e:75fd with SMTP id t8-20020a63dd08000000b0042bce4e75fdmr14121354pgg.498.1661921975965;
        Tue, 30 Aug 2022 21:59:35 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b005367ef405e0sm10178519pfq.85.2022.08.30.21.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:59:35 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 2/4] mtd: spi-nor: spansion: Remove NO_SFDP_FLAGS from s28hs512t info
Date: Wed, 31 Aug 2022 13:59:04 +0900
Message-Id: <12e468992f5d0cbd474abff3203100cc8163d4e5.1661915569.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_215938_782490_54B783A0 
X-CRM114-Status: GOOD (  12.06  )
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

Read, Page Program, and Sector Erase settings are done in SFDP so we can
remove NO_SFDP_FLAGS from s28hs512t info. Since the default_init() is no
longer called after removing NO_SFDP_FLAGS, the initialization in the
default_init() is moved to late_init().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 676ffd6d12ec..babf88171902 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -281,12 +281,6 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 			cypress_nor_octal_dtr_dis(nor);
 }
 
-static void s28hs512t_default_init(struct spi_nor *nor)
-{
-	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
-	nor->params->writesize = 16;
-}
-
 static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
@@ -322,10 +316,16 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 	return cypress_nor_set_page_size(nor);
 }
 
+static void s28hs512t_late_init(struct spi_nor *nor)
+{
+	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
+	nor->params->writesize = 16;
+}
+
 static const struct spi_nor_fixups s28hs512t_fixups = {
-	.default_init = s28hs512t_default_init,
 	.post_sfdp = s28hs512t_post_sfdp_fixup,
 	.post_bfpt = s28hs512t_post_bfpt_fixup,
+	.late_init = s28hs512t_late_init,
 };
 
 static int
@@ -460,8 +460,7 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
-			      SPI_NOR_OCTAL_DTR_PP)
+		PARSE_SFDP
 		.fixups = &s28hs512t_fixups,
 	},
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
