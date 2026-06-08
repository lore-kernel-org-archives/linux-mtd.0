Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3ADCD8C92
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 04:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IorQeMIGE1KG1YydH32xqnkGFM6GvcWsqHfzhRaaOdM=; b=g6lMXIGhNJoNX5
	9Gwat8kKbFnuHLj5/kEfumWdNZC7gwrxlCqSHSOp8qoz9bEchPL8nENYOuTFaqUHqAIMPKmwTR9Js
	tAzvA0u9g3r72anrM012rk/Ls5q4EQ+9tdEhdMK4sHoj2zORO3KxIgDE/CU0eAoi82hHxgXkxjw1A
	d4jA9vPLLQkjZFbAPzwyc+3db0CXiCCAZmvHLB0cjS1/ACV5xpVH63lMXzhVqwHWRf4u5o1Q3M664
	5ZBONxV1CkmXVWIQXOxhAcotRcCPRrPhiDI47Vo5R25GO2fM5gqd9bZA+MsS5Xfp0jXmPVla/8/mF
	8r8mo95wetG6OHggg+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRGC-00000002mt0-1n5a;
	Mon, 08 Jun 2026 04:06:48 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRG8-00000002mse-3QCT
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 04:06:45 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51780bbc560so35636391cf.0
        for <linux-mtd@lists.infradead.org>; Sun, 07 Jun 2026 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780891604; x=1781496404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y69ayd5+81/FuoX9JwW+2OYBy2TwAbLRbHarkaIwFyQ=;
        b=dN6tvp1gBhnJFE054rVKv4fWTg6Oqsg9Cv1K/Im3bNXmhBY5RSD6Z9eg4ec4rhrwpm
         IAY8XJCYe9os3yJShMPbpwE5+gv4+MGa7SxGWX7111ZFOvRx1qu4Xiv1BWS3ShS/AnpB
         99uvrGajLncU+hFrCvGHDk0BfhdLvRtp/GhOfIAFTXqvyuMFTvRrronjuCFFrz3cYEEw
         TLVcBJkixRlkCZxzDhBbMxpitLSw+ZURh1NI0LE1G7U3rGJfH4yrUyfuAVXaxycGhadj
         Fzm98ayLgOlgC6/vuklGFHNPIcgh2mHJKSrXwWmehQi3wNFoYTKdB0+hOrFgU4Q+zCkR
         CISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780891604; x=1781496404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y69ayd5+81/FuoX9JwW+2OYBy2TwAbLRbHarkaIwFyQ=;
        b=LZCEGr1BtckSiz859eA7n+Skp0aiBD6p482T7//DE4Sjf+17iCTTxpc7BNdO9vK3qL
         RGBep5iV1Z3D8rC4fiM5PL3uRydQ8VF/qsnxomSVIVZsuezCmyO+vAvPCgIe90S0CFny
         OcdQ2PLkXi3n02OAbMSClOErc66KSNjDszihKMmOcGrDDyKDLrxIioh+N9vVcWEx9e36
         h97gmDwbXdqX5mZley4TQbExKPTY8siyzcrtjqTBFhNwCO50MiNylW+gbln34NnH7aGx
         Q7HUpzml3XuBszy2bP1Ri5CvgldTT6cjZDFd9wuY1TKCHQCvXmO8lJkTqz+qLcPSQgDP
         rvCg==
X-Gm-Message-State: AOJu0Yw3M1/lUria04KsO920xVgcb6/dJe7pltvNrT9RpCEd0K+0ZQ5/
	tx1FnCTNjal/efPh9Aav7kPD7irG9czmlXr9wxS2zLH59WqwRhcWeKGTqQgrcClgDms=
X-Gm-Gg: Acq92OFF+FAyXhBtztvZwKZ1AEJkahOGvNahyDUuULcEng5s9pkogXx3Mg22in5/9CQ
	NDyNYXtl21E7HlmpsFhfbbny78vuHKMr6l5sbx9uDNO5wnWsGCkJZfxKLuLNhm1A96Q3MDdUq98
	qwCnpVErtMzi8PZvFoeLbQRI9ZN86euqE8uzidb0CEorsnNbH+vIfwJPF0sGduNQrBj45iMovD7
	FdRqPIVXft3oLZhrWM2PvR8D4YBWX+bZ8ceay6cE0c2NJizUwBnIFtGcP+1vjykH0DgSyZfWdPM
	NueMee+efx3T7O2fwEp6HKR3KJCqKV4eR6N/T4be34DwU3F+/MiyLD3o9hheOm3XBKFzwkgoca1
	zzGIXVkgxRFhDCNwQtFUOQTAvoy3tic9WZiw4wBr1VimL7WDO0GOm/VcDUWufY9Hd8UqTdHJA+s
	cq5hIBvz4h77cSSvOph/Ypihz3LXtJrT+rcex5DwUsVok8kRy3xA8=
X-Received: by 2002:a05:622a:4d88:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51798708bd9mr137621361cf.16.1780891603597;
        Sun, 07 Jun 2026 21:06:43 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c4d7absm139938971cf.11.2026.06.07.21.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:06:43 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] mtd: ubi: Fix rollback for explicit UBI device numbers
Date: Mon,  8 Jun 2026 00:06:39 -0400
Message-ID: <20260608040639.2616638-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_210644_860583_2AF24390 
X-CRM114-Status: GOOD (  13.15  )
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

ubi_init_attach() rolls back module initialization failures by scanning
ubi_devices[0..i-1], where i is the mtd= parameter index. That assumes
the parameter index matches the UBI device number.

That assumption is not true when mtd= specifies an explicit ubi_num. A
successfully attached device can be stored at a higher ubi_devices[]
slot, and a later failure can miss it during rollback.

Scan the full ubi_devices[] array and detach by the actual array index,
matching the way UBI devices are stored.

Fixes: 83ff59a06663 ("UBI: support ubi_num on mtd.ubi command line")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/mtd/ubi/build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 674ad87809df..90c5c83d90e3 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1317,10 +1317,10 @@ static int __init ubi_init_attach(void)
 	return 0;
 
 out_detach:
-	for (k = 0; k < i; k++)
+	for (k = 0; k < UBI_MAX_DEVICES; k++)
 		if (ubi_devices[k]) {
 			mutex_lock(&ubi_devices_mutex);
-			ubi_detach_mtd_dev(ubi_devices[k]->ubi_num, 1);
+			ubi_detach_mtd_dev(k, 1);
 			mutex_unlock(&ubi_devices_mutex);
 		}
 	return err;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
