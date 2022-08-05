Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D35C25B07
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Aug 2022 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bErJ3Rhfi5BSqhu442Og1x+DUqGZoAmdmjC2ma8xvI8=; b=LbN9eyGtRRQwiC
	SA+VMWnNtSHMNQj7RaH6KqBYDeexOssNn3hSlBdvOVyUkecEAA78OKGh9TLnYne85H/OYQ/4IT5q0
	Nn02DLkuccY0zMQCyAe0aRMOEvj9KpQkbt9pssKaTaVS0yg/f2J7WwKd0jhZNh2ixSLkq27EEu7pH
	Yaep8SO8WarWQdPNGKSMloFKaskP+BsmnTUvtTZhIEmUdJ3tCEqprZSLgsPBEQHKi11UE+LG8mMbi
	AxgOZ6sfddAkDhRcuGau0NKenwRq8TldFJhhIvcepfDbL/0WLeV66khP4hCiSK//m+WXr4wWpYQvv
	UB+uzOHWjwBiOKFnLrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Wo-00HEpm-Dq; Fri, 05 Aug 2022 17:54:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Wm-00HEoO-ET
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2022 17:54:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id j7so4057058wrh.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=CY7nj4Dbn5hG1eBgbsltcEsXWXjhhaj6B7nXDjf979E=;
        b=J3Zfz+3MyGk5EyyiedXaWblx79/zzFn200lbKGskp7tykjV1usM/FZeJXZm143HN9l
         rtwZUsJtGTQr8tsIsouEGMn1ue8Q0TVXTY2x3ueSOxpRY1WWPXPA73jK4JzG5LhB5GLh
         kLXa+PoUPofh1IpAu6KBJoAoPwjv32RJK8dfEiOokUBGozp7rmt5MnXQ6oC1DPrMZhls
         jKhXAsIBQuiEji1KKITNgB2RBzMq3qT1rP8CRUjlM6l/DuRiGYiTAkNOrNkbg1FPk/af
         NtW7H7EPmDfxNc4QFJlc4tL3WGi0IBO++Umy3dRNt94hPUNI0M+BEfPcvkNFcRnIK7Qy
         UNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=CY7nj4Dbn5hG1eBgbsltcEsXWXjhhaj6B7nXDjf979E=;
        b=nsrgiiPN9C9Zn+7MyoSa7GRDP2OpGisnUYusgN92noluwnYp6x39QrocIRbEVBmSaQ
         pkW865mUa0IszKpwnqYMbV3KjmV/uuf8gl/JKLkl6xrivEbn62I7DoiVLBjkf2q/BnvS
         e/V5Ip8LzkKN9bFudB7lMdFkVYkaDgoqRN07lFLmMq8Ti3HQB/+q3ve08iEDCqitypxZ
         zLysYlmm3esuuHYyehcsokJoTy261sG3iU/A9ggV9tnu3W7OliEzaS+Tush9F/qXdaa+
         cEDURqKnGWi7rwY+YU/f2eO8ludeYBYIcGVqmMb3HT2juABf6TRF1nXURiVZK8OSasJy
         QTRw==
X-Gm-Message-State: ACgBeo3lMZKvoXweB22a9KuKdazUrGZnlLJcl5uuLjKAogHOGihKmJfM
	Kb5iOQaN7zSQZ4azX6pLCu0TFtK51s/3QgvP
X-Google-Smtp-Source: AA6agR7IiagAGZEP+xy/ZTMuCnaTw0jJTWp9G2mTqeewCjcDgMi6F/ihKED6uVAMwi8rYhLR9Eyyjw==
X-Received: by 2002:a05:6000:1689:b0:220:8a04:69f6 with SMTP id y9-20020a056000168900b002208a0469f6mr5280368wrd.357.1659722064238;
        Fri, 05 Aug 2022 10:54:24 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id w8-20020a5d4b48000000b0021e4edba1e5sm4373353wrs.111.2022.08.05.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 10:54:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: devices: docg3: Use correct function names in comment blocks
Date: Fri,  5 Aug 2022 18:54:23 +0100
Message-Id: <20220805175423.2374939-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_105428_522783_1D9477D0 
X-CRM114-Status: GOOD (  13.82  )
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

The incorrect function name is being used in the comment for functions
doc_set_reliable_mode, doc_read_seek and docg3_probe. Correct these
comments.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/devices/docg3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 5b0ae5ddad74..a7bddf80751b 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -300,7 +300,7 @@ static void doc_write_data_area(struct docg3 *docg3, const void *buf, int len)
 }
 
 /**
- * doc_set_data_mode - Sets the flash to normal or reliable data mode
+ * doc_set_reliable_mode - Sets the flash to normal or reliable data mode
  * @docg3: the device
  *
  * The reliable data mode is a bit slower than the fast mode, but less errors
@@ -442,7 +442,7 @@ static void doc_setup_writeaddr_sector(struct docg3 *docg3, int sector, int ofs)
 }
 
 /**
- * doc_seek - Set both flash planes to the specified block, page for reading
+ * doc_read_seek - Set both flash planes to the specified block, page for reading
  * @docg3: the device
  * @block0: the first plane block index
  * @block1: the second plane block index
@@ -1951,7 +1951,7 @@ static int docg3_suspend(struct platform_device *pdev, pm_message_t state)
 }
 
 /**
- * doc_probe - Probe the IO space for a DiskOnChip G3 chip
+ * docg3_probe - Probe the IO space for a DiskOnChip G3 chip
  * @pdev: platform device
  *
  * Probes for a G3 chip at the specified IO space in the platform data
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
