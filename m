Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454B7E6C5EE
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 02:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8wlQERhuVtWPyXI+63BCgoh2GK9JMUIIUbK789ZO8o=; b=2MUYTYO5UXU2wU
	tC5jrg0PZq9zxXA/Jj4EGVFbjchypDujiYadakvUIbKLJGrorm7RPAGlyoKwrqxv3tKOtxTBu7nTW
	bIaK77c7q+oZs7BGk58IZcCS6KePAZmcd1RpMcuB22KSTsBXxf2qC+uD1z6rpkCRjGfq2iuYDaR1l
	4cEWy3pW4lBaNt4d9uTzRvX/bQx+/Ws24ACxpJ9CXlb3D6nAZjBrKJQn2+n9RJgwr2mIO19uo7yTG
	zi/ETAAWSUlireEToTuyrgiwRQT91Btr9r2pDeXRVm+sApctY591aK4vZk8QGvPCfj0iUcnPSLhGU
	hKZiKQwJ4wHFHU3sQBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIxg-000000083lV-3QLG;
	Tue, 03 Dec 2024 02:48:28 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwO-000000083Ui-3Er4
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fbc29b3145so4289756a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2024 18:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733194028; x=1733798828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/fMjCuPubYsH0DXCXMNg++mVJWPpXEZP60/VYOzJ3A=;
        b=KwlMB/nqfjgC/zOdemfkyCPQp4AiiO73d7vHHy/pCzHbSNK1qsLVPkIKIbwoWLZKLQ
         qSN7SrkanO0HK/VZG6Ks60EoF7awCjGlWDUwpAXSVYwKN7XgF2Yg4RvJY6kLPTxhMH+r
         zob0S/ISb7XMhcyLSSoQZrHf6NXCOKpcWUBRstU76bVwEowuJLhuka45vcLDyHDl2pAX
         44rw1IhrlFKZOQ0AisG6qsvCXqAUvLpwIc63FOaZOXk0v1sMkS23HoI1rCEc76ksExwt
         8/ng+wYS2ego32c73TvHx9vwzws3KS1B60BxrJt5LGjfFBf3sff//u8STwHa/jTRHQws
         j71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194028; x=1733798828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/fMjCuPubYsH0DXCXMNg++mVJWPpXEZP60/VYOzJ3A=;
        b=eO2t4vDcK8DHGFKkhAVFPmr3QsTlVAO39Efkvm+kySGHLcb30XE2GpQnR+zNLSzppm
         O5z8WUz8+oio9qmhQmJGyP6jCnlTSW6QEBO5i5SgMsDs6ChtOv+x+ABXjeEiAYxMQStw
         j65gulw2C0Hw9o7UQMWouF3Czgpw53GpUWmIFeOB/pPCfV4bKuav8oa7bSr1wb2BJLoe
         k+PxR3lF1OgvIXUeBKJRuVL7oOBUGlQatqhP0PS9wqBbg/SEl+W9NbV2xvPVGT95GG5s
         5wayVm32bWwyIJfUKKza9LBTNSwbHemqFaK3tcRc+524hllDbFxdqGLblzBKtZ0M1k3w
         pIsQ==
X-Gm-Message-State: AOJu0YyqRMt1tNTu2Cw96RApksYY79WCQ+vFcSBhVueZuSNYJII4SaIo
	dFq/5Mlz74niYU6uyMCvs8AMHE5P5EhnimgDrCKWqqo4yO8wnEBsVM6VHQ==
X-Gm-Gg: ASbGncsu6hZvr5zvN6omCBzCzP1yPEm/PId1Gz9+3p258o/n55pKxKasEV4OgU3FJ3z
	bvPkiC2WKaznkkmf9WG4IfQTH9ONi2zeJ/huMqONLWN2EWJMpX1xhuoOruBLpEoLOC21jvYHsOK
	ywac6Guf8B9yalp8bTbwe9tHJMfRYj+Tg+2lZiUG1l21fs9a1j1cYHF236fBpi30uQkl1Hp+8mr
	PIANvja84/BppnC2lq9DyjTU5gjSZvtMgHl0UrZSoFlh0sPLMnr2smljDKCdnSEnHIGuZt4OUag
	2dHE6dZ2c3hEvgCs1CtuHj2evIMd2NiaP91B/A==
X-Google-Smtp-Source: AGHT+IHODLbfRzFCa5UdoY3a2QSL0mqI5htFnV3n7XCPqVUtza19f5wrvgsYooxFT5Xj71CAbBGprw==
X-Received: by 2002:a05:6a21:32aa:b0:1e0:ceb4:b7e5 with SMTP id adf61e73a8af0-1e165aabd49mr1219999637.18.1733194027725;
        Mon, 02 Dec 2024 18:47:07 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-81.msd.spmode.ne.jp. [49.98.220.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d634asm8605693a12.8.2024.12.02.18.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:47:07 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 1/3] mtd: spinand: Remove write_enable_op() in markbad()
Date: Tue,  3 Dec 2024 11:46:48 +0900
Message-Id: <cfc1c1d58719e5ec55186f2458e84642b55feb4a.1733193264.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
References: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184708_817359_48FF4B14 
X-CRM114-Status: GOOD (  10.69  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

We don't have to call spinand_write_enable_op() in spinand_markbad() as
it is called in spinand_write_page().

Fixes: b645ad39d568 ("mtd: spinand: Do not erase the block before writing a bad block marker")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/nand/spi/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..47c369f2925d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -942,10 +942,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	ret = spinand_write_enable_op(spinand);
-	if (ret)
-		return ret;
-
 	return spinand_write_page(spinand, &req);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
