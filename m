Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0BDC169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CB92087F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBFpWBuI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="JFA/7pXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23CB92087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6hmHi0K1gbhv1XedkLm8zDIeelAoCUPlt/SdqIEvbQ=; b=uBFpWBuIz1HYyV
	D655SSwa3ycCQUhgEcZa41jCWEuiFodyZDrJGDmj2S8egnXeaMCV0ZGlreWEaRnuMDU5ReIYO1iFr
	2IbuGQtOGE4KNomB2lF9NuGllFey6TOAhh8WlWUAt5jNLHz29hp2Ua8hEdtF5115xGkLuyLy25EHl
	MCKyOgKMTqJy4ROne6Gni2/jeYc+UBJdK1iwLE+XVkk/RRNbqNWssycxlV4SsK0wo8PJmYFQgOHBn
	42oauZrFSsFpAIF77Osk4z8n6JZVfPqxyfBkSnrHphpqQjBOjo51MGoU+xwFQrCQ8tzxsmXc00zjV
	/nx6wStOCw3F8adyR06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gobXo-0007w3-1D; Tue, 29 Jan 2019 22:07:48 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gobXN-0007To-Vq
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 22:07:24 +0000
Received: by mail-lj1-x241.google.com with SMTP id k19-v6so18898053lji.11
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 14:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCAZzM1cGkJ7CByeA9n40YHfydVdoSizKIYGOlAeBRo=;
 b=JFA/7pXTWu3CCkPsJib1WMpjPBsVw+uzlMe0n8qckvfOtPg3QiSc6jAUkHBpdSsHUK
 P0OHbP8NfrelD7eLL8SsFlE44xjjpTTh8wDAw3EHl60sCAVwsQd04c7NF0m9mlSi4m5h
 6C5lLq7WVoSaty9hRVGEkc1LKRHjtoIknBUnjfc47bu76Gkpo2h0a7oOq2TY7FWPo+jS
 kW+Z88I6ob4m+dYZAJ0Llbe2LB9e43tEfOlDHq9l34GXxDyXGiPijd75ClA/DtNqHmA+
 blASwJU+72ZLIJD3k+k23LAaLwZTOlaTGEdxsWuvWqNEySvDTF+ZkO6ZRX+QwcWcifDW
 m0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCAZzM1cGkJ7CByeA9n40YHfydVdoSizKIYGOlAeBRo=;
 b=axcWLiX4g0dn5Y9vpl9bOF9/cz09xT53uJLkQ1mTM09XdBj7+cwotgHgVRBk1maQh/
 LfVWfAAIMvaRELGmJWSwu1F/TRZaz6Q5EPq7QkMrsH9uFlCK6i9gkdnr2gWD3xWECd21
 J3qC28SYdzuja6iFGPrYhH8Z/XYw+uzOm2gJ75yXIl/w2fCa4u9O3GhIT4zjS9hueZhB
 btss1Liy9apMcSbxw/mnrdOhBDGUSrCJZ+ud0wBDusvcc74dTStK2+T0//dd5qOPhs3N
 B8YqOX2peOKzo7ykaY8aMVOc4eJMNSBRphEvz7VtTSNR5ts0cHwg/6lh8vx4KOfoWDRH
 YLYw==
X-Gm-Message-State: AJcUukcfS1HoMAZ1slN6HlF0YXwlZ48KO6Ibhsa4Ganks467FOxpaD7G
 UfjBPrzzSqektfYlcmRqRE6UIbSTxUo=
X-Google-Smtp-Source: ALg8bN4pxsQ7yhKI6c1A/sDgTf3Hu29NCPx8/ihw/CBqQ+3o6hP3fB3YTwC7RpSuNViIZmdgXEaBHw==
X-Received: by 2002:a2e:449b:: with SMTP id
 b27-v6mr22289300ljf.47.1548799640050; 
 Tue, 29 Jan 2019 14:07:20 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id c15-v6sm3821045ljf.76.2019.01.29.14.07.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 14:07:19 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/3] mtd: spi-nor: s25fl512s supports region locking
Date: Tue, 29 Jan 2019 23:07:04 +0100
Message-Id: <20190129220705.5143-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129220705.5143-1-jonas@norrbonn.se>
References: <20190129220705.5143-1-jonas@norrbonn.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_140722_018993_B2E40C16 
X-CRM114-Status: GOOD (  13.91  )
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
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Jonas Bonn <jonas@norrbonn.se>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both the BP0-2 bits and the TBPROT bit are supported on this chip.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4c8ce2b90838..d6840c2b15dd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1886,8 +1886,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
