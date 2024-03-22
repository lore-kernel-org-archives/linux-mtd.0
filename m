Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884BFC47DD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 04:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3C8QtjEg5AJDj8ypmeKWbq1D5eQB7RjNYSqkq3QnsTA=; b=QpY2KpNE7oaHQ2
	bs0ciYThaP0Ai/x4V3Ga6Gfyi2io114CtfcHyO75Yb1cGLjBzQDkzn5N2Ogc7RW1vO56oljZG2OlC
	viKrHrZTnBJeKwLJ2kT1EdZpAxuaGHAms/QNCq/UfwV2sDjAlXxzEhrSH4jnhwXNQaiTwKWagmyYb
	0abj/pRqBKqktYHvluhkX7uaQhgVp3ODYhr/Ji24r+OCC/frMBpoFRCa39kuLDRPWuwXztVSV9P2g
	Kn3aonQbhEz+siuXQ4aDcc7kpGi2Yi3ZMq+dAji9mebc7+Q5kN+T+ZPLVfFJzzM/6wl+tFzB2CNpQ
	Lnmo6XFaWG/wYsvaRvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnWER-00000005iHz-0nNl;
	Fri, 22 Mar 2024 04:10:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnWEO-00000005iGP-3VGr
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 04:10:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41412411672so13103805e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2024 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711080609; x=1711685409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NA3Bmop1gCKtv1Q82P2cRoeegkqQuerIZY6ItFpjOU=;
        b=dTVbogNNhIWNDWCnmXz20Qrf+Frv0Gyz7s91qKHGmc44tC+hpbRsc+YrshYftBBy8Z
         6RNe65/Zh9yQ/Z9dtcF0WWNbEpk1zTlhQ05HqnKgkt55iolop8bKdqsFPZfco98CkdRe
         yWBjzuiyZqZzLVer5I8rG7JwreUbT8zWu9wQhtYyH1edvRLEkSphJSU7hw1Ezaobcv8h
         xKedw3quW2MAcCIdQ93tdw2qy+0Z97oi4gY4Xoz6Ou6HnOQGPnCIw7o/bk37xdFXD4lq
         jbD8hVswghw3pkyKcTcX0bOcd73xcUb6h6dZWTdH4EVJkYoI/E+EhYACSVUImtcd8f03
         yvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711080609; x=1711685409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NA3Bmop1gCKtv1Q82P2cRoeegkqQuerIZY6ItFpjOU=;
        b=oOeOtPVA0CgKxejuC3duSlxnz62cAjfznpo22zCQeln5cGne/A7TkUDaYRLd4cnvcv
         3GQ1/K5SGtL6/6U7pJB7lMHCNeliC7blenAk38soRJVjhjsryoXY7VNal8SyL+JZ8AkE
         BHLmX2POAGopDcXBhmsbVQfqtXGCP+E+6MooZdqoeQR+uUHxQKwtuQydN0O8o5dCNpnM
         uqliwpO+s7CusHCxnzxnriBTkY8AUU4ypo6z8kABhRQCLc6TzTjcbHHPWOtMhBrmbjRy
         wxVb5ZWHK6RuLsvHd3bqRiblx6gs2wJPlZkUGhxBz+RAG+f93fCnVqxMT8UXFYi5jDJ8
         18WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM22Ev45WPqgMenXeIvLJaaw+XSXYj6sPc38oEVxxC3Y5Vk3vWvU5UXMMHMc9mcd12iJwwl7v7lTQrU5XYA9EhQv6NeY53Qcg5bfMdDw==
X-Gm-Message-State: AOJu0YztKU1nJGwlquB1LWLJWefNE81YSv1GPqTua5eCKV6J8ovh8n5y
	Vu/F8KmYn1IygQFryXNy/++5lSnCsEftSWMaLv+L1tZWKBSjHN5W
X-Google-Smtp-Source: AGHT+IHzryKQyKjUaWMydnS98Rv2D/wqKdSlap+b3Gib6PJz45la8lFONvHSzUUr6Wjek487pAiq1g==
X-Received: by 2002:a05:600c:35d1:b0:414:fd8:10b2 with SMTP id r17-20020a05600c35d100b004140fd810b2mr632367wmq.8.1711080609255;
        Thu, 21 Mar 2024 21:10:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id dj9-20020a0560000b0900b0033ec812ee0esm1058605wrb.71.2024.03.21.21.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 21:10:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
Date: Fri, 22 Mar 2024 05:09:49 +0100
Message-ID: <20240322040951.16680-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_211013_097935_8B278E83 
X-CRM114-Status: GOOD (  15.14  )
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

MTD OTP logic is very fragile and can be problematic with some specific
kind of devices.

NVMEM across the years had various iteration on how Cells could be
declared in DT and MTD OTP probably was left behind and
add_legacy_fixed_of_cells was enabled without thinking of the consequences.

That option enables NVMEM to scan the provided of_node and treat each
child as a NVMEM Cell, this was to support legacy NVMEM implementation
and don't cause regression.

This is problematic if we have devices like Nand where the OTP is
triggered by setting a special mode in the flash. In this context real
partitions declared in the Nand node are registered as OTP Cells and
this cause probe fail with -EINVAL error.

This was never notice due to the fact that till now, no Nand supported
the OTP feature. With commit e87161321a40 ("mtd: rawnand: macronix: OTP
access for MX30LFxG18AC") this changed and coincidentally this Nand is
used on an FritzBox 7530 supported on OpenWrt.

Alternative and more robust way to declare OTP Cells are already
prossible by using the fixed-layout node or by declaring a child node
with the compatible set to "otp-user" or "otp-factory".

To fix this and limit any regression with other MTD that makes use of
declaring OTP as direct child of the dev node, disable
add_legacy_fixed_of_cells if we detect the MTD type is Nand.

With the following logic, the OTP NVMEM entry is correctly created with
no Cells and the MTD Nand is correctly probed and partitions are
correctly exposed.

Fixes: 2cc3b37f5b6d ("nvmem: add explicit config option to read old syntax fixed OF cells")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5887feb347a4..0de87bc63840 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -900,7 +900,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
 	config.owner = THIS_MODULE;
-	config.add_legacy_fixed_of_cells = true;
+	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
 	config.ignore_wp = true;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
