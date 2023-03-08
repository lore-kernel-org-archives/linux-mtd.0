Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69226C678D5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGlle7Z9jEiGhkxh24kqoIdFGvQvRHEQg4kmSpCcvjY=; b=d4YUzuRWywyEHw
	FBUho4+eHt41cMP1j+AVl9tNpDL27oe7dyC00ubRo3x3k+Upq66kDSR+Z+PYdzcVDbvdxCjr7sP7b
	inDXlO6mfh/y+0sQJkLr5nB8BdNeSOHjxvCBueyHL8xbxlkhHJlJdrck+sFJA7tKmXyw+ycbFgJEZ
	Ko2dq0hXmWj9rZI52Hr0hN5mH1f8zWyJbTY1V59zxP/5dI33IutdCxTkowN0nv5WsnOqe1a2jCVPC
	opQ51PSPDx4fWj+f72++VpSNtT/oz2ZI551ERsPgDdA1v2oslsv4e95HQjtfUw9Eu5MKkK82zt/xV
	E5rcSvJmOTZZm9SA/oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2P-003wBK-KK; Wed, 08 Mar 2023 08:20:41 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2I-003w9Q-PU
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 08:20:37 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A73E216FE;
	Wed,  8 Mar 2023 09:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678263632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktfcqSBRe8eRK5A5gzbgUANLuCVChHFFCI/4vtIw9Fw=;
	b=Z8xfJu6e78pT1XFtaYdWug4JDZB8LYDQj0qyNdu9780y1EN7Z/O9wigVQ0VR07GfTzM1Q5
	wFdBO7Q+0X8DzEbai2KJusBhyyGVU7Ikai4M8417Vm00dFkOhhHlrpNFjVVu6enyNQYz2P
	y3YShXURejpkbG+Xc7dUWobXW62+5wEJSVkZLn+5t3FMa91V8B7uKuzEAr5I30iwbQMNNF
	yOzj5NQ0NWOBUf4tT4OBoBJ7SK+cDMxwjJ5LJB8GNfSFG0UvlKOPYiTDsnZXNDnIWMUunz
	XroHmi+w1bpARuCpoio/PtboD11Prcfx5fPB8L70F8IIQEH4KuFbdVG1rpjEHg==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 4/4] mtd: core: prepare mtd_otp_nvmem_add() to handle -EPROBE_DEFER
Date: Wed,  8 Mar 2023 09:20:21 +0100
Message-Id: <20230308082021.870459-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308082021.870459-1-michael@walle.cc>
References: <20230308082021.870459-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002035_039505_811A08B7 
X-CRM114-Status: GOOD (  11.02  )
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
v2:
 - none

 drivers/mtd/mtdcore.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0bc9676fe029..83a22566a8ce 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -953,8 +953,8 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
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
@@ -971,7 +971,6 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
 						       mtd_nvmem_fact_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-				dev_err(dev, "Failed to register OTP NVMEM device\n");
 				err = PTR_ERR(nvmem);
 				goto err;
 			}
@@ -983,7 +982,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
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
