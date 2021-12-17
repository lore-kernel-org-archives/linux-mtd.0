Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ORql5rwQpGl5Zgf0vvH9QsydlCIGjC19HiiB1KGzR8=; b=Qzqn4Kh0TfOCvl
	/X6djUpCPhBvBiCzYjs95hXrRvHfAjRFSRtkQdE9WBi2oaI3ltA9/mxjHBjUss92vGizB4tzTicM/
	AawnOJjjcbSAxu6C+FuEg49XUTALrt+m4tUbkbnHjANWtEkTrRZw1z+K51Ld01y7H/sdAY3YKntNc
	peNWDDfPkMNPHjTHqOBrvkw6Lv8PvUCMJB7ioLoXKB+oP0GrnV2gz8SOx/wmj5lGfYrc3XHVCmHNx
	cm5PTSvut2uLxVLWYO5bEQcy4isjoBGcdOJu6jfCCpMQIxRezNPKTzvI6gPULj21b9mixB+2Djc9S
	9zbn4F9xYYNs3L5/TaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myG0T-00B9IZ-Ko; Fri, 17 Dec 2021 16:22:54 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFaH-00B1T4-Ku
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:55:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id g14so9453901edb.8
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pCjPRfOE0ubdFKl1wroT8qZZ50obE6oG33Hg0XGM304=;
 b=GT7+ilekxSTS5dFNut7H6CiyF+s4HbxoxVMua+CSJLqW+fj8bgZ36r7laPoZzjTKVO
 /0ZsMq4hFsukMP44g8xdxWMyJ84oewN+Pqh49hxeu7h8jm/FApB0Emn134cSqYtoUf+Z
 PIca9tyY8AbC86kn8KUvHaTa5CHPRYorzTGPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pCjPRfOE0ubdFKl1wroT8qZZ50obE6oG33Hg0XGM304=;
 b=kGU78fKfSGybAEDzgk+NAPBAPHzqeYJ4gRBwTa+weVfa5jUih4xTtRFzrSWOcYR2j5
 601wPlZ/El2+U7q9XoEWI5QdvnbPTLvusYExqIAf2/0fNew6cljRetBm7k+hXpSaDkpZ
 IgZfclJ/i3ER62/nM0iVeL23KjqQEhIcLl0h5wsfqpBFQDM2FflyHip9zBhHpZ1Rnkp3
 z1gOGEVlalZUxKRgegb9bi02J1KL+ltbVAUVjpYrZwZSy5PBckLjITG4gy+V/n93J3qp
 Vli9dzkKP1ZWzHkfLSuLD5JqnZyQTBDWz8lASgIFGpDgI9HuKHzg8i7khzfrV5ojE2PE
 VDnw==
X-Gm-Message-State: AOAM532qf3ewY+Gs8H7yssFpXSVCvSk3ORIbSh7wirBZVAFKAxLiChyl
 OR8u09+0TYzU7AXD6+IdNltqkw==
X-Google-Smtp-Source: ABdhPJwq9J1DWJQ8i4E0EiIDgAaMs/AhSQZcnTaJ1HC6l3gTEc24oM/ESRtaqP0UYIOPboiOppaXCg==
X-Received: by 2002:a17:907:1c81:: with SMTP id
 nb1mr3125382ejc.9.1639756548087; 
 Fri, 17 Dec 2021 07:55:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
 by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:55:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH 2/4] mtd: rawnand: gpmi: support fast edo timings for mx28
Date: Fri, 17 Dec 2021 16:55:10 +0100
Message-Id: <20211217155512.1877408-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075549_734426_F596FF05 
X-CRM114-Status: GOOD (  13.01  )
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

In the mx28 reference manual there are examples of how to set up the
GPMI controller to support fast NAND EDO timing.

This patch has been tested on a 2048/64 byte NAND (Micron MT29F2G08ABAEAH4).
Kernel mtd tests:
 - mtd_nandbiterrs
 - mtd_nandecctest
 - mtd_oobtest
 - mtd_pagetest
 - mtd_readtest
 - mtd_speedtest
 - mtd_stresstest
 - mtd_subpagetest
 - mtd_torturetest [cycles_count = 10000000]
run without errors.

Before this patch (mode 0):
---------------------------
eraseblock write speed is 2098 KiB/s
eraseblock read speed is 2680 KiB/s
page write speed is 1689 KiB/s
page read speed is 2522 KiB/s
2 page write speed is 1899 KiB/s
2 page read speed is 2579 KiB/s
erase speed is 128000 KiB/s
2x multi-block erase speed is 73142 KiB/s
4x multi-block erase speed is 204800 KiB/s
8x multi-block erase speed is 256000 KiB/s
16x multi-block erase speed is 256000 KiB/s
32x multi-block erase speed is 256000 KiB/s
64x multi-block erase speed is 256000 KiB/s

After this patch (mode 5):
-------------------------
eraseblock write speed is 3390 KiB/s
eraseblock read speed is 5688 KiB/s
page write speed is 2680 KiB/s
page read speed is 4876 KiB/s
2 page write speed is 2909 KiB/s
2 page read speed is 5224 KiB/s
erase speed is 170666 KiB/s
2x multi-block erase speed is 204800 KiB/s
4x multi-block erase speed is 256000 KiB/s
8x multi-block erase speed is 256000 KiB/s
16x multi-block erase speed is 256000 KiB/s
32x multi-block erase speed is 256000 KiB/s
64x multi-block erase speed is 256000 KiB/s

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
---

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 65bcd1c548d2..fd935e893daf 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -772,8 +772,8 @@ static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
-	/* Only MX6 GPMI controller can reach EDO timings */
-	if (sdr->tRC_min <= 25000 && !GPMI_IS_MX6(this))
+	/* Only MX28/MX6 GPMI controller can reach EDO timings */
+	if (sdr->tRC_min <= 25000 && !GPMI_IS_MX28(this) && !GPMI_IS_MX6(this))
 		return -ENOTSUPP;
 
 	/* Stop here if this call was just a check */
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
