Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20F3ECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuodWTNJYlaZoGPK1O6wonTfiOa3I+kGKa0oC4Kb7dA=; b=co5SbWelZxU1zF
	oyZ4bNBLWPCAD1OW62DxcGVV/yJIUuOnf/kHqKprnY9mM0iGO3VodqO1/i9ZRaQZ+8M0Lq/jlnma9
	TpxKZbvZUlbxTycZ/XUnUA9Don1Qztn3yi7k19Vvhom/KGFZLaD7Mt+equc7bj8sbulN1gBLqvKB4
	GNd3bBlhruXuX993dBnricr4/Z0si4mse1C3WP+w6bxYe1k5D53M7grKZaqNyH2qNBMGkfUTmE5nq
	aMGepDO9YKt1eifGCZfj2EXzT8Z3j8FWQgtfKcy1nhp3d0Wrb0FOSXUtx6Oa7SIADJ047lTy8hWrz
	TpusI6SHNKirvvYZhG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpO-003oZ3-Ra; Wed, 31 Aug 2022 04:59:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpL-003oVq-IJ
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 04:59:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id fa2so5386507pjb.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 21:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZSLqohTS3zWC3ZYH6cSkx4WDlm4k5eoQO/pS5Rdozsw=;
        b=ZkY1EVAyvqw1+ZhX6ZzOTWrStwCpvk3AQvBKfrJklea1FbK51MaaHqN6KA8Vyepd+Y
         vYb4FK6/94sFehImvJTAUHgWxgiRDm+KSV+U9+S6+oW7Aft07kjfN/8YXrVFWZOW1HAo
         yidg6zBXHdEwRJvVoVcQLYVUrh51r+DgivGnd4exTWhV87frwq0TizNE21dVx2lSCLki
         V8mwGLoG98cbm322fT73AN31Ne/wOkfg8CwD0tfiNnksmhKZJHChK7SniDIv/CZwjAJX
         6oQJZW+EbZJxKViucZ/A2NjJ32gKy4/LaelTwbjUljvRWSU8HfxQqdBesZA127TjmkX3
         VZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZSLqohTS3zWC3ZYH6cSkx4WDlm4k5eoQO/pS5Rdozsw=;
        b=wn0/ubWuHrvtqcXKKNFsuBAr9qcAR1/YdvdkIxOkb1clQIlTQ1vwIBN88NNcEvlFy5
         Y29ToxBW7CIRP7H7cf4dky5id374E5X2DF4l0PM19GaC9AokZt3n/49H6moKzTaMLoal
         42axlT+0znkxz8OWI6HZsj7qCMttnGH00dgO3MIGSwkMTTQGiziH3IgqIJj0m1Gd4KnQ
         JQr8qbA+AW0BMl9HjPiT+M7ICAhgjdqty2+GhEwXX2vjpwGpAaisDvTs13JSc4OtaqgW
         o3GlqpfGycsz8UEStoBSf2H9CzLxFNC1z+QflYSghacM/4LnDF5OVrF3yPNAtGZL6PBf
         +m3A==
X-Gm-Message-State: ACgBeo3RYciSho+v99JLymNNhO8HDiEpDBLCJyDSKcd+OZWv/idMlS0r
	mMCqFmw6vwalHu7iZaWB0D4Yv335fMo=
X-Google-Smtp-Source: AA6agR6lWFz+FtvKfM9o2ZDziGkyhizW3fbypJ4mfAFDJUyUuFSli30Ffo+RXDyRcgAz0uUeY12kWA==
X-Received: by 2002:a17:90a:b00f:b0:1f7:67c6:5df5 with SMTP id x15-20020a17090ab00f00b001f767c65df5mr1429988pjq.59.1661921984673;
        Tue, 30 Aug 2022 21:59:44 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b005367ef405e0sm10178519pfq.85.2022.08.30.21.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:59:44 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 4/4] mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and  s28hs01gt info
Date: Wed, 31 Aug 2022 13:59:06 +0900
Message-Id: <6350ac204c58b94b30d70c529bf194d953085ac6.1661915569.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_215947_633559_DCC3354B 
X-CRM114-Status: GOOD (  10.30  )
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

Add flash info table entries for s28hl512gt, s28hl01gt, and s28hs01gt.
These devices have the same functionality as s28hs512t.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4f63e9cbb4a4..b621cdfd506f 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -459,10 +459,22 @@ static const struct flash_info spansion_nor_parts[] = {
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
+	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
+		PARSE_SFDP
+		.fixups = &s28hx_t_fixups,
+	},
+	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
+		PARSE_SFDP
+		.fixups = &s28hx_t_fixups,
+	},
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
 		.fixups = &s28hx_t_fixups,
 	},
+	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
+		PARSE_SFDP
+		.fixups = &s28hx_t_fixups,
+	},
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
