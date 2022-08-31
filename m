Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00BBC0502A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWPfo5fVeRD5K/Q3g12rfQVkEwxE0+hSjOQyycbqGR0=; b=hgN31IF0Tgb97k
	NbKZLtjromba4Y11oeWRPN0b5TnkNyvzLS9Kc2B5TsboH00z+axjPSKzkRsObbGf3z4lxxKc4eVxp
	PvR00a/AjBEyXpmhcWNqMcUd+UjtynFW9NAvPSuIrz2rwryPfXdVTFogKRKaC7gXbiOV/PnqR0VEs
	YsOKxDOFY3/K7dvJY1lNVB79bCDesky/AjVgMUzTBEbSaw5BInB9Z+Uz1T6flyGWJcWNU0VcCq2df
	Dh8jS8V9s10GP4Pz8oBZLMY1yTntRies+yxlF1425Zrdgj6h1cQDojutof1N6nW8FpKMR8YuX7Lsx
	IhAK1ewI3+YSxawY+5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpD-003oSF-Fu; Wed, 31 Aug 2022 04:59:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFpA-003oNj-Q4
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 04:59:38 +0000
Received: by mail-pj1-x1036.google.com with SMTP id w88-20020a17090a6be100b001fbb0f0b013so13890639pjj.5
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 21:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wfS7hwzSU0sf8meonpN9iroxszozhmh22GHztDWWImo=;
        b=NfRyXQAZIwIYRSHBK8crWBP0da2pDZp7JQu05dGOQ9wm+CHKKEwWHkLnuyiAn/wv7e
         HyFtKDMAlTPO8ngljZuJ7WSuqt2QWWDdRehV3IwBiBy50tYQcC0u3f/oyxKXRe3TtjnS
         OyGHTscuRVOn9JfWvOXitWOMnzqULCEO6ga5j5DgbeQLj9bz1YUEntNPpxYZ3mjtZYN9
         XHZtmf996lW1MlQzeCRjLkQlT7yCLpuBqWjwm8l55tSQC8pICxthYYNGdPcW8ZllUGh8
         rxn68Xjbr4NQUa8MSrtDBLzze0bjFzib5lES1ynaEomLByy4h7UW22QG5y9Ebgicbe97
         z2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wfS7hwzSU0sf8meonpN9iroxszozhmh22GHztDWWImo=;
        b=JEn+firQOuvuxa3JLroXv0HKTDU3tYGqXzEL8OVnKNhUSTgmI1T/NaNfhRJTX5c6sw
         pF39j2rlaz5G3CVk0QvjRf34L/atm/CQtoRGxZAP8vxZ4mufVkoSfRS2ktK6rfsQKtmF
         JV2kmGkIq/LJje05MwkbnpSM4kXgFi5EiGyNZqWs55FNlVdGV09taJxjwDktw1CWM74M
         tajQIcZb1Krvoamd4/wz1E3daSDkRkXGebdvkGf+g/vfkgY0+ILqMg0duEON/zNMVh0p
         fy79sLZx8tMmOFNeJ2k9FN/ymVOlordNDO2hijdyyC6UldYtqA0hjgTwQseq98geHIFp
         1NwA==
X-Gm-Message-State: ACgBeo3gbB/rLD91JuHlpX/84G42pv5GUV94sLauje982n5r0L5l7ZHL
	JU3d0XXaSm6w0NxgUvJZIgKs65irF9I=
X-Google-Smtp-Source: AA6agR6Su27aDyNQzmoLeYKfrhXuf+SgIpNMM3gwxSbpNitS9TsJ8YoiUFfx7ATeDJLGaVj/wJ7DAg==
X-Received: by 2002:a17:90b:4f81:b0:1fe:1716:fe20 with SMTP id qe1-20020a17090b4f8100b001fe1716fe20mr1446507pjb.63.1661921971664;
        Tue, 30 Aug 2022 21:59:31 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b005367ef405e0sm10178519pfq.85.2022.08.30.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:59:31 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 1/4] mtd: spi-nor: sfdp: Update params->hwcaps.mask at xSPI profile 1.0 table parse
Date: Wed, 31 Aug 2022 13:59:03 +0900
Message-Id: <1b449bae6978f11f7636f2b5acb6435723963f59.1661915569.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_215936_868937_42E89BAE 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Existece of xSPI profile 1.0 table implies that the flash supports read
and program in 8D-8D-8D mode. Update the params->hwcaps.mask in
spi_nor_parase_profile1().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..15fb7f661ae9 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1183,10 +1183,17 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	dummy = round_up(dummy, 2);
 
 	/* Update the fast read settings. */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
 				  0, dummy, opcode,
 				  SNOR_PROTO_8_8_8_DTR);
 
+	/*
+	 * Page Program is "Required Command" in the xSPI Profile 1.0. Update
+	 * the params->hwcaps.mask here.
+	 */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
+
 out:
 	kfree(dwords);
 	return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
