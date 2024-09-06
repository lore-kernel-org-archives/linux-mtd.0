Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E6E6FE20
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCQn3M7JJmndE6QXhO1LlKllMmnQJWoWd7LGbmwP8cg=; b=J5Vnu9k2kYPr9u
	xCCjDepYgHlxpJh9LZikDSH81FnjkodF9vRKGyd3lvOndLfwFRyWWjW3GaUAa2KKUhmINXnCu8sDa
	vypKPDqU/7cmCYAEBGwQziO9OljPhu5hr80jc/X+AjshJDtNdvBQQCTdPTYxkrsVTZsPMQkyVk/rX
	HP3Tl7WNv2U/LQx3KIZjX61xvD17mHhLHoKQJYd0Pti+pu6BZ+t8OFNTxp+ALG69NV2eeWkUAaYKC
	PrlDVMHB85dPcHI6Ers9sFMCBCgUnV0pPiMPtSrPY4k+0mb6y3OGt9gAnn6hzM92JMJixbolNm4PY
	G+03uy+mvRoqhWqBNglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaZh-0000000ChTx-0SAk;
	Fri, 06 Sep 2024 15:08:37 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVO-0000000Cf8x-0esq;
	Fri, 06 Sep 2024 15:04:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07CA40006;
	Fri,  6 Sep 2024 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw3jelfZPGpJojoqs3leXgvbUvML2v+wgQjqH8fSPOg=;
	b=Wf6SCxH6Yu5o+CGniDQq5IIduRCsRLQB/oErbgsNq8vdm3JLhwO5a1soEPJX5JOEZQhW58
	T4XsIFeGaHAH/06yxElbpGgFYRaTYMmW1XtIModGnXxTeS6+ymyeyiX9jkrGED+RZitQ59
	6qy1xp9C2BcWBKcPrAab7CkG9/SaaCWtSc8YQXU3LyPX0pEDgXSrTnOv+KFlk/H+K0dDGm
	1WSsZfMdBBq4jhHwePwiiOokGprjB6+Eik0eyox5fhvN6anUcn6kCCWtz5+Ge67qdV0Wyc
	DXg/l1qX5ELRDfziQcLFmXFagLTeOuGtxr2g7s32TBcclbT4TA5jBPeBc4zX0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 03/10] mtd: rawnand: pl353: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:04:03 +0200
Message-ID: <20240906150403.734743-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-4-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e2e4eddf7b16a0cb431878e95e8bb80d893e4077'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080410_348903_3C7AA49C 
X-CRM114-Status: UNSURE (   4.46  )
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

On Mon, 2024-08-26 at 09:43:21 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop by using for_each_child_of_node_scoped().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
