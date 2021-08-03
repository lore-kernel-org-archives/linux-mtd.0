Return-Path: <SRS0=Irml=M2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A61C4338F
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1451560EFD
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1451560EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ko8mAamhvKygiLi1KlEArhhhebmKiY6xAmjGDKprAwk=; b=1tCHmM8j5MD0QS
	5ZHM5NKw0sTJY2Gnocuvvi+/kKeM7REyIsQI7xq0y0cToHGtsmm8OC2vK92Y4cmpZfmOlq/fpvzff
	QHl1fd5XjSIh3UGoiToNBg+ikJZtEylK9GVW0IZt811rOlH0v4vg8nRsxPFegnjJ9kmgFQEDhVz6B
	vr9OVH57SKmfaktV2KOB9dG190psEMOGlIQfI5/x1Qti7FRcEE8yz7T4AwnlxZaKOCU5PAhXMy/jC
	Evr/siXHEQds3QWON+AqMyFhg+9COgRkvBJUgTWQvF9V1d34Vp0EZ1da14LW+iOGUZ0YeQDR6oOnv
	gLZCfBGdXvtxN83Zy8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAvTe-003El6-TQ; Tue, 03 Aug 2021 14:33:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAvTZ-003EjK-Kt
 for linux-mtd@lists.infradead.org; Tue, 03 Aug 2021 14:33:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j2so25486164wrx.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Aug 2021 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=JnAQe55H44yXqV5MeskQcrSV5sTQ09ofmwohDfaVvNE=;
 b=m+MsmA+Uiw/gmtc06liX/OUsVOiuS+XchqPunoyHhgJajiRN+//GRLz/OjwvNns2G5
 r2uwdnWf5Lbz/65G3+absCGaJ7spQVyfq8I4tPE0ViP1aNZhhkkt/3LStROtshhil638
 Br1LxstnbRDhlf6YKQ6v4l52LqFf5LULlEy3eakUYc60BfH+4L9qDV29l91eGqrKGNMb
 zxQBLlLcyOahfHJw9k5G1ptSZ9WVGfnDjGv64urKcMmV5mypgRs6F11Y0wVJKpnGwd/5
 RoS8/lu9TRQlrKdyacly8nEYF9dZ2yjqg+Nuh3YulVMwv50wF8Uvq+VlcfieCEoJ7Z91
 wDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=JnAQe55H44yXqV5MeskQcrSV5sTQ09ofmwohDfaVvNE=;
 b=MQq0duioUB/Z2micLypfoKFwNqW89tKXZt1ENvAaf1D4u3Od/ClzRM/EF17zwmEqnE
 b4TuuUxF+z2H2GVY0JGjXo8jKRCPTZobdCW4RGXNt43O2rK7PAtRvkJomXgRbGYG4YEZ
 2i+BRFpwHZEZJJrSbbThNCBViXePFBcplA0VwzZOS/lIQGqiuc8annz8gszy7ZAvg5gB
 S1K7SFfqAZLPSIz7SGQMO4InAqvDONvzpXYRTgNi1JYiHY6hlmXL3Oe8ipSSoDdMlrog
 Z72ss1wtlBzbvAir6HnEfvzPwV5Yqubk5xn45IvBxGbr5W5hwJOayRtaVzMWRVX5T+HS
 NFGA==
X-Gm-Message-State: AOAM533uSEbEDBSanLNWA1w2YJv3N/I8dfp8Lh9ZwcOeXsAcwxh4rvsm
 EXriyfYoLK0pc8JThi0yY4I=
X-Google-Smtp-Source: ABdhPJzCZKhuklX67exUNipVKVEcV65KTpbeavr9kerSSJOMmZzYj/v6c8QxiLmK/zwvhAfXXU6xLQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr23357581wrn.362.1628001178742; 
 Tue, 03 Aug 2021 07:32:58 -0700 (PDT)
Received: from ubuntu ([155.133.219.250])
 by smtp.gmail.com with ESMTPSA id v6sm14699059wru.50.2021.08.03.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:32:58 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:32:56 +0200
From: Daniel Kestrel <kestrelseventyfour@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Kestrel <kestrelseventyfour@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: xway: No hardcoded ECC engine for Micron Chips
Message-ID: <20210803143256.GA5209@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_073301_733445_61AB59F4 
X-CRM114-Status: GOOD (  18.97  )
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

Some lantiq xway devices use Micron NAND chips, which use on-die ECC.
The hardcoded setting of NAND_ECC_ENGINE_TYPE_SOFT makes them unusable,
because the software ECC on top of the hardware ECC produces errors for
every read and write access, not to mention that booting does not work,
because the boot loader uses the correct ECC when trying to load the
kernel and stops loading on severe ECC errors.
Removing the hardcoded settings would break a number of devices that
work with those settings.
Adding a DTB property was considered, but did not work, because devices
of the same type but from different manufacture dates have different
NAND chips and as such it is not possible to determine the NAND chip
in advance or device specific.

Signed-off-by: Daniel Kestrel <kestrelseventyfour@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 26751976e502..20cb5ce2f3b0 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -10,6 +10,7 @@
 #include <linux/of_platform.h>
 
 #include <lantiq_soc.h>
+#include "internals.h"
 
 /* nand registers */
 #define EBU_ADDSEL1		0x24
@@ -148,7 +149,8 @@ static void xway_write_buf(struct nand_chip *chip, const u_char *buf, int len)
 
 static int xway_attach_chip(struct nand_chip *chip)
 {
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	if (chip->manufacturer.desc->id != NAND_MFR_MICRON)
+		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
 
 	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
 		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
