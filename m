Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96000C54E41
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ut4DGe+gL3LVErfY1BbWbVmOOJGpfoJo2vcNAU+7Vrw=; b=xoiW/rldTW90uZ
	0MyqGeyi8JyMPCC+5ZJJKQuJ+oxfAIwhJvJohM/fAaYHUKyhmCmqXkrxzY+KksdmW4KArcaPjwuN3
	hm97cC1wE0PxrxRf11iWAle7Htuhk1z6RVrUb7byL5bKsg1q3+zy5vHieNLp0XYJZVMyoLWgL8vO+
	gDYUAtagMXVMweCFdZaUxRLZm+uf2ZaC++UxkyrwIxhSrphIHzQArnTpky1tg5p5icCD2GbcFXNAt
	kBS7yshl5ftc5cJUqgBULv/6YQez8M/hl+T35//dFMdBBzxymO+5PaBXu+NxReNBqw7bBl7Vc8/C/
	LBSEcDq+fxyhnwcNJdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaZn-0000000F1ZA-2Tnp;
	Tue, 05 Mar 2024 19:35:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhaZl-0000000F1YO-1Ihq
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 19:35:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso767334b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2024 11:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709667344; x=1710272144;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buUMhaoDddPV5KgoZBFsQ0zbWZIP6RzvTrPKJ4yK/XU=;
        b=ZuWhpKw4FoEf3lWC5v5egzEUIuSeJwnngrhTwh1jZWJwRZTUnIGlhyRYsVaWnKYMQ/
         3Fs8e9881yW2FJsHgx8+C1Bvc5sHalK7YN0yVJGQM2mslo/tO7kRDxD1QFKTAWkvjCR8
         uGBvFCChFRK6LC3wQOF0ydjmODjKRWbPOXWn3EkhDJjvY095k0W9Yd8DvqeAlCjQ5Us5
         31gcOZ5ugeadDLChnvL0VdRyH3HK6KLXn6CX5NeUMuq5ExzA0T6Z4TYoConbW9ryDRn8
         AGbx60HiCCZMden65PaqjyEiHQuM/mSul/wzyLL5ptMuM67f72y9ky0yarkhd2+xcvQE
         KCIg==
X-Gm-Message-State: AOJu0YxOOp0AoPckNkRx07GSM2uBabmeRnG0X2qbIMfTpSl4a31I9ae1
	/D4861ssOyOQ3NWxTTO4Bexu7cn36KrB+YQlD6HhZ+yEQ5OuTrEC0UTfvsG5ypiR8g==
X-Google-Smtp-Source: AGHT+IHIp1NFYWybcF42eIpSpjJQwg/VDRADtVXgIJH+SS3e8a5GmKma8lTS4PbBUu5OePT2LfV6VA==
X-Received: by 2002:a05:6a00:8685:b0:6e6:c82:5771 with SMTP id hh5-20020a056a00868500b006e60c825771mr5562944pfb.11.1709667343839;
        Tue, 05 Mar 2024 11:35:43 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id e29-20020aa7981d000000b006e592a2d073sm9191674pfl.161.2024.03.05.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:35:43 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1709667341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=buUMhaoDddPV5KgoZBFsQ0zbWZIP6RzvTrPKJ4yK/XU=;
	b=Hjt1w6seAhSWPAE2GzYZ1CydK3Bf7WiWH/SaNGkhNAwpKTm/W0kwtEjcS11hiAsA+KDE6S
	20Oja7nv8RNKd+6pKvYroWqCqdSHZmY67VJCtBk0mFGbE6i7UBFFCCZG+zj4Snet+oztZv
	oYeEFNM1jckT1qUXlRo07Qo2Vikah4eoFB1ZYrzHBBqwFeQdh+XfyHkcXeYsJ3zJxsl2El
	wIKkVYuvE2AGjcKGtYbsGVtbk/4zvXx/iHlS56q0ew04yrcZy3x5wLzcDmH8GqfuxWb+ZD
	d+GVWzdnqiZLkfOgGVVw2+0vM9FjEzQKObIPNcV4wYqwcZcGFHWCKtAOBikqgw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 16:35:38 -0300
Subject: [PATCH] mtd: ubi: make ubi_class constant
MIME-Version: 1.0
Message-Id: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
X-B4-Tracking: v=1; b=H4sIAAl052UC/x3MTQqAIBBA4avErBPMfukqEWE61UBZOBVBePek5
 bd47wVGT8jQJi94vIlpdxFZmoBZtJtRkI0GJVUhc1kKs2rmwayo3XWI7bRirO2ECnVjVAWxOzx
 O9PzPrg/hAyyWXvZjAAAA
To: Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=hm4KaFby4sPHLD2JiItKpumEzYHLr40V4Wmk5RBIVas=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl53QKcNrjktXADPGUmCKaUXE36bdVGpJoQuZmg
 HmIRTdDH1OJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZed0CgAKCRDJC4p8Y4ZY
 pvXsD/9b54CWHkFqIZDw6puqub0R65fpfyCbnBt6KgmF+7+HqrdtyNBPOjJu/UVoWyBPs8mTpF8
 Fr/EuqwE64j+yLE0li0wpiiBwMFNhQg1045pH0RKd2P+uOPt2feROURnw9y2AcqDTgj00Bc9c2p
 sVrcsC0gby0l139OTNhwS4OmIKjBeviIS5H7KGjOa2V9FTcPCKTZM0hfcxnhRdh16287xc8aHtV
 P0gGomJyGhqWmrCpzq8cS7OHY9YI+XeYIQRR/m23GexXGaZfDKtBWeNXs6LWjJRoJZnFk4zygd4
 tl03RvtL/UqU0EVhsRy1HvBElr53MAr0jsB6OKw8jAISXUBjSduVTUc4FjcML4+PWYrUqTzNv5O
 OlBXc+Gkes+bklbvIcLdRF42Jjrx1/NHWgG+NCu7tDypOf+wgdSua7qnzwrfYvBlXFyrlmlh2o8
 /vommG+7f3pGEnEFxzT+L2X6z7FLxG+kFysTyr9TggdQFu3u4FYqJJQJLTSTxL3O5x68CllV87K
 xLYsDozwK24EUqDWz67pX/831S9vNLdPID/p/rdNrjgrIYyV3K7a6nrHFwQWa9jNJ4tvx/SVYQh
 2vdKdYWGsRV9fUAeQbpiRMhLEE/kl4Sr7ip/As6ZU0indk39JSAse1Y6HLN8vrUjpNpy2SsC4Cc
 UEONh4Qs++V3xug==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113545_388856_AA93C4EA 
X-CRM114-Status: GOOD (  12.70  )
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the ubi_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/mtd/ubi/build.c | 2 +-
 drivers/mtd/ubi/ubi.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7d4ff1193db6..1938b61e1b74 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -111,7 +111,7 @@ static struct attribute *ubi_class_attrs[] = {
 ATTRIBUTE_GROUPS(ubi_class);
 
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
-struct class ubi_class = {
+const struct class ubi_class = {
 	.name		= UBI_NAME_STR,
 	.class_groups	= ubi_class_groups,
 };
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0b42bb45dd84..21c3208a9210 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -812,7 +812,7 @@ extern struct kmem_cache *ubi_wl_entry_slab;
 extern const struct file_operations ubi_ctrl_cdev_operations;
 extern const struct file_operations ubi_cdev_operations;
 extern const struct file_operations ubi_vol_cdev_operations;
-extern struct class ubi_class;
+extern const struct class ubi_class;
 extern struct mutex ubi_devices_mutex;
 extern struct blocking_notifier_head ubi_notifiers;
 

---
base-commit: 77bf032528393d2dc9430b3cea1fee8d0762a86f
change-id: 20240305-class_cleanup-mtd-b7dfe2ea8c26

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
