Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55899C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AScCgpMRSYve7jTdDrnrO+himktfpLTKNdneT5jGrz8=; b=UsLeQhtDVUoBcy
	yNt9e5kebMZIkI9KlzoW8C7rQAJlPgjxXLgLHQRlK2wRGx84HtGj0sgSms+M7iDbEaNiszUEIzlkn
	m1UPJ2mSYFturlPhYWCOPsLqgotU6eJH6QN+HOjSivUhQ4bPeOkEsvuKZrX/xKz9NU+oYvn4r5Hb0
	20t7kdauurjuNXMB7ooVezy5l0pFbLV93dHdbGJ7XOSnR/68eUd/h4VjwxB7zTxzt5GuK57SwX+/w
	mG4dMbe55FT0bQQ0NKcZj6OvvKmwmnJpudFuikJk9ACQ2qsIjzu5RtonhMnjYWKB/7sRdFgCwFiQt
	gB9uLnhwyXIE7SX2uY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxUF-000iJ3-Fp; Thu, 29 Dec 2022 18:18:39 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRK-000gwO-6i; Thu, 29 Dec 2022 18:15:39 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DC4383200909;
	Thu, 29 Dec 2022 13:15:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337736; x=1672424136; bh=2t
	sBIXORATjAZKv1+cfGVeLshq6JEsC7gla2AnZEybo=; b=fh1RYumAS9X7eYRhei
	C65sJt4y89btRu8tKd7ito5an3dh+TTDfrWQVEoD+4FsRjvfJ02mGnKl5Kh24B55
	lHcZe9lk8Md/DMiwOnMgf0c2heXSIz/yNqgKbbqaIxSnpAwASYYIF8WJbveV/ceX
	nedGcIpbiGKUNHy1sYyQkPA2i40lAaGOESD4hZcDIjZBUmRWiidyzmgcN9iWtlFr
	J7hd1ry8wVhvnJ2X9gYzUJlJNg++EEKxmNlNtPYqmTouLhIVAo8SNZ06wtal4UpO
	NwRIUJpRa9ttVaRyi4rTtMxzTrgS998Po6TXN8KNMTN67X0SAXkayOlmqqVsb7U6
	BEAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337736; x=1672424136; bh=2tsBIXORATjAZ
	Kv1+cfGVeLshq6JEsC7gla2AnZEybo=; b=QX397Uypyc5ERHvNfuUiyerBrpDqQ
	wTIr2Vlf8apX1gSTCsT6fzwkeuXxQnVkyNZwDSwPMyVoXY5eNaF+irs4ja363Ld+
	UmfSnSSVeOmlgs8fWHaPkgd78PoSRgIkuI3Js4pwUaTMZrdTYuaCoPsP8qtH9UzZ
	hViAM8RC2zyDwx3QNOD/Yot8VtdBad3UK8AbQ4CaI0b2ti/12ezjL530fOwIGqRj
	HV7FKNhdTq3Gce2QrCLP/2DSIBd7CeNa0bAy14cJluBfaRLV84h1BlpA9YqGxrHl
	wAV8gl1QCQwj1sPuPQBKAmvxQ+2Ezp/pZOAxppeUPsdOQX2+FtSFl2xCA==
X-ME-Sender: <xms:SNmtY0O4Ug9dlg0SfWriIAj1j4HwCjJGYAFl-2xTsrWCUZuaM03P9Q>
    <xme:SNmtY6_CfhdS15sEzASNfNJ5b9BmP1JKlpdHusyie_LRNmeayQOcmTRRRMLgW2WLT
    M_fkrXlbbINpti5kQ>
X-ME-Received: <xmr:SNmtY7R2lhbXQsnsCfA97jhvrsn9ZPxKOd4BVuees6sn17wbNa5M69mfh5ZAZgjhPs8uxlIbpx3he6_0t0mlwB4VVHjgFrOTyuNddD638Lpm2Ok_gICp3SxJCa_3y3_fvfsy6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SNmtY8uuiZcRgANGYBrTWHx3Wwn77EiME7H5vnU5HyVBwoVDZeLDKw>
    <xmx:SNmtY8eSEaKP0TKC0OoueUtuMmfDP-U0TyLWixWf6WOYXcJwkqHLUQ>
    <xmx:SNmtYw3ltC1nv4r0q3Z0L-Ex3CWoNqCk9gES6cxCsNuXlbCxqozbCg>
    <xmx:SNmtY9VkLvzMynObp_JbeyiMdlalC-IdLDN0TxjlUIZQoYUWfj5pww>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:35 -0500 (EST)
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
Subject: [PATCH 3/7] mtd: rawnand: sunxi: Remove an unnecessary check
Date: Thu, 29 Dec 2022 12:15:22 -0600
Message-Id: <20221229181526.53766-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229181526.53766-1-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101538_331321_A4A68067 
X-CRM114-Status: UNSURE (   9.26  )
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

Each chip is required to have a unique CS number ("reg" property) in the
range 0-7, so there is no need to separately count the number of chips.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8b221f9f10a7..1bddeb1be66f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2060,14 +2060,8 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
 	struct device_node *np = dev->of_node;
 	struct device_node *nand_np;
-	int nchips = of_get_child_count(np);
 	int ret;
 
-	if (nchips > 8) {
-		dev_err(dev, "too many NAND chips: %d (max = 8)\n", nchips);
-		return -EINVAL;
-	}
-
 	for_each_child_of_node(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
