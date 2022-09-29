Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DAFC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Sep 2022 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Rp8RHalV1TyruCoHGCefpTn3e8TA1lgxZ/c8t6DnFw=; b=qLNcGPNSTqkcpV
	sGjf/Rsv8xsCRMxwp9mRCR5vqw/f+1u6PfJQjKQuBHGgsUWzreTnHRO2tZiRy8UT2UdIktOOuRK2U
	LtPblz8sAp+ISe8E80jnUmNw0f1MuMrMD8fEAUmghtUDSlH+SP1AtCUysx70fwIP5YH8viNbA3fJD
	SiK1iUbq+g2Sq1I89vuFuiX+h1nUNEKdONqjDRylGtwmuFGzWqxGts41pKArMSd0DZ3dp4LB5mP46
	nFjrY8Krycr5r2NWVuETB8uhAUuGRjMSMNuplVTc1wYYJs2gFDSw8rLLSy3arod/D4wsH0vM/LUlO
	pw9+SCTZqAKBP1+4N5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsmd-0031Jt-65; Thu, 29 Sep 2022 12:36:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odskl-0030Oc-Gr
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2022 12:35:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m3so1741751eda.12
        for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2022 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=G1eJs3Mljaulp10lM3s9KZwUJhSiD5Z54QoCFft9nj0=;
        b=QjlvRE6HJ+8CONd62XKDkJ/YO+eolaQgiqltwxHKFo55/Sn56h5/VJVJsVTfyNXPo/
         VpHg5bIlPfbFcPbx7tiVYP4w/SxBbyP8/L+TBnn28aD/wkwxId9Ndxz4lbSIqivrz1wG
         KeBXVklYXhyTTHZCjMIghKCDJISc0R4H2dP/Q/d4CJIWgUzDhrXJehlxPCJiNB9nKPUy
         00z0h7tJ3Bs93OlpkQ6PsiMZfrSTJxYtwfPGwDGawvgIOkp+VOLilccvdAB0SCM6RGD5
         ESBqJjqzMPPiPmuHj5FTt/9vPN2FW70qWJRQD+/PshqhyJEh15thqc59WBK3d7atlBm9
         +Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=G1eJs3Mljaulp10lM3s9KZwUJhSiD5Z54QoCFft9nj0=;
        b=emOgZ6w/ehuSE+vD9ULbZI3XFXAYNPHajTkXXqRMu6vxQ8+DkjuV4qMcaxXOtp3mXG
         JBU8LMAazd/zHcH2lZ6PFrrUuMzNndb7/ryeKfwWHmWrvyyjW4NiifACib8Ngq893iNs
         2OVAVCx8zl2RuleF/+ZxrqIgRBeMmzcOvmFReGIbuS6viXom4Gi+QHfuFTxdlXsTYpze
         EmEcwxL4BCFEkFvowrpRXN75dAGLJ+MHOI5VyHEhawtotl++9EPrJbF7ESA5VW16GQJ8
         Moo2cNnHqVFkzZ5j6fwZb9f5NCUfQvtCw4b9G5R2lXlH+bZAcr+p/gaG5rGR5hgg4C4z
         5Ytw==
X-Gm-Message-State: ACrzQf16caHpcbHCwYQxKeFj2iicbLIPTFow40VJgk9i9j3GSOIOnJIg
	TZXagSV7qJkXSth2g0BPhWE=
X-Google-Smtp-Source: AMsMyM7ML/RyoD8oE90RBpNhAwROpSdGmW5R4R5Fdokjsu3StGo9bExGOLdoXvYBGAVhLFTZ6A9SAQ==
X-Received: by 2002:a05:6402:2549:b0:452:8292:b610 with SMTP id l9-20020a056402254900b004528292b610mr3142739edb.199.1664454898120;
        Thu, 29 Sep 2022 05:34:58 -0700 (PDT)
Received: from felia.fritz.box (200116b826e11200b190ebfd45660ea6.dip.versatel-1u1.de. [2001:16b8:26e1:1200:b190:ebfd:4566:ea6])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b00787cb1de743sm763435eja.38.2022.09.29.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 05:34:57 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry for MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
Date: Thu, 29 Sep 2022 14:34:31 +0200
Message-Id: <20220929123431.23180-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_053459_617247_F6026DCA 
X-CRM114-Status: GOOD (  11.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
converts amlogic,meson-nand.txt to yaml, but misses to adjust its reference
in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in MESON NAND CONTROLLER DRIVER FOR AMLOGIC
SOCS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e14e37c7c734..95caae5c2bb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13360,7 +13360,7 @@ MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
 F:	drivers/mtd/nand/raw/meson_*
 
 MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
