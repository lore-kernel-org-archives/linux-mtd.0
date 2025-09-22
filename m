Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ABBCAC5A7
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x86V81ioPS21/OfQccMDqXa7xiaiikDXgFITOkfWNaY=; b=Gcgmz7KUg8356x
	8zhrxc3lRBjiBdQbVRflkHG+VMDvQjGNY+WAD3e25QfWK04toA7F+pUgR3kvUO+S4xMAI7BiIfWxx
	ne4xP3es827UUGT1ZlStYgi83qkdWqbzvhFwze+3c/UkSqyOlR/WMTdTMLCpkLFu1DCdVqUGgOBko
	mbVoXrrnRR7A9enBdjyzE2WqvkEleFa3mTpkX9WzRZuzccg1+8pF6VR3+jfDGzPI3eXMScLR10XeH
	0M6k3Dg9uQUz+Re4CSpJrrUZkmvP0okpANjpltj/kUQ2UA3pV33nazoONfsBUQw/0YChdMs7LAL0a
	MqmnTl4MBd8twaNenPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eOT-0000000A9Te-0Klp;
	Mon, 22 Sep 2025 11:07:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eOP-0000000A9Rv-47go
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 11:07:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-467f6fd4e82so9960425e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2025 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758539256; x=1759144056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=KGi7IzXtKJywdh2Ca0jrTMUD6kJw7IDOiEeLRZmvhxH7YdQobAbg2sIOubwm60V/Ui
         aWfCZxW5l5o5P8rRsQMrnaaHpU2SB+FxewjRCjyCZg5CfQ81QjfVzh49MCcqD773fH0a
         P050NgKOg7tJeZ2fDiqmr//7/SINdy5DLuwIv9Uoscdl3FslIqsMb633a5Z9d5AUKU+6
         51WPNAAY5lKrNYQzvUXL46Oirh06yiQpJB901V86V+kTMNHFswfxkZ5QqzdqqQE7pAVv
         /ZIRRJGIzUWWTgoBTkMobSDm7kvZAjL3ridyy1usVXSAkR15mmznpAKr0mG5dgIKIsab
         qArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539256; x=1759144056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=tgstaHSsITcbUt9U7AxCtYVjQ/5zN48uAAmjlEQP49P5cS6bIZg5atva5HRh6wwrQD
         WpSc512ASbyMx6Pc16vmD9jExeoOHDmUXwDg2jhYG1BCo9ad8Txbh27/UaePB22B0DhD
         8G4Z/YHefR3aqX9gWizEP686Ztl3TasDndnhMARQYtA2nyZL2aTaV2e2ZbcvnHE/Lmc9
         qVhQgPtQiDHyRgci8z5ovb1qBV/RxWYP7pYWTtPnjDJ7QVSacI6zEkMByLBgKqUV1aIh
         bpO/5iPdkB9D7g0W94SeGj0PwK8Hqg1VES3Pf6BN9xf8YVv71vzNDuTzSEVDmJnHVwzS
         TqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXXDms9aKhZBbtbNMvryVebwnfhwRuCEKnB0G63aJxPqbLV+4CxZgbysmcbfyKCXDdYoLQc6o7QW4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Tb5I3pMAkAgwi5BcnUYKmsNCAqUzZ/oTev1zxG0ry9Kkrywj
	vPu8bibdpvwcOsh0L83xYqMpf7XAQosljxy5fZd/xu0wnOXbKhWjh2Gj7R4g+xDoJak=
X-Gm-Gg: ASbGncu5tyDai2A7lLt9l/vtyjF7xeD5i+qTfbOu9P5IfTf4QFUsRsSvs4cKJ0Cv11W
	7coWCgy1K771UqazFOoEtm8RR1/ApUtRCuEm3K5Z78DHe2Lij40waG9b8EXka3qvPHykvEol/qY
	gnp2hdk/UUQ9MyJTaU4f/OjjPgRXdCSRsXxisZEKDmoVweUcnIliDPKJgVnJCXEU0IdBGOGqiYE
	kAspLLZgTe3iQgrhrCczja5t6MXwlIThvBloBP50wfzY9l9gv3RNSH+TE70zgwjgwUswVEAqqTw
	HVKNzbkeIDYTLAdI68y/pX7T/TYrYIcj0gdgruBeOAnW1QpUqai95VYkV2bgi56sWolCnj22iAX
	wBwEZ56WD31S5cC15syArnvXOdy+TFkM=
X-Google-Smtp-Source: AGHT+IGuwhHEO83sfFCU12OTOC2+vkw5qcfiySY1IUg+z3oQVKsK98ybPmO83IDuQ6N/NzO8qDOnLA==
X-Received: by 2002:a05:600c:1d0d:b0:45d:f7e4:87a3 with SMTP id 5b1f17b1804b1-467e6b64fdfmr112379105e9.3.1758539255657;
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
Received: from pc.. ([105.163.156.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f53c4sm19524684f8f.3.2025.09.22.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
Date: Mon, 22 Sep 2025 14:07:27 +0300
Message-ID: <20250922110727.1423318-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_040738_047901_5A276E9E 
X-CRM114-Status: GOOD (  12.05  )
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

In case of a jump to the  err label due to atmel_nand_create() or
atmel_nand_controller_add_nand() failure, the reference to nand_np
need to be released

Use for_each_child_of_node_scoped() to fix the issue.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index db94d14a3807..49e00458eebe 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1858,7 +1858,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 {
-	struct device_node *np, *nand_np;
+	struct device_node *np;
 	struct device *dev = nc->dev;
 	int ret, reg_cells;
 	u32 val;
@@ -1885,7 +1885,7 @@ static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 
 	reg_cells += val;
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		struct atmel_nand *nand;
 
 		nand = atmel_nand_create(nc, nand_np, reg_cells);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
