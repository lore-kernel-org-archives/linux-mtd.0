Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C76C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptuWMhPvTbbWenM8ZR9ZW9bnnjRdiFsfPeBE7+BE0nE=; b=VxD2Udv5q8Jxec
	lprOUHyXalg7UdswzIqUnNd+JY+y5HFA3narCEHPFPdpm9OY5o3A75o3ZGlcwTGL0wJe/Pv4JeLhf
	KAc/AvMmlfzOb19PkaASGk+yTq1nHpJSacfWm93Lnlt9MSEV/q75BYAd0yE+wnCf0K6R62GAJkKi0
	UXzk+vpaIF+gKxQQCB8nDHa4HTrXyf4jeeEARUdDpPnObEFdfqfzpGegAPq9VIv81alClaT9umrv/
	/QJ7NN15tOXNtBSL74A9X/g4rWycFD3NpNTpZ0ayuQRuxcU394qoTkGphAvv4yHjoEz9R+htzaeMG
	mjTGftd2Q36ltXpSyFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAQB-00Cm4s-Dn; Mon, 06 Mar 2023 12:58:31 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAQ7-00Cm2s-Ak
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 12:58:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3E19C166A;
	Mon,  6 Mar 2023 13:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678107500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjUKX8vcOHRxfuq1rLlQX2Q888LcQ64xmxe+6S+e/IE=;
	b=remoxRjffuVdFV7RP3A/DnTRNbgpNuzcP3/5Mg9FRfPXhjxTQZ50iPuDU7OZnQcfHyZ7zO
	9E7JrxIJIKD7pqQim7XtEAG+cO3qoXl3QzBIxSExnODOS2nuzneBbUL8Z35SobE49Eik7+
	ry9Ino+B/stNJLhVunGZmd6t+JJVAsfqqefv6K/tixr06EYzbzuwfxvqI1yvBHI/Zlhgtz
	Y6uNyLjCduevVlEnmfGrCoib/8UiZ+qK+YiMSRDCcaDCp75kLJBg4ltLf0zjAeSKb5oK4B
	dIdBBn5Zk4La6lL4Lj/8CTrMQVvXmJ9P970akTIj2U3/eVVBg5pyf1r23rvDWQ==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH 4/4] mtd: core: prepare mtd_otp_nvmem_add() to handle -EPROBE_DEFER
Date: Mon,  6 Mar 2023 13:58:05 +0100
Message-Id: <20230306125805.678668-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230306125805.678668-1-michael@walle.cc>
References: <20230306125805.678668-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_045828_583684_5D2009E6 
X-CRM114-Status: GOOD (  10.55  )
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

NVMEM soon will get the ability for nvmem layouts and these might
not be ready when nvmem_register() is called and thus it might
return -EPROBE_DEFER. Don't print the error message in this case.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/mtdcore.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d6675bf03557..4f9bd78bc6f9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -952,8 +952,8 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
 						       mtd_nvmem_user_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-				dev_err(dev, "Failed to register OTP NVMEM device\n");
-				return PTR_ERR(nvmem);
+				err = PTR_ERR(nvmem);
+				goto err;
 			}
 			mtd->otp_user_nvmem = nvmem;
 		}
@@ -970,7 +970,6 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
 						       mtd_nvmem_fact_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-				dev_err(dev, "Failed to register OTP NVMEM device\n");
 				err = PTR_ERR(nvmem);
 				goto err;
 			}
@@ -982,7 +981,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 err:
 	nvmem_unregister(mtd->otp_user_nvmem);
-	return err;
+	return dev_err_probe(dev, err, "Failed to register OTP NVMEM device\n");
 }
 
 /**
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
