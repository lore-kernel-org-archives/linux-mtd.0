Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA33C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjHybY/i2TAQjLPrLFteQINTk1B9xMuPHTxLz4XbIDo=; b=rUQRxa+ta0CZ5p
	Rc0+l4r7pHiZV50Bsqn/Mfup0LSb1+iDZba/kidpVRt/en2kdGDD5UC5utNkOiXRk8DpIKB3eO1/5
	5/jNp5q23lA0gE78RzZYa25Nuz+Rznyl1U04J/6RPdcYt6XeqMlM9iCFTNtRnay4fGdxsDUPiXzi4
	iGxzgXJ+5/IK4rahnokekmLOavFmNaOwMdcWN60ftPGmR4g0lgRC70SUXSL3e27ToR7sgLI6hH5KK
	RjLxGw4k70h33p3+QUHf8aks29Md3opF8LzHqrBIrdYDzTVEbAmvrpqO1zDpl092Kn+DKkJcYnhc9
	hlFJ7OVBwOwlfSN7FY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0BwJ-00BYyO-IP; Thu, 23 Dec 2021 00:26:35 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Bsc-00BXi3-LK
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:47 +0000
Received: by mail-pg1-x532.google.com with SMTP id k4so3395426pgb.8
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yy0dKp0QqTKRDDm+DzMuRMtHniPa8Xch60bze9ubGZk=;
 b=oiAcd/kTGkJc+314HWZKIChHC7+TT85eKuknVt2Qrl8fgIWwHb4HZLCou6kEMJC6dG
 kCTzfc6Kr6EpxJUfSYWl+8oE5OK2D8o+Nm0h7ql13+5TALigNZZeRApbq6regGDtSBBL
 YaszKtin8mMpaoJs9XguPE/UvrytJjv8GgNjG9pBw4Jmx+pzb4VTjgG+Y5dRnd5HYq0c
 fGXZPnXlyu3Wvifus+DHtjdqcGdKRPoWQeaChpnd6vrzgUjzwnnXkQpk3RubZWUdFXWn
 PwsLixClBkBVFpKtFCUFvDm4y249kx/F933+WTZWnCerksgh8P81xdJLIajz8hIJhlno
 fI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yy0dKp0QqTKRDDm+DzMuRMtHniPa8Xch60bze9ubGZk=;
 b=dRdkS/sTtOX+SEO2vMdqN9BWXubhshB1bZKsdndKNFNk169tJPsiViM8vPGuWQ4lx1
 aLJNnUCl8ZSiPehFfuDsPz3rzHs7jZnMe2kascTYVoDlsSKffpvHs/n/mhbNrZWd1KL5
 hhqeH5fnQchhTgBMdcq2E+F8TPbCmQ6RkRiyOogmWer9/wSNpdZSepIggKntVfPqd7GZ
 5Yj5y62+ILOV+rDpyBwhokzQVubrDYrxzYjfPE/wDM+2lfxPYKQxikI9esB8790B3i7Y
 +J9FYUAuBPHk0AKwf3AZuWwpGyI+agr4lispGdayylBBs5IlkiLNBU09O6mG1JAmgRo8
 2CgQ==
X-Gm-Message-State: AOAM533+o/1iK4Xv/S317k3/egs5r9PFbSC6MdmuSnbKEJAEcA/AuIIQ
 0aabY3bPEok3wAVyH5dq8VdzYZovpD8=
X-Google-Smtp-Source: ABdhPJyEsAVWK4JWRbMSF91GaDuMQ+6a9Y/KzuHDIAlj+nme3qw1QD74G5FuOcQ6YCrjDXd27UQEEw==
X-Received: by 2002:a05:6a00:18a9:b0:4ba:d14d:88 with SMTP id
 x41-20020a056a0018a900b004bad14d0088mr158299pfh.59.1640218965581; 
 Wed, 22 Dec 2021 16:22:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:45 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH 8/9] mtd: rawnand: brcmnand: BCMA controller uses command
 shift of 0
Date: Wed, 22 Dec 2021 16:22:24 -0800
Message-Id: <20211223002225.3738385-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162246_723561_6C21731E 
X-CRM114-Status: GOOD (  13.02  )
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

For some odd and unexplained reason the BCMA NAND controller, albeit
revision 3.4 uses a command shift of 0 instead of 24 as it should be,
quirk that.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 2f2aaa554282..2dfb94c4cc93 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -908,6 +908,12 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 
 static inline int brcmnand_cmd_shift(struct brcmnand_controller *ctrl)
 {
+	/* Kludge for the BCMA-based NAND controller which does not actually
+	 * shift the command
+	 */
+	if (ctrl->nand_version == 0x0304 && brcmnand_soc_has_ops(ctrl->soc))
+		return 0;
+
 	if (ctrl->nand_version < 0x0602)
 		return 24;
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
