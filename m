Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9403D2FFE1
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0mb7jFm6ALFXVuOax/CaLAHI4QKMy0JOGbtj2cmcqiY=; b=GkxQFJIvQIQVlo
	sCpQj//IyaSrjyW5ZoNli/7dLqlHSSy+D6LCf/YVYAX7/fVViNTxHUwtGfAgkjSE7jZovNS5V17PT
	bTUWScdhdurMUcAQdlu0NcFID5o/FcU6rcKEHAw2pAJiaPPcSq49N24Q5AzfiHV/Ol3Jy/fB3W/Vb
	9wF1Ja16c/++3ZhLeuSN7Zy+15nvFPQU4m759ZS5Sx42cnoREvZ/WsrMGKYtJLoD4sQ4MCa2P6fdM
	VXCz+hEXFmPQtfQnmG3DDxv1TMHfiah6eILFOdMoIO9H9mmNdQy0zPZPkz1ypekKG9x7KQFLnKDFF
	bfHd3RE7yhvtBrN8rRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jfV-00000000Fm3-1SGJ;
	Fri, 18 Oct 2024 09:53:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jdy-00000000FO9-3suG;
	Fri, 18 Oct 2024 09:51:40 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f72c913aso2392546e87.1;
        Fri, 18 Oct 2024 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729245097; x=1729849897; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDyS0J1pd4vIGVt6v9Jag9N30v2NScqXZqalv3DOEP4=;
        b=P4C83sZfZZHe6pBZzG3MW+ct4L97OyjtYPR1gAu0H2v5ENUfcUkda/zeFlx9xvRg9H
         rEWs0leeL0AV+PYQoWj3F9TxjoKs95YFxb74ril7YjMiEXJpdjcfJKCMwbZSV1kaGaK8
         Ii63763gOJd4r5mXFrhVG8lcCadXvm0T6bw9AUBEK+b6zCzplgTEu2SFCtnKEGQvWGQD
         p4TjNSm8X69z99gaa7ayuy2dBgFYQ/oJ3fZbmNZfL2i3/7LW4ZVBwCqY7dqlWznWbgsH
         5pQFLiayK4cAo1gKO0QYYNZF0OcXXEj49YCq+wGHZW0reVFL9iG7/9YvdJP985MvMU6D
         5yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245097; x=1729849897;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDyS0J1pd4vIGVt6v9Jag9N30v2NScqXZqalv3DOEP4=;
        b=o3LUmdbooma3TD4tdysJvCmbNnza2aGIxh4RqfsXnw74rIhUdzppw6Yi8sX0jbxLDT
         3jU/k6Q2U6YmrLUuVNdPNJUUZhTOWbBrysArqFgpMnlsvRViFm/a4ufyRXVtCFo518iS
         lDa+b4ct5BbSHSb1Dpe+3xKxERf3Y96aGDc1UrhcUnwq7Qp7Zw7XHzIqGH6Tx1ebRMGI
         GWEAcjUNk38r1KeWF/tCBNI9pfvIbKMJ5iLiF+ysS1ts9PmwsCrHadTXt0DL1++I2RNE
         BejP2DeZaPzmRwdqcmy0g64prS6Pj/Ccb/fs9Ya2lb55SZAQkxd4xGvNva2m8YoZ6k6U
         ZCmw==
X-Forwarded-Encrypted: i=1; AJvYcCVmxi5ig/T5Qw81cR5JnlMJ9gvSMDDhb0hQApmYHkq6I8C5mlBmMvayO+a3ice9nvvdeB8NLRwS1joBq5pBAqbS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3uAub9ZMwRlxXg5yhN17SOoZdZfJjPFjeIm7pHOztVyj3rEbV
	HOdCERR3tlNbXeG9ct9j2c3yue3tRt+FLJ150OLQf5vRnGFpkoEo
X-Google-Smtp-Source: AGHT+IEhJfxVayyxRoNDSoLjmVu8Qhwdgii53gm5tk06UmrkUVlirSIR13xwqIUHTLhXDvf349Bsqg==
X-Received: by 2002:a05:6512:39cc:b0:539:948a:aadb with SMTP id 2adb3069b0e04-53a154460f0mr1356938e87.42.1729245096567;
        Fri, 18 Oct 2024 02:51:36 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15204653sm177458e87.210.2024.10.18.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:51:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 18 Oct 2024 11:51:19 +0200
Subject: [PATCH] mtd: spi-nor: atmel: add at25sf321b entry
MIME-Version: 1.0
Message-Id: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJYvEmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ML3eKCTN28/CLdlGQjSzNLi5TURIM0JaDqgqLUtMwKsEnRsbW1ADN
 XJvVZAAAA
X-Change-ID: 20241018-spi-nor-dc29698dea0f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zB2nL6YlcN2H6tu7PPX7gZOJOCDXq4EG7fQ8xmS8XNM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnEi+gq2DdE829Xn7ZKAUDpSaaJbhLGC+nBT7/+
 OYlzom++BWJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZxIvoAAKCRCIgE5vWV1S
 MnhUEADCqk2yjn11uEhZ0+drX8Era5Fzmf0Q8O93uSndh9JPBmRGUX3aYBiaWbRQvEt/EKAWEAl
 204lB094Q82kaUDR32UQuYwcVKOC1ukElBhPY4cxrNXfHA1n5cE1LGJ0Y6HpkWl6ftUwixHoWiY
 SRE+gTQK64Tb8Yi/laUQmaJ1mr2pNtDI7AomIvkbqyRX9UlQq7UEaFAMAFw2VoDWx6hBm/EtNAL
 aGGoiLskIk1b38meAzy4vsth+PYf4bOpiza+sHqznw4QAMqi1lxkzAyg06uat5MUiFi0g1FLoiB
 uSl+uWPLhyr0aEe0FrFtD1IEF1PFEjncmVWa1SXIEKltHTsKDHxxXmQ1OKO+k6y2dZcQNOoUomd
 cCnX+M3r732ggmlK+8zLvv2IZNCUjs9fZdaJu41p0bX5EVk2AXhY79D+d4e5+XQ19mIre/YRSJP
 P7VeMznsKeyRLiB0MolGK+nXnHrhrCOGoHpUWlA9FNdcMMRH/u7USuQ+atJXYVHD2i1Ux8Zhr/f
 +3SE/bTmtYQ+EP651TEW4o7nEcXuphHk+7Rm5t3xyCw38NTgz3MOaybGX7e4PUuBgWJs6pfUR8C
 jOVzrLEEs83Bs9bnLmfwBzoMkhzel/kmtaFUr9ttDAiHQdw3x6XpnEo2xIMMx6M2w7YO2364mlx
 MRUVS2B/9cNI2qQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_025139_002131_759EF04C 
X-CRM114-Status: UNSURE (   9.01  )
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

Add entry for the at25sf321b 32Mbit SPI flash which is able to provide
SFDP information.

Link:
https://www.renesas.com/en/document/dst/at25sf321b-datasheet?r=1608806

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mtd/spi-nor/atmel.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a07b7c61f46b117311b24ab695038f..e635559711a4b402d23d49da93efc15e6be571dd 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -238,6 +238,12 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x87, 0x01),
+		.name = "at25sf321b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
 	},
 };
 

---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241018-spi-nor-dc29698dea0f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
