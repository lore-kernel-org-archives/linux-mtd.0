Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D11C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=er3gEyT3hIt2Q2QilVuFBehnS5fHXrTI3Vp5J7s4XDI=; b=ZSy+Tlmzq3iMHT
	AWiC371kZ5YwNmGK9NA3WFWDMpQ3HpsBRldbAJT4s8XIxo/SW97Om/p+41sysYRdYSMYw3jLTB11d
	X87wNaier2AmDxCnh94Y3pG/UynXH0sKUwAu3M6fwYQemwdvEvvhx7fGwGBCQ5T+67buKX4FV1NWD
	ll+ugD/Ytoa1/RoppKdb/bkdH2zJVkbTqHGrDmwvqce95vV/MPJrN7r2Rnx7qPfpMkUyx9pswWfXH
	/AJspIiycxNhrxUyJyOhU4jarBW9eHkdtHwixm/wgofL3s/+uq6VrcBcly41lEVSN4k7FLBGzsQIr
	0oq3wif5IFsxXRgBRlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004fum-2Icp;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwD-00000004fU1-2uit
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:07 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae7166ebso1500286eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420205; x=1790025005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=rPWr7QtRUfMJRFDgV05ttTIJzcqi1cfJKEyDY+K39giRtbJeMNAUyzaclmau7y/RKH
         CrugQz123y3eVBw5JaVcsmQ4X3IksrEcErykqPhDCNavDkMHmY67QjGcWuAD+0sD2+sm
         2YLpSYEHJsR/WS6oMXwWDUTrZK7YfwxtkMuLJQXbk+regq/2IXLYq3qAhyRb7I7BHugz
         SdeKC7tHaqeUQjUiX+6Vie0DPbP5kDNq6fG8h5Ee8v8Y/JJvGMlXw1n4iZxq3c7VvGdo
         a/QTVn39YLVhDOuxuxYxKhwfdOp6sBLOzNj6jTFur5Lt1W+XMqLRXEuI1TKyeGtl3Qw+
         o0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420205; x=1790025005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=Ui3MLpRyeM0HJH1yLaeGPoYtK7iAYdEJt6rekLl1uAbjbiqOrbY31ZLAV+vP0v3HRV
         1fLEuLog//fXUpcPEFn4fkfnBCSw7B1Age2mHWvVpeZ5C/iNBZ6v3EBkwFurYUOSscW/
         QfTKLhw4WrBVrXEF/ohCzgRtgwrhmJ1lrlCe9bv5kmOzw00yHnl7I2oK8CRAXGlwIjfJ
         G57STY9NlnxlASMSUfxF2ji6Mhl4TcBlpSvX9XZGuaL/Om0ySmAN6ZmczyZEdpVnOxc1
         WKoIyWgvXz1DWlKl5WJOEkAunUeb/ran+30tpZOsIgYiAzqoKayt/2+E5kThsYIMghtC
         gLTA==
X-Gm-Message-State: AFuF++kKhfsbl5IEf6sCKjPSZMARw2ZhRHQ+BBWxWZMv+XWVsADEixQA
	Y3yCnRP47xWMmaVJrVV/al5F0006onbUfB5I/miWeqpCffLJOt1Oq541lr+8mg==
X-Gm-Gg: AYBFou0G9lWp3cMacemmBJyVpcvAUUQ1oKioEpmKvLd8FnTNMkoYJZyFfgRODZhkVth
	3lAH2PRyCpZ8CsrqMXAuXYwtSDXLNviP/twhBNdwg03wHfJ9jc3im0vzRP6/pjiwqLCs15ShReQ
	qcfmfMVlpKJ5EVDkxZsZSDACNhagYXd7UsyNTHvJxLcegxy8Mmpv3WIVwv3z7ln/PDpB7y0Nv//
	LayMMB3ynM/CzB/BxSuskAO51Suya0sBDbrWR53SpfyA4Dg3b4ZOT9nUAdgbXSkNFycKpWN6Mpe
	dacDNyio0AtS1sd4cpgn83OieOX6XY7A2+H3ODeldtpx6DUeuhuDYWtx0SprwSblJoRngmAFZHI
	kf/He9D9WV3ZFWbMMN5yauXY8plV3ccgdpBKMIxhCocvxjk8QxoCchfchhwQEbOsX+OPea+XWK/
	QbNdxKYat04j2UaIB3rVWvl7p7PqB8ugwRODsaRxpDz/kb+060pQ5LK245iUEABdI2JMqPqn0T9
	iFWGNJdCyyepIOJamnPf5aeWBfFWzrxn+Tr7EcStR2qHfISZrptrOC43X7oZpQsMdhUxFcdJmqj
	3GlRnvsSAvvA82PbLo8d3x1lxEHjNouV8QUNQuyCFtK/tMxEV90p/yRGniK6z8iQ4rcY7veU16L
	zlXq6eFcneKFLVBoxDLbpsl7WaeVJ
X-Received: by 2002:a05:6820:1626:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-6c540b66d8bmr2665520eaf.26.1789420204843;
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:53 -0600
Subject: [PATCH v6 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-7-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141005_782976_78FC72FD 
X-CRM114-Status: GOOD (  13.26  )
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
