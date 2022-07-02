Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D53CCA47B
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDevnHAX5bt3zOlP2BDXie01BB/L8A64lDhXF2zdoEU=; b=oHRXxBALnr+A8m
	vOGMbeQGvWOTtca1SdazS8asl/0U+7YIMIoIWvSOlJVHf4e90TtOlyPAKuNm3EezN5oI6yKMQr1y+
	WXM5AMJrJLp2bkC9whlTTzBlraym5fgw3zKDz5RIDqywxwdt7uLbxyeaCbueWotj9L7irEvMHvYku
	7KWDjkHgwtXETaeIxxvIvpT3ZV0S/OW8SQqfDAZn/fSq9Rvgq5uAcgXneo/Hgapzbro167lbBfRek
	I1TeM9D2xPx/ISpLqdGZSlrMR9J3Vja75v+tb9P2Z7P2j+YfdVvD4mC/HWZQvnaGCj2iKIIcd9xoH
	TBC0mzj/U5FSV6lJA/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIL-00C99C-VC; Sat, 02 Jul 2022 23:12:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIA-00C91E-Ve
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o9so7120435edt.12
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jieKz72cmVh5R8qYrLL4foPrJEJnRnBgZYhz6Rx/tnM=;
        b=frQ1Qol83oss+lv4GeZejx5ahE9NUdxPRX7bykNoHAmP4yH9SlRkF8V0VDWBwvJ0BA
         7n4Ck6HDdgQTsfE5uCN5BYfHbI9+YmmiiBPbTGGFY5EqBz7Ln+zmA2sjdOKzZGKEdDTN
         mg+iGjc9VzHsOvEwdNX5gou53MqdHNbsRwL6DL+ihsBxTMGll5CrKR0TmaC8FeQOhp7i
         K9jdBZkvJpSzKJM3T2j+lXjhCrssEjR6BvPyhL64OIWGiwod7aLBwEp+TWYWF+/pKMTG
         RywinF2Q9cQjR3saZBvz2fb/qnRDeEgxDfHOSN4ch7t/+3zYmA/RR+9/9kgEy4yEgB4C
         fMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jieKz72cmVh5R8qYrLL4foPrJEJnRnBgZYhz6Rx/tnM=;
        b=Ocdqw5n5J/Xfhp6gCcmJjElCh2Te2pEMzcCa5fqarrW+qK31Z+sf7A8A7WmrgjCM43
         gSDEtrcRi+BEk9vxNWtbML9hDRcEsyGoAt1RW8UXwy/DTDhlpm0a0K8FEYh6EqzL/4sg
         IPNx50UFIb0d3AgT7EgWhAtD8j7Lvl7WfCZhW57e2nBF744y+nrozniwTiHRRnWUeKiD
         GF9Tv9oZXv9R7+9wozyuQsIxaY/Uubd9FPJBbfxnCY/FiMEJ6tFinhBZNVJsLpj3epOW
         A24rUPgmCUIrN6gO9oS0MPFM9Zr53oR1tsw5T68QaFwRXVLkTfI/fhhANURS6AWgoijN
         S/Dg==
X-Gm-Message-State: AJIora81kUgsg1zWMDVpTN8XrKN3tULb3MCDk37/YaKowtrrjmh62BNd
	ia4bstVzb6vQ3igCAkGmEncr6AohA7I=
X-Google-Smtp-Source: AGRyM1u9Fq2VuzmmIzRNy0ZkprnEdbdp2bP9FPBBwB2JuLApMZEyuznyiXVqsHVJm3iOg6OSo5/iZg==
X-Received: by 2002:a50:ef12:0:b0:435:81f3:a93a with SMTP id m18-20020a50ef12000000b0043581f3a93amr27300326eds.80.1656803564739;
        Sat, 02 Jul 2022 16:12:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:44 -0700 (PDT)
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
Subject: [PATCH v3 5/8] mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
Date: Sun,  3 Jul 2022 01:12:24 +0200
Message-Id: <20220702231227.1579176-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161247_060502_BA551E51 
X-CRM114-Status: GOOD (  10.49  )
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

NAND_DATA_IFACE_CHECK_ONLY is already defined in
include/linux/mtd/rawnand.h which is also included by the driver. Drop
the re-definition from the intel-nand-controller driver.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 056835fd4562..3df16d5ecae8 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -100,8 +100,6 @@
 
 #define HSNAND_ECC_OFFSET	0x008
 
-#define NAND_DATA_IFACE_CHECK_ONLY	-1
-
 #define MAX_CS	2
 
 #define USEC_PER_SEC	1000000L
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
