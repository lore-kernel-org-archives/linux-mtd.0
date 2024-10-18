Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FC8D2FFE6
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RJYcLjhqK5g8I4V4+SpjzqDQAdLE8I8pce9tPyrMZzk=; b=N/h/kTkcroKjmj
	9xjeUe71v0W9POPjpXz0K/QWquLf7cwlTNu/f4SntysKzZ05DMY4E8VXxzxMLIw1wdll3HrKiPIjk
	ykPzySoP6HA1m6XQRF/bZldh1VODm3EIWTpdAIVuTFQGRmNpjiuuqsybXEkn9MIgTwHq/krZ9DZgo
	ZX0Twluoc0W6fQn2sSGKynHI9lBwS/FY+89aXmrBZknWQ9Hq8DVh3WjylVGbapLAIAZet65aaQ5ac
	uzj1frmEF4638KEY4EzmxmWZPrqmgTsItCCefKe5LwBSsETthWAXdD3wKZKxoKjy9HevP9xJLQaq5
	VWYCLbxn9LDiTuXiNQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jsY-00000000Iae-43QW;
	Fri, 18 Oct 2024 10:06:42 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jjg-00000000GgY-0g2O;
	Fri, 18 Oct 2024 09:57:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f84907caso2381116e87.3;
        Fri, 18 Oct 2024 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729245450; x=1729850250; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwDAxn8hr5/Z6eYXB0TyuhQ+73+e0ZHcccVnO8hBXVk=;
        b=FLuuD3OKZSi0NH7KxMxgcCi233yXbFccsBL/SwxbNB3JIggnPuDjgZbJfZRRcMdg4K
         5BjZSGqR35HKdZ0Fl31AC0z+74odrg9Kh7o2P4shqWdZqERfvzrvalSu/pKaUUPrKU2x
         RVxtmPUE6jex6GlaATeOVXzYpTjDlg0yEbEORqoLY/RyCwvE7xrFEKhZ3umtkVPeqKK/
         qehpZKd1Fn5cuIfGwWp9fi1pFZ5oitaF/p63yWgj3QCxJo1uGCHeZlaEf4F1OW8JzCpL
         vT3FWRHPiuDqKfKTZoFF51K5Gehdv1zBH6XevWKPgDckdkqITbmKf3+fUoL/6IRZyn0i
         r0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245450; x=1729850250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwDAxn8hr5/Z6eYXB0TyuhQ+73+e0ZHcccVnO8hBXVk=;
        b=bX2tBo52xGoJJRN/MsxwbrbyKFbnRcx4TSuNbGLAU/U4iLO2n2pV1F7wqMxld9ocb1
         V3KzN0VsIE6Ic+Mt16ss27APyyvWY8lKMMTDHPvnQqv4ev+ea8Pu2JXIscibDR7wbplf
         RLSU3qeReuH08KDJHTL0/pSjhYCkShAEaaGIJuO34K7r2vITnXcP5jHFK2HPiuhv5Kjj
         Y9gaG0FpVHoiCJOTyLFd402UHTWUdckWIVOmM9Fg0zssRTpvwkyNLunzLMHMuVGX7KOC
         h0B9K5VA36Ugr2Lw4dVymQmYlZPneIT12LNm6OdRZBVSyf0wdQjCLgnAv3swJFlKo0bv
         BV5g==
X-Forwarded-Encrypted: i=1; AJvYcCVzNHuQShWxfIlPJERu8jNvcP5+Zz5p/rKGIp/OJS8fCjTTV9TNjaaM9+qZ4C4sk5izLnQ7Rs97FUuEkuFqIQnW@lists.infradead.org
X-Gm-Message-State: AOJu0YwEHEl7l+u/LFF1TWqZBuPGSOnVyvypi34VJ351NhmlpsF5jKNs
	ij/gcvMAld/IY+kZ2Ts+1X4lOVCQ0h3NNkxrNq33QvzEHCn8x6pe
X-Google-Smtp-Source: AGHT+IFCdbzl4ckoe26AeOzCWVdM876/TTRWm6BE0Bt9Ffroxi6NaMANv0pUCg2ewGZ8WDCvFjiHkQ==
X-Received: by 2002:a05:6512:1598:b0:539:f886:31d6 with SMTP id 2adb3069b0e04-53a1520bd09mr1167492e87.2.1729245450115;
        Fri, 18 Oct 2024 02:57:30 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b91c0sm175166e87.77.2024.10.18.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:57:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 18 Oct 2024 11:57:20 +0200
Subject: [PATCH] mtd: spi-nor: atmel: provide .size to the at25ff321a entry
MIME-Version: 1.0
Message-Id: <20241018-at25ff321a-v1-1-c8380f80c289@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP8wEmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ML3cQSI9O0NGMjw0TdpOTkZMM0MwNTY4skJaCGgqLUtMwKsGHRsbW
 1AN6JB4hcAAAA
X-Change-ID: 20241018-at25ff321a-bccc1f60538b
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ppPiXEetbt7hM7JgNh/mkoO4MmccshLeXaKKm/hvPWg=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnEjEESYKpmzIrRnTizN1GadHCi897sXAkb4PE1
 HwCMGtRFbKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZxIxBAAKCRCIgE5vWV1S
 MsS0D/4inV4ltStzrIHXTMDf0XFIFsLY4A0au67eF7n2e1zXL5WQhFNkG4A0ygvgBjmzqs1Q32Z
 3cR//0UBINRQ5mRjPnhf+Cs86Gfy0qgHW2QvuEk+koEs+L2LImtrOQKG/GFofSCh9ICfKjef7r1
 bewkX6peCo9GjrjxQwUnjIK9CbhJgVaBULTv52JmWJUpnD0tek+atfdntANoWtIT7OCLx5CIKfl
 uPDRtr3DuzCY7uNnrvWqpnnY6dpufoBSsc4qZuC3/el732PcYkNd1qilruISxljUKxBS0Skko11
 4FNa+wkFzEgR0/fyi0LoqkymzjExTYY16VPD2JCOF5b9QQDdJWnbmF29QGhWrMua4gOxZFHP9Hn
 oMYd+RrlYsWjiHRHIBnj6/H2JvMKXcyaDji05TVA/E23TCDoTg5KCfkGNLxVON/1LtZYHSQrXku
 e0MxXPXLX0DhdAVoLijVUjWsUqDg7FkWdeLYssEvPRfnG5Sd43uekrRLi4deKImrEuAJRxk6Zjl
 eyaVfk3rjjN653wPavDTDeG+fokFaAmW1fclAFmqdXstrAxhg3FcmhM0EBQp5lLWsdJ7JAyO/c6
 Ls8Rq9vzQYXOZl4ienEN9LyB+r/vMXFxnaokWZMZXI1I0RwTypee7AIQxBZgOajyV0WajtzEYzp
 vgZKwEWeowG7ZLw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_025732_237195_6FC9E35B 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

Set size of the flash for the at25ff321a entry.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mtd/spi-nor/atmel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a07b7c61f46b117311b24ab695038f..cc7217e96d0139a06d46f10e35c545f604464b3c 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -214,6 +214,7 @@ static const struct flash_info atmel_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x08),
 		.name = "at25ff321a",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {

---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241018-at25ff321a-bccc1f60538b

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
