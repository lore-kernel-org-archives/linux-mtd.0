Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF1BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63yErSIWeWeuvAp2myExpWDuLcge7d4l4cn0sP4xQso=; b=IlApLU45ZX6vOX
	fge1b58XK7+0RFahWEvyIkLP7kNRD9j+LQD6y2vme4LRLQk7izniuFHqmstlOYSdr76gj74dFHtsr
	x/JQ96nrDY+glaNXt87yFnYr0+JKKKOzcimT3m8T3VVmXNGSI75FG5+MhrieVqldOarN3hfdUiE9d
	y7uqAcOrQfOB3HnE9D9ugWkHFXSXM656QxqrrNqnwhTvTBMBydIxDg7iQTBVvKoa4Bz8xZuqxST3O
	ONSVfNxj5S74UhfTQmrdwxOnzUpm5+A2BhiOAYUBE6jY8GD8Cok3viLUBPfYzIpp9X+dfpjixSabW
	UfGJbrB/qxPE0ohdUlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjjb-0083cR-Eh; Tue, 21 Dec 2021 18:19:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjdw-0081tP-EK
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 18:13:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso2306409wmd.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Dec 2021 10:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkhoH6+A3+y/RK4E+6wgX4k5jzA+vrkcJUVCORNbtSo=;
 b=Mj6vdHiFsDzeaIBFBNnKFpUWdLETR1MbAKVKzY9oBtojNCZB1rjtlLBQHBhPR+M37Z
 gI0s/LF0f6qf5f9opvHxB4YLtMDaOc0alxsNEzg2dZkyy9B3cbBV5FAhdMK/M1FWpQ+e
 ta4f4TuEbQuFFCEw8LOBP5RraKTgxWxTlRsxleUcViwBPvTh6kCZyPX3QA30m7laeOsE
 lKgpPuM9KniuZn9TtTC0vWqb/vI1rZlQPCemSL9q1QE6mYfF0dsR6rBlGZ6p7RzpO+34
 xdfnYQ7vVXw/bRt1IWI8JFiowfKD6kDeGY0xEH/OgTDH+k0vDIPdNaIwr5Rralz1Qf8G
 xLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkhoH6+A3+y/RK4E+6wgX4k5jzA+vrkcJUVCORNbtSo=;
 b=DXGNcIGiSRMfzca7HXlanWxBGsuPvEWHfzB6kI4MY/lcPMgG2zofobjsLPH6kN6pY6
 bNatgFmFhVCaeSzLwXPTdaq7dy2Povvr6L4p6/hF1RQMQhRH/5aVyiDhXOyAEFsjAZCI
 gvHCCtyXjtIeyh70rXTZbKVgPAZC0Nfm8rg1AtSvy67STrzLtYNB5Y6oLIA+x2qUhjO+
 UIDnDIhnAHswYanQgGdsKeWQ1KXNf3/7T4Q9ppT+EszK9TYb8EwbYSRUjzbKyG7hkSPC
 I4df1ilW36BwmJepTmsESDCjrrZ6EHhfxUwu5QmHa7WdzFVis/XRWMk/OmzWtugvQf6b
 nNLQ==
X-Gm-Message-State: AOAM531i5ElLYhteQcJRe0EScYj1Ut3sd6gxT10otrCS1P00ltWaC6VU
 jLLFq053LwFzuK+amyrilCs=
X-Google-Smtp-Source: ABdhPJwoE6twfKQaGyivNwy6SByKI5P04Hv6OPekW5ZnN1vGmvjEL2idDW82hlnSVZe+AlL4DY/ZBw==
X-Received: by 2002:a1c:a5c5:: with SMTP id o188mr3837273wme.22.1640110421576; 
 Tue, 21 Dec 2021 10:13:41 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id j13sm3276069wmq.11.2021.12.21.10.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 10:13:41 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: omap_elm: remove redundant variable 'errors'
Date: Tue, 21 Dec 2021 18:13:40 +0000
Message-Id: <20211221181340.524639-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_101344_523080_41A308C7 
X-CRM114-Status: GOOD (  11.64  )
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

The variable 'errors' is being used to sum the number of errors
but it is never used afterwards. This can be considered a
redundant set of operations and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/nand/raw/omap_elm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 8bab753211e9..0b6aeb269c33 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -282,7 +282,7 @@ static void elm_start_processing(struct elm_info *info,
 static void elm_error_correction(struct elm_info *info,
 		struct elm_errorvec *err_vec)
 {
-	int i, j, errors = 0;
+	int i, j;
 	int offset;
 	u32 reg_val;
 
@@ -312,8 +312,6 @@ static void elm_error_correction(struct elm_info *info,
 					/* Update error location register */
 					offset += 4;
 				}
-
-				errors += err_vec[i].error_count;
 			} else {
 				err_vec[i].error_uncorrectable = true;
 			}
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
