Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA0DE82CA5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs0VIk64PQqeh/KO6LRcxDw5hWVriROkJd8TQETilVQ=; b=ilLLBi8Ll3yFLv
	wfy2/DMBD2rq7CnEv4R9zRf+6qclkP8Wx4SxX15Up26zWBzYKpJaqlUkT2pctiC6WZJ3IdEt+wyhn
	iVa2eGfqLBf9lbLZ4FB0uTjISGfVO1lS1PvgQfSK1wg1BR1l9/haP/nZlxGoR06g+Ipd/uxErT3x0
	OBt5MFtCei+6fUE4vLYzf7XdpUBF8dOmw5SqXqsrH+6NGArdkUUgwWBASiVhIuwwFTKeFFgXhM2G5
	HKNxYI/QSmlUAdZIN2mz5YiniqpGj7Sszm3P82kykn1ulqp1iw7Rm5xLomN175NJ6OI+U3TA9BA0y
	eO695h//+bsJDvKcNYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWRg-001F05-2Q;
	Wed, 27 Sep 2023 15:27:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWRe-001Exw-0U
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 15:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 658B7CE1AA0;
	Wed, 27 Sep 2023 15:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDCCC433C8;
	Wed, 27 Sep 2023 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695828439;
	bh=RUPpmHbb4kJSl2c/HLftS0eFYan82W2JMeZx9U6odFM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=m2uFvcH/Sh7Py6hPDqCl2ffQkF+wpMQrL3cz00UjOU+0iKN/p4fNZIC2Y55QwFQHV
	 zkfHk7a2B5jDM8lwiD9pw+X9tFd/AX8qZOHDj53UJZV+4pIzucP8wfGGkjiH43QaX5
	 2WSgIk0bAQDEkHMOE8J/xKMz8jI5nBBU7Ipz37yvJEPlQNwfcLQG1eXJXrevm8eZL6
	 B6r00VOqDYFG/4PcVC7wWrKnUm+PWTY1bYnW42OxnCDS5TBCNEEQkoa8ZRcibqEstF
	 jOtkcmdYkRIfR9OYa3mwTY4NylxErIjUzKvAHLe4QkSodXP/HOwKm4uJ9X6UtzDWLc
	 4V+TSgiYhW+jA==
Message-ID: <c16e9f00a14f232b2408ddcb5f8e6f1b.mripard@kernel.org>
Date: Wed, 27 Sep 2023 07:20:30 +0000
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
X-CRM114-CacheID: sfid-20230927_082722_400905_E3B7A484 
X-CRM114-Status: UNSURE (   6.83  )
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


Thanks!
Maxime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
