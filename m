Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF3A606D83F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D05Q6AmU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ce8sFCfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ffn+Qfy7QxeS69fLRNwlZKzhCD3gv68dPB4NNwXQ8SI=; b=D05Q6AmUstoQxx0NKh8FiBdXL8
	j9W/l/9Ha+WVzRgQkm6fV1WcdtsReTLtVDuWmCag2G/V8rp1I9tV/4XKNkOhZOPgCYl9a30u/LLPJ
	6txSIvkN+S5eVoPTUJixrEDlSFS6j9xoThyeqFwptw4lN9tytuXDkgjTE8cCjlkIXuAzbiraE1FvY
	2/ohpP50jPBUrNY8ErrmOehegyKHkkZGvgq+JkziKFEOjH2WMDWp6p/iqxm3YF83E6eTOwsK1kJMJ
	D4IoyrD9fiQO0BnGVxIJdd7Xa6rgze6IFrR+WOIFlQRU2R6RLER8E4l2T0B0K2lJYBVSlm6EKKz9r
	h+IVm2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gW-0000000AFpX-2fVA;
	Thu, 05 Nov 2026 18:59:40 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cq-0000000ADOn-3TKG
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:08 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493572eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904952; x=1794509752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=ce8sFCfA6dXJIapHmdM/RRyKelwkCsdB64v8R7hjMJbt8ZaF3DmDPwwr9Rk17coEBm
         AUzM7dndWPFK/uajGbe/wm09XTMnP7ydvs5hfggFDRNczDSB+EYaU9hKL7ywSJgw7Ru6
         kAwxxlNOIDX6cADhLa22Rbc+OsdhxrxjAwPo9FAK0mcshHJAMTCDvXSO63T1/j2tNVxh
         nMwVrbX9G095n8MdNnxvvJE8uKQxHznZ/+X0O0q8fRRSNYeVR2TS85IBEwvhTDyeq5tU
         lLIFxz7/oE/Bxj45Q7qfrZtwGTusN/MOVWJ2pHp30+IJm/75KGjfjN9E8XO8MbOI2K/n
         SyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904952; x=1794509752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vgROzYjn2zK6ttGrhZKySS2hmoJVCYg6HGqDUPiUOs=;
        b=OpLZqCFb88n6P0xiQKyBSM7UmyFK6EwZsWCj+tbymh0MKqsZFWmvDn15v0yemgcqlx
         8lhA1e3ExN158nhLLXpxTpjDew98ga2GWl4l+KL7j40NMkvFwFPhUawDC5c2J9O26Vhg
         B0JfUS3ZH/zFoBeZ2Ls9s+bSPZLS4Ll0b3Arnn/1qpbJUd5wF9RCJVnCZs5br28LLVNR
         wLM9g9xUTTIq1uP/gNTY5FEqtxam5hirjUsvXwjiCgp0Eh45uN+j8imk32ZcNQ4652vo
         y2rvjMkH2CK/63j/epsUv5tCVdT2Zp6F5YHeUNIJYNf6LC4IqsPTbbs36FDmMrJsMfPK
         K+rg==
X-Forwarded-Encrypted: i=1; AKwUvByQmlsdvrONgQm7ruwxm+hMfgSRF1u1Srw0vN8+T+1qHPaEwKG4RKjK6AmHCqXKb0/OrDB5rQe17b0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9BhNaepU46swGIGKxI/vxp4pQFbXpBi5kCRp/HKUtRye63i0P1
	jbtOSCmXLvzA/GIwiQdst3+JFbxte3fhjVSJJ83W2lhlwTEkZCS/hhb7
X-Gm-Gg: AYBFou0bKBmIHlBtDa51Y5vUFNDsJhsnEuG3DMfKxIVPFBPTkclh0zZApVj99va1Cry
	f3lNe3wGh24e60GJ3oCwGc7ozsN69YqfRo6EnxW2e4PBwX8oBlAwodRJXXITX8AAEC8RhwgDRu6
	M9RDgorKYJJhu+MdFNPOxT9aveagFGmaF10H0rtfK4UUEU//umQcQcW4ltRckozjqvdjV2yjE+5
	xDHT/2GbuooqnYJbyO6y3Ta+GhK8qv/Xiyj0clc9pHxapfmU37Y3oFS+FwkrLE/hm9jTdYIocXD
	fXUbwFfPjx5HZzYdujX81PvBG3NwxH/vj6ybalVc30hInAh4H9VvdL9h9uM0Ijd3+JtadI/MAge
	4ExIPLpj6t+HhklRGexNkrNvaUeFPzyF6tLyTTHiFZlyKsoqReZ2W7CAKuhYvnNPTH25oIkfSwQ
	mrAbjNsq3x168jwPy2LTI0nbeWKyH5eqvEByNmIB9hzjiQdtz70vcW/Bkwc7k+axR438JEk+dMJ
	FEGLExa1MpcMBfGN7lxsYbeW3cYuJfBFu8l/jA0LXAW6jPEt2fQBFhjhpdchHIv1JgaNSE8UBNd
	LbhlvMlj+xulEeV7MztJIELmgBVTksDovrHMw+Xj0fR+ZoQArxrz+T+YGDvka72ItKu25DD+LEo
	EncMW+b0mP+1lB0KZCZF74dDZDQMnPfqCJkRKmDkqD/EkGYBSnmnNyebIkBKDItHMgHwQQFW5oB
	LMTMElOg219m+82A/esVM39yCa0nuyJqajZsEyWU6J3xxXlHJqExzcSg==
X-Received: by 2002:a05:6820:c30b:b0:716:deda:97a4 with SMTP id 006d021491bc7-716e790f945mr252144eaf.48.1793904951958;
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:28 -0700
Subject: [PATCH v10 12/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-12-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105553_309367_6F03EBF3 
X-CRM114-Status: GOOD (  14.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f003da59cbe7..5f57c5998f03 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1841,15 +1841,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
