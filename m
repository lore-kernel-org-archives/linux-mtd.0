Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C483C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jul 2022 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=khp5SCzal+gwDz/AqRTr+6J/qngBdUuSEr/1clmcO3E=; b=062bZ8Q5enzscV
	DlXd5K+H2kH2whnrx+7IRhVmgMTqyhp3Q6tsCBS/T9/wALZtSn0FpQ70p+8A0Zfg69RERcBNPvVlX
	cP1DWebYF6VE/f887iMr0yN89rk1S0ArTB99XvgUQPuhz6MX2IgIcopcHL/kYw84+ebcDkccYXru+
	dldVokcRvIZ0EF7JEykW5+trXJTgbYQADFseA0kdZATtyAycccwlHEXHQsgMkugO4Lf2Z+s6Lh+ky
	olHMCzUZLC9lLe5Qpmll/RDD6Xf1fnjv7jeYGk4QZic0VSevrsTLtwX0jxbG48EHILHVXRJ5tlQrQ
	0OeZGZNb1Y3wIfalZoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFnj-00AHpE-4g; Wed, 20 Jul 2022 19:56:07 +0000
Received: from [43.155.65.254] (helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFnb-00AHZ5-HW
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2022 19:56:04 +0000
X-QQ-mid: bizesmtp86t1658346936tilnfd3r
Received: from harry-jrlc.. ( [125.70.163.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Jul 2022 03:55:27 +0800 (CST)
X-QQ-SSF: 0100000000200030C000C00A0000020
X-QQ-FEAT: xqT8U4SkSphJYnHyaylettPgIO47BB3yGPetCKKVCel5otGINx+MloH1vBXBj
	s4XxNQialnwY9aVHdto/kOIjYF+EY5mRauDF4Gn5XGQOGWoWFaDTI5IdFHkCGIue4ehH4XL
	61S4HwqJYgSagy6y0wr4WjIc2bVjguvR9LOphvIjTJ/mKD4k+jkAk7Q+t9sRac8JcKtpcwk
	lrbvptydA4FV7/fUEvdEIyhb/LWMIC53Lfa0MmnJKiqejYvDvkyra0VhfvDprsb+Sr/wTGK
	lgIv+kk8G8v6rUP+0o2YND8CPPPTXOI4ZCpkInggfgoAimapysKuvJRGxFgQeS3Ro0EIgty
	9GHmTkBZjZ6qKWeJBXPWfdZAyPRIGetWJqqTH7olpAhmNUl6cIXMjY+k5EcKQ==
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: jim.cromie@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xin Gao <gaoxin@cdjrlc.com>
Subject: [PATCH] mtd:do not initialise statics to 0.
Date: Thu, 21 Jul 2022 03:55:26 +0800
Message-Id: <20220720195526.9289-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_125559_900499_1477BD88 
X-CRM114-Status: UNSURE (   7.91  )
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

do not initialise statics to 0.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
---
 drivers/mtd/maps/scx200_docflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/scx200_docflash.c b/drivers/mtd/maps/scx200_docflash.c
index 8462662b7128..a565d69d28d6 100644
--- a/drivers/mtd/maps/scx200_docflash.c
+++ b/drivers/mtd/maps/scx200_docflash.c
@@ -24,7 +24,7 @@ MODULE_AUTHOR("Christer Weinigel <wingel@hack.org>");
 MODULE_DESCRIPTION("NatSemi SCx200 DOCCS Flash Driver");
 MODULE_LICENSE("GPL");
 
-static int probe = 0;		/* Don't autoprobe */
+static int probe;		/* Don't autoprobe */
 static unsigned size = 0x1000000; /* 16 MiB the whole ISA address space */
 static unsigned width = 8;	/* Default to 8 bits wide */
 static char *flashtype = "cfi_probe";
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
