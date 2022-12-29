Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADFAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9SA+5hrQq23QK7O2bQYidJ8wCSlVLl5ichaOk0c7Xg=; b=E7yhVMuIZIxj/P
	eYakwBmW+Lr/gauZnxnNAgygOc+Eey+iXrHakdesG8pSdxie/gM4FrYDStESib7CAe0opDJ8yVvd2
	6+bo00dD0b0LHXil75qyJNhzX55FD7Qwu5EmXiCz5fIaG3ZJJZemQa2AxlVNhsspxurSuNZz5uRme
	3xM4ovmAZ98MPHCPWc1xAtdYYMjNy45Unw/aiY91RVHbPhG6oYH5H1TEVp4b6khbhbJ1rWxhegeDf
	J3IVSGWt/x5NcLudN68ERrbZQBG88uEuQ8R0mJ6uiWnY37vVQlPhdKIDlrnzyVUZSuZIR5zev09Xl
	OuMzikVADMVGKXD+QP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxZM-000kZz-5M; Thu, 29 Dec 2022 18:23:56 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRT-000h0K-4i; Thu, 29 Dec 2022 18:15:48 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C78A13200908;
	Thu, 29 Dec 2022 13:15:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 29 Dec 2022 13:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337745; x=1672424145; bh=+9
	bUzxjZZvUZxKDoetxLqlF5Y2GGvm4/vcpqx17W7w8=; b=JZtCisfL3NacHn39+p
	vu2PzPs1eTU7wxsQulhC8spek/2T+EY1IZvc+ZwSNINSFCUVs/52FHONaI4JGvIh
	SpXIz6y3O2oDrMpIfRPjfchA9XwQnVP4r+FRA3Fzypik0DhSlH2HC0Wpd6MlEkEY
	GGahWBBo02ZkwtxSma2pt+WdvOp09Bbg4ZwzffkS0229qwAoTM9S1HR7hvL+89gC
	/LlCnVzSC/DIuh040IkQyoiBdRf+sacFJNrryWmjIybJz9sJzkaPJmBUAHqx574B
	PQjGCh0ppF8CUgOhVMn1MVUEDwGWJ6GYbuOtkIUDvf8uB7+rh0aB9oED8bPvLHij
	ySRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337745; x=1672424145; bh=+9bUzxjZZvUZx
	KDoetxLqlF5Y2GGvm4/vcpqx17W7w8=; b=CL32CpCkwfMFoRvVq27PsDrZo+9wj
	kTu0i/znVDfPD5jKBz6jMKO84lA2gYR8auy5pf7r/k6pJ6oUNjbPqwslpUTyGFXy
	HUes1LXluzRe7ZAixBCXH8eKLw6p0MqwOHCRuAdaQH6msr4yJpxbvNG47JkITqjW
	i8QWansl6wSylP9MJzACigtvxJr2AlfDFtd4QGbk4j7Sd4nM1omfs6q8R8x/pQf4
	PlCucH2NTVoZN/mlZU9waD5EGTzXgUwc/LKXfFeE/x9Jiq7lQrY1gtgURRYPdfv8
	zN/62pEgNlvM1gU/lzlZO8W3ztGGtwuxDFHcvuoem4GXUhF1diCT3pTfg==
X-ME-Sender: <xms:UdmtY6x9b-55UlUBvzP6Un47_qYffyaJ9mRQEY9OxCgXrkzuGtIG1w>
    <xme:UdmtY2Qm5_orAnhrTcuzBEoJVP0Rg1KP8j4RQAKDKcP9tJCyTKdv5dORgNEBhdfx4
    f0WHfy57Ulgro6etw>
X-ME-Received: <xmr:UdmtY8WIeZSJYRGbmyWzqPkGlQFWo6jwEQSXRNhnZQZ0fQjLOY_S-ZSY4eK3oLiA8H7arpsmfSwdvzBxhOfnQdN1Qmh7VCO17VgNyiNawb4fsM1bzZemAJKSsXczU2dD3TL8iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UdmtYwimH5l_E3jhm33R9oQDPij5QPt32GrDx_TGy9WewPfgrTQPtA>
    <xmx:UdmtY8ClSN2qg_0Gqqgj0cvLVzEX5VaHMR4UGiIV-CJ9baKjjtWrxw>
    <xmx:UdmtYxKvv0pOBhhI6O-gvQ4Cv7i7OzMNqkQGt-qbij5eL-CiefBOnQ>
    <xmx:UdmtYw4oJGxu7iekD3QONDx7AQNG-r7WzxxSIPGSY_ahepSsILFEjA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:44 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/7] mtd: rawnand: sunxi: Update OOB layout to match hardware
Date: Thu, 29 Dec 2022 12:15:25 -0600
Message-Id: <20221229181526.53766-7-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229181526.53766-1-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101547_344165_77D6462D 
X-CRM114-Status: GOOD (  12.07  )
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

When using the hardware ECC engine, the OOB data is made available in
the NFC_REG_USER_DATA registers, one 32-bit word per ECC step. Any
additional bytes are only accessible through raw reads and software
descrambling. For efficiency, and to match the vendor driver, ignore
these extra bytes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8e873f4fec9a..a3bc9f7f9e5a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1604,6 +1604,13 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 		return 0;
 	}
 
+	/*
+	 * The controller does not provide access to OOB bytes
+	 * past the end of the ECC data.
+	 */
+	if (section == ecc->steps && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return -ERANGE;
+
 	oobregion->offset = section * (ecc->bytes + 4);
 
 	if (section < ecc->steps)
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
