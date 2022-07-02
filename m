Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D8C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPAjG9485Pu+0On0ncfvB1HIiFddheryMVl9Vyi9jNc=; b=EfwAhruY47OaiA
	HkzcZaEUUst9tbnnOxzAXnQDUONJFbyome4543/wnJZANRIA/xjRugERJa3KDhDAqWhFz4wPs9oPv
	TBQVEUCso3Mql24ZV/Ife4W1rzyUObpSKTPUk2iXVYPmrEsOYwWWX3ohKyccA7+I8nqyBJzHErK3e
	BUsJTwTLCjj4kDqeQiMY53nW0JK1m6wsb52PXajmdKwl3ZTUP6MKZvkr+ltaXpYfHC3VjIOXi2HiC
	2ZRf9QBbG8isoZkY56VA1Ti5upDPduiM43uCMb9PxgvOKUyo3sz3yxZ8Z+20vCyox9e04cKhEqq+l
	xwQ/d5uvNJs1bT5eS+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mII-00C96O-06; Sat, 02 Jul 2022 23:12:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIA-00C90b-2H
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id k20so7112042edj.13
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DTaZ/9+DRnLhDSj0DOV2C+IIhpHfbKqhWacVmkOB7BY=;
        b=WAh2tNKM0lRNF8UUHv4MaNqhtwRvQubb5330+ZE3Y2mae4IDnvy7linhak+uRdzDuL
         fCnOAUVX4274xrZMmLilupQ2Z1rmJFGjBYLiBQuiV9sbuW+yfo2nF+9jAAxwZXGyXUiQ
         mGhlewzANw11TbAAokn2DtuU28zUdub/OmqISYRxdUQf6mqAhq+SYB95psXCfnNz2VE7
         4Tyts//6DcsvsM8fyorliVDkfQeEi5iRyVm6igDR6m4vjEA3BeXscWuVYmO7FPmZ+vez
         b23iT/69ltBEHcXQWzut2ARq0z9pXxhcECQ/3Fn6s+6qdba7bMl67X5ssgJdadDriehm
         g9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTaZ/9+DRnLhDSj0DOV2C+IIhpHfbKqhWacVmkOB7BY=;
        b=3SHj7CklJ3ogFWBwgwBvxHQ+vrMyVY/28plK3tKDaIt89RfH+2ZiMYokb7bf5yVF9V
         he7fq35ta7o9r2FmRYBqu5Y541TzhKghB+LHLI3XqPSEydJSlZFlRnbgm83Z0vxZ3/dV
         nxU5GJXpCYfgVmYg2pUpUev3D0d7h1KI180FTef02fWz3MHqaCBdRZDHS11CcRu274+X
         HfNFAV6GzAz1zBoPY/L7upAjLCqkkoG2060TwlvOdJHrId87KolBnNDYT+B/UPm6mESV
         AdmEA2IW4OGzyDCx5zgmEaO7u3OhLheCdOIKpPmK8Mye1V1LH41/psKuxQldFcQ7Z4pt
         Iglw==
X-Gm-Message-State: AJIora90lO5Q1/XUXmW56RIx+5GjqMdg7CGPSbgc/tZfS92rlcQZQooh
	ILse0r59/sZYOOS0pMUXU2WiOPnD3ow=
X-Google-Smtp-Source: AGRyM1t0QOBr9erpyf7jmjLE/oOiBlNlr/q0V5DW66YddsJao3mqr3ZWGBJYQtA1HfnkFRmj1rVVmA==
X-Received: by 2002:a05:6402:1e95:b0:437:ce7f:e17a with SMTP id f21-20020a0564021e9500b00437ce7fe17amr27711429edf.169.1656803563812;
        Sat, 02 Jul 2022 16:12:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:43 -0700 (PDT)
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
Subject: [PATCH v3 4/8] mtd: rawnand: intel: Remove undocumented compatible string
Date: Sun,  3 Jul 2022 01:12:23 +0200
Message-Id: <20220702231227.1579176-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161246_155269_65A9A2D8 
X-CRM114-Status: GOOD (  14.35  )
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

The "intel,nand-controller" compatible string is not part of the
dt-bindings. Remove it from the driver as it's not supposed to be used
without any documentation for it.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 3df3f32423f9..056835fd4562 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -723,7 +723,6 @@ static int ebu_nand_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id ebu_nand_match[] = {
-	{ .compatible = "intel,nand-controller" },
 	{ .compatible = "intel,lgm-ebunand" },
 	{}
 };
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
