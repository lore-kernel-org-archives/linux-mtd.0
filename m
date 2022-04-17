Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8885BC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Apr 2022 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0qbXo9OjD9TfhvVlur1IbYWvhkr7WhAZR6394Gkiyaw=; b=ICwKdwWxcBm9v7
	yBK2mmTaseAutsBIViR3yC3rSem22XzQ/kkSiOlpAme5lsQJhUiNuxAqRmOhTUzpbh2hs02NhT0pe
	wMArCTeX29+bc9CPWpI4XSBMtFpUGjoOCpkr5ewjxK4I3zeUQugnxxRbLBzRFrbqmndQwQNTGnoO6
	j4Vkvmjm+LUHq3jQOnhoyHGbgBIiSXoxiiGq8V4bx0U7bc57p7kiOdDsVL8G+HvaaUpA3yFs3GLcW
	AkdMr0X76BIQa4IVgfZHktFdE7WPMavDyT8/WPNHA7S8cO0NZTUFXPj/HItJWVZxOJCTYnfH33aOK
	oZHkF+Z54cNsYBdwuOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng9vG-00EpLb-Ad; Sun, 17 Apr 2022 18:46:58 +0000
Received: from alln-iport-7.cisco.com ([173.37.142.94])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ng9vC-00EpKy-4T
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2022 18:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1240; q=dns/txt; s=iport;
 t=1650221214; x=1651430814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+BCSFgpwz16cUwJFvXpZTH9edfgHzKDaLBpIEMjSMEU=;
 b=d/PhbuoUPwh2bUKp6xGDrSNR6khOlLQduDXlOqTkubjct9RtHrdSbpOi
 NYxHU3EugwpQKjzfDI83eQ10dlw96/+S3z46JP4Pj16VILN3nSvguu7pt
 XpFEprEm9zpS/4nT6l6MFNL8PoMKhTa11VwYDSycs+ogodZGz/EieY61k A=;
X-IronPort-AV: E=Sophos;i="5.90,267,1643673600"; d="scan'208";a="841891360"
Received: from alln-core-2.cisco.com ([173.36.13.135])
 by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 17 Apr 2022 18:46:50 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
 by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 23HIkn0t008765;
 Sun, 17 Apr 2022 18:46:49 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: oocheret@cisco.com
Subject: [PATCH] mtd: fix 'part' field data corruption in mtd_info
Date: Sun, 17 Apr 2022 11:46:47 -0700
Message-Id: <20220417184649.449289-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_114654_374135_F2DFC6CA 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

Commit 46b5889cc2c5 ("mtd: implement proper partition handling")
started using "mtd_get_master_ofs()" in mtd callbacks to determine
memory offsets by means of 'part' field from mtd_info, what previously
was smashed accessing 'master' field in the mtd_set_dev_defaults() method.
That provides wrong offset what causes hardware access errors.

Just make 'part', 'master' as separate fields, rather than using
union type to avoid 'part' data corruption when mtd_set_dev_defaults()
is called.

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 include/linux/mtd/mtd.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 88227044fc86..8a2c60235ebb 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -394,10 +394,8 @@ struct mtd_info {
 	/* List of partitions attached to this MTD device */
 	struct list_head partitions;
 
-	union {
-		struct mtd_part part;
-		struct mtd_master master;
-	};
+	struct mtd_part part;
+	struct mtd_master master;
 };
 
 static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
-- 
2.26.2.Cisco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
