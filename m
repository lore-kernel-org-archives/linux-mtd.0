Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363D9C44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMI1i91m2RoKyoCQhURNYTa6QXJQHZH7awOU27TFzks=; b=00v5xjfRYBU+sA
	/FfiWkNMPMFIbeotQTtbrDcumdn56S4UyGE+SctkYfnClR6Iwy79BdpX2cr8xAektiOdkS0pbDpBf
	meYlOVwjXHOqlKB8BWt1EkJm8afxVipzWqRs8z1yBUEJJrF5kCvvp+SCakv3A7dPNvyRrTw7EJU3t
	sr4m0F5Q/V5JTG1NYfKP1fyKr/dhsbNrJSaBq+c6zyRH1mgc0gnxYQHuVu0/EcdY8QgqPflEmDYNh
	z/ONuiE7+pAUQmviQXIPJBooj67QZ/fwPBoo8xR8Z/sBuvm32rXxx/jqOfjlbWJbVdl5oknXu6f/+
	jwEoVSz2XoQ/7KcConOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmf5B-0000000Csmi-296k;
	Wed, 22 Jul 2026 22:06:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmf59-0000000CsmJ-0F7t
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 22:06:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495437bb891so55399595e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2026 15:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757985; x=1785362785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTPm2m44GtFRGq66+iN2n68o+5+YpQyJo9uF1nvFQA4=;
        b=kC6/rtvnbJYx0BbKxdkx4E7QWOCsUrPa5hHRMQAxqYbYGMpwnk1UviO6h8B50djrjJ
         kZ0QTrak87tu4vFIe6KUH6bVm64nubU72v5DDsMryVKyCcmrNmLLHrc4Gtln1mH0a5qp
         quIEoHnPwXVXxI2+JRH1EoMmfrbhcyp/Kci+iyc18rS+6j2hJJ4lXLx8Fk0ODfI7/+vI
         0AHvlaSW1k1rHUa76caGbK2xt3WQXJleOFGiK9niP+iYNN5Zgn1zycn/5et+xby+dbao
         kLiqC67nlcQklrr4LXN2HaZ/c0BgKwceAqW8mazGGnr0rseOaESTslj5lfBHpAS8+rgu
         iV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757985; x=1785362785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTPm2m44GtFRGq66+iN2n68o+5+YpQyJo9uF1nvFQA4=;
        b=FSozrizMjNyLP8jQTWdMb3OkrKV7NkHMCQnwnI56cGX2xm79XrkIK5uF8ThyP8UXFy
         AMBhnO9knGeFLHcKkd59/zpvdzbNrutmq1OuFyfFCHpeXAtO5o8lnkAHIrWxSNRNeZq0
         xTaVpUT5oRBrJnhbE24nmM/ezd6HangPZX9J15JMNgezsCnbXlV3hqW2q5yhOSNsgQgd
         pJvBrckcQzJyfnYe6O+l6Cj4gqAQnxvVv2u9h2NpQHu9X+/MrOxbCaLvmgqwcLEB5N4N
         CvVhYzc8NJEHZMpZphS7qi8wn6jk3qcz/gWM02wcToricpJ2oXPGloZbJBwZrqTAm4qQ
         np7g==
X-Forwarded-Encrypted: i=1; AHgh+RqmBXAHAfL2XINUVZ9PvXalFYue7STnmZtWPia9g6MLc45G6gX69UPbwbn5Gk5AqxWpqeAQw9lkz80=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy46NIXkWNkYdngo7Fx53Xywz6TKPeEsYBIL10DO13jnfRlaVV7
	j90J5ZMlixodgFZuaGC7/upy3va3EWDstnb4+daFrm0+wSEkX02jFrDL
X-Gm-Gg: AR+sD12bu9b+thV1tDTR+W2Dcx7dk4pOagzRqgZBd5i96R7ZEmyn/+ZYeGorSY2KV99
	48lb/L+jWhNalFrC+NADSNMmURHgMQmNll9W29yArD4C00aKlau4wLC1o7V68eYFHH9LOKJwfAy
	takiQZe6+IRGRegOXzu+rbUDDdmdbYmpwyX9T9TGzjgG/BInM292ghOTmV4xw52usoBbTe9defc
	ddSgdM3u820Gzxw+tCE5TUB/yaDkOKNfxzzQerMmU6BCR83Lj44pleMMDCZzAFChbJ4qg7Z/dFT
	YbGeL8qhpo6XbV4kGNrX2DMPsF238BRVMBy8TkY1gDesyXJ+0GecH48bKfchiY6/ahJ98llf9h9
	UGjPopHN9uOIX3pkoMuPv3Sga8qSfy7+RWsmHaPKJb0uE9G0hs/Q1JepBTC6m5rjI7qO/qlAtXM
	EjO7pIGdkuIg6uGRXQmHhsKDTI+jZCGGf2u86mPOryA6KXyYoNPB8O4gL9bG9nShqfPw==
X-Received: by 2002:a05:600c:321a:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-495745579cbmr487415e9.2.1784757984580;
        Wed, 22 Jul 2026 15:06:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm9562718f8f.3.2026.07.22.15.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 15:06:23 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: arnd@arndb.de,
	sean@mess.org,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] mtd: maps: remove dead select of MTD_CFI_BE_BYTE_SWAP
Date: Wed, 22 Jul 2026 23:06:18 +0100
Message-ID: <20260722220618.198164-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_150627_144102_C8EE2A40 
X-CRM114-Status: GOOD (  11.09  )
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

'select' does not work on config options in a 'choice', so currently it is
possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.

From a previous conversation, it was decided to remove the select entirely:
https://lore.kernel.org/all/c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com/

This dead select was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1: remove 'select' instead of using 'depends on'
Link:
https://lore.kernel.org/all/20260722001003.36598-1-julianbraha@gmail.com/
---
 drivers/mtd/maps/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index f447902d707e..1bb3dba2631d 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -101,7 +101,6 @@ config MTD_PHYSMAP_IXP4XX
 	depends on MTD_PHYSMAP_OF
 	depends on ARM
 	select MTD_COMPLEX_MAPPINGS
-	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
 	default ARCH_IXP4XX
 	help
 	  This provides some extra DT physmap parsing for the Intel IXP4xx
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
