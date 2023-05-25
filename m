Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD88C77B7A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MovIyhrl7rHBZM53f7SXBDA6UgAQN2BZPwEhxQzsgQ0=; b=KY37FL4AlX4gg+
	cvb9mfYWShbbjQYWAHrvGMa705zLmXfx1xJlenb2JMCsqL/rQdXpbs+LkM7bgykZIu1JIzuZzEzy4
	QKh0HQLaanZooSDhvJLIxAn8x5zjM95cdeSFJON2+diAzyxAQqBmQfgxlMkKQ7iFhgZYIPJCOyb+0
	60TVy+l7NCNVPC5SEuUPMNHvQvdoI+GhBpXwJEj9yZ/revUeBD+M2XyqPZunjLIblh10BdLJ3YH/S
	9xrha+ioPFh5I4mTUyjtNN39VSh/HoQwqp2h3BCmxL/wfrf5hz3cASwMgvar3BnrzetPglgoEhXrM
	dSG+4pAIjFceswjRh8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zEP-00F7H7-0K;
	Thu, 25 May 2023 00:53:29 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1zEL-00F7GE-1Z
	for linux-mtd@lists.infradead.org;
	Thu, 25 May 2023 00:53:27 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AE03B2C0288;
	Thu, 25 May 2023 12:53:19 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684975999;
	bh=gakfYzajycWsBIRNP8cV6Mi5LfkKI00ALEVp/557AR0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=opxRzPOMErYuaex5VKKtrEpdkwSwq0I/abh33hNMcE1bFwXayQdf7pizD/waWK64J
	 NWbFvdSNQa3ndbqaG4wRuNGcd5y7JQwoiBm1lFcVWgiaAL2FOujUsZ4V4xu7YAtlo8
	 eYRs7gdeyA76Ge48X0V2nWobvoTYSw5V4QSZ0Z3JQdWsPP8DiNoTpiBDXVXVBaSZ0x
	 X2OSRrSJzW/X3rwgZZUq91ud8vkfkBtrcJroc71hBDyP8wnY58AIE5g5v7tqEcz2Ah
	 N+Gzly+YvsTkYJt8qCJrtNn+4uDu66h/Ijc3ZUs6xERR8ClnrBx+ClhEUJNYgXHS5G
	 Fnu/56z5cngqw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B646eb17f0000>; Thu, 25 May 2023 12:53:19 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 12:53:19 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 25 May 2023 12:53:19 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Vadym Kochan <vadym.kochan@plvision.eu>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Roger Quadros
	<rogerq@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Liang Yang <liang.yang@amlogic.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Aviram Dali
	<aviramd@marvell.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Elad Nachman <enachman@marvell.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Topic: [PATCH 0/3] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Index: AQHY45PTmnmHPuwW40yPMLrn8y8OYa9qtkQA
Date: Thu, 25 May 2023 00:53:19 +0000
Message-ID: <143fb1ff-b2d4-a6fe-e892-b55a7bbf56f8@alliedtelesis.co.nz>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
In-Reply-To: <20221019082046.30160-1-vadym.kochan@plvision.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <BED105E491B8E142A82B3707E313028D@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=QG0ANWG3iu1Ceheqxc0A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_175325_999274_878FE43D 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Vadym,

On 19/10/22 21:20, Vadym Kochan wrote:
> This series adds support for AC5 SoC.
>
> The following changes were made to add AC5 support:
>
>     1) Modify Marvell nand NFC timing set for mode 0
>
>     2) fix validation in AC5 Nand driver for ONFI timings values modes 1 and 3
>
>     3) remove unnecessary nand timing-mode in device tree of ac5.dtsi
>
>     4) add nand missing AC5X layouts , add option to use ndtr predefined values
>
>     5) Zero steps and total fields of ecc in ecc controller initialization so
>        nand_scan_tail() will calculate these two fields, otherwise
>        NAND initialization will fail with kernel 5.15 and above.
>
> Aviram Dali (2):
>    dt-bindings: mtd: Add AC5 specific binding
>    mtd: rawnand: marvell: add support for AC5 SoC

Are you still looking into this series? I see one part made it upstream 
as commit 68c18dae6888 ("mtd: rawnand: marvell: add missing layouts") 
and there was an off-shoot series around converting the DT binding.

> Vadym Kochan (1):
>    mtd: rawnand: Partially revert 4114f97c41cd ("mtd: rawnand: Get rid of
>      a few unused definitions")
>
>   .../devicetree/bindings/mtd/marvell-nand.txt  |   1 +
>   drivers/mtd/nand/raw/Kconfig                  |   2 +-
>   drivers/mtd/nand/raw/marvell_nand.c           | 277 ++++++++++++++++--
>   drivers/mtd/nand/raw/nand_timings.c           |  14 +
>   include/linux/mtd/rawnand.h                   |   3 +
>   5 files changed, 264 insertions(+), 33 deletions(-)
>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
