Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C212EC6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+ATlfhsGO+9NWlWImA9dfrthcRlMA0s3xkiUQ8AbgY=; b=vLLQQ0/iahTqcR
	RiGmRKAbONcrLxhlLid+KQ8qXzNz+GMrUwyv49AjF+2EQeU+ZPsNjp5AoN5F3dxLV3OGLvHVE0Svs
	xjZom12bHalRCQGX08W3sJH2jYNs3PeNCceEtlln+jepr5L2u5g0eVGIDtVM9vyS29r0FH6ztBtsW
	xDy3Vgn4tErnb4yXzIXXpvEVCTo1Xxybb7QALjwY7L4qvaRq5nfaTjQaecU4eyI9JZ0WIiZTTJqth
	uvlcx4x5GzmVh/GYOe1Uyy6i7sL8qdbTJenqDBIKKDzdsSYqtcTvqtrHLEE9zfTbophtx2sdcCYN+
	Dhl248H/plLV2Wlbqn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf11Z-00Gc4v-1z;
	Wed, 22 Mar 2023 16:09:17 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf116-00GbiO-2Y
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E983724000B;
	Wed, 22 Mar 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcE5Vh/YHn/UUWlxMLPTBmTY6gfuVYjV/FWBldw0FIk=;
	b=eEJ6f3eFxrPY3y7pL3FVUvsc00nO2UgKJKKnxUvjkBOgacxnoPLm8u7dV0eVPufhgW1DgX
	zSNeavo6pdKFYH8jbOpZyyiGs8fjjhhi9KFa177zb7MV5t0T5i2Vcm3lHFoU4VvFq0ShRW
	DfabE7RuhGXrGHYeH55jSftu/M6UIZAt9qjCmvu3Pb3tuPXnP+V7dU2uRbvbNGqLireIDV
	/yHEn97rhJBuKM1OqhcmZ4+ANWUL34UIIPGyXVGUmvfyRvsCzrIqs/vKGaA6YxJJUb5mi8
	+dS8QJMv7E9OIZrJ0skU5LT34FZWnAxTSzVsHArjK2HmRlaVKTGYcPBPbXJzOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hector Palacios <hector.palacios@digi.com>,
	miquel.raynal@bootlin.com
Cc: herve.codina@bootlin.com,
	linux-mtd@lists.infradead.org,
	sashal@kernel.org
Subject: Re: [PATCH v5] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Date: Wed, 22 Mar 2023 17:08:46 +0100
Message-Id: <20230322160846.2232952-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310080609.1930869-1-hector.palacios@digi.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e8c047b4a92cf4af7a81bf31e9b31fedc7434335'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090849_041216_B1621C1E 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, 2023-03-10 at 08:06:09 UTC, Hector Palacios wrote:
> According to the ONFI specification, bit 0 of 'SDR timing mode support'
> (bytes 129-130) "shall be 1". That means the NAND supports at least
> timing mode 0.
> 
> NAND chip Hynix H27U4G8F2GDA-BI (at least) is reading a 0 on this field
> which makes nand_choose_best_sdr_timings() return with error and the
> probe function to eventually fail.
> 
> Given that sdr_timing_modes bit 0 must be 1 by specification, force
> it in case the NAND reports it is not set. This is a safe assumption
> because the mode 0 is the minimum (safer) set of timings that the
> NAND can work with.
> 
> Signed-off-by: Hector Palacios <hector.palacios@digi.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Link: https://lore.kernel.org/linux-mtd/20230223165104.525852-1-hector.palacios@digi.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
