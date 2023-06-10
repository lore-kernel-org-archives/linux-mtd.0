Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A8AC77B7A
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jun 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFagriyGimawAb/BlJhqFzSm63dijzE4biNv+VcTwf0=; b=n/SJOJLYwRohMe
	nQVgW9/n1LsS95AMyiKEcu95l3pZlLNE9FRpSq/WsBF4/gQPY9u1gnIoJAhzohiqh+g0BBWa5Sxym
	tJg9aAloi8iyyfccruvvmA5MetQaIFbC4OiN4daCFxtUbVGDO0R4ABhyBGKIauNF8iKHrpqPGCbSz
	alcGV2Ru/usytgBiMZ+Xt/K57Cy1dCHG2pIiKox2rgtsnrLibKEoH4n97yI3LecJx1p+QD4dnWZV0
	bZCEx6e35yH1MPzkKJjHI120vtrSiGIBZ7c+ITGTaWYDz/mvkHCWWmdj31+awGMRYijVBOWlcyQ/k
	S1qhJWoI8iu4fpygIGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7utN-00FdvG-1a;
	Sat, 10 Jun 2023 09:28:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7utK-00Fdui-0S
	for linux-mtd@lists.infradead.org;
	Sat, 10 Jun 2023 09:28:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8C8960B97;
	Sat, 10 Jun 2023 09:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69BDC4339B;
	Sat, 10 Jun 2023 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686389290;
	bh=JeNd9EoPp12+uYLi5ZosgsJF5qp0+CIahTtNm8NnSbI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+1P8pGKlZYt5VR9P8sPEip17CA5XFt0habYs3SBZ7fF+dk+vMsFKegEdRuk0dEJ5
	 /eHQNYCB+WwaXl+P4b8Mjx3TABfAQetz3Go8/leP3MzOyC8416UT8UIEUMucT+k58F
	 HhkHNHWLdxn5iH0UwU2tFC//kumcWI3BhvYgay2ycfs0B2WRq7lGEUqkGbUsCDFKgK
	 TRTSF897bdZChRziI3YJQ9gflGW/I32piEWX5AxRyN9CxOu70hMKbo1vocR9+kVYLo
	 fsB/RNU+7+IpsQsNc629MZexpU1dQvZRJJPCL5Vqgo/7T+3PTQyqUr5fz2b3LTCcLC
	 YpRwBVdrGa8lA==
Message-ID: <e886db25-dd5f-c8d9-83d4-77540fc3826e@kernel.org>
Date: Sat, 10 Jun 2023 11:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Brian Norris <computersforpeace@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Samuel Holland <samuel@sholland.org>,
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_022814_244548_6F124065 
X-CRM114-Status: GOOD (  13.11  )
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

On 06/06/2023 19:52, Miquel Raynal wrote:
> As discussed with Krzysztof and Chris, it seems like each NAND
> controller binding should actually restrain the properties allowed in
> the NAND chip node with its own "unevaluatedProperties: false". This
> only works if we reference a yaml schema which contains all the possible
> properties *in the NAND chip node*. Indeed, the NAND controller yaml
> schema contains properties for the NAND chip which are not evaluated
> with this construction.
> 
> Link: https://lore.kernel.org/all/a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org/

Please rebase on latest kernel. This is some very old tree if you CC
this address.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
