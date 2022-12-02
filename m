Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ABBC47088
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBJ5ynpjYF55kWOMBW82NpJ7+IAiXFZ9biU/yjaEvAE=; b=HELJ0ySEbItHAp
	i0xs5zwmOAsK3+28pM/GZF6YpTeKgENYd86DSMl7/hvNJpg4NomcD3bOuXaem+ISyK40Ydh497NHG
	7qe2CXjT5zSNWN94KbFNo9bXLtafvzFqYaesbcgWfK5Z0Cu2Tj2f5aQc4/9hznWaoVKCgbCXZaQnL
	GemdvwM4t4JWe31G/h5WA1BCJECAQ6spQ6bnXyb9vPKMuN4YGf8tEH5c42z/w6dsp+Yb9A+YnkGfY
	UVT+AIGWEcdnv/w7K2U4/iHknveeGj4kp0fprm5FU5wWCGn0KRmbc1qwWHR1aH+H6oEUIvR2eLVCG
	TLZtPiP2T0nWDTHsE2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19KG-0008B0-3i; Fri, 02 Dec 2022 16:55:48 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Gi-0006AE-Vh; Fri, 02 Dec 2022 16:52:11 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 380B88502D;
	Fri,  2 Dec 2022 17:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669999927;
	bh=twTp7J71qtL0T9tnJpNnbIaLvNd0mryFVvrL6Et7EOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z+tLaoY0w+CLWMvkZmlXqa2/aNwt51FcDKRnoIahPX3EPaaxa0J9KtGncPTelGxH9
	 0mmMgfZhbSk4z9NXCIV6wPW/qdWgJ/oTia/wPwBBzvWI9CixXq778MKhc5Dg7Ew2yT
	 SWpWJ7SS0uYDL08P3zRnkmW/B69GTqPn0pTE+sVWKGFqlKMIue+uooQ9oDdy8iRTgy
	 37LheVzjcT/uDYIiH5zxfXjWD8fmlhwHuL9nDw8Tn/8UUW/LR3X5f9YJTYi5CBrlVW
	 s+wxYrJiKZRAJAEHGwjbOYwU2EKHc3Z89DVzxXJargwYfKsljlB8Om70IMvo4u6v2g
	 xwfr2H8MWY8GQ==
Message-ID: <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
Date: Fri, 2 Dec 2022 17:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
 <20221202174255.2c1cb2ff@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221202174255.2c1cb2ff@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_085209_457983_CE9DC842 
X-CRM114-Status: GOOD (  33.84  )
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

On 12/2/22 17:42, Miquel Raynal wrote:
> Hi Marek,

Hi,

[...]

>>> However, it should not be empty, at the very least a reg property
>>> should indicate on which CS it is wired, as expected there:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/devicetree/bindings/mtd/nand-chip.yaml?h=mtd/next
>>
>> OK, I see your point. So basically this?
>>
>> &gpmi {
>>     #size-cells = <1>;
>>     ...
>>     nand-chip@0 {
>>       reg = <0>;
>>     };
>> };
>>
>> btw. the GPMI NAND controller supports only one chipselect, so the reg in nand-chip node makes little sense.
> 
> I randomly opened a reference manual (IMX6DQL.pdf), they say:
> 
> 	"Up to four NAND devices, supported by four chip-selects and one
> 	 ganged ready/ busy."

Doh, and MX7D has the same controller, so size-cells = <1>; makes sense 
with nand-chip@N {} .

> Anyway, the NAND controller generic bindings which require this reg
> property, what the controller or the driver actually supports, or even
> how it is used on current designs is not relevant here.
> 
>>> But, as nand-chip.yaml references mtd.yaml, you can as well use
>>> whatever is described here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/devicetree/bindings/mtd/mtd.yaml?h=mtd/next
>>>    
>>>> What would be the gpmi controller size cells (X) in that case, still 0, right ? So how does that help solve this problem, wouldn't U-Boot still populate the partitions directly under the gpmi node or into partitions sub-node ?
>>>
>>> The commit that was pointed in the original fix clearly stated that the
>>> NAND chip node was targeted
>>
>> I think this is another miscommunication here. The commit
>>
>> 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>
>> modifies the size-cells of the NAND controller. The nand-chip is not involved in this at all . In the examples above, it's the "&gpmi" node size-cells that is modified.
> 
> Yes I know. I was referring to this commit, sorry:
> 36fee2f7621e ("common: fdt_support: add support for "partitions" subnode to fdt_fixup_mtdparts()")
> 
> The log says:
> 
> 	Listing MTD partitions directly in the flash mode has been
> 	deprecated for a while for kernel Device Trees. Look for a node "partitions" in the
> 	found flash nodes and use it instead of the flash node itself for the
> 	partition list when it exists, so Device Trees following the current
> 	best practices can be fixed up.
> 
> Which (I hope) means U-boot will equivalently try to play with the
> partitions container, either in the controller node or in the chip node.
> 
>>> , not the NAND controller node. I hope this
>>> is correctly supported in U-Boot though. So if there is a NAND chip
>>> subnode, I suppose U-Boot would try to create the partitions that are
>>> inside, or even in the sub "partitions" container.
>>
>> My understanding is that U-Boot checks the nand-controller node size-cells, not the nand-chip{} or partitions{} subnode size-cells .
> 
> I don't think U-Boot cares.
> 
>> Francesco, can you please share the DT, including the U-Boot generated partitions, which is passed to Linux on Colibri MX7 ? I think that should make all confusion go away.
> 
> Please also do it with the NAND chip described. If, when the NAND chip
> is described U-Boot tries to create partitions in the controller node,
> then the situation is even worse than I thought. But I believe
> describing the node like a suggest in the DT should prevent the boot
> failure while still allowing a rather good description of the hardware.
> 
> BTW I still think the relevant action right now is to revert the DT
> patch.

I am starting to bank toward that variant as well (thanks for clarifying 
the rationale in the discussion, that helped a lot).

But then, the follow up fix would be what exactly, update the binding 
document to require #size-cells = <1>; ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
