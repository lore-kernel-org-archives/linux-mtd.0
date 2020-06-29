Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727F1C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 19:53:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4832C20674
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 19:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uww30OM7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVz8Oiap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4832C20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wo7XKHERepOerZQ1vx2Sa6QV8yonvQjW/5agt3OrpUo=; b=uww30OM784p6WVELKgam/QTVfN
	Eb/9kampgjXnU8BaZ/dNMk956YqbDOr909NT69VUv23TyHiXd2PY/QfPHL3HZ0Rf5H6Uj9kDtU9bm
	Ni2SSMLAiRO7AOChSTwrHR1bxn8a1uLf3GFZRrj8AvxldXvOXlkxm/uklHKx5oQXgwvhzCMViTWZI
	jFYEieVoLxN8dqb/FasGrs4OyWYlgcV1h6qqwSyQSXsfl1FP+LVSM1oCQrQ/kizKluPurnMuGFgGm
	GdrArLq8ZJ/CA4ABhTqkVO8fcc9vWk3g2rB1ZZBpLWm5MtB6tEZaOqODz6frVA40QlUlXNcfZdOCf
	YHs0thCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzq5-000088-Nb; Mon, 29 Jun 2020 19:53:13 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzq3-00007i-RF
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 19:53:12 +0000
Received: by mail-qk1-x743.google.com with SMTP id c139so16402586qkg.12
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oyEodCgkXhNOrxY4Db2raIEhJBe/zcrPZ6JM1bawZr0=;
 b=bVz8OiapgEka8x6YtNWVDwk6aWW04aYZrWQR1RhB3i8t5MbJ4ylwQLukcm9wzGU/40
 tLZ0D7YQrL9fWT3i0zp4Tkh4NN+IDCF7wdSaKO5oN7ARFc6wClflvVFZ/queIBBjAB8T
 nIMmXoJBEQL3RM7KH/VVoktOklJgn4lUTRkXFNq+dhL5EX6KCGfuIBdUKCU+xN6f6cQF
 PTdLT6rqPyEouO2b8FWpA1wZFNGBo9w8WvD1v+/t+iF5AmjOlizau0LWULoERm93Ybkb
 eYTNBycgPYOHH3JLAHWoaluu+mVeeqJpcD2aaRD9WwWAMgRy5ZOzbxxWH8LL4kF4O+Mo
 2wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oyEodCgkXhNOrxY4Db2raIEhJBe/zcrPZ6JM1bawZr0=;
 b=Z+YXkPpmD2JkuL++hOAgq+Rlh/7bPhlr7dXq/6X9qxEdCjFd3Az8ntjgsfd/9irBE4
 I4HFtz2tmVrkw+tLVLUO0bSMSbdYWaAIOciyxX2CfTyTby2lxzn/rMl2wlzoY9cX4m4T
 YLzUDsHCj3Spf00CVORFfZfcLPWxUtIrQGIuMKTJb828v7uroSYo+xg6XJPJwnYXQwWL
 l45McJCj7tMBidOVg0RwyatZ1Ot8YU+Jn0Y/fh52H8tXDw8xuxCUe5ao0VQ9w0LyGSnf
 vLlgBOwWQadxbZClt0DaSGBGOI8enGxAEjCmTQUXSQ5mH/hA80FwXTpqFzGvVM4Q3uHg
 M4NA==
X-Gm-Message-State: AOAM5307NK5AIU4C6NaLRUrikAFcXwkQ3ECHisok759JeIBgpWDkBwPI
 1b9dZa18EgIt6HPu3GAgTgM=
X-Google-Smtp-Source: ABdhPJwX18jDoBGiBdMyQNJUUV/2hvnsDjfOh/ZD9ytFt9u/2MrGF+GqE0gb225g6POrhgTsWW24mg==
X-Received: by 2002:ae9:f814:: with SMTP id x20mr16596296qkh.253.1593460390137; 
 Mon, 29 Jun 2020 12:53:10 -0700 (PDT)
Received: from localhost.localdomain ([72.53.229.195])
 by smtp.gmail.com with ESMTPSA id e25sm655098qtc.93.2020.06.29.12.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 12:53:09 -0700 (PDT)
From: Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v2] mtd: spi-nor: Add support for Winbond w25q64jvm spi flash
Date: Mon, 29 Jun 2020 15:53:06 -0400
Message-Id: <20200629195306.1030-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This chip is (nearly) identical to the Winbond w25q64 which is
already supported by Linux. Compared to the w25q64, the 'jvm'
has a different JEDEC ID.

Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---

v1 -> v2:
  - Tudor Ambarus: name the chip "w25q64jvm"

Tree: 5.8-rc3

To: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 5062af10f138..18bdff02f57f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -65,6 +65,7 @@ static const struct flash_info winbond_parts[] = {
 			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
