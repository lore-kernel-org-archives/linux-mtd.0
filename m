Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2F3C88E5C
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=er3gEyT3hIt2Q2QilVuFBehnS5fHXrTI3Vp5J7s4XDI=; b=VFcKKCoNHRKDUW
	cM1Jt5tojJrYDP/j8jHU8pv4TuP+C/ftGiWHuNUiAZCHdvKn4AaR9GV2wcwgBFuQI/gOFP4rYyHk6
	gsfIPVrjzxdiBqEdOP/UirL36ljS3wACqNI2KCaXew4B2SdwLDdqcKd+rqX4OMx4QTSnwEUX6/iRv
	5I+KDAxRbTi71jL4hvv7wvobGJZNUqxcnbyltAfs1KfnlDoxc4Mzj1/z1EvkfeDvGwz78c6zc8qNS
	qhYc+LngSW7q1H+2aAtREqBCdfBmgqHQEjzW7CGTxZELWkVCMiMUeCVit6nJMjhu5KG+dr2P2hIRF
	M1AXpRXM+hJM4aqWrytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxB-00000002CtB-3T0e;
	Mon, 14 Sep 2026 03:01:57 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx2-00000002Cgn-3O4G
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:49 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1513269a34.3
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354908; x=1789959708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=fco/ZO54RgOqUk87aSoMCHiQ1+H6DFyTO6F194MKtiDNHwETDKg2ekMlg2J505QZWL
         jMvUd4SG299eeR4usA8HZbOZqoeLt3rSrPMO8gCebxoZVqxfKqrYVx2MVnyM0syBebwv
         LWWkzIzcWHxPiSgpSEYJWiEGeATnJZHSplMuTFdoORpP/86EUflRhO4tgnaMa17LheNY
         8FPA09ioTqFhexCSYFpa1KyY56NaPL7nLcykchTvNzrdHkEO/G1qNIaOd5zBNOEBaOAb
         gOvJX4zDYTwrlUEn3jL4crF0jIHCsQe9ClOloSLhWws/5pgkmZSplVGteTDkxDMgZXY6
         OwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354908; x=1789959708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=LqhLfvcp4u9IhK0lWnS4d2sOieeGq3GXEAUIBObOp7gJl2i8S9fJgvV08UCJvsCiKu
         5xfd335RILpiaND4PqHBLz8HSNpvThAhZqjgtvdMRv5IQiYlHNHVVAHdN2WeFm9T8EzN
         eehjEkX+83Lx4Ds4qeebYGFf8nQQS2eziJRn5CFZQ9eD3mFAPIImqFRf5N7aXUfUK+NL
         N4BY7dXt2XzeekM+itYoF5UV4/Do58XoaXTWpQZd46unsyM5OwSiZ1ZVvkmt2nIQEYF7
         0Inraw6Z4D1otrOipFIvX3wnTr2Grh37BhO3JQs6doRog2/hpG9WSmYyChxdh2jLUdlO
         l5ag==
X-Gm-Message-State: AFuF++m/6kdqJc/5zWCkQkhMyGPSjv9ifStoQGSA1mMPOvuBB0V3id1D
	7oNO5Yl4iYojxOKZzSYIv//bQ92VdptSx6z/iaOLSrJIWmrs+9Etlxnv
X-Gm-Gg: AYBFou1vAsS3ASPillUzB29mTY5CdUHL0gI2LergjQVt5QzqBmF89gL7tMsm1Nl3yM7
	EkaaJi2eiICEhT56DBBbJIJFL3Sh2WiMU+z+pU2+pTz/T/VK9JbhsWLtv6qgVjp1pTMwq7h1sRS
	f4HtYReyAb2Ltl5NswlN0WZOczfKD1WzwLOt2/NxudSbmrvrmRwImTOhk+7Js38+wUHeG6pH1av
	o5fAM1m+Iqalbc34+KomQ8W6AH04jrp0gLiQkD1Tq1CHt7ewZoe1Epfy3mylIskfQdKT5Uk6y3H
	KHEHUo7oKqrIYR8f+3punqpvJf40QmL8tsa6OlqaJaALEHZKfXfaUHfBircpIt3dofjnMjWLdkt
	YiD/divp8CxoqqwpAQe3uFY4HLhXCsHy1iQ+Xf90CdUeMjGwPZ3UwXppMYxdNm/sJEyk2djXR79
	BDKJ3IOrbdFkkfEFic4auPJIcYIy3U42MzvzvnLjW7vLcPMLJyl5yE+mNu/2N7+57lvVWf8m+t8
	nkd0N7hBn9teikq3W4aqqs6EgnlDWNKjfuCdCZd4KKLPufUyVG72zHB3Z9aB64PuVNgNgi8p4vr
	HuiGXjUJWfJFbG40tY6lpeTNpdM41GdjpsNMo8DB/f0tbXTg4gXIufV5dki0eNZkaCXxB3QGRwm
	0DnjpkTKYESc5T8aMX1kuSTR3kHKV9w==
X-Received: by 2002:a05:6830:4c18:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-80897c868f2mr541126a34.8.1789354908010;
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:13 -0600
Subject: [PATCH v5 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-7-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200148_869690_C92342B7 
X-CRM114-Status: GOOD (  13.11  )
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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
