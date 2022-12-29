Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90651C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sQtTOcXXCk1kdBEuXBQ4lpIa/GbaEH5SCfjkWffkHj4=; b=zohK91KpefLpTc
	7pxpbyJLwILd+Ate+hM08g02BNotQI+wGJEvXHfPROp+82oyWgLWlzPkAzKG3JtTlxZiLS06FXUmY
	EqwfHRhoIjkn+oiSZPs5xcqQrf0HZGvFZXutKx6GYSXaRvspxNzIfYtGI0i2EzV96i/z8KyI7GFrf
	WVwY/dn1uJP4R1p0HbM98DYem6Z7GmJRwq2mDugzRkvEB5NiZKbk9lWrUwFATmk2CexOT14xoKOt6
	YFbBuBD204+y0Kb5l2M2scGFkXiUPpVTVeoSsWYCjtipnfSldMl7P8cXEiqrlKZVBI0zRylDg6BN7
	WuIyPH5+NuM60oLQW5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyYN-001I2q-34; Thu, 29 Dec 2022 19:26:59 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyH8-00168W-1F
	for linux-mtd@lists.infradead.org; Thu, 29 Dec 2022 19:09:11 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id C1BB83200906;
	Thu, 29 Dec 2022 14:09:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Dec 2022 14:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672340948; x=1672427348; bh=0RQE8/nTaUDJx2rfTZDgn+HEP
	18KjlUXz+uMmj/1Xf4=; b=T9BbuC+HiYQ10P5oB/PBvffq/N3eXR365yLl+l3N+
	ZHq0/KRiGLN+DkPdoDeesmm3Lymqonl9kAMJifIk0Fo29+Tra4IEkIEikF1NYd/8
	shILVotAK3Z2fxqi/TLQx41MRxI1V3NqWz6ppAqoYxS0RmFnLxSnZRuyNGRQ3ReT
	yx7qfUXRibmL7FAbeoOdlFtFwCDepC8fnkB+WoQOqydRUvpTZDbmxzsd/74T4VGh
	1fOix0uaNDfcgZLFqGqEztNa66EHvhF3LvqGvmqk0JRURO+kTVYCsPAtf5Lo/Hez
	9JnPBTqGOkQ+oulVjQ0uRL/SkBxrPa9fbF61CP+iSdE6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672340948; x=1672427348; bh=0RQE8/nTaUDJx2rfTZDgn+HEP18KjlUXz+u
	Mmj/1Xf4=; b=mL+bYvNCMGh78XX/SW79Ie5O+5bmiRBMIExeEDzSGTXNc0pSwxl
	jjvsFZ+KUWBQ0jUIaEAMDosdq1CUI4crH0BtNdm+Df/0Zf3jUDmUVzmF8ThVe8fm
	TvE4HxpZ2Fv2GK43JWcATWwLYDTvTxQ0lobNKHONHBgPalpM+pNN8ShafZ9bksNt
	d4h/OaIqs4m3ogrzSrLU0hmEB5FjPVpt4KFVnMgwrxe/ZqIrWKWjLoaH/f6h3Is0
	dDaQr+kA48NTRCVDsuTNX13xhg+lMrJayqqLxvk+/ZKnJb8DYQ4fn2JsH6P/AAYf
	8KQakKK7oF3WeDCSbWhrxK2XCPgSCtymY4g==
X-ME-Sender: <xms:0-WtY6cCXEMXezw9B8quno1dTE4qs9TPOddbwMbhXCjUjUHBfvvzhw>
    <xme:0-WtY0NHeeQL2RfIblN0SVb9LD59L-DEpHQ9z30aVRYpnJ1t6N2_O2UuyDHjOkfD1
    GV86mH3OF47PlEuIw>
X-ME-Received: <xmr:0-WtY7jhzQAuFIQzNxv5GL5FTPUL4fyPR6GRotkwPPc3TlTCsZ0rKHz_gWdUaU8HgfBxi0lhQAnSnuxpE84E_kZin0qLDmmJbaeJLFJ3B9lASYA2BnUsd_noAeH6Kqro6dT7HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:1OWtY3_X9zokBMbSNhpha85A0v6nPG3GuzMWi_x03oTPbetgofkn5g>
    <xmx:1OWtY2ufes7Qi1QxihTFEpXej0ONxv_WC9TIbPQeODdcc6nqkmzPBw>
    <xmx:1OWtY-Ge-lZKj0YNckck5JCXrO36pQIvs34FcDMNocZptJezeSyNmg>
    <xmx:1OWtY4IjEOcTWNQJdtRm3FwGfii3mjEKieUnCMtGaWyiUBxnsgvNfA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 14:09:07 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/3] mtd: rawnand: Add H27UCG8T2FTR-BC MLC NAND
Date: Thu, 29 Dec 2022 13:09:02 -0600
Message-Id: <20221229190906.6467-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_110910_427597_2A088E92 
X-CRM114-Status: UNSURE (   9.34  )
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

This series adds support for the subject NAND chip, found in an
Allwinner A33 tablet, which appears to be a slightly newer revision of
the already-supported H27UCG8T2ETR-BC.

I initially tried declaring the chip with the number of pages from the
datasheet, but it appears the NAND core only supports power-of-two page
counts. I made a change which works for me, but I am marking it as RFC
because I am unsure of any other impacts of this change.


Samuel Holland (3):
  mtd: rawnand: hynix: Add support for H27UCG8T2FTR-BC MLC NAND
  mtd: rawnand: Support non-power-of-two chip sizes
  mtd: rawnand: hynix: Expose the full H27UCG8T2FTR-BC chip size

 drivers/mtd/nand/raw/nand_base.c  | 14 +++++---------
 drivers/mtd/nand/raw/nand_hynix.c |  4 ++++
 drivers/mtd/nand/raw/nand_ids.c   |  4 ++++
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
