Return-Path: <SRS0=c9LV=M7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23B7C4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Aug 2021 07:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0AC60F0F
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Aug 2021 07:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E0AC60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ukU5WxPbyk44Ufqzv5vj6WOXu5ewtblYYzeT1B1O7FA=; b=RQpGBXMAcv5IgP
	/6JKrBWh6JXHSHPS9xFR4NbGD7ZYwi0EpN5OsJioF0roqZMLykDdC0oI0cYR8VL2NWJ+vA0SUZP4t
	DbzwgYr7KXIjR2u8A4AzKb1SXfBQnR2wFGBnawoMb5dq8nHyJy2wxgaNpavh+/cgpTVcsRTIkQdl2
	3t/jirbTO9P/P2KiYhmhBsGeRKDClK1o8v2+moclAQyo/2CPbPvIeIWZ9CaMzqXOoHUq9sY7w6N5s
	4GLB7GdMeIKBJ0ulKa94IEx++18vR71+/hAEpOcqnH9u7Ilw/41adiIIFjBSphvowtV3QZyuekvd1
	ZyAs05LtFkROgy899fcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCdCr-00FcTb-7e; Sun, 08 Aug 2021 07:26:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCdCo-00FcTF-Aw
 for linux-mtd@lists.infradead.org; Sun, 08 Aug 2021 07:26:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so8931979wms.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Aug 2021 00:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=vQGEpzFTHdiNMrj1IbLwx7ugk+DGqp8L3qv1oj8hD5g=;
 b=DtU5r9zVXntBuZSdHA6FnR+0AKscgfFfZOq2IHsQWipCUnwXWAZA2ohzu5H3+ZYo8s
 Plt283LNlbdNpERvVnwgb9S05dkSb9SEu34kp+BlrVd2pPeo2/409+1Y20+KG01mpTNU
 HD2e3N0RjIGsJA3wEXPv9lk5tcb+KbD/8RUcH6LO5x4lKNkA/mw+TJ7+g2+Nu5zlYGol
 ajEFCB3AbyNdH6V9d73+Ge3oZTSG0PvIIok0E88gAhszE3zKYS5gr3rdn44dbiiUmGSd
 vbrdS+vGvU6uco1R9wfr3wTifs/Mt0Qp3uzoTqbM/1bF5CB6YcZnFT1bvZgx73TJAiC+
 JpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=vQGEpzFTHdiNMrj1IbLwx7ugk+DGqp8L3qv1oj8hD5g=;
 b=blesCyPy+nYBynQcAX2MUoEAnYj0J7IdlTWU6DUiWWbL3yORu/sESPhmKSZyZAuqNV
 3m83nPi2I0hISza8zvQzM07izSVOuztl8dbul0Ss4WH8TQWBOIsAulmBcsVhwtaOdt6Z
 9THCVMkK7i4wHYv0qovrvpts6MjoTHgoTHeZn0vIkREnLUuS9h77BxXPm+3uB22/cKDa
 W8DiSy4OvCQyXycAJQhIcD9dJjkWmARd2NMloj3fjNviMQX/znagCamyo8nuDca8ZziB
 CIMt06sjzUQaT8k7agE3bzhqvgYiRvBvZ6Du3/mgR6HH1jJvc2RZG3AtAE2nhHGV+GC9
 Ycow==
X-Gm-Message-State: AOAM531DIa6ZkkVtXrzprppxeHazMj7YcbaSuH+fv9MjJve/BTPnBmS/
 FGCY77QTwhRHr6zMwS0Yn7k=
X-Google-Smtp-Source: ABdhPJzff5Y98YpXQZTZOV86JynYtLA2tQaUfwWAqrpGuZ1e2BHqrq8hPzTKZQ2KVi3Zy/vFhga3NA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr28240065wmp.165.1628407604320; 
 Sun, 08 Aug 2021 00:26:44 -0700 (PDT)
Received: from ubuntu ([155.133.219.250])
 by smtp.gmail.com with ESMTPSA id i5sm15072205wrw.13.2021.08.08.00.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 00:26:44 -0700 (PDT)
Date: Sun, 8 Aug 2021 09:26:43 +0200
From: Daniel Kestrel <kestrelseventyfour@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Kestrel <kestrelseventyfour@gmail.com>
Subject: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use device
 tree setting
Message-ID: <20210808072643.GA5084@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_002646_442978_9090639E 
X-CRM114-Status: GOOD (  14.46  )
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

Some devices use Micron NAND chips, which use on-die ECC. The hardcoded
setting of NAND_ECC_ENGINE_TYPE_SOFT makes them unusable, because the
software ECC on top of the hardware ECC produces errors for every read
and write access, not to mention that booting does not work, because
the boot loader uses the correct ECC when trying to load the kernel
and stops loading on severe ECC errors.
This patch requires the devices that currently work with the hard coded
setting to set the nand-ecc-mode property to soft in their device
tree.

Signed-off-by: Daniel Kestrel <kestrelseventyfour@gmail.com>
Tested-by: Aleksander Jan Bajkowski <olek2@wp.pl> # tested on BT Home Hub 5A
---
 drivers/mtd/nand/raw/xway_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 26751976e502..0a4b0aa7dd4c 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -148,8 +148,6 @@ static void xway_write_buf(struct nand_chip *chip, const u_char *buf, int len)
 
 static int xway_attach_chip(struct nand_chip *chip)
 {
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-
 	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
 		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
