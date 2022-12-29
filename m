Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C838C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1pVMGiXawIrGtLtHIcv4fJqllATAF0x1BnEEWpMrTB4=; b=2FS8f0kTfKqRSO
	WB8YjnFlLEtkUsvRDo+39YCsGC6BLHlkonVzSyBd4pwW//AwbISVDLJ/DpBy0PMLqq3Yx8PWlyHAR
	RUFrW4j7TGDDJTq33QzLdPDoJR191QDoUk6kjKrFytz5IVibblG5i6rQUKLdeO92fNzrxVCuvTz3N
	3rLak4/A3pzNB0GWb1wcm/Wf+jhpR4SXH86w/PpsG5CHn9Xyt3RT8w5zb9cgcmRHaAXDnAuc7QpKn
	vSEeUn/gnzDBLffVJA8ONrGOG/2DEqdCYDI22wHGayFgW3ejVsVSqI4g7VYBo++COnAFQOm9xVAKV
	BlESwFPp4TPprgKBc94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRm-000h52-8j; Thu, 29 Dec 2022 18:16:06 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRC-000gsI-OM; Thu, 29 Dec 2022 18:15:32 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2E28332008FF;
	Thu, 29 Dec 2022 13:15:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672337728; x=1672424128; bh=7ZnnX15h1ezrtWz76vu0WOxPl
	qy17P9/bTAqG1Jqm8A=; b=rJvbNw70l3N+VRXKsAkKi2rMSIheT3BGiT+PgUT/8
	pEw7Zswjwt9Vw51KqvfY1EYZh0UbZMkvwycGNzrfx4PKaMvVPOYDqYkcGsk6xBvp
	BvyKwtHjJwJiGRhkGUnHy9FdYxrmIeAlQWJofJkmAXdzLwr2pxohFc/2D9G+948U
	xhs0P//UNUbkQKTKndtgow8Fk2Sc00523D+D6e90GX2G6jf02KkLhdSIaCcNCS8U
	Vtir197MXUf2MNKB11Obi38wbGIfioGSZg3OpBvMB+bUNpoRay6FiSpkAQ1cNpSb
	je6nL2/CK0Cx491Hh6yz/6mHDgkbSAKWj4Md6/hUyrAxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672337728; x=1672424128; bh=7ZnnX15h1ezrtWz76vu0WOxPlqy17P9/bTA
	qG1Jqm8A=; b=hsgpT/wy9I3pFv8aaDrH8/UuB+r/nNkZ2VBEJ6CAPPw6Dag1uoA
	pbZGioHT/Q+FIpP6L+J+zhbrkz2N9itg+bLynbuazqv3A3K6i3gPDsaFHBV4LmAf
	9Ewt6CpkthnBMq4vqyKHIMrq3WyB60yg/a5JQhd5aCqPbqGCFcJcBXT9+iMUo0iB
	ejH7hDCDmomUA9lffIuFluc4lnQQS0un6UfQxioe2LTf5wFn3Wv66ncm6TAH3aXH
	+5WduoXDvXGX894L/5hyqTbAgbbWUEMeOxEdrNoDh3LlU6BeU/tBMReBeMm5Q+MK
	hUq+MnH596Xqvt6AaGNaguwKmPfrtTLfgRQ==
X-ME-Sender: <xms:P9mtY388Hhu4itoTzQZIt0pAAQjNRL2aCWCEjOH5xSLSdJTiU66F3g>
    <xme:P9mtYzv4Q-Um-ze7O3K1OLwO01gB784EnNpqWK0tsO-amn6WZF7PwHQDgxc_2hxAp
    TxpohAgbDCDgYbrLA>
X-ME-Received: <xmr:P9mtY1ALuqbZ6GFQMCVrHKZ_IJrscgQrk-gMPZhymJ010pxauaznyiVJwtaSmwBhm4sW41RFJ577rESdx7KGAMCKonDq6ILyUI__ywzm2QGD-B8GW5aAvjWO5VexLZ9cb5sk4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:P9mtYzcdBDa7fJmrEW2S0fy9MgcsxvbNZN0Kc0ra11atUDXczPiuvQ>
    <xmx:P9mtY8Oe946Vb4VC4m8XDld8kOX4xQMn8fdeS42Y2YRDopbUu7bNHQ>
    <xmx:P9mtY1lnvE5otaf8EDN-sL-B-GKLlC5JMXWz3uUDkW9beM3N9r2Bkg>
    <xmx:QNmtY9Fn39z5_iN-3TAmYb0rLhp8290xUSe1ohsM3C87jURzL6faHQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:27 -0500 (EST)
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
Subject: [PATCH 0/7] mtd: rawnand: sunxi: Bug fixes and cleanup
Date: Thu, 29 Dec 2022 12:15:19 -0600
Message-Id: <20221229181526.53766-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101531_040943_4BCC1DAD 
X-CRM114-Status: UNSURE (   8.62  )
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

I have an A33 tablet with MLC NAND, and I wanted to use mainline Linux
to dump the NAND. To do that, I updated this driver's ECC ops to fully
utilize the hardware for ECC and scrambling. This made the driver
compatible with the existing (scrambled) on-flash bad block map, and I
was able to read the full NAND contents.

This series contains some initial bug fixes and cleanup from that
effort. The changes to the ECC ops will come as a separate series.


Samuel Holland (7):
  mtd: rawnand: sunxi: Clean up chips after failed init
  mtd: rawnand: sunxi: Remove an unnecessary check
  mtd: rawnand: sunxi: Remove an unnecessary check
  mtd: rawnand: sunxi: Fix ECC strength maximization
  mtd: rawnand: sunxi: Fix the size of the last OOB region
  mtd: rawnand: sunxi: Update OOB layout to match hardware
  mtd: rawnand: sunxi: Precompute the ECC_CTL register value

 drivers/mtd/nand/raw/sunxi_nand.c | 132 ++++++++++--------------------
 1 file changed, 42 insertions(+), 90 deletions(-)

-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
