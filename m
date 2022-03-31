Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1781C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRP3E6uI6QE5OMB4A9ExfFiO8zhyqavc+mn/idq8eq4=; b=0FQ81ZEmLJm+Vn
	LVYzcRhZbGZ2DaL+V6ZliYyqalU/d7XfZNzNYVMvyyaH4krFIq2bnqDxI5Li9D/mMcyiKKOJQpDNz
	xzAgTXcvWhTaLJmfpTqbp33N3oHlyWz9ffQcEIth2KODYws5YKDuQO2BjzAcQkiuVVTJNcNo5Evjt
	lJGOcAjdIJ1Ke7pFNKh9JZw9Px4pNH0UMk9NnS81p+bea9fSZXj0hF90dLs9aM0d7vd6WgyVw9/4O
	QFXaV4UwTbQpgBkGcLnIM0NtPn8t1/ccmqbiiQbNWusPFx8DMO4yAAXrb9LXSmSTPmkPNTKngYwHV
	13mPd4J1yMZpkUzgRqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZp29-0012Ij-Hh; Thu, 31 Mar 2022 07:15:53 +0000
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZp1u-0012Dx-82
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 07:15:40 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 647A321D6D;
 Thu, 31 Mar 2022 07:15:31 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 09:15:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0017a140443-46ad-4610-9aab-007a7028463b,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d12860e6-cc56-6073-0bf2-bfae02cbbd88@kaod.org>
Date: Thu, 31 Mar 2022 09:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 08/11] spi: aspeed: Calibrate read timings
Content-Language: en-US
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush
 Yadav <p.yadav@ti.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
 <HK0PR06MB2786548534B370AE0C691C32B21F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
 <0ec477b5-e404-536f-ff60-39f43208c3cc@kaod.org>
 <HK0PR06MB27866B5CC29F46436A4F6230B2E19@HK0PR06MB2786.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <HK0PR06MB27866B5CC29F46436A4F6230B2E19@HK0PR06MB2786.apcprd06.prod.outlook.com>
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 302d5792-24cf-4c48-bed0-3ba3d01619e2
X-Ovh-Tracer-Id: 6130243521099631422
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_001538_618879_44D2589D 
X-CRM114-Status: GOOD (  12.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Chin-Ting,

>>> - Maybe, if the calibration process is not executed, the frequency setting
>> calculated from max_frequency in the device tree can be filled in FMC10
>> instead of using dumb slow one, 12.5MHz, always.
>>
>> Indeed.
>>
>>>    For example, except for uniform content case, the calibration process will
>> be ignored when SPI clock frequency in the device tree is smaller than 40MHz.
>>> - The function, aspeed_2600_spi_clk_basic_setting, in [2] can be added to
>> support lower SPI clock frequency, e.g., 4MHz.
>>>    For AST2600, SPI clock frequency can be calculated by
>> HCLK/(FMC10[27:24] + FMC10[11:8]).
>>
>> Could you please send patches on top of this series ? Here are the branches :
>>
> 
> Of course. How do I provide you the patch? By private mail or send a PR?

We should discuss first by email on the openbmc@ and linux-aspeed@ lists.
Please send as follow ups on top of v4.

Using the openbmc tree should be easier :

      https://github.com/legoater/linux/commits/openbmc-5.15

> Besides, I may add a new callback function for this part due to difference 
> between AST2500 and AST2600.

ok.

Given all the reviews and tests that were done on AST2400, AST2500, AST2600
platforms, I will be careful not to break the existing proposal.

Thanks,

C.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
