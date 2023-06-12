Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71851C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3uW0UeBjER8JFQxXWW7NEUsVOl2Jb9wPNQsxfKALY0=; b=jCXENSO3ed209d
	rvdKwP++khpadTaI39/BsY5D93pGJRuMFXrNCmPqpcUWJI79CKlRkiHmIfrlBTMh9pg5UnbTl6LwP
	CAW+hpy5m9vHiYdCgBOHG7N1lP6fpGzRjtn77s0XLMLISNdcliWayMxuO/lcL9X82Hl3Kbyc8UF/B
	M4SgifwblJBY/UK5KPzv2rR/6cpmZAF0Ond/EXckYYnQrQXv+JhMM5pUddPxOkaJKV5bRWey0qwMP
	WmkYa4S1fXohbZvUmSKahWJt8re0/oK3U3X6JnYMJTTph4v5l0oUi/QFqrxbcrE4sN+WnUKlHHPvq
	gGlLlAXJuxf3rHhk7PQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4V-004Of6-2W;
	Mon, 12 Jun 2023 15:03:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j4T-004OcP-02;
	Mon, 12 Jun 2023 15:03:06 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so5273323e87.3;
        Mon, 12 Jun 2023 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582181; x=1689174181;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5jdo+u3pfToMD+E2Ff5G6AtrFm+z8Xryt182/z7nGO8=;
        b=JyOlQBn4VhrhzWei2zg2S52R+Rlo+nZqzmYM/zIbhFBj6NeW/Yjxqg29rXgAVrJw0f
         /Muk0xDIqzCaxBJ7X/0WiZo92Oswu7wHpjWO/XuoQIN6CYq0adNIhywip16Em6W+K6oC
         bq2/pU186AY8+6GtYdMBeKT1qCB4yVOsG/1CQhAI39745AN8o2Ju03Ta+/oCGc906TVn
         qJZf77w+m21RO8JeJISvjRgBv/y0rl232sVwiBZJVboD4MM/VE7VaaSfHEinEBaUYzyl
         X/GcyxZgI7T1t1j9Xz/qzWVL/pQLOf99RJujvqWJrq3V2JZCZdhcJt3mYoWGNx+T6MAx
         mHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582181; x=1689174181;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jdo+u3pfToMD+E2Ff5G6AtrFm+z8Xryt182/z7nGO8=;
        b=XVtinMivXC+MWYzMIr8IxwhR1/L3czUUKrgnFLhgK2a0B3+kxbbp1m02uc2lQ677j0
         gvHbFEbITWiyggsVuHGcgA6dnVeySGd/VVVe+PSu1fNLsoAQ7Adox3tKkrKQpCqZqFNS
         D941uZ0zowgfdIAuEkK1qhioGGTmTwPQkplfrdtyQCs8EbyTB7SJml5qaN9BG3lBIBfC
         kyemnAotXUqGwoNtgRsMf8VCeSy/wpyFmP94v92L5UaZbZq/rv/ucyrPM7OFwaJZGq3G
         0u8im1hDgp7pRwwFXuxUMooccnz/UeWGBqqz+yG7eWKhJMLt2sHto0x1vq+DLrkjvkt+
         y9Jw==
X-Gm-Message-State: AC+VfDxGhI2yFdLePtB9JrTNDkaTrea0+N+F3GdUjHVd9477HBKbEAvt
	KqU5IKlMTR95lcIRCcZ1P0U=
X-Google-Smtp-Source: ACHHUZ7pmGgzXBo31dNj2E6xdZJooe3qMUN1YeT87gDyJtu0kPG3ksApUsSATeC0JkKcFG8T5PGm/g==
X-Received: by 2002:ac2:5b5d:0:b0:4f4:c6ab:f119 with SMTP id i29-20020ac25b5d000000b004f4c6abf119mr4150322lfp.64.1686582180763;
        Mon, 12 Jun 2023 08:03:00 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p4-20020a05640210c400b005158563be4asm5184499edu.33.2023.06.12.08.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:03:00 -0700 (PDT)
Message-ID: <b52bdd52-dffd-6398-2fad-cb33c0b7ad55@gmail.com>
Date: Mon, 12 Jun 2023 17:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 2/5] mtd: nand: raw: rockchip-nand-controller: add skipbbt
 option
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Content-Language: en-US
In-Reply-To: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080305_051047_00348E0D 
X-CRM114-Status: GOOD (  10.95  )
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

On Rockchip SoCs the first boot stages are written on NAND
with help of manufacturer software that uses a different format
then the MTD framework. Skip the automatic BBT scan with the
NAND_SKIP_BBTSCAN option so that the original content is unchanged
during the driver probe.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.
With these options the user has the "freedom of choice" by neutral
access mode to read and write in whatever format is needed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  reword
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index cafccc324..31d8c7a87 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -188,6 +188,10 @@ struct rk_nfc {
 	unsigned long assigned_cs;
 };

+static int skipbbt;
+module_param(skipbbt, int, 0644);
+MODULE_PARM_DESC(skipbbt, "Skip BBT scan if data on the NAND chip is not in MTD format.");
+
 static inline struct rk_nfc_nand_chip *rk_nfc_to_rknand(struct nand_chip *chip)
 {
 	return container_of(chip, struct rk_nfc_nand_chip, chip);
@@ -1156,6 +1160,9 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,

 	nand_set_controller_data(chip, nfc);

+	if (skipbbt)
+		chip->options |= NAND_SKIP_BBTSCAN | NAND_NO_BBM_QUIRK;
+
 	chip->options |= NAND_USES_DMA | NAND_NO_SUBPAGE_WRITE;
 	chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;

--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
