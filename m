Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E87AE82CA6
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0Br5so79PanMACl4/euJaF+LBETFoFdsB6cxHcPC94=; b=bYkryB0owD5R71
	IJNFDUqtdCZA+7/c/Yl/XI+jw9yRgx6qWRh7GMKLbiBCN4N6IxD0A8ZqKC6YdllOAXTVzgLveIaj1
	Zhqjy6e0bLUhzkq1L8m8BxYDy2GMUkYosdEg31ZFP+rQ0oTcxoEc+8a/0IM3t6yFQpNsuifi7pYlk
	A3a3cJjcXGq4NKZSKdmCfxOo/FJ5N7Qsp3uKcxT1H1Ic5lP/J/u9iKlWbE1yJyb0d38dS9SWAuR6G
	2NN2SvdUkQ58Kam1pSWJe8/OoToPzG3SNbnwy4XGb/yuZn1M4pDmDbFvaXZ77PrP1nWfavl6vY2NT
	pTIu+IuptH+U3CWcNqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWRm-001F2t-0j;
	Wed, 27 Sep 2023 15:27:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWRj-001Ezd-1M
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 15:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DD30DCE1A95;
	Wed, 27 Sep 2023 15:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FC5C433C7;
	Wed, 27 Sep 2023 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695828441;
	bh=psoTQr8mGkV3UKidOz+pQ205UAHWxAMSfHwgV7szlp0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=s1bKn/hrxcB+5VItQe5OsoMYGoU/S0bzhLZqIPWY+8oyIVylxEls9DGhiSFV4C8K6
	 MK25VHKQVGHZ8ANAV9qxiSEG5H9eMprCeTwJr85mwX2/hHBtZLzTUAcggEqF2RLG5G
	 zBvQMGtJ9wFMVIeY+9dxWzAfSQRWVIbriGPHz2mP+ANXqID0mQzUxVLyL8PrcGQdf+
	 +XjihmnzS9FZ2n2xDaIwjHebV5sHP1u9fxOBbMGpp0ZPvDKHDBeCrGHfDyc1t+KG7g
	 Y/CSQIpivWbIzkBq3Nq3JWVY6WSI+ubjCS+20T2K614XJydh5D9dWT/v8ckf49KuR4
	 q0q5iCi+E6tSg==
Message-ID: <d919baedaa11a1d6a710edce20826c82.mripard@kernel.org>
Date: Wed, 27 Sep 2023 07:20:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Packham" <Chris.Packham@alliedtelesis.co.nz>, "Christophe Kerello" <christophe.kerello@foss.st.com>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Kamal
 Dasu" <kdasu.kdev@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Masahiro
 Yamada" <yamada.masahiro@socionext.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Walle" <michael@walle.cc>, "Paul Cercueil" <paul@crapouillou.net>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Rob
 Herring" <robh+dt@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Vadivel
 Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Xiangsheng Hou" <xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_082727_659561_04029E00 
X-CRM114-Status: UNSURE (   6.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 6 Jun 2023 19:52:29 +0200, Miquel Raynal wrote:
> As discussed with Krzysztof and Chris, it seems like each NAND
> controller binding should actually restrain the properties allowed in
> the NAND chip node with its own "unevaluatedProperties: false". This
> only works if we reference a yaml schema which contains all the possible
> properties *in the NAND chip node*. Indeed, the NAND controller yaml
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
