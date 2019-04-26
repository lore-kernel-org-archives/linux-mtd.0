Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715F9C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 19:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FEE20693
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 19:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5tYDWIj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig45WgKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FEE20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9YzBZIlT8BmKKcgCr0R50uh7dG6ENMCU+/VYGHoDn2o=; b=d5t
	YDWIjEsF+dIMqKK1qoYjjbK1TMowPaVusQyfcd/av8UUz2RldfdCfUAMXFaCKu5Ti+5doCj5pZKct
	afOPx/S0n4KJyFOqlRkKz0/2atbnu/XhVOgGJz78j44wWYL0om96GseKuxdSP2ML+8OVnZDDU7lvs
	Vtl5pywL67vWHY6HGae6U9jvcATD/iar0aFud3vHiVayy9gs+a82DjkzacyUQEvYGYXPDdJ6D6+Fc
	+TGXBE5ocztG4700NMVosRKYmzZvNSZROtmZeZAwiDxJKL8LYQu90Vib0WL1Q+2o3ghEph9eGME96
	xv1qpnzZwAih66/DjYzeQQJIl8CcIrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK6TF-0002kj-Nq; Fri, 26 Apr 2019 19:25:17 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK6TC-0002jv-7T
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 19:25:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id i17so2180885pfo.6
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=an5rEpkFGQ3NHmznnBNRuXXxR3Z5SHbs8DWRZW5+fO8=;
 b=ig45WgKKQqZebDRRWwG1Lj4m5QQ9D9aAPNnhnX1eTLJiAqznX3JOJ2g5ahFB5uVQY5
 oyIERfk0X612tHthQqJypWNwnj9TehLdg1ikZ3jVD5cD+1COpgGuKm1HH6/7u5AGWf4M
 rX2BEXJnxNnSXjvlZ1XIUlHWb6nLcOIzj+qG8Mh9UmsxqIZspbBW7m4l6c7vcwJlZ5yL
 Bp98T7qET+H0q5pFEbVkUTJTxDBvu5e6CWEt5B1dmEwWQELjrLyZlwtsINfBnKF/hDZP
 nMJ7mYiVS1SKi5+SpVOfqLBaU6jo3WpxLSZGl0ZN5PNYGJ478PSfvCsjuYyGSSN2nT9m
 e6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=an5rEpkFGQ3NHmznnBNRuXXxR3Z5SHbs8DWRZW5+fO8=;
 b=sPkHMS1FKfuJ/qsc3tpxiyAThglRvqEgTRPkc2OU+RB/79TQHZFfkTACGDZvGskNLO
 qgtaZAUBhaYFBdjl8KD32INB9B73WuA4haEohEUEmWF/OxpWwQvFtEPGc/VL6hSWrKZ3
 4uQnP0Jhw6eMD73lQNgWY+ftpqjK1kCIylIKV8bLWQBYnDbAei5TmRM2rdVNKz6a5JOO
 rWRj8jzWGLn8J4LdEAfuzOX+qQkcmzsaSxR+mu9sgC0fyyEPbGFGDSAVjNTXL4Q7jSj8
 j4XFl2qhYdldVYk4wAx1lw+KB8cTXWbTGe1RF0yZoPi4NviP7VV1P7oZND72vs8eDW0w
 W+lw==
X-Gm-Message-State: APjAAAVQEJwc+IDP0YpxdXuLw9NDVxT5hGqrocAE2S/X4W85xsE6kJdQ
 3wZUgRKPWBh1zezLqyAs5cb0e8x5
X-Google-Smtp-Source: APXvYqzLiLvTpQeqBlBn2EZNk7kx1q3pLixQSE9zvkCA8sZ0NktBztwkexSNcxu8fIPn9TCgWhTcIA==
X-Received: by 2002:a63:1852:: with SMTP id 18mr9164960pgy.283.1556306713105; 
 Fri, 26 Apr 2019 12:25:13 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id w38sm1129639pgk.90.2019.04.26.12.25.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 12:25:12 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: brcmnand: fix bch ecc layout for large page nand
Date: Fri, 26 Apr 2019 15:22:26 -0400
Message-Id: <1556306615-37990-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_122514_294248_FCDED279 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The oobregion->offset for large page nand parts was wrong, change
fixes this error in calculation.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 482c6f0..3eefea7 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -939,7 +939,7 @@ static int brcmnand_bch_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= sectors)
 		return -ERANGE;
 
-	oobregion->offset = (section * (sas + 1)) - chip->ecc.bytes;
+	oobregion->offset = ((section + 1) * sas) - chip->ecc.bytes;
 	oobregion->length = chip->ecc.bytes;
 
 	return 0;
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
