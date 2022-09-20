Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD59C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYAMbC4h06zrWg7rmA7A4cOomT6ZlPL/49uxxJaAT5c=; b=aUM5obqFbX5ppE
	CIFb1ue6sbrNkzg9lKE6agUvlT3whpPEOZo52f9LW/MVEYvxFpILTpcUd3nLo01OAAxfo3G5uI0ds
	9aRsjV0HG3vBe3Ezy3nQUKDz9RdYVeisnc72XMz2lx2FhYc/eoEOnEZltuGWRO3SsiA+NO65FuAlu
	d1w/iJ5hiR8MOzJZ5Di+Y3YnF2HudZPy/FOWw8MxRbq5kgtOexro8NSf7fDdGPv/vS/NPfZ2LY1yI
	W+ATxkvG6uzuZuSGaK/Oy6UCmYxeYyPlH+RptpYyP1LhXrbmciU2WldcQ0hwUKgbru2dzovJYD1mW
	KDL44ngMEYOv0kGMK5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhr-001rUb-UH; Tue, 20 Sep 2022 08:34:16 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYh2-001qie-OZ; Tue, 20 Sep 2022 08:33:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8A5EA10000F;
	Tue, 20 Sep 2022 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGaXqmUuhbJFVicNWJMGeOrxHPA6svbN8LucqeYADpY=;
	b=gNSTmaZkyz5A/5jnSEquys+Rv3t3Uy+sP/9NtqVEEuPSmHPubla23igZZZ9HA0lagL/LHy
	e7Ga9cbPWOuIPm+VsIfxL8rlCiBEkeZi0E5Y9sP/tessdwUhJPvJWuIu/BgpIjXTdF97pF
	TiJk3Rx8+x52S1ZoP66WgrNafcPq6kFwvtfghzKWaJIfP4E9mfGcu/wT5ZW3Q3JSOhGp1n
	h9GhudegkmxU9TsrLnn1Ae0fcFKmQQjAmhWDT7mevyT9fFTaP07kzdpGZIl9HpNBNkZsi0
	Z63VkDCyugfpNpoO3uLP6Uj5tDAeJ+wZ7HcsDkBjv2AmEkw3xGYllyZzq97yQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	BiChao Zheng <bichao.zheng@amlogic.com>,
	YongHui Yu <yonghui.yu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/5] dt-bindings: nand: meson: convert txt to yaml
Date: Tue, 20 Sep 2022 10:33:14 +0200
Message-Id: <20220920083314.600898-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907080405.28240-5-liang.yang@amlogic.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'16cc974686247c49e156bb74d8fef37e0134d5ba'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013324_968747_3384EBAA 
X-CRM114-Status: UNSURE (   5.20  )
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

On Wed, 2022-09-07 at 08:04:04 UTC, Liang Yang wrote:
> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
