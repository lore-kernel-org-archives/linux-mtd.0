Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C925C88E7F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW1bYtC18dbvxcxdecYp/Kw/PV5SzAcZ5tzkUT5gTUA=; b=0R/mYZerqdIzdS
	hGBqY/t6nQwR9TdR0vmbgAQXuEh55r777jlRd3bvQWrmwv4ZZjMT719qK9Q0zEb0zIvqPg+w3rCdo
	tBKf1WXZL8UpeJuXyQZvV1Aemx0+NeFLlEOydL0lxoI3MRhWjWsv61t5M0qUhLIGw33+BiD85nrRg
	bWsU3mNGaAjjubFWZwweK7wxVtu3YXbQCaK47ECZMKLUM0UdQTM4JgUFOcUwLw4J2caYY9ngYGoyN
	wrJDiOpWA/7Ahcgxm20UUSeif7itpSJlmZtZEuuOyF8c/+/lWnlKk4W0w9+/RQIhFDZpi1IWjuCxw
	77T+uHQ1IDb5Vgz4RuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwP-00000004fjp-45gS;
	Mon, 14 Sep 2026 21:10:17 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwB-00000004fRO-1KGe
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:04 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-7f65ebea805so1576974a34.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420202; x=1790025002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=q4h7CZ9Mi9iZUUcXIFGIAOEBYDqJkdx8RgQSYNr4TDuXn/D+GxP6jKSx0MOQ535hbr
         z1YJh3tGc33BiNke42uhXgdrf0NvqD3fkHNLCqzy8KpBbo5yAaL3Um1cgN/npS31R1eA
         LmSuT2zZ9xE5Mbdbs8wEnjmbHvDhHhAzR6EBDetAR1v8tZTqnbXb7Yc08ScLgyxudyKY
         HSz1pnLUd2kIRVLbWW+oiTZNHFYIPCyEDbgTQcx1mGP10ynqj171VYt2q4lj7Sz1onK6
         gbLyB5CmlbLJGmFxtxpsPrjOFPUKAVd+zal/7CqNP09iwAD63SG7rIHiOFoR8eDlk+zz
         VAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420202; x=1790025002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=ttRbUsvoC+H+jGezzkR81M0L/65kOs28b1a8R1SK1rVsc6/c12APf4s+aabkt8V6J1
         P17bReiFqQVa8PK4hAO/w+pZu/Ng8jb4VJtXsxDy24Sj5k9BbwRLx4MGv71xPtbuOxEa
         TRwwe4Zf37AwoQ+GS3TgTScozh5WtZudm3EFDf6haplZzIUfrV1ovFkNcE8cUh7fOBMw
         sPs6cEQCrr9Ko4oD+Tq59YNuLXYk0RedAYaOGBnjJXL9pMXdLnezSReGQvR/Bqn/z5pP
         kCSadCUGXhh1t9Cd9xltjy/E3p08QtQCztpH98v7dzKuuLyS0z2lAxM5I809nQOlOF2Q
         09kg==
X-Gm-Message-State: AFuF++mkxZ+XUtE1SLCMLz+t9xi5Q56aQNr8NEUllimjpJF/zOn42hOQ
	MSxtrXey6ORYKy05/exmtSpIzMhjdo92OhlAT9a7ZzQS4yeLL++/tkwt
X-Gm-Gg: AYBFou3YLJudxk78/djd4GobTPXRTX+M9yVFrorSzQxwEwuByDSNCJmPby/jhvdFF/P
	QV53nXLVwUqI8gBl+9EgqYKnEOJKSipXMg/5oO2k/4mTZrM27jx8F/nXk+VbTaRhgqYjWmHPeNT
	Vr8ilVVP1ZkpWmN/b3zflMeJG7giSfvi4NNeOCyp6UXEeF6HGJitVIBJqNya0j08NRTSlkIG8mC
	gucFeruV2qhuuiQbMQMvJBFxJioIZ9PefUsJPdU5h5TIl0Qkk1m78Ll2TnvOiRkOhuAgQdoPERJ
	4amUPymIpto7a5VCT7B/EjwJdcpNZ4drJbjTcMs7k/dqaP4f3xuZyXXItkwoYgEStWimjIUN6Ka
	5f+nxuQt5dvUjRK8VJE0O+FMnnwP0Rew2/SJbWpuTEhDNOatRBhORBrvTZNoY/Gdcjh2odgltLi
	WKsPBeBd7ioQkulbOu6In4RSxtBxxMvL54NSnwbAXoTvTpAUX/9RrVKWhblMPefrfhcgwChzdKV
	bYZsUkC/9YfMybhZqoera9+pXWcguDktTtBr8k8KVfExky44l77J3GRFvs65PRH3XpEApybsp1R
	xUcAxPR5dcaFRued/prLQf1qxygiLfi5FGIgQBkneq0+uS0Wk1ICv/LFz5p2tkwx+fprW5TapJa
	sCY6YA0N/JDajx4b0XIJzjiaNBiyTbg==
X-Received: by 2002:a05:6820:80c7:b0:6b1:b33a:db69 with SMTP id 006d021491bc7-6c53fb6bf40mr4489299eaf.15.1789420202250;
        Mon, 14 Sep 2026 14:10:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:51 -0600
Subject: [PATCH v6 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-5-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141003_376850_1AFA91CC 
X-CRM114-Status: GOOD (  13.58  )
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
