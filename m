Return-Path: <SRS0=i5Q8=2I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCD1C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 14:06:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC8E218AC
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 14:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRNu/7pi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uITl8L2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC8E218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v9c9poukRV9lw1JSlYP3Qay4mFEfRKLK3LtTgpORqZc=; b=uRN
	u/7piz9OYb9+GUYTgFIV4J1a6ThIPg7Od/dxy8py8rX1mRqAl2e352GSea0HZVrchG32l9NfA6v6C
	UtMDRhVRvm9s9bi0KPx57G3tIiuWaHyJ2nAl+s/w64Nuv0G9Wyy0VX//gm1vvzdRxMoyGr8XldBaE
	98/SZV/FJdVxLTnhUZzyf0BbhmqUgICiawOBujbD/YVsz16EFR2ahusGy3r7HtcYjCEOG12mKSWUR
	Blq4enEwXsJbXkTwH+ygFMyW+Y0FmoSLx398lnhQ14n+f+xJYhCjclUsPmafmBU7oJodCabXMKZO+
	8qFsvNmV1dOnhPzFRc55WmtN25mHFNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihZxo-0002To-SJ; Wed, 18 Dec 2019 14:06:08 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihZxl-0002T4-5l
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2019 14:06:06 +0000
Received: by mail-pf1-x444.google.com with SMTP id 2so1256518pfg.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2019 06:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uV9emrToibtOtd5PwV/QEFcEzg9NL+MgjlxJNDfEwL8=;
 b=uITl8L2DI2aQzJ+jPqTvx8o8bwqNQZzz9yIa4VZjCTy+rXuhJrdcGB1QhFsFeE4FHo
 baT1rLDOQFTP8OkqTuMQt5Dnt+YP8Ec6aMKejz98kCxMvnF3131NU0iinnzWy0DkxhaE
 fGa+cv4Pur7BJUWH1N+e4BJOtoPCEQ1yjl1qkzdKzf0MrvpLYDDBLftlbUKdAL9/Kxwk
 l+8XYK9FGO4htM4pYNRIrA04KYP57bmN2hsc8sLM0jRPU08lOyBYZSG+MWUcyIfHPk+D
 H4vmxLeBaO2Hxcsl98RVzGTz3/HaJeVdTE6/rEPHKTzK1owIWlRTetcxaJK8EWfw3RLp
 sK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uV9emrToibtOtd5PwV/QEFcEzg9NL+MgjlxJNDfEwL8=;
 b=J7w3nIDcnSBewCuvHAtdc8CxBMXbXVlfBqQxwb6XTAqtEBz4r+oQFw0ra6GwsUOh9w
 NlLBZJBlg0dxyE/OZXXVacOlgpnZTGOzW39YC/DgNJw9nOe+PR4T+/efps6O/ym7G8i5
 qG1OUXi8iIIRVaNrG43sOHH3rH0hwHvMe/Y9CeOtJOYPg6iXiWlVn6RxpbB5mN5iZ5sj
 L25y8eAMD/xxGUwfeC6UWpQ3/Lk4afcz28c72dfpdrK66ZqobuZ/F9vhPIDM5hTXSag5
 3HGXEbbNClNR1//Hasbn9joZAR3HyI2laTIBRtNMCElEn4h3Kz9C3F63IXb9pc7RI/Hl
 6YgA==
X-Gm-Message-State: APjAAAXJt3NOmU0yI45eHF10QIYT8fBmjQSgEtuHTpmz617l2Q94WRn4
 ZgN1j6Xy0id74NGCbH/6MC8=
X-Google-Smtp-Source: APXvYqxT3fV1Ulz6tWQI94WjXrxyeWnJup5zp9HZWBIwe5+NxmlgbPxwEI2ELaAbchfM5lx2V5LeRw==
X-Received: by 2002:a63:e30a:: with SMTP id f10mr3188567pgh.331.1576677964039; 
 Wed, 18 Dec 2019 06:06:04 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
 by smtp.gmail.com with ESMTPSA id o184sm3390758pgo.62.2019.12.18.06.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:06:03 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: maps: pcmciamtd: fix possible sleep-in-atomic-context
 bugs in pcmciamtd_set_vpp()
Date: Wed, 18 Dec 2019 22:05:52 +0800
Message-Id: <20191218140552.12249-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_060605_214843_947FFA6C 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 309: 
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306: 
	_raw_spin_lock_irqsave in pcmciamtd_set_vpp

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 312: 
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306: 
	_raw_spin_lock_irqsave in pcmciamtd_set_vp

mutex_lock() may sleep at runtime.

To fix these bugs, pcmcia_fixup_vpp() is called without holding the
spinlock.

These bugs are found by a static analysis tool STCheck written by
myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/mtd/maps/pcmciamtd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 70bb403f69f7..d2cd1708aa49 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -301,17 +301,23 @@ static void pcmciamtd_set_vpp(struct map_info *map, int on)
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	struct pcmcia_device *link = dev->p_dev;
 	unsigned long flags;
+	int fixup_flag = 0;
 
 	pr_debug("dev = %p on = %d vpp = %d\n\n", dev, on, dev->vpp);
 	spin_lock_irqsave(&pcmcia_vpp_lock, flags);
 	if (on) {
 		if (++pcmcia_vpp_refcnt == 1)   /* first nested 'on' */
-			pcmcia_fixup_vpp(link, dev->vpp);
+			fixup_flag = 1;
 	} else {
 		if (--pcmcia_vpp_refcnt == 0)   /* last nested 'off' */
-			pcmcia_fixup_vpp(link, 0);
+			fixup_flag = 2;
 	}
 	spin_unlock_irqrestore(&pcmcia_vpp_lock, flags);
+
+	if (fixup_flag == 1)
+		pcmcia_fixup_vpp(link, dev->vpp);
+	else if (fixup_flag == 2)
+		pcmcia_fixup_vpp(link, 0);
 }
 
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
