Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707CEC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 23:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pZMP+NgGRv/wi9Vn41HSJdK8/QaZj7sPfNUU3A5BLEk=; b=ST7tezPw0bSa2V4a0LnyzWclIt
	IYTNIm07IxAHeC/Er1uGcY/8fdIq+btq0xVk1LNMBS8t2gIsZoyrRfrMHDpPrkS3ZPD00p2QWd9b1
	oSGOhKhGscRAkB6ViH2RVRpX4WwfVc+rtR7TgeDxgWGGTNOwGlQqJbq2J9kNqTrDI5Gspjpw4PIV5
	2Jai0bmJuLA4qUZ+dVsq6/z9Yl6DstN/pkNAUkhrfnTKHxXkvcI/maFL2c8RoRhEPgmAfWZkaHoCv
	4ubPp0D3G+25G0Op37zlC5gkCgXYh14qoARof/cGmmKp35rN2Ei+e7zCGo1g4seLtPAjE4AJXdjOs
	WLDTvnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhgSc-00FOqd-Gk; Thu, 21 Apr 2022 23:43:42 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhgS5-00FO7M-8c
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 23:43:10 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 l16-20020a25cc10000000b006456cb3d1deso4347304ybf.14
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 16:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3fAx+rY6rT1xlegKzoz04pzJajlBuz++rECMCocuCig=;
 b=UbTvTm/eASLKfr2ec/HX9XZ4OkYPUdY+71Bz3IlA0uDoB0X9BFAvn+p4iLdDlKRJFx
 9cCZAgiYxIpayn1hBCEP4jMhUI5XFXwJlufnjyuXlxpYBNtFAdlB16M1+Ts5FmJn6pps
 SHiXEgSo02E7ja85rdFF2S8pJS8MNP+eyJz/wH22M4HlfymbkdbSzj0SeQGNKXOIZKP1
 a6EA/8dw59pmncwFnHPteR8oIUysF6b4ySqT2i3mxoescrrkF8TaFzoW05fLVfHByxBQ
 qWrfX8/asvPnpnt7OHWXErwa3rE710sh97MXhNWnttipmgfwMzC886GsMWbc1ADGu3dy
 uVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3fAx+rY6rT1xlegKzoz04pzJajlBuz++rECMCocuCig=;
 b=DL4kba1hk6G15jERB57c8Lvz3IE8fiWL7mhpowxuMkDlAYx5x+YoXAYW4lhlosp0Jg
 4L8M/oIcF2PjMpy6VJyzLp/tvNYyWtmVAe0jARS9Q1BysFPysjCILVdDzPjAg/1LJaX3
 mWsbEwPiHeFxp+8FWsZOBkPR8jotCxh5ZnR6o6vY7qlqPlgXk1We2dBoVI2HLc6DIOOd
 kH7/y6ztquGIsdV1amMikulDZN/vJ4cuKQfznWpWYteI7AhWed7sTmw/g9Wz+EPZxMsR
 8A1e78JL/QVSnVedE0HbfYJMPP2Y+qGqvQMtAKBZIk/Cd5cdDXz2C9HaWDp0WVlnFRFv
 GjaQ==
X-Gm-Message-State: AOAM5319LepUck3pyd++jcSckNHr5S7aXfF8ov9O1vQNzi9JjImKqF1k
 1wuBt/1JDetq2veLd0V2io/gR2JeZIKR
X-Google-Smtp-Source: ABdhPJymA2xC8NqGbX5ElL/YJyaxfLAfOURTWcSJhoZtPTGmOJlQtMG/mqzIM5XVcsfzDKTJGsHAs+ZS61jP
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:fcea:37a0:4467:e04f])
 (user=jmeurin job=sendgmr) by 2002:a0d:e8d6:0:b0:2f4:df67:6dc3 with SMTP id
 r205-20020a0de8d6000000b002f4df676dc3mr2319812ywe.57.1650584587154; Thu, 21
 Apr 2022 16:43:07 -0700 (PDT)
Date: Thu, 21 Apr 2022 16:42:42 -0700
In-Reply-To: <20220421234244.2172003-1-jmeurin@google.com>
Message-Id: <20220421234244.2172003-2-jmeurin@google.com>
Mime-Version: 1.0
References: <20220415001321.252848-1-jmeurin@google.com>
 <20220421234244.2172003-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 1/3] mtd: mtdoops: Fix the size of the header read buffer.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_164309_402404_E575E5AB 
X-CRM114-Status: GOOD (  11.72  )
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

The read buffer size depends on the MTDOOPS_HEADER_SIZE.

Tested: Changed the header size, it doesn't panic, header is still
read/written correctly.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 227df24387df..09a26747f490 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -223,7 +223,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
-	u32 count[2], maxcount = 0xffffffff;
+	u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
