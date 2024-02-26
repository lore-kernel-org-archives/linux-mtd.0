Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FEC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdfGIVsdwpaEH1LKu7FqW23PwCF8ZlLJutdzzA5MVe4=; b=pjyoybD94JeiLz
	B3ga57N4petApi8SyZbf5wVarE0HT7noexmjX/Q96o+p3uTvji3mGySJsKc3ddSCDdemva/eb9S6f
	fclvHkqB8ACW/UL2OWKczRrfxqSIn9XNFwqWXYaPKp2numUjbdss1nK2fEtW6EacMU+CGUa6Cdimu
	uQ18xpMYaSWilzhJ9VbDrwvM4XgHs4W8S8V2yfEL1TO1sVauoWma462NhF72oNLh5YJtjDkyLcGTK
	/wfLjWJZCfuXZFuPyvOBWjuXgN86WoXj03t2v8e7qB/HKv6QN52t220nygnrWr1ZH41XRndW9Wg/I
	Bbv+RbF61Xq5KqKvb2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXa7-0000000HQcg-1PXq;
	Mon, 26 Feb 2024 09:47:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXa1-0000000HQY9-361i
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 09:47:28 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a34c5ca2537so377011566b.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708940844; x=1709545644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kfst+zj9dofH6G00UFxAViFXDa4ima2oZcEsc7TvoI=;
        b=JC2fnwbQq6iGNOuzpEbziTRTgfv31qfN6kmDoBKVGbkym85inbFCIhzjrRowQ/XbTd
         2+HwAO1Z7kxh9VAclobsalXoyoT7co8HzrOa9/GqSISJ/twFLT6tYA9J9qTa18bFL9E3
         geBqKydTJBi6UVP7hefgEJoTGb0IBNMT5xbkoCEWGAxojX0rImMqx+BS83xXTf8wVHz/
         2qxDdZUDcGVSeExyDnsr1Djk4ZnaEhmqjX8+FSZ2e1Rdk1Iym24oic0cew7xa4z9kpeQ
         vaImoi9RVGxt9xLcjcvQ8orob3bbJEG/2C5skia7XWBxEsDsZbN9mP+swgB0a4+25+Qd
         Gpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940844; x=1709545644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kfst+zj9dofH6G00UFxAViFXDa4ima2oZcEsc7TvoI=;
        b=TGPMga5qlej1HPf6G0CBLQ0GZWZB4gic3/bC3Mk0kOX83S1XHoJ0rffSELiKVjB+Qh
         jDDAL62vK64yQFDwl9QS2qROZBwQKJwUuU7+LibI+KVbIPW33yThb3MBMGMVcv9e25ka
         lPoh5gbX3QZdGO1/FknBrlqclHFpUZUFlPtJyuivVfuJ7i+UinKM2hn8EVbS+DwMPVKT
         q8rb6E/oSoQCMUmhIF3zhsxmTuYFZ/Mfq4yOGetHdSSzC1N1Kvcp1dR8EkJSovarI7fJ
         +hRHi5ufTojw03fKJpUWVqkF0YwwyQOsMVHgrBl6EMqVPLJfGVs7paGKLzTD0yLJE2gw
         92ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIdECNelhnAO03owzYYRZSsFNlBaBEyk96B3rITmMt92U1502zPYvfwnyipMFXBGx7YDTqhc6SHWU0QRlOFNPkgmKtlJ4gCTwxcBW0Lg==
X-Gm-Message-State: AOJu0YxKNT3WzR6DBxpYrvuWoDNkv9vYaMpD26/kNxSY0vc8CC9b1KCc
	At7dJ0X/eK2RlwiAxnqH33rE2eJme/YX8IZR9jqVCLB7a2cnXz5bZEOJCLsbH/w=
X-Google-Smtp-Source: AGHT+IGW59FF6b6lp9BjaeHYg+U4YXucBm/Jzr8k7kcUpWM0NeiTzSJQ7Sq41VK2A4CK9lgJaY8FKQ==
X-Received: by 2002:a17:906:eb4d:b0:a43:80e2:98dc with SMTP id mc13-20020a170906eb4d00b00a4380e298dcmr334127ejb.32.1708940843746;
        Mon, 26 Feb 2024 01:47:23 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p21-20020a05640210d500b0055c60ba9640sm2175929edu.77.2024.02.26.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:47:23 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] MAINTAINERS: Remove T Ambarus from few mchp entries
Date: Mon, 26 Feb 2024 11:47:18 +0200
Message-Id: <20240226094718.29104-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=tudor.ambarus@linaro.org; h=from:subject; bh=5y4i93VXcmdUtjt5FWPiQmq6UMktsTYsPI8vX1bZ2V0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBl3F4mst9gVFdNv2yXt+50Sj0Jqcm35hTr5ZQHr 2TSTHg0A9eJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZdxeJgAKCRBLVU9HpY0U 6UTVB/4oCBi2DI+DNUG0IVjWM7GO66JVMUP0o4q1lySZo/elMeU/p4t2PCXCr6nD/CVYEtbAwun 19/+ip+Bb6WoDXewNyqj3/SOL0g3XaZMxMakw9A+sfN3w9DDFRaAZaMYuWsXYVy08JJ6bPy96PK l5A6zNH9yqCwhOtrdgSuL5REWQB32lSj5SKz6+gBLLfrw0L10RPn3Q3zixzA97+fqW0H30Dwsxv KcWfu9FzTvqMyqVqZxTeUBTmyJ0zPS1I2EZ78qjRYG60l+Uwu8eIabM/Mb34ePdVepycAV17caX eCY8HGcqKPu5jCh9GYuMnUaOeYZy9/zB9NEMuu6Pv3YSSyzK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_014725_999967_81441E88 
X-CRM114-Status: UNSURE (   8.15  )
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

I have been no longer at Microchip for more than a year and I'm no
longer interested in maintaining these drivers. Let other mchp people
step up, thus remove myself. Thanks for the nice collaboration everyone!

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Shall be queued through the at91 tree.

 MAINTAINERS | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1475ca38ff2..fd4d4e58fead 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14350,7 +14350,6 @@ F:	drivers/misc/xilinx_tmr_manager.c
 
 MICROCHIP AT91 DMA DRIVERS
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	dmaengine@vger.kernel.org
 S:	Supported
@@ -14398,12 +14397,6 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 F:	drivers/media/platform/microchip/microchip-csi2dc.c
 
-MICROCHIP ECC DRIVER
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-crypto@vger.kernel.org
-S:	Maintained
-F:	drivers/crypto/atmel-ecc.*
-
 MICROCHIP EIC DRIVER
 M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -14505,13 +14498,6 @@ M:	Aubin Constans <aubin.constans@microchip.com>
 S:	Maintained
 F:	drivers/mmc/host/atmel-mci.c
 
-MICROCHIP NAND DRIVER
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-mtd@lists.infradead.org
-S:	Supported
-F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
-F:	drivers/mtd/nand/raw/atmel/*
-
 MICROCHIP OTPC DRIVER
 M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
