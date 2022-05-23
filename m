Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF988C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m3ZOHJyAJd8eAtAYRBiXcC8G8LetfiUOqWTZ+OgNLmk=; b=AwJe3uel5Du9oj
	5aDuRDYnADfcBgp4MDuOuQVOFrWx3hO+d2WcfCGP32ZxG4iWyzwPucewH/fDoFuEVIH+oEFsSzkI5
	KBgJNJDn1lfD/9b9vPEQZfdJz5S5fGweKGn1epWPLv8wzHjaMXCEvs+f/DPaYmgDm7pQBr/GtMAoa
	9EMC7oDeocR/PxiahDt1hlsSEywMgmFB/HtUoPstTFOkZG2DAsQ9/bovEtlgZWiIoVgxvttTzfKyB
	hfJSrjvtIYEQ5PxUV83b6YdA9SHcp7/B9GrdR3BZm7/kWUtNRpkOM9/6SWzie+AHiz3ANfsepHlhX
	RLmNryPnnJM0Wwzol73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt97X-004jXA-7F; Mon, 23 May 2022 14:33:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt97M-004jUl-2A; Mon, 23 May 2022 14:33:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id z11so4418201pjc.3;
 Mon, 23 May 2022 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5VXWNPSZA3rC+8/IoRn3B39pVcambgp6FwS9mwBIhE=;
 b=VGALFZc0nYQQoedtnupkwyTglseKhWTY2On5GWZjTBnVdfqeZRtT6V0EiUpJ4SUwsd
 r9zRnVuzUcyDeEjRa1u++eT4aTIC52q/m+Q/fVKQ3QanGuFNW7G8l2O3IGcZdTJf9Ptj
 vNJdha+QWBjmlb2h2upXjluOrjOKlA/5fjH+VuGtiQR8mnzvfFkot6ua1qompAvmKTP2
 rsM61K6/prGiCKWrP1ZOyPEXy7YHuCvAioTCZowwRpVdsQ9hyzAaHmZZbUFHIKue0Jum
 rInuwPcIRCPqJKhB2ASaMyZ7xevms3Vtn1jH86zuT5wA4Ado2Qk5+j7P/uwRR4EidLRf
 k4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5VXWNPSZA3rC+8/IoRn3B39pVcambgp6FwS9mwBIhE=;
 b=YHRTfUPJgkTY1BstxLWXSdF3rlsajBS6nbrK8UaUUbCEX72fYQX/+WA2qLJc8Gt+6o
 LSAbBcsFXJuXl7UhMB8GMUHqqdCWSIrrZGuuBzM3uQoSiBlqTaK+/x+H6/Tf3O2a6ez1
 VeOkzJxoZXDRjTu/1mn7F1fQjS0WCV7LenPDq16Kef3/3RT709MrzEW4TMT6WPSICa/r
 n6GGPWBkQVMpZ+yfvHx1BNe0Q5ANMTl/J8h5+bpR6kDwojwZlJKGjtciUeglO/h1/vof
 98tMMQ/98NKX0JQLyKY3c9NtfcCi/J6iJlHJLWeaBBrwIHvEB/W3EYthDe+oweULlTtn
 URXA==
X-Gm-Message-State: AOAM5322HhGdfeI3nn7NWyPY0d02JG/VDD4JC2sPxgGKjSIqBJShuk5S
 mPEzVmuAkN5966LTUV2XWk0=
X-Google-Smtp-Source: ABdhPJy22fsu+i3GK5N2DZ0aRKa6iZuZr30HkITvLYPMJ/oH+EPw7wfRAJ0866/BtpxvxVyX7CHwLg==
X-Received: by 2002:a17:90a:6c66:b0:1df:9399:9189 with SMTP id
 x93-20020a17090a6c6600b001df93999189mr26896192pjj.179.1653316387168; 
 Mon, 23 May 2022 07:33:07 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 n18-20020a6563d2000000b003f655cf45c0sm4835848pgv.63.2022.05.23.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 07:33:06 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] mtd: maps: Fix refcount leak in ap_flash_init
Date: Mon, 23 May 2022 18:32:55 +0400
Message-Id: <20220523143255.4376-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_073308_138438_8624BC6C 
X-CRM114-Status: GOOD (  10.96  )
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

of_find_matching_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/maps/physmap-versatile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index ad7cd9cfaee0..6ba6a1dd127c 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -93,6 +93,7 @@ static int ap_flash_init(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	ebi_base = of_iomap(ebi, 0);
+	of_node_put(ebi);
 	if (!ebi_base)
 		return -ENODEV;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
