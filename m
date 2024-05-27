Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C057C25B7D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci2IvryQpZKDrZ2FV/yeexNLCcshJbdl+HZb9A80wmA=; b=Wb9aP2B28TmtJV
	X98D3HoY++8q7p9DcS/SvH7alun0lRmKp9F/WI7arA4AkBY2RgbRBYXD4IeX/cNPVUxDFJBYRuYlX
	GMakL+UvdiLYZWMfGl2cpkwUCtfaj2d68CNOVso6i3XGTF93m3DctSWNrNnUgf175iwRFub7fn0rs
	1+xrjMC60v8XUf9Lj314Gu6dlTt7bXldSDcaCfOozMbiT9ZMsguC+NNryMOrrkwxeMMzEcb4fyS2r
	yZJ0YmEsNjQzCLbEc5ahoTJMG0HKG+3MO6R30AWFYwj1BRnKw9ykO3HTXxtAc6vp4S43a1bOnLNZp
	ALq3BAMVHPASWNjTXENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJM-0000000EpuO-3MWi;
	Mon, 27 May 2024 12:18:44 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJE-0000000EpqL-36p7;
	Mon, 27 May 2024 12:18:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F3F1FF809;
	Mon, 27 May 2024 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJGCBGWt/YnEWyTAuowr4XOvldsHsCCiNE6m/L9+UDA=;
	b=D/JZ7hcUtunEHjGi6W7diX1NPrwkhQsjZ8sibKty0ZOrxXwRRlUIuDQJamLQhcuyaJhNI+
	zNEgkEr/3Owkhq++mI9a9tFiiYwkyHb1NoX9ABbKsMglYebZPqFtHa29d2uFEVD4G75TvJ
	CB30iHLUTZt8/o43W+rqBI4FP75WQkWTgpnOATCTAv74I7pvVoKnx9eLBMDIkvUOc6WWps
	guTLlHtwsEr6JeXO36p8Z/Vf3HduL+W4rTAQrzPKawvHkwb3gUPw3lUQhves5E4bo7iUbC
	6RCFM7zr1B524QVYWKrvfuW6+sswaX2zf0C3Q2pWGOtmIk+DYhunhANE6GndhA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: gpmi: add 'support_edo_timing' in gpmi_devdata
Date: Mon, 27 May 2024 14:18:33 +0200
Message-Id: <20240527121833.178429-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520-gpmi_nand-v2-3-e3017e4c9da5@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'88861f37ce6e9e31991e248c7d9d04ae2287b377'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051836_954647_DF56B38A 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, 2024-05-20 at 16:09:14 UTC, Frank Li wrote:
> Introduce a boolean flag, 'support_edo_timing', within gpmi_devdata to
> simplify the logic check in gpmi_setup_interface(). This is made in
> preparation for adding support for imx8qxp gpmi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
