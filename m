Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA67C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGmr2eDo+sCl5jtDyIpGb8J+2ppDJs6Ru/ufSajt7qQ=; b=N3YUOlsv8m4Nkv
	sJHphhTC7oMJlh6lyAH+EXvGfHOf9ynPdmkG366HGpflLnxE/OuLKWeBzkeXIVXxKPbxLTDvUU8Ef
	6birrsnIRlPw1ug15bpe9iV4NnABIpAZsWlYfdc/4FusPLnxcjtB6hYJ57mwv5IoIMBxh1fGMfKfU
	1YugCNPiJ8aQBov0TIsrPXFAypzN55Z1gyF/sHiIJu1vidrKwc8i8hp6RGBtP2ruepUUefLe2jv6v
	otTXNLoM5l0Kj3u4BUvaxfeU1PUdrJ85/FhgPiyLU1b3jeR3I6Dy7pNIub0V0GKgXjGYQnDkmDGRU
	WOXdluUFT+R54Qcs9OAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyYl-001IA0-Uv; Thu, 29 Dec 2022 19:27:24 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyHD-0016DP-9C
	for linux-mtd@lists.infradead.org; Thu, 29 Dec 2022 19:09:16 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 4B0AC32005D8;
	Thu, 29 Dec 2022 14:09:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Dec 2022 14:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672340953; x=1672427353; bh=Oe
	tE2bxovRIangZAcEXPm1k/wwprZFIdljerdmOvL5k=; b=z4sXU0z9KwQ/Kg83h7
	sbWlXjkOurNEooNA217bA08r//0RDtspxbBwOI6NO2K2bO8YGsEogxjq7Sdm2D5J
	OthmUOnInOWy0KgHpxmmCyVsD9a7kyQfkcTBXnAg16WaNulvbj0kfw3VmqXt6VK6
	0esUtXoh0aVSTboM6pvjNskn6+mItOwiG8GoEyM8XaMBTm1oMdk6k0YLOLKF1CmT
	QtvIOdOPGP7afW9NhjL3+UVDPNiDyu2kXDWMjtbL25U44YX0qyOHxIKa7jaTUrFc
	Z+YuOcJ4sgqDdSOVOma3CMPNtpHKQtzfM1xcSvPwNjhc/8Dlf3tZY1+vVm7Pfm2p
	kA+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672340953; x=1672427353; bh=OetE2bxovRIan
	gZAcEXPm1k/wwprZFIdljerdmOvL5k=; b=o0eLNsmvWdbUeeogoD51FWyjlsD9v
	rx55U86WMdn8eGJu5EqpwMO6CzwKf7t6P7+e4DYKAA+jBlB1i+lKV8XfhfeJQ+5/
	yo6izADBmkdcfly8pQMad9+hAfFRKx6XVtYhSBxTHQrEH3sM4kdlaSV49BXdkaeP
	uO55arWu254q9/LQz4XbzeXSDdm+3tJj2D6EAHy1br3zCn005s2oiiwqs9pnqT7N
	Xv6owK4TxV5xRt7J8rZJ4gpXLtURDY7/kVeXQJRuPv2/qzrG3u0bXvrM7eKLLR1j
	qGrYnCVqK86rX1Qn9hQkNC3btIvPCDY1XW5+5zOXc7CHZz34iLJa+6rRQ==
X-ME-Sender: <xms:2eWtYyHeIqTazav3WooCyjlRsvbZ1ACUtk9EpmIezgnoziICfnInyQ>
    <xme:2eWtYzVWzOKVbMskhFzN7tbChe-torzgMJ9VFEqSI03rReV_Ht6GmoTJbQ2V6EtBY
    FBZLoI_jcQgYoJhqQ>
X-ME-Received: <xmr:2eWtY8KqsIxVkd1Bji5fh4dbszIlo_5vIzzQYrLy1LggV7krH3MmS2OFI5n2SiWfKyNUdIio4iubummexYlBvUBdvyiVW_mp65sMryS9x_3l0BWYIOHlZs271FRF9Y7Wyuev2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:2eWtY8FsXoycn3r8EqNFzWFI1EfqNQJIeHgKn_roFLNVpnNVxur1wQ>
    <xmx:2eWtY4V4GXbxIxbiuzSd-6E6bLdkbxiiQ8jLZhjyhGYHf9rPrMsG2A>
    <xmx:2eWtY_NqohxATKNqahn0sRMUMLuKVQmnAvZMeof-agq2Orjl2UlwGA>
    <xmx:2eWtY2y-ABsyZXIO3Y6zuExuI8kIdBMfAzRVWqxzLdvUcfV6W99z_A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 14:09:13 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [RFC PATCH 3/3] mtd: rawnand: hynix: Expose the full H27UCG8T2FTR-BC chip size
Date: Thu, 29 Dec 2022 13:09:05 -0600
Message-Id: <20221229190906.6467-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229190906.6467-1-samuel@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_110915_505276_B724B94C 
X-CRM114-Status: UNSURE (   9.20  )
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

This chip has slightly more than 8K pages. Now that non-power-of-two
chip sizes are supported, make the full chip available for use.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/nand_ids.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 167183ccb9e9..f20a65aa090f 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -57,7 +57,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 		  NAND_ECC_INFO(40, SZ_1K) },
 	{"H27UCG8T2FTR-BC 64G 3.3V 8-bit",
 		{ .id = {0xad, 0xde, 0x14, 0xab, 0x42, 0x4a} },
-		  SZ_16K, SZ_8K, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
+		  SZ_16K, 8448, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
 		  NAND_ECC_INFO(40, SZ_1K) },
 	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
