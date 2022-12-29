Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D030EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 18:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tREkXzQWUtML4pQrml4FCBsPqF+z1UAipQ+S9ocyrfk=; b=urwyGyUYT4/4Uw
	/Vw1yIYkgiV/xs2dkDgM7aFzp9/iLZwAcUchg4XiEMECmGigXatFAWOmMuZXFjCGUXyNh/FlXsTuu
	MKn61y00zVmofSMtsnfD0vmaF8lGoE0jDnEtEIDcuI3uqmK6ALoVhn0MQZTmLj86kvF7G7HnzfFH4
	BUIMCm3Cv3hryq2egTofLHWkvNRQHWM3Jl9+2Av6LVzeM3H81/nVLPwgrEAQ5RpFt+46CjDD6O9Rv
	UIxnxtnPbu4v1H0pt3oLMi1cwzo6YkvvN+9NhApG6Gt+w3lw0jX0nrY5b1jUR8Ht9fzfMRNms3mr3
	iGYQWR+r8cW+OriJr7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxXa-000jlg-Hw; Thu, 29 Dec 2022 18:22:06 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRQ-000gzK-JB; Thu, 29 Dec 2022 18:15:46 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 46E033200909;
	Thu, 29 Dec 2022 13:15:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337741; x=1672424141; bh=pV
	PQa7Oa9NfFrWw4kM0RTohv+m63gRRiGiW2YrMQGls=; b=T7T2dv2FzNpv6Y1oXC
	VKoZn8SgpVp7BdsTqlXkXUv5qY/hBC5D3CZl9W4ooEO2TTbdtcMVCl9h+t8DfOjl
	kHGs0eX+YSAFhbiybAd1wi4dy+2EKQ3+TmJiV1m/hMB7E/mEmoNRqjkprPDuVvbV
	sAOOUo22SPTyJRJGVTs4Ih1HeK6VA2ZnOlai3givXQDoeZlbimA8nMaYYPS1lBzf
	LenoTfnBO2Yn0/Umez2HX4QNk6SJ3TuUBCl7WpWh8Nu9BLDr6vmQfzAgs+8B8f0D
	gSbPcZBmya/vPN/TZg50jhy1XctvhHPehiK3QLpy/KbGy7Ivu6O/fiiJ79zGf4e6
	Q6GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337741; x=1672424141; bh=pVPQa7Oa9NfFr
	Ww4kM0RTohv+m63gRRiGiW2YrMQGls=; b=rqn5MVdneV1TUbiOZC/jhWTOKZcSB
	Ru9uu0CwSsZHbzL6UabABW1+oWuwz+awkLUfbI8wG1DixZseEBmIszlAsOBNeJQt
	+NypcQy+Hv3+tS8vo1X3YFwpQTQDbNegHQMEozKXa5Qcr/GFTG5ABzp0EHDevjYD
	9NceDBOPUY2i5Y1VTFSuL9AsLk/J67E+DRSpgDMUdirj248v1AM5BQMRWUqb+GdJ
	AjciLSO+87PYviJOz4B+djZGKSqIeekBuJToXYQztdvqWkg0GS3RVvGAxDMpgDDm
	833MgTiUfDzLuoXj5CgQ/wMK2XIPE+cOed+wqM6KyH6BDgRd+eXclVpLg==
X-ME-Sender: <xms:TdmtYyE8Gw-37qTKUZgjdRjVCAMuMz3Ga69ZPmMsEK9pbm2Df65Pmw>
    <xme:TdmtYzVcADvw5p7gzA0WMFKBRGEpVwvEijVdBgE4SwIceH5hiRQke_LEDVx3Voe0e
    6YsiBqde61qnnLEzg>
X-ME-Received: <xmr:TdmtY8I4O2B6lUt6y6fU7j2kpKrX6_XT5KIruhMlUN1VdGuXUfot0m9pIABAp2E4SRQbs9O6rLDI6RGGTLJUYjOpLUxWyM-hRJc-Q_3EpC0OUCNLuOCze1apzCeqSiBq0MGWLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:TdmtY8Hi8AF0hrL1-fPVxmAvyr0J4Vu9AuDBsh7lixrpBAY7TVV3MA>
    <xmx:TdmtY4W2eeMxUWl94MXH_LZ0xc7YdCmZO5DYpxujBC4npxJ2rrwSpQ>
    <xmx:TdmtY_PQUE5RPLVFd0_wxMbfhiRo648OWvULdd95oT1R0hVUElz_Qw>
    <xmx:TdmtYxP0_tkjYEFjfnvRBKSP2WJBpsxW0GMwXpaelX4YJs1mwUN5Mg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:41 -0500 (EST)
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
Subject: [PATCH 5/7] mtd: rawnand: sunxi: Fix the size of the last OOB region
Date: Thu, 29 Dec 2022 12:15:24 -0600
Message-Id: <20221229181526.53766-6-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229181526.53766-1-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101544_696408_8A7CA848 
X-CRM114-Status: GOOD (  11.46  )
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

The previous code assigned to the wrong structure member.

Fixes: c66811e6d350 ("mtd: nand: sunxi: switch to mtd_ooblayout_ops")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1ecf2cee343b..8e873f4fec9a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1609,7 +1609,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section < ecc->steps)
 		oobregion->length = 4;
 	else
-		oobregion->offset = mtd->oobsize - oobregion->offset;
+		oobregion->length = mtd->oobsize - oobregion->offset;
 
 	return 0;
 }
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
