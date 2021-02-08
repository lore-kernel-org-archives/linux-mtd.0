Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34301C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 07:55:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC54F64E78
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 07:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC54F64E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0aBgeL0qQXFC2TbFRsFCo5EZtQbD/fTLTppDpWivY4=; b=v1mKJz0Q96OMltZIKHHIDdDr9
	x9EWVXSk96IN9NxjfFY+b4QB7cEN63mfy2jyFC17BNaw3NFIcE6v6xJsuxUepRHsa9YOMVx+WyOOh
	kTKlpXq4EBbCLA/C+f782pNqXuXeRDYa5x3MKB09M7usXLaJvKU8bkz10KljCi3KQMEGK0OTsuRJX
	rQg4cpArSG4xpgPDhl9cYrMHhAvEIi2mbXBVyCrbr24UYBaFeRZiZclu+gWNVKnYwxl1J9kRqKD1K
	60JwpFjSydqV4H8u6x7qW7Q5yZdBZaVI/bFQn3CxM7Rh4bh4oxFjE1Vn1+pAmALFjTRRE0fmkJhk8
	s5bV9JG7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l91Nk-0005v5-GA; Mon, 08 Feb 2021 07:54:52 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l91Nh-0005uF-Cz
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 07:54:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id a16so7371919plh.8
 for <linux-mtd@lists.infradead.org>; Sun, 07 Feb 2021 23:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wS78z2DGzZxHA2vV2iZc+QYltD449KPzaCG39iIKaiw=;
 b=OkRR34sqJBhvubTylHIh6sfTyq+rOJmudymq3iITTzzuwTfAcOqOHA3QA6UfoiyoGV
 xHz431jIXhJzaRIC+/j433ndm1OwxSd0anzS+hh5sneJ6EoD/P7HwwmjX1DMCSLff6H3
 yP75OQjOm7LhfRV0JzXPFtcuyGXs/BDEoP7NMALtLoAKt47Sax7Cixp9HYE09pW2hMaz
 MijZR1HJiObHxT8q0KpBFLeNXZunjdCqDoGQoiHLlpau/vUQxt5S5qvvK6Ei1oBk0kck
 CZwDMZtojYJqZKAEDMPX73lgyNbYn0vk9XdoOIRrFs3/ria3UrQrUw71mvSWAC1V0nU8
 Z0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wS78z2DGzZxHA2vV2iZc+QYltD449KPzaCG39iIKaiw=;
 b=JR3purpQkRmFChFVmfTfPetewCvVyKRb454ZP2ZE0gFAA+G/k1Vf80q+iop+1/+DuY
 ssh6+lB9c3ZAfqtlJW+e3YB9Xc8rO+Tt0df2PqZawrense3zu4i+kh7SxymjWUnC8Bij
 p/bJ6hqjMfeHNlxFCvI+MMuOFKhOEyUklnWYLCJvl85S/Gu/WXxTAoXHRFKlailaNV1T
 apdL2sksROU+rfYy1ci8SqI36IeJjSJcJecg+5Dsl3fFd7QjETAy4O0j/kDg0FGpIF5e
 BK437lcVmqxgefRwcIJowwZnjIMK07sqWd+a3wqCbqsGbi6S1lU0ADy9tLXqu7k7u1f3
 To2w==
X-Gm-Message-State: AOAM530pYiep3oZplu+ZU5J+KId3X6AuxEwJBzeW3G+i4rRm9LTLITfW
 2LW0sm4/VeL2oxn+6Vgx/6I=
X-Google-Smtp-Source: ABdhPJzaSEUP15ABwV/65132kurRfLzuYpf1pIoVwXe7KXDzHN2cJK9ECwD4cIJsOIPhwzVXnMVRuQ==
X-Received: by 2002:a17:90a:4297:: with SMTP id
 p23mr10594796pjg.213.1612770885436; 
 Sun, 07 Feb 2021 23:54:45 -0800 (PST)
Received: from an990131127 (42-72-181-6.emome-ip.hinet.net. [42.72.181.6])
 by smtp.gmail.com with ESMTPSA id b24sm15106613pjp.12.2021.02.07.23.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 23:54:44 -0800 (PST)
From: Shuhao Mai <shuhao.mai.1990@gmail.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: winbond: Add support for w25q512jvq
Date: Mon,  8 Feb 2021 15:53:03 +0800
Message-Id: <20210208075303.4200-1-shuhao.mai.1990@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
References: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_025449_527437_98F8DE87 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Shuhao Mai <shuhao.mai.1990@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for w25q512jvq. This is of the same series chip with
w25q256jv, which is already supported, but with size doubled and
different JEDEC ID.

Tested on Intel whitley platform with dd from/to the flash for
read/write respectly, and flash_erase for erasing the flash.

Signed-off-by: Shuhao Mai <shuhao.mai.1990@gmail.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e5dfa786f190..b1d307fcdf9c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -97,6 +97,8 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
+			     SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 };
 
 /**
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
