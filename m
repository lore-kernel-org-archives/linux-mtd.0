Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7748FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=ysNInHN+egRCTW
	LmgCSrTSIph2o4dnyUvJ40lmmZZ00JtaKazl1phtQdgVwUmn1xXYHcZosz6iVqGp6qlM6M9yuYOM9
	BQOgN76bfk08wtAhktPNu8kmkBTk1o+GFku8+azlA/0HxOEcVdKyxgwm7SzHCCiSBkqgSpH6PvhgU
	FyJ7h3zs5JALKVl0Okvsw2I8qjdpL2vWahPFSdSx3a0dHrj7BxQsUKlRDrwY/qUYnZhKyHaFz+z+P
	nLu5sKrTf22/ArOL13o6ovhDKoXS9cFqVrW45XGlksl8gLmfae/DPI+hx+B8xWkc4XUM7A3Ovv3SN
	lDkflFJDbrY5IGaCPQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYjEI-007Wl5-Pf; Mon, 28 Mar 2022 06:51:54 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYjEE-007Wjy-KN
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 06:51:52 +0000
Date: Mon, 28 Mar 2022 06:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail2; t=1648450306;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=u4vkmo3YVnD9grhJDGQ7SLNwLFreJiYhg7QdWwFj1tDfsAAfs2Ung02TSZosfntBE
 lnXv2vpk5VF+oBMwXFXuDg3GSA/NpBe5clwMbKFCVp/TleJlGi13EoItlWZaY2To3v
 NS1i9hzohhjtNFw3cY9CdxgAn7tJHmSTjMcJlegPoITOlitxCP5UUpplB9hiOpwMXy
 Glqk1NhHN0K7bFHO/RH6CZkD32+bdUuXzdOJa5BCaHOcwhfJeDe12C+SmYIvATXsCn
 dUraMQrKKfejdu0fXMsXz2ZP/ip6HVaoFF6Kym3vC3afS2hkk1lQRMEI8lbVJhMg2z
 +LvGsHSKasK3w==
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
Message-ID: <98502d10-17dc-6ed5-3baf-92cd639ca7a2@sigma-star.at>
In-Reply-To: <20220325120025.17931-1-zajec5@gmail.com>
References: <20220325120025.17931-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_235151_551240_B312A2E1 
X-CRM114-Status: UNSURE (   2.38  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
