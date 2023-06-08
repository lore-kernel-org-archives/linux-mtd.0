Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02579C7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNDzziE0VUKmzsKKIsFu/Ql/VIcHpNaafYKBO/zq8BA=; b=E9i6iQHfSA/BPZ
	by/C23STo0EEr83bJId/m+dgZjxidwHVnsz7MnSWTffja7XPVD6S29pPWEDvCZGqW3wmDF+pfiLuc
	wOKhPcxmELXkduiNgCoqVkIZYGKI9GUNMs6w3FJ4Dh7hGoNvsFS0TeOUWJo94PTeN4Fbfgr7eH2yp
	eIt9WeslxdNVWkdVEABB7yr1aCKvgIK/o3N0HrnNhuh1LImdUn69HBjh+mZuNYUszzRQ8B6il+P2H
	dURQVMPfP/1LYtavxYhcpadz932p/symZk5NwSEWAx+FjZqakgHPs2rXMcXm8TOcBzBNooathWshh
	AuGARjqZOeCfMz3b1kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IWw-009t1L-1G;
	Thu, 08 Jun 2023 16:30:34 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IWt-009syI-2T;
	Thu, 08 Jun 2023 16:30:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so975554e87.2;
        Thu, 08 Jun 2023 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241829; x=1688833829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2JEi90Ldlhgb1TX3KGxyOhRscyzL8bDaJwIjdpZwAHM=;
        b=oiNID0CUe1AWbiikTsKX2eDTJ0S9WSJOOdI2miZOoBfeO5yy93DYpwIqMc192Y3JFQ
         vK5U1z2x7zv6jn0X7WqLjBW5Co7px5er5ntKxr3Hvcee/IVS4/XBk7h6XkGh/gAQNM9r
         BrApdp1SdAquHLYanvievnjMvG/N0gj63BNWmPusVw2PFP4DwprMzwfrz7nJPvIylV85
         RaGQwFqelBeoorNKYr+zdQG5jDevAGbh2PTGejNT3MHLBt8J3Ag0DuPIdzKEehoCnP5n
         T2Lf65eyjyEcAVTRdH08gGjOFSIpdgOxuNpPAxkZGpCvWf0JzFq4xUYkOFqJaRNNDsp6
         sqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241829; x=1688833829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JEi90Ldlhgb1TX3KGxyOhRscyzL8bDaJwIjdpZwAHM=;
        b=DBu4UEwDMNiV3r8+VMplAZzgxGEVqYcFkkUc2sp05/9QakXudXQXe5BxcZ9i6PZux3
         mlhruZX2mRXUx1hBeQNws25mZXUcpjWbf9YAmgB3FuXZcm9XriBrphW6PbdEUyBfTV7s
         znftUKZ0pDm0ROjhYO9/Zs/i4lZYjLDed23VHsmiZGxey6vJ5OyS+0ubb5bhORYthBU+
         EIN9pvILoLcxwnQGArNfJAKfd0N1rbWVbv6YN90QOMPPbKwpL1UTxrOEasHu76TPUKKq
         9/X5euYGLnZqDr2j3BYJCew1Jso/jHlpM+AcNhM6GgZHoWsLyxrEjvVOQOdpT8JlMG0Y
         CXeA==
X-Gm-Message-State: AC+VfDxe3Fsu9pSoaKerK1C+g2e/koJiGwtZZj/zmjelyLys5aNQ/Gcm
	re77LFwFACLtHD6lPOyQs8I=
X-Google-Smtp-Source: ACHHUZ6klAVFi77hcHpFJEJ4Ipf8Zzlq9+RqBHfp6OUAfEq7a2ufitVsxLKZ+8168eWyQSz2KBEiqg==
X-Received: by 2002:a05:6512:14b:b0:4f4:4cd4:2586 with SMTP id m11-20020a056512014b00b004f44cd42586mr3699557lfo.20.1686241829063;
        Thu, 08 Jun 2023 09:30:29 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id i20-20020a170906a29400b00977fb2fb44asm52422ejz.28.2023.06.08.09.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:30:28 -0700 (PDT)
Message-ID: <4d9473ce-c167-47d7-e37a-7b39915a724c@gmail.com>
Date: Thu, 8 Jun 2023 18:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/5] mtd: nand: raw: rockchip-nand-controller: add skipbbt
 option
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_093031_808732_2313311D 
X-CRM114-Status: GOOD (  11.23  )
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
NAND_SKIP_BBTSCAN option so we can run it manually.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index cafccc324..f56430f6c 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -188,6 +188,10 @@ struct rk_nfc {
 	unsigned long assigned_cs;
 };

+static int skipbbt;
+module_param(skipbbt, int, 0644);
+MODULE_PARM_DESC(skipbbt, "Skip BBT scan if the NAND chip contains data not in MTD format.");
+
 static inline struct rk_nfc_nand_chip *rk_nfc_to_rknand(struct nand_chip *chip)
 {
 	return container_of(chip, struct rk_nfc_nand_chip, chip);
@@ -1156,6 +1160,10 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,

 	nand_set_controller_data(chip, nfc);

+	/* Skip the automatic BBT scan so we can run it manually. */
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
