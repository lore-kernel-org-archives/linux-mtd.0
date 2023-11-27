Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750A9C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wQN4//lATB+98o/bm6eDD7AIS++Xfg92wqIu8/Xpak=; b=oUAItppr3bExnT
	NSasmKHHqFWtVr3vNtBzRcQ8iPXa8hfKun5zoXQDNkw2t8i5/Vy5VB1PPVUbf/s9sGMWSTdbJYG2R
	OdOnz6vIvR66cXyrWIPPiZ4FXm4ePFOUPfW+/vIqtkOi9U5yxPgOYt7+VP1UbH0EHoVmL5yFdxIH/
	qz6m65UP1tkzLDE+WY4uj/W7+bCK7rh2umVuNLDChf0QELUW8yK3uIhc2n2MPJsN4Eou0Gb+Bwutr
	P69MNL8fau8PeKh+8XV5dyHmA5+QNhWpnncxWSFEU4HYIzYXcbOLqDeiSXqkGkfCh1mrOPTdR9CCX
	VD4UlJxqCT4oRud3EONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXH-00228X-1K;
	Mon, 27 Nov 2023 10:08:15 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXD-002278-1A
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 10:08:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5bd33a450fdso2864977a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 02:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701079689; x=1701684489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWNFfleF2FQ7tZjJiJmyGEaXMVhNA/SFCvRVCvCjQcg=;
        b=IvjxByoVrpgUHDFDkjuIkE/d1L7SUkmGjqeGABETAEPIiMUtR6r0IHzIdSAGZPxUcx
         qffvZ6buop69BXP+6Ew0QsvfQ9xqPTzHp+N0/aEl25dxee3r9SvoONZbs7wTs8Pxm3mU
         wvqzuUgMWqhUQucR/EMNNc1ucmO8qbNed1kYG8HHB+FtdECq96sjwwsD96aty49eR8Y9
         LdlA1g0Uxv5VbkjIweXsWdM7J9iYeVQcdX2a8cM76DBGZLHTMCNFh9y/hI5ryo1TsqQp
         GDF84l8CbhL5a3xgLKbwI0/x3qzpYU4zMIiBogse7iBQ4UKOxZnw1frvDb3zNFwg7Ehv
         pypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701079689; x=1701684489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWNFfleF2FQ7tZjJiJmyGEaXMVhNA/SFCvRVCvCjQcg=;
        b=Vn+i3S0U3TxOPDgtJONE55lPdD89UcvrJ9PQXo5uJcyV4vNkDAsf1R9iGGa2pf0Aiy
         fMtPl3n/CtHpFPIHgt4/kVijYM9V91ZCQM3zoKvWBQ6TXrpoBsJdAuEXi2abN3JbU3+L
         PNkaxAV6Y6zpJS8LqKIuV87Zo5xadC3eXKE097u2JEc48H2w9BHUHK+z8Kg/FTbapvpL
         Rc6mGmPAoAfnhzD+tZeW//rTuEz/XmOnzXrTk7HUPBpRRrwjwsSrhv+BV0tnyQfOWMRa
         cEV9SVAUMykxiyy1NgkdsfA4bIB7XYmuBQyC84rgkzttBqPIsvN3uWXHDppUcKDda8jz
         8f9w==
X-Gm-Message-State: AOJu0YzVM/BQB3L+dCDR8KtGP26/TM6QDVMZm1G3cByrQFynROl33AJZ
	LGqXChBH1YCLW9WSCsKoBtA=
X-Google-Smtp-Source: AGHT+IGckNZduWWgdgXTdfPCitRHnaH8emJYsnzmWsCf+BFDQb9D/WkTY47y0FfWtMe9N3INb/VEVA==
X-Received: by 2002:a05:6a21:788b:b0:18c:19e2:5735 with SMTP id bf11-20020a056a21788b00b0018c19e25735mr10124551pzc.54.1701079689335;
        Mon, 27 Nov 2023 02:08:09 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id nl7-20020a17090b384700b00285cc7a867esm1474767pjb.0.2023.11.27.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:08:08 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 72E968056D;
	Mon, 27 Nov 2023 18:07:51 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name does not exist
Date: Mon, 27 Nov 2023 18:07:54 +0800
Message-Id: <20231127100756.41605-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_020811_398780_C05A488F 
X-CRM114-Status: GOOD (  11.35  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

(null) will print when flash ID founded in ID table but
the flash name didn't include in it.

Make info->name optional in the print for showing flash name
and flash size.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..73405bed2a5a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3518,7 +3518,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* No mtd_info fields should be used up to this point. */
 	spi_nor_set_mtd_info(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
+	dev_info(dev, "%s (%lld Kbytes)\n", info->name ?: "",
 			(long long)mtd->size >> 10);
 
 	dev_dbg(dev,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
