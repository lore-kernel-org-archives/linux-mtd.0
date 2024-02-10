Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15E1C4829A
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Feb 2024 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aQz/yw9WHf34/adEuoSIzp5sLctgSuIDFy9j7jZPSk8=; b=fN+fDViYypZtaF
	z0ZXAFSzHUDgHS9iL4GkYsopuorecgJ/BIRX3F5MKyREtlO/c2Kfd/UrThJe/T1SQpslejjREXKem
	3McARyrMsLvRGapY5fxYyf6JEgF3Bf6Io523SZRGZRtKNWp9iYnVOMRZAyp7W75CN1pTyABq9Qebe
	gW3Wj+4/hyq2VGgirKAuirRT6yU90pZJZ9z5g+pXcJcrVkIq/hzKqukoJZEvQeBasHtkc29BX2s0O
	pnqETm0HAIw4kUbv5eD5497NkXX+/K2InuXzrdf4uHSw9DlY1+nnvjN/Y+fyS8oguluQkCtV6FxDB
	LG6cWVQma3HZKZRaVlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYq2R-00000001mdP-0scl;
	Sat, 10 Feb 2024 16:17:11 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYq2M-00000001mcw-3LN1;
	Sat, 10 Feb 2024 16:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1707581794; x=1708186594; i=erick.archer@gmx.com;
	bh=OfG4W2vrN+BKgpQ5aAwkOcwerxwIgHNq6byGUSl/zus=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=HwdmEO3+DYeTsTAqBIyXHET63T44a1xtI3JB+T4mOHbfg3YRlN3eTrgisx6Qty6V
	 m5HZMB/jq0YStPEA8mzKn2U/ua2TXuKIq13sO+SCiyOSiH/vdvQsQpT4cw2nkWEAD
	 Iwk253BH4JQQKw/q+0ebaAq1gwIFUkSzXElwMDJgCdkQkH23FiHGFiJWqP7JYpFw9
	 OvJ8q9H+xTwTWBkZwKU0igZTiBE0vWz6bcwtqBySAt1L7/iKxEHBwLt9uUwzsHnOb
	 dfIKytswsBmRPRpLrRMkznLeh/zV5xBLR8q2p/7VWD8oqvkyTacM0gR8VD0oitcNO
	 EXtx4792DSfhgVXIWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1Mv2xU-1qhyOQ2CRM-00qxEh; Sat, 10 Feb 2024 17:16:34 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: Erick Archer <erick.archer@gmx.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Prefer struct_size over open coded arithmetic
Date: Sat, 10 Feb 2024 17:16:19 +0100
Message-Id: <20240210161619.12656-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:cE6WntWvcCnRVKbuPrflNE+LM0S/ZuMDnpLQs4Rt/3MVVPl0ZEl
 jh5hEvamdlnrlzQh+Xn/DyeW897UTiYJftyoSkjAModsgHBqwpZXASdUw2819ZPGgzRkdls
 5oA0So3/CI6eU9lLpwToSblgBUGrk9KUtHno4oEtREQCIdpgxpQCMTxcS50WDCFkI7cs+s/
 N5Or+HfzYjxl5q9qB/RFw==
UI-OutboundReport: notjunk:1;M01:P0:VGFqzc3IIRc=;tUTDQhueCO0tu5eV2hl+d2qyQIF
 pcv/rPJ95xWai1+wm5czTvEb7E0H/FESByeA7Ej+E3BTUzPmw0Nj22QMPpbKGJ1tAc8sDZBSO
 PksapTUJlV/kbeH4Q2zzfKza2kHoLVkGdPn9lNy/sb2AUqbg7UXxdf7qSBJUcI2zc1dc/BFfg
 MtmfeF8ylN+cHz73T+ot3OImAt0ZfhowAmQaQU9IYvlP2C8nvsPx5VcdnQUlPFQ9Yf2T4SAcX
 Q9aLURNa0/5Om+lIbtsXGinBhu/gTsUasgZpQVDx9rsZ1C8rODomycnmispx7smtN5NIrG/kn
 UWgonq3mGlpChY6+CfhBgiUpkPzLlEodMp/PD/IFFe/B/znTawbueGIUvvApbMcL+m+S9dMjv
 CWHTULkg52xeaCydt7jKNATDiGTo6N8CJOH3LuGTvS09d1yvXv7hG6aBnzwZ8EhzQqiQXW7hZ
 ZGEYJgk4d/zh3t7CW8iHyLrgxnJCdeunR94Ps3PPKQm/ilHTylzD8xaHDoQpkCL58nsPVXOkL
 vr+M0GJnh97M/1d0TiZ6AceirrQlLEFLZ34A3Xl/sQKK/eU4FJ7MkD52jIOmd8OPnzlh3ILl9
 ugP+Bzef/0UxqC4p+oWhlGU8Psn8xQtMvmQP0kLNX7+tfiyv3Eoq84tVZz/kQwf3Z5Gqh3bvX
 pCaiUdkRp1edJ68x+OtgzmkYxqP4DHIFzgEK/mUjFbptOLCO5sMzQhaDQr/2lvkGJB2EfhIS4
 /BBlCdMvH5rPcxUQ0w4XOkXrAxaVTna6JEI+hw24C4h8VPIi1CvGOre9MM3mtkj1QST/wuOe7
 IOEWJHRkQJsTjnfNWBspSQmSmm7H5sa4Fx1/2kDycu4eg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_081707_154780_22A5CBBE 
X-CRM114-Status: GOOD (  12.15  )
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

This is an effort to get rid of all multiplications from allocation
functions in order to prevent integer overflows [1].

As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
this structure ends in a flexible array:

struct mtk_nfc_nand_chip {
	[...]
	u8 sels[] __counted_by(nsels);
};

the preferred way in the kernel is to use the struct_size() helper to
do the arithmetic instead of the argument "size + count * size" in the
devm_kzalloc() function.

This way, the code is more readable and more safer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/160 [2]
Signed-off-by: Erick Archer <erick.archer@gmx.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 60198e33d2d5..17477bb2d48f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,7 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}

-	chip = devm_kzalloc(dev, sizeof(*chip) + nsels * sizeof(u8),
+	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
 			    GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
