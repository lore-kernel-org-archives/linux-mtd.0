Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07389CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 00:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rYPjIy1nKSILe1Vc/Cx+bNcI7LEcikAoqndvIz3bfOs=; b=S9p
	2D6BaQB31DUwS2LH7Bzeb5Ow1/8Qwnrm2HnFbCHr3JQYTyVWZyWtKlE9WFErjau1S7erUB5P68MZa
	uZlGXefXrauoYa/1Dtz4nF9yLnnczZvCVIhbkEiQoct5SSIPeivBOtWr7U/zYTMWIzKzrfz0zPcNz
	mqINLs9LVyMzLlX8pI8/KEwUGOaout4KX6uhE1GF6YaIxyMLs0/7JcCJMjSZdDA1isAaXczfPNhbR
	wCGQaAmWDqyqSwQGKqDuhAC3VtYAZHnb2hOSCsBwdThVsexKfOrvi2whTJfY5IU1Ss5JFi6NptxKw
	iMOKwhOt6cG7l1dTwvJG0QgY0eN/IXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw8Zr-0000000B8Pe-06PE;
	Wed, 10 Sep 2025 00:20:47 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw8Zn-0000000B8Mw-1mbv
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 00:20:46 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso5821813e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 17:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1757463631; x=1758068431; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=cEG3Y8msO5r8UxMzkcPkAhsiAWmBBXecH9yki6Sd15wGvf8pGXkZoqrqVWkHVNOypt
         jwBpVDkyMMTgJBAIOgw9+g6L73+ysUS3tIvnt07TBPalIIvv3Q5OXsi9wZIWULEJW19M
         YwWEIVAY3ZobThOzWXROY8zqhcsuXL25FCPvbX7ucU75mBQZFZcNciFpCzc6/P9sS1tg
         wIaDAq6mNYrdu71oX/wsA+nrtt4A6/y2WUe5xQBdE8sxrSkNUQ5ur3c9e4s5ofoR4AYX
         nsr8+2bLCExCsyWc6QqK4iMxIf9TEgrpuvzTzirCjnrgwhVv3/aMk69+MqKsOXuxoyeH
         cNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463631; x=1758068431;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBluRc4AqYa9mwEBFMC/KLTpnRIQOHur+1Rtne5kToE=;
        b=NhYSVdeobcJNC8BmleD+gVYNpXdZG0CaIhT/L3fnPXHwTUfcd8mVKBo9Zorr+2+QhN
         gxLN3x8UdDeB2dyItRe5Rl1e7Cy/FmcBchc6cyn7vK1zAvsmk30lBdiTxQmh7dDOkRZw
         hrRfnttN3v1U3pfVhTecM0genqUvokGVgkc6+Sca8cDUeJ6XeiLz2GjOUgsZeifi80Vb
         PkqunPHXPEf73RXtKLEzAZ24wtzqzgA3yYaLI3zHm8N82+7iPRICEcux7bNB1kJyH+8O
         tovAhM1XLG3nPwG1jcdCjC2W1reHLflvxaAHQ/RDJzjnBFbXOi6yu56018YXbYTJoWnA
         tLYw==
X-Gm-Message-State: AOJu0YxsAsFNbjsxmhzN/pnXKFK7+pprOCMPSxv1Y37bO2I/rBcSwN2f
	pq1H9AoUZAWTOMtdjhUCcS42tnlhlFQDLWpgWAcHd9vj0PGVXDRnPnODP+OWdJunMxJbHb00sLT
	Uko+WhVqe8mvs9//rerT1W9jqAYpLm6sttRPU/1vqtyr8jxEQfbVdR3Q=
X-Gm-Gg: ASbGncsY5Cnek45h+NSG0xnWMEvvI/3ap/pX3PfspD3HGYMnM3SqI9hM3qqTaCigHY3
	b4ROTETO0+JyS3xnvfDdsNMNU5IZXj5LmxHvgvz+Mug5rGfUCO/3ETLcScOObsu1SsNk/JbJ63e
	QnLdKOKGMoWjekWfGZqAgohES6sNg+Lai+76VAy9SD3BcjEE6DoMdlYvsDJmRAAMSL+qKiYg01k
	amV2x11PDI58n30IA4=
X-Google-Smtp-Source: AGHT+IHlRbEh6Fd4uHZeP2GnSuo0Cg0aW9q0IeNzGVC5i90l3bMEtQ/tnJyN56EVLzH4aO2kIpBzc9XiUmxkOlJ76Xs=
X-Received: by 2002:a2e:a008:0:b0:336:93f6:8e70 with SMTP id
 38308e7fff4ca-33b56fb0c23mr24562181fa.8.1757463630732; Tue, 09 Sep 2025
 17:20:30 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?S2FuZy5LZXJyeSDlurflrofoia8gVEFP?= <kang.kerry@inventec.com>
Date: Wed, 10 Sep 2025 08:20:19 +0800
X-Gm-Features: Ac12FXx69RZLjFlLPzNwJIMWTv9cI92iEqJ8ic9zg0GMkmKmVKJRl9nJIY1Enmk
Message-ID: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
Subject: mtd: spi-nor: Add Winbond w25q512jvdtr
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_172043_784551_A095CD9E 
X-CRM114-Status: UNSURE (   9.27  )
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

Similar to the other ones, different size. The "JV-DTR" suffix is in
the datasheet, I haven't seen mentions of a different one.

The datasheet indicates DUAL and QUAD are supported.

https://www.winbond.com/resource-files/W25Q512JV%20DTR%20RevD%2006292020%20133.pdf

Signed-off-by: Kang.Kerry <kang.kerry@inventec.corp-partner.google.com>
---

This modification is add BIOS W25Q512JV-DTR chip to winbond list

---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e12..6ce5f70bc11a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -146,6 +146,11 @@ static const struct flash_info winbond_nor_parts[] = {
  .name = "w25q512jvq",
  .size = SZ_64M,
  .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+ }, {
+ .id = SNOR_ID(0xef, 0x70, 0x20),
+ .name = "w25q512jvdtr",
+ .szie = SZ_64M,
+ .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
  }, {
  .id = SNOR_ID(0xef, 0x50, 0x12),
  .name = "w25q20bw",
--
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
