Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49706C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G30DZ4wVoY+Jxk+CDdXVyrnuofi3YVY/Ou1YZsLOAmM=; b=p1+L5wT+6WSf1E
	xjaVClOjI+JUjGD28oO898d/qPPmhqH81ZB7eNjN5rCtnNu3csZGAE2B8Rbf1MO/ahbSNDce86LqY
	g8K8KtIpgELd+jCk1SCkUa0xTbtKiGffsXFUNaKvvfPA0ciihg14yGm3kuta18Q7DDYDo5ybIp9cY
	eF0gW+AvTsSWzLe9qAfATStZvaHJxoHDL+Af/atN0o8WZ/JMT0FH6JPnhwykjO6bSm8O7BaTZ1ds5
	25tb/BMdaZ9GFNgJjJrX0jLlCuaedg+Rwew9Us2lsAY3wqm9vTD7OHX7iFjUUBr90VZFetbYyWiY3
	k9H1g1mJhMEJvNF8IDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne5xf-00BE8M-LG; Tue, 12 Apr 2022 02:08:55 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne5xd-00BE7p-2h
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:08:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so1167883pjn.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=A9IM1YoZMYeZsqiXebTOSXRaO7Y40jkfHoWw9tH/GgQ=;
 b=p45NeFlRokfGIHAwDw3LrGme7BVQhmjbIeG4y03mfHnm/z+ixqJvLyUjzqJHf3/Y8a
 8EFs5M1RhlWjFnHKLyVjOGPhVr+eZy2tYYkhgFRlfe78s2H2RBVXbOTHwffPFmdqwQ9C
 J5e1igcw7vyWXbAN425N/SrwOS8U+b6YcvDNnCWw1lNAXH2ObhjFHUhepJ+XvMyazSyL
 BpuHWWCKZLPRXwsfICsIIe8ZGsutHOEmmOE8I4ceNVWkeEpocWZvAFLDRG997GyWYA2F
 aZ/s+/5dx/WlQMiNn4Oqa2WqCxCmrtpXBvH/Py7UfxUclf10MvXYNCE+Qd4HtTMZQue1
 cMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=A9IM1YoZMYeZsqiXebTOSXRaO7Y40jkfHoWw9tH/GgQ=;
 b=EIoRUDEfhx0u6wAHEhT9adjnAZ2u9drFQt68pxY+27aFZIzYffX228qgs/2lhW679N
 V6KVzF+Z/X9+wYhDk+Se7O3O4da0dlhoEdFBBIU6xsIZFJLa2hd3C5cAHEpnhAAqgWRa
 i3iduQuFRLlw9fvpnYjakfEf7xqtUggCHYRRqHR1+fN8khPPkeGkbUpFvpHTSxlJYXOw
 IF8/tx617WL09vMeh9HenOV1AbjwfYp/jWF80Yb/RXneut9tch0d0vqy+A0fsROSo6/u
 V6pD1dmA/xpUyubKPE052SB0rztyQ9mtFrplLfMym2JEZdPwLr7OEw/t3RWVJXc3Qm91
 NHKw==
X-Gm-Message-State: AOAM532CsRaM62ZuY2omNF+QLzpdNTEP8w6GCtagUdgAOOqzJv2eEzHO
 1BLXxxz3WL2SV7VlCE0d4Ec=
X-Google-Smtp-Source: ABdhPJxaljyawvYpKPw3HWG2wZ8Dt5AeofevjTAIjQcY6iTvRHkUM8O9mJwfjlRhlw3oI7MtnYdfSA==
X-Received: by 2002:a17:902:6ac7:b0:150:24d6:b2ee with SMTP id
 i7-20020a1709026ac700b0015024d6b2eemr35515745plt.168.1649729329898; 
 Mon, 11 Apr 2022 19:08:49 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 u10-20020a6540ca000000b0037445e95c93sm903361pgp.15.2022.04.11.19.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:08:49 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miaoqian Lin <linmq006@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Date: Tue, 12 Apr 2022 02:08:30 +0000
Message-Id: <20220412020834.7161-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_190853_179156_32C9AA1B 
X-CRM114-Status: GOOD (  12.34  )
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

wait_for_completion_timeout() returns unsigned long not int.
It returns 0 if timed out, and positive if completed.
The check for <= 0 is ambiguous and should be == 0 here
indicating timeout which is the only error case.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index b85b9c6fcc42..4f326a2dd170 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -385,6 +385,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	dma_cookie_t cookie;
 	uint32_t reg;
 	int ret;
+	unsigned long time_left;
 
 	if (dir == DMA_FROM_DEVICE) {
 		chan = flctl->chan_fifo0_rx;
@@ -425,13 +426,14 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		goto out;
 	}
 
-	ret =
+	time_left =
 	wait_for_completion_timeout(&flctl->dma_complete,
 				msecs_to_jiffies(3000));
 
-	if (ret <= 0) {
+	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
+		ret = -ETIMEDOUT;
 	}
 
 out:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
