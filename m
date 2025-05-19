Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B1AC2D0CD
	for <linux-mtd@archiver.kernel.org>; Mon, 19 May 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KxHmMTdahDHnWJJkmFHGaer5qNy5JvWQGgJ3OtC1guo=; b=X0ok5/kd9fsbPi
	toaFG4u2oyr0/t7PIfj/cAvfljJBukQkfmT4n9yng53B/HlQnoVfY+uf4Z77n2q6Lq34WfM4Ofaeq
	6Q3dT7KYMVIU7sowRUKHO5f+/O4to1VYpCubytXP1lQht/XJeKJTxLRneNaJysrzPhErOfcavRW34
	yIBKJBsBNzJMUAZGbljS/uYFHQjlH6XMG0qYMj6vLIBdrPKYXBmv4uvj6dlXJsy5Uz00MLJXV8ama
	CzDnMC4Bj9JAUeIkIhyiNDNipwxx9N69n4Ji4Ox80lt3Q0ab4zTgA/DZEWmb0S+3QVB409BX2V1DI
	GCTS4dkTABbHiQNsgvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3bo-00000009r3a-1wo0;
	Mon, 19 May 2025 16:45:00 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2dl-00000009ea3-2qXH;
	Mon, 19 May 2025 15:42:59 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAAHcL96UStoD9NmAQ--.49806S2;
	Mon, 19 May 2025 23:42:52 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	ruanjinjie@huawei.com,
	u.kleine-koenig@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: nand: sunxi: Add randomizer configuration before randomizer enable
Date: Mon, 19 May 2025 23:42:24 +0800
Message-ID: <20250519154225.2928-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHcL96UStoD9NmAQ--.49806S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW7XF4rGr1DtFy8GF4xtFb_yoWDtFc_W3
	y2v34kKr1Uur93JF1fuF4xCry7tw4UWr4vqwnIqrW3A3W3XryIq3s0vrn7AF1kXF18uFy5
	Aaykt3WxA34jqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrgA7UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoHA2grSSUO0QABs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_084258_107856_B5B83593 
X-CRM114-Status: UNSURE (   7.24  )
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

In sunxi_nfc_hw_ecc_read_chunk(), the sunxi_nfc_randomizer_enable() is
called without the config of randomizer. A proper implementation can be
found in sunxi_nfc_hw_ecc_read_chunks_dma().

Add sunxi_nfc_randomizer_config() before the start of randomization.

Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
Cc: stable@vger.kernel.org # v4.6
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fab371e3e9b7..9179719f639e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -817,6 +817,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
+	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
 	       nfc->regs + NFC_REG_CMD);
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
