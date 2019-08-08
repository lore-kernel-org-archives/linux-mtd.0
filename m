Return-Path: <SRS0=E2BX=WE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF3AC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2019 07:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307D9218FC
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2019 07:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DScVVXPW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtojRtPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307D9218FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o4cSiQljff+Mo76TijGgEBT4JGrijrRcu+ef2oL5cU8=; b=DScVVXPW83NBl0
	W/wuJuoAQHZX7OTSwXbg/TK5SJta2esea3dt/2Z198SB/Ia5x9grRhv9Zhl5jSwexhDg0lYPgM5Im
	jJfumqePonygvFlkoYHsqAwgZBnvaXDJbApt5jWZo1OU4RZmuqTnkDdh0hz/jm8xNQWgxXTOo6l/A
	3YSmZ/1+2iYxPlvk2hCEgTj5WsaHj4a08l+i7Gn6Oeuz9KALLlZaXvVJWijTLPH2u8yjona5ImBWw
	zfkjlxXpWiSHsHdGUUdp8G3ncHI4OSLLyq4i4MSGARvB/6km2qdAdHUYJ56B88Br2k7403RTCIoxh
	J09lmbrjNewB7Hiyq0tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvdCk-0002N4-FP; Thu, 08 Aug 2019 07:51:22 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvdCg-0002Mh-UP; Thu, 08 Aug 2019 07:51:20 +0000
Received: by mail-pg1-x541.google.com with SMTP id z14so6386741pga.5;
 Thu, 08 Aug 2019 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSnnmihUYLaKXzyTPjYYLBxGDRScrz3svy/ObDo3mAc=;
 b=BtojRtPbMAjLmUGMQJ7ClEybpXmv1+Mi+UUo849LLaPZo5nuf6jZnK6D3bQwIswvED
 kbYiM1hgXX4lE8iBai3WptwYBKYczV6YmPJv2Dvc47CpcvGV10QThi+ZVyDdzWcoIGR+
 2As0qPeitNIQIzWxcGvN9W2M/hn7heivuNUKGcWEJ9iFfFdBSlSq5pmQQI+zkafMN6jU
 uPtznbzr6CKpnEcRdMY1nUpmGoZQ9zqz+7C8CNR3vWzjrcwB9+kn4YTGjCuYKNsVM8qE
 7+XQ+dYeInr435rJCAzO5e31+XRunfkyMHyycSnQdfUJpGAR0kkjcSx+3tRGIgJI3AkQ
 RifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSnnmihUYLaKXzyTPjYYLBxGDRScrz3svy/ObDo3mAc=;
 b=eaY0SMQpphQo+P3sSbAwxL1+NnTUEUkMjLY51oZ12hZqvyHotCau/SE3QsIR5f4BDI
 elH0i/9az9661x1l438sVtRFUujfkx7NFLNJPCU9EJ2TjfyRkLvNgVKTUKNPpci6HR8z
 NQ77sSDuGMLxzK+8LZY/9CQaGZpS9U2ouODhG/tbcwj/iKCBjPW/Z1fTvCIR10f4Njj4
 D4ETfpHds7ilhvZ5qYxKZNEOUFEjXdmdhH4sVKk7FqizBKCnJGkDc22J5BNHgw1C9DQE
 xeENywLnJZsKh6L75VlhYE6oMPNVxMekGX9rWwxd7J3FVtwvP8Kdd4vzDaBOVg4Ch2If
 Lr9Q==
X-Gm-Message-State: APjAAAWC/4B6NyHcy1lUbwNMCY0ZGpGZyv0UyABFrPKZ2rWcsGZvf8d7
 eKFV8jzOwjAfm7hCGFHoqxg=
X-Google-Smtp-Source: APXvYqzb4BAVBg0ifb2x9rYLwX8aneK9iIJBFsc6LtMuNn4lmieiAChuS3Dt/gOZYeg60hNjARY1iw==
X-Received: by 2002:a63:c50f:: with SMTP id f15mr11538416pgd.372.1565250678430; 
 Thu, 08 Aug 2019 00:51:18 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
 by smtp.gmail.com with ESMTPSA id c69sm3279009pje.6.2019.08.08.00.51.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 00:51:17 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, joel@jms.id.au, andrew@aj.id.au,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH] mtd: spi-nor: aspeed-smc: Add of_node_put()
Date: Thu,  8 Aug 2019 13:21:04 +0530
Message-Id: <20190808075104.15928-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_005118_982116_56C7CACF 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a break from the middle of the loop, there is
no put, thus causing a memory leak. Upon termination of the loop
(whether by break or a natural exit), either ret will have a non-zero
value or child will be NULL. Hence add an of_node_put() that will
execute only when ret has a non-zero value, as calling of_node_put() on
a possible NULL value does not cause any further issues.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 19b8757325d2..009c1da8574c 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -836,8 +836,10 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		controller->chips[cs] = chip;
 	}
 
-	if (ret)
+	if (ret) {
+		of_node_put(child);
 		aspeed_smc_unregister(controller);
+	}
 
 	return ret;
 }
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
