Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BE5C79FB9
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt6XYuMEHR+7piKlXveR4GBEuqb2sTGwcjYbtZdzDZI=; b=UBa6xbS5PJFM56
	oJCODNEPATHTH+qO6syvEf58IWYyZFYdUK6tuMiTbDajvPSNX0NLP3mQjY7RrK2njRYBYzjsfjUH5
	ZS6PZthiABRKYd6vMpL/d1m2OyS+4SH0z5PL3aikU9t72ZAm5/aMaK1YKbUMGF+99sZbuv2e1zzv0
	0hjYvONKyZHzyUvPZULy5hmsu0FvBcAWtzK4YMM3XYGu86F2sjsu1v75SGDibwiiPxzkjh8fGqwak
	i4i9C1CZuBoK+7FQHyqK0w5YzvR079phUeTOAo8SU9/c5jh3vueFIE/7rRDLQVIaltzQXHTjqoC6R
	nfGGJO7+WbckB30UYAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiB-0000000B6Uf-43qg;
	Wed, 09 Sep 2026 08:31:20 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhu-0000000B6LU-040T
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:03 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-46f53c8a5fbso1730367fac.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942661; x=1789547461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=BIJ5E40E+K8kHXNk4mqSVTHOjrjKp4Et1gv+vA4QhhXQ0imNtJODcRcABxSmeQzGvP
         TVBkohpPK3a18siRwabTEt5zdzf3ljkTpdsSzDzveUhjiZz0af1MG8Bww2rAX72GhqM2
         bbCH7YIRhncGGgD/m/XUAHQKMdgy6S/MB7yxLjwo51UIutUxEiVfwUtuSOoYHf43dmk3
         bO1qpSA4FFad6QA/oNrNMTENxszUvf7RnS2Pt5GXjNM1sd+6w/u02orpdQXtwfFXtwu4
         oQ+H/5TJAOv8EI6naHiSBYCJH5qrJFtzZ1pHIShijRXXvHY/SGPk7F8+7bIre/yqqAp+
         MU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942661; x=1789547461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=DAxQ/sPDbdknQJ9xUin3ww0h7rTH+17ZROkHQt2fN0iG0DX3NCU+eS1z6j6mzCXkfk
         zG/c7FdEEuk7AGwFKE1BlR9iC1OHr6yHF7yT1nlhfKAIiek+UC3a97ndUCbQ1A5VNSm5
         be29xqcVjVVOlUJ2kUleBlCVVdB3WTWeplSIuH2v281f2L2ugHkEnv/nZwKOWBYd2bIS
         Owfhq04TF/vGuCqBtZBv61+nCzdEy5P8nSF+Mo8Qh+cbnOHK9eU7glfbZICrGXltk+Y7
         3mgiG+d58BW7OeqJl38HW7othfc8Y85Ke2Q1F4oeDmAYu1LOzy7gDs55OsriqJk4ItCq
         bBcA==
X-Gm-Message-State: AFuF++m8PWt8BMYAfLpJSsKeVNwR+0GWlt8D0smwJ3exkruymZ5rjOsM
	sw0BByRY5tx4sQCelvr33Uw4fzMkukUVzRiMnZIYpcaDwEc+bBBg8OTN
X-Gm-Gg: AYBFou22M1uA3423n+EjSHh785IHHAtkELAaaZMZWcLcD1aKFAzHZ4v4hmqAWGAptB0
	qnpDiJ1K+fQ4YQTcwK/HTsbpf+8mK2a9l3YwbXw7aVPKxruaWMq9TRPwIqpOPEaNy55ccTzVmDq
	1/Ij/pH/KGpIeSXvoRg/TpoZ1MkH4b/aUHp4Si3jkkQQzb9yZJzQMYWK4sW/DuPjVaEWNx8kObV
	GDVOdBhn8DBnVQO2FElc33+F+Cx5sB7uNGS0bFfn62i/Sx99QzeHNx2HRXLx9PZhVvPurx1WiYs
	gzhlUdGS6xn1lsXJ+fmqFm+B1N+OV+ex+pqyROYN5Vt8Bsn44ExnKuVVL/BckS8zhD599KekYn4
	YUuUnDS3bfcllbPepCS2TnU/F475o4ubM8O9v5AL/cXhTesGaegxRxYfEnu1Wxq0TmVC8QHSqeW
	OUXquB+plo+TlKcqFxYDiuglGg65oJOx+86ChZ5I9eOaiv7R+03ZkS8idh2CFiyvvf1iYbaLvCl
	NPSb4ujg9QuioJS0/IXrxbmcc0qvRSSb/+sLNFGOO/AE9YSVluxxlj6sNuNFK3berbWPTw+XPFC
	rqncPo7o5cxBDyTv8BoGu41NqTTvhtUMlQIkqY3sSRs+cbY4oVjCdRC/bEfkLvag3TI7zT42N+M
	0fDpVBXQo5VrxGfZTbtylJyVdaxF5
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6b6fa7e183amr19522399eaf.3.1788942660818;
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:39 -0600
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-6-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013102_383300_BD395C0E 
X-CRM114-Status: GOOD (  13.59  )
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7081df77f63e..545da54b8908 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1831,15 +1831,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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
