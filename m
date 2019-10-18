Return-Path: <SRS0=GZUv=YM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE22CA9EA0
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 00:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 031FA222C5
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 00:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nspnEyGG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baAQReQx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 031FA222C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RYCcMcDB3N8a/0NdcxqrLOYi/9mV0LMISX8ZrTM8HuA=; b=nsp
	nEyGG4gwYxA9+0u2nOo1IaxbGewF2XyTx44HoBQbARKtnpy1pv23PtacwxUjbZsyJ5vtMV6Zf2y8u
	+kisl2vU0P+Fd0QVCLWjVoDtUHl/gK1asXaLx+UUaw/CugUdbbojShslQ5B82o0cJPPrYPRuCDlnk
	rEAdEvDNQFLJij6QVHc1Qgd819T/bgNz16dQYsVDsSQqAsfVqqSKAtTYlu16PFFYBGkZYsNRTHNRz
	tw8NCcBeJ6jAPP7ZkiLRUKBq9NhbdYrWhryURi0y4b6eV1Y0fc7Ws3X0PJW0exZQDIWt3656klUcs
	rxRmqRE7yL7JnF2nmkzuUCkU1FAYg8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLcDj-00040O-V0; Sat, 19 Oct 2019 00:03:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLcDa-0003sr-Gw; Sat, 19 Oct 2019 00:03:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id i16so7757560wmd.3;
 Fri, 18 Oct 2019 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WAd+eoXj8rMBgjdwJQ/n/lojcxhy8TyVDnA3tTrrWOQ=;
 b=baAQReQxk6oaFS2zApSA26y2fVX/yf1YvO270iCIx5N9S2FJn9xbq8S3V/Ixxn86Ji
 MnXzioVccBIzj1yKb7Dp9SOSr/ZQ1RObfnDh2J2LW1jEOtVbxubAw5NXSMTwynu+hlPn
 qNmNaU0n3NA6LI2NhzbQQEggNIjVSk971V5i1DWc7f9kwFwoSqM/SL7kSUl4glHSMMlH
 2ZXoLBqESIwAHEGXrh1E/zJeDqW3RBtgI/iDM3MTiK6rt91d/pBf4jEtZGQuVlGJkF8N
 8WGnPWM/YQv/T5qd0oVbSdyZsjTbH6ksjBiSN2Xa7ZrAWww7+LoHY7NqhH6SGzffH503
 3ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WAd+eoXj8rMBgjdwJQ/n/lojcxhy8TyVDnA3tTrrWOQ=;
 b=r/NGKrmDOMDLPQaf0GrgI5bql3+YCTD/sKwstWO3L/liT/DoVBNkvaXl1a8tp3ZryV
 jBhBsShIP0niY+h2H67jSMkXFLDVfzbxAVERDlizxTB8SzJ8JrRibKCcors4z34TxWvt
 zfwv6UskCOpcRa3AviRAIcBdNiKRDe8f4e62/aYrYA8R+uOYmScJ/720+VvICykszUIs
 nxkokCrEzklm7E8itgNsmKjOss59WMLj4F2/Vp6bwJ/qC1GmKG9RQHEm35PNXHArPnXm
 HIGla2bZrNiq6Ar/tAvXA+3EEzmjcbkFt4hNEKJVzsb91tlMLA7RYZJRwAXjZTzj95mX
 uDBQ==
X-Gm-Message-State: APjAAAUECzktbTAbvQYy7cNxfaM82darmsJ9dULH4wDAPOaD48ARJ5xv
 WHnHz/T2ossN5V2flKyCthWCi1wj
X-Google-Smtp-Source: APXvYqxof3tazM3aejcDp5mrzkrOBHEEWgX3P6zZRV+hbvxON0hRCN69++MGXx6cJSkWf0+D9ku2KA==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr5327041wmo.3.1571443416275; 
 Fri, 18 Oct 2019 17:03:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n3sm7760800wrr.50.2019.10.18.17.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 17:03:35 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: rawnand: brcmnand: Fix sparse warning in has_flash_dma()
Date: Fri, 18 Oct 2019 16:38:44 -0700
Message-Id: <20191018233844.23838-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_170338_586399_DAA40D01 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:BROADCOM STB NAND FLASH DRIVER" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sparse rightfully complained about has_flash_dma():
+drivers/mtd/nand/brcmnand/brcmnand.c:951:40: warning: Using plain integer as NULL pointer [sparse]

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 15ef30b368a5..73f7a0945399 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -909,7 +909,7 @@ static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
 
 static inline bool has_flash_dma(struct brcmnand_controller *ctrl)
 {
-	return ctrl->flash_dma_base;
+	return ctrl->flash_dma_base != NULL;
 }
 
 static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
