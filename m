Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294C1C43334
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rfPOWvYbLh18f/q1TpeJHRCruc37q5QnmIMny1jDyw=; b=JfzABgInIRYRBK
	yy1ONn+A7WkiErg0sq4gEkW2aSKERedvWONL20ux5g13qNPhIu8HHySO8Sj8gPH0f32pKRGSlNaXf
	PLscmm9MTU5Qb6NMp+piqrcG+s5YCxwvDbrwNSfOmcXrpXDeupFsIvE1q0sxyXM2Y2/cZlco/bOPS
	tqaNqhI5s2IpepkW4VDb6l+pE+0mnowUvX7DAJ2PTRzuxujqSh0jTu3K3d76bIEKLCHJzs0YyvQZF
	QX20FjwPmQCB8/+CclXxzaUSNBRctZzFyvEfwyMzTUBA/wj2ZyvJUgccSMDTxKlQhFL4hMt8Q/4/s
	ipvBPkwo+RRYChYiq/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIN-00C9AQ-Sg; Sat, 02 Jul 2022 23:12:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIB-00C91W-Pt
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id ej4so7143182edb.7
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rMFZHu8PDqwv5GHr5nbOBzzYZPK8b+QduZ22FxBHIqo=;
        b=LmMpJrmNWZeApdyuPOlUWyIq9xXhlUREoibq6Q6UO4K47VwQD2ByfL3DwZaGQ/eLhc
         c9Z46PM3h5NxHMI9zEfHzJnVJ/vacO204dRiwGf+p2amHUA6KBExp/Wcnzu1Jy+CDdQ0
         k4nDLlsNF+zX36ib8uD8VTPTtbQ6afyLNe2KKOj18X8enaCOmeVmW+r7FnACrAqn5/mF
         fgRhbJqjwYiwW8V+JQC1wwL3A8VZ1qIsZKomzgx0c61lkRxPyvB6zFZsQ80b1WOF/In0
         JFMoKYaBxH1tR035v25j5whzFlj78ce0onBkRMDFht5l6aQ9Tqkf6e7XedQDZH63ve+S
         ieew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMFZHu8PDqwv5GHr5nbOBzzYZPK8b+QduZ22FxBHIqo=;
        b=q3kCbANkSxopB0XgrwmPOKTW3cgfVp0a+/WEwmQRfUA24X0AHxkxhHKsd+ZnrZurvE
         hZv7H8IyXmv5aq/R4jCikOuSHehbyYHP+PzTVbaPPkC1wXO7UqiTnaOS4tmaNM1RLlV9
         y+x962pRPDWk7XDnbBamOH4qFPHimURIMJX/JTqbP24hYN5UOAtsRP6vLjZPpcdvN5vR
         26T+0orz/Hr7BrjodJ3mHZpPJB0RPVbejlDhdUf2PkeYSWV84rIvzU5A3qQA3Y7d/cct
         0fH0i9hudDtYAUrvhIF/fObqfaP3QQheMw2ZQmm2HcxzFMikAY4S23k8XAF1rpj95/Yo
         ML/g==
X-Gm-Message-State: AJIora9cce06AMv9zTnUUGHxkC5AQ+WbwJX5tevkY2Z8fj5AVQ71Shb0
	WH9r1C/RXLvFZL01LVBZ/VpEEcqEdcY=
X-Google-Smtp-Source: AGRyM1sD+hNDqYlRurGJOdDI4Xbt/HFa3sI09ympVXFOMrrvtT1B020+WOXrAo26KkGChwkm/eBf0Q==
X-Received: by 2002:a05:6402:2549:b0:437:788d:b363 with SMTP id l9-20020a056402254900b00437788db363mr27528790edb.406.1656803565559;
        Sat, 02 Jul 2022 16:12:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 6/8] mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
Date: Sun,  3 Jul 2022 01:12:25 +0200
Message-Id: <20220702231227.1579176-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161247_860526_DC29DB70 
X-CRM114-Status: GOOD (  11.62  )
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

The nand_pa member from struct ebu_nand_cs is only written but never
read. Remove this unused and unneeded member.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 3df16d5ecae8..de4f85368988 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -106,7 +106,6 @@
 
 struct ebu_nand_cs {
 	void __iomem *chipaddr;
-	dma_addr_t nand_pa;
 	u32 addr_sel;
 };
 
@@ -626,7 +625,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs[cs].chipaddr = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr))
 		return PTR_ERR(ebu_host->cs[cs].chipaddr);
-	ebu_host->cs[cs].nand_pa = res->start;
 
 	ebu_host->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ebu_host->clk))
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
