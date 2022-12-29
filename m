Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E50CC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H5da2wwqOzK0tIvOxoQ5z80PJCFEFwh12zt4MSYzFo=; b=S/BqgBfQxEPHcN
	kim4YUaHtxrBI64yFP1k/CMrpsaf/lXQxDC34azQYg1vP/v/Eaiqa9OcsaXqFsWmyFfA5oGY2QyM8
	ivJH9YTZmGQkU5hQB72wy15vSiHJ1tqWLtlZS8KcGOqdbvm2X5K0K7eFlu33Z6FWq85Ufj8XNXRbP
	+0nqfBro9Exs2vxHx6aIJS9EPvA7umIxwe87oROlDANmWPtf0QVgWm3nvyCq1P5l63j0+HzWjuNlM
	KRJ2g6u+NtnXEPbiVeMb6926OOe7WAMTQD+0Ng5T/zDpr5iqhd9BivPmbYvOUP/YoBAUgGFq1V6Su
	Bre4brmyLxcklYMoGPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyYP-001I4a-SV; Thu, 29 Dec 2022 19:27:01 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyH9-0016A3-GH
	for linux-mtd@lists.infradead.org; Thu, 29 Dec 2022 19:09:13 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 91F0D3200786;
	Thu, 29 Dec 2022 14:09:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Dec 2022 14:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672340950; x=1672427350; bh=26
	OVl7pfPjUCuTagaZGOenKInbPyTJjQTgFy1rxtBYQ=; b=1rOqAIpmu7OJxRRrWD
	Zg9QX/bWx2jqDmeTQg3mXE+S3f2iXjFA5VRSEYIAKhz3TqC1z26C4Ww69up8ZmPI
	sAFbYpTbj4XjE82+7HRPJmkrWsDAY7t9pWPGOi+hY7LPXwPadAX+hkjjl6U5g/YP
	C0B7LCvVGZYkNsGOdZN8ckXgmT2mBpC7wFKCTKE0ww04ERxhn/xhZNKQnzUFggkq
	3hJ2CCCKCykSl+qCPV/zrRMrtO90oE5qdv/16rVX8NZCe2ZWNyi9DWVlT+3AF51b
	1q283Y3XLHuT1p3igWKEJP6aR7oJJ12kkjFLJ1ca0ZOZIGYEwEnWlXKENOm0IRrx
	sXYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672340950; x=1672427350; bh=26OVl7pfPjUCu
	TagaZGOenKInbPyTJjQTgFy1rxtBYQ=; b=oein5zp1XyEl9w8dNi+CcdsUJs+9s
	4zovpuXNQAL3KwV+y3rdjurP34r7N2Ir6vaJxZ3FgxYIKhH3Rg99wFYM6dGwWLXl
	ZQytwE5bqCqUSVh9F6coLVSmSs5eJKnnL05mNDhfFcT/jmuIxcnQaDeBwHpWEzcl
	n+X1cjJL6WG4optJpEitcTzqSV/1y+USov9vX20L9p5TzXeJzyAU1D8+2DwQxluY
	uMUmwiR4gtrN+Y0/gfo0JJnJ45OCccYZnlUitU+A9H84ss2EqbfwzX779phnNvFQ
	8zWQj6YHDTdcw+Tu6U4xY+FCAlY3olP78XbvJ0GkCf2nc9G4eBHhBCKVw==
X-ME-Sender: <xms:1uWtY49K47hOBg76TsHofq8eOXNvYloJTFSejCTK6oMG6xnaV7Ha4Q>
    <xme:1uWtYwtVjfOSSYgNd85fTQOugYthDFcHi-QDU6sNf_Er9Xi9vw67DsCH1s9P_IZnH
    oO33jTaCAxK0rn5nA>
X-ME-Received: <xmr:1uWtY-BvGZVbLcmhpf4Uk8B4yadL_C0BC6FC6Get9bV2EsGi3KdiddYq1jfwCrfIzlFgkBF2DZEJcwgxLT8pnEg_6wIxZMBoPtLN869dxN4JzXWWumkldVk_pKg0hnQIth0EGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:1uWtY4dOu_1Ly8xvK86jaB1BhT_cbkNaBn3SNi49Hd_xhG2SrypJsQ>
    <xmx:1uWtY9N9BQRB5abLsfiv3Kst0QPlXRY_nAyFxiXwiggCVCVUH-0pPQ>
    <xmx:1uWtYynBzB7xyjUvdR47EhenlAlFgGN6t1fLRk78aup1xZnYX3hCWw>
    <xmx:1uWtYyrZxoVvF0anYcK_dai54NaJmseOTa5bnOJt_vVB-H11K9wfsA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 14:09:09 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] mtd: rawnand: hynix: Add support for H27UCG8T2FTR-BC MLC NAND
Date: Thu, 29 Dec 2022 13:09:03 -0600
Message-Id: <20221229190906.6467-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229190906.6467-1-samuel@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_110911_653546_4E56BDCC 
X-CRM114-Status: UNSURE (   9.42  )
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

H27UCG8T2FTR-BC is similar to the already-supported H27UCG8T2ETR-BC, but
reports a different ID.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/nand_hynix.c | 4 ++++
 drivers/mtd/nand/raw/nand_ids.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 0d4d4bbfdece..836f152612ab 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -721,6 +721,10 @@ static int hynix_nand_init(struct nand_chip *chip)
 		     sizeof("H27UCG8T2ETR-BC") - 1))
 		h27ucg8t2etrbc_init(chip);
 
+	if (!strncmp("H27UCG8T2FTR-BC", chip->parameters.model,
+		     sizeof("H27UCG8T2FTR-BC") - 1))
+		h27ucg8t2etrbc_init(chip);
+
 	ret = hynix_nand_rr_init(chip);
 	if (ret)
 		hynix_nand_cleanup(chip);
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index dacc5529b3df..167183ccb9e9 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -55,6 +55,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x14, 0xa7, 0x42, 0x4a} },
 		  SZ_16K, SZ_8K, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
 		  NAND_ECC_INFO(40, SZ_1K) },
+	{"H27UCG8T2FTR-BC 64G 3.3V 8-bit",
+		{ .id = {0xad, 0xde, 0x14, 0xab, 0x42, 0x4a} },
+		  SZ_16K, SZ_8K, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
+		  NAND_ECC_INFO(40, SZ_1K) },
 	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
 		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
