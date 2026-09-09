Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F67C79FB8
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RppKbMGrfoy8uXFMCEwawr+nHf/gqfIOW51s7WoIduI=; b=dgT8m3i0VTiEhH
	jgZ7FoqV1t0GiYTN2cIb2HjtDW6kIp43zRaXE8a+rDiwarx8Sgg5zK9+a8BAR/QbXcL4yyEVmU77Y
	COQeHCo+SwjtMBOo36BvLv3j12LBpjKYcnQiXhoiFzpHEc+0bc1oq2SSZ1TW6WRpWABW7qKQ4FfW1
	3n+YgJNBsl6+BAqdzcJrZjXcenf3mnnYyu4zg1DadA4FhZqamzX/tFWV82Jl2io5v44LcgynA8149
	6Fu5jO4tkbWrxkRzvRBV5igqjbrg4KxT8oywW92TE8eLRq3OA8k50x1+dpHkElMz9lNr/Jraxda9m
	JLJAffc4s1kxrHapuWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dip-0000000B78a-0sie;
	Wed, 09 Sep 2026 08:31:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiA-0000000B6Y7-3AsB
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=; b=JR/z9RXBH4Ofkld2u9xqm4aNWI
	m7GiR1tBmYrQx4TeVsN5mvQ3DjWDjvvHHQeB40QEakM9YVY50wRavRA5saieh3atUxSFiqc+VuH3W
	OE5l5mNO8TbiMRMSrX3qA7T1h4j6VfSddFhGmvRChq0SUuP6TZQVzFIcie+hGW+XsOa6hH9S5kcnC
	aICSlWGWOA4Tg6JN6M+sDP9i3QQvDj7GCkl0mfcXsX3IDtKqdqE7PR7DvkJVY0EZG20pE8tXQHLT2
	qigPOjbUmZ9ocZstce9dqFQmZXCID3hMCtk5RKp+r4kHt8ylKCSDpMcDbHkyfOU1ZWP6XzAmhcMSb
	Quy1MbHA==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di6-00000000un2-1ABy
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:17 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aca0f482e5so6116648eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942672; x=1789547472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=W6X5JslaxJgAm/wQ8WvCTm5QsqYs2xw8JqxDufghNKpRRxaLs3GMVUsA1OmM8497tP
         PJCxTyNT5gijj3nInq9nS1toLS8O8PgsOSawUO1WXTVUFkAv5fMSKuIlRhtqFqBqoZ6h
         EqF9ZUlQ5fVvi16ZfZ/U6DEIMqYn9lGmHlNfacai3/1WZhwe9N9By5hpDv/c3s85tvDh
         qXnUncuHrjgb3kKtOuUlYPWOvKoWLFca8P2HDkDNNPbOonB8i2ZfE49cTBYgKh2ehwhW
         9g8sRdurGvCIJY68LCw4AvuTuMgRU+jlIPcCkynryZq52kNe4+Nz/k/v+kuE/RE4UOFb
         XiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942672; x=1789547472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAB7sP/kuv2a2+DjQqOPqA2dsbZemJ16Q3uUsVl6HgY=;
        b=H9bsH5ozuQ8x/vsWh5YXSBbPdW5fF80lIPtTdPudW4fmgwc070fkc/SBkX1w8Y9JPe
         QZGIpfsv6C0BZpZXPQ5v/EMkx7QziXY6WhhysmmmRMZV8HcVMjZqY3ed1hYsvDAxiTLL
         iIaunVICN75xfgDFjRd7idyWR+TnUGm2v7aF8bhfVXEgmwp64ColzkrWpjhkVEhCVOWp
         4qaQ39undEC/iu/esa9PXB/JZwWreGlIGkiyUJfKhXzcJWrq9vFo+hiWk2WyLbpfYJjO
         e1Bp9PAgn/SPB290pZKtxCV3G2ONg+cHuFDPYOIz1EqHawGf19qpLXtwHO69fmbxNgZZ
         WmgA==
X-Gm-Message-State: AFuF++nlHv2UA1YvC/2DrFIaH7TUMewBfAwOaoi5WGpZXRe0HRmjoCXE
	F4VIS0l6NKfoBi/2V2AcjqGVMyAhSYurhChV4wBJVbQ75u8hH3EdQxEO
X-Gm-Gg: AYBFou28GFU8MZ89GMOJbn4yD5YC/Qt5Wi1W+R/wU0ujZleAUXjnSLIsj3hBThi9n28
	63W8HpjNXo8SMzoklamuzFyv4pO0TytA6y14u9U5lhoxiB5Iw3BRVPFw7KXryOrCmMRKRBDay4A
	mGpCAMtKuGtjgkwzGnPCvz7O0gDrsTq5prfY1EjTYnu00o3CzukCSzVvNQvWSqxQSEueKZkmKXq
	t16RhpWkMuzq/HyHeUGVyC8U5mZmJjwGInwqUyVr+LhZxvUvl2uYEiPOxoaTRrh0AcAu/2xacz4
	70Fw0WZfxPOikQDApadSqz76Mfi1VrxBamHNJQQrfSkotXsDOhjR0fcYI8QWT86HI7TM4pyQg93
	kEhXrUxZPFv+iNZgKsWw11fAlAEDcJW3gH84uwiVswG506kEsHRTYTjLlVKD5NvUkGS69vSboJX
	gpBqIwffQXnmRXGFm0MuT2XtRPuxAnE+A8cmiWcNpoAlMD6WajX+jaLTa/mWJdkw4bxxX5/ktio
	RdqVHWNcOTSyeunrkBBpy9r29wIAqqaVPyxmYMv7+Yd+gzBsgcJpffVQp+uZ5PDLrMlzdBasZqE
	RI1UhCb1q/r2ei/s8BAFmDxCb2p28PV2ke/FjQa379u2dAyfHw6Gl8P26NpcgJGgmqNLlu6rziF
	FgecvnRUkMY4YaSJvOzfswPvqvVti5w==
X-Received: by 2002:a05:6820:f00e:b0:6b8:ef7d:e17e with SMTP id 006d021491bc7-6b8ef7de370mr14081411eaf.51.1788942671900;
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:46 -0600
Subject: [PATCH v3 13/15] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-13-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093114_734801_15C5BC57 
X-CRM114-Status: GOOD (  10.64  )
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index bbfed22640c8..9dc742ee4344 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1743,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1793,8 +1791,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1823,8 +1819,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1865,8 +1859,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1890,8 +1882,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1935,8 +1925,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
