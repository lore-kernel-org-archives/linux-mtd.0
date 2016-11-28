Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBQNc-0001jL-FN
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 18:10:18 +0000
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id E94D71F9EC
 for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2016 19:09:51 +0100 (CET)
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Marek Vasut <marek.vasut@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA@mail.gmail.com>
 <9569aaca-5748-e82d-20e1-ed846fb762f6@gmail.com>
 <b9d8ba33-2bb9-cb93-d833-89ddd8cfd7f9@kaod.org>
 <c35d6a7a-1c77-1884-4ed4-aee161bd0e43@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9ad102a7-8d78-efef-8adb-62cad75f0034@kaod.org>
Date: Mon, 28 Nov 2016 19:09:36 +0100
MIME-Version: 1.0
In-Reply-To: <c35d6a7a-1c77-1884-4ed4-aee161bd0e43@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

>> Aspeed SoC AST2400 has a set of SMC (Static Memory Controller) 
>> controllers in which you find :
>>
>> - Legacy Static Memory Controller (called SMC in the spec)  
>>   . base address at 0x16000000
>>   . BMC firmware
>>   . old register set
>>   . supports NOR flash, NAND flash and SPI flash memory. All bootable.
>>   . 1 chip select pin (CE0)
>>
>> - New Static Memory Controller (called FMC in the spec)
>>   . base address at 0x16200000
>>   . BMC firmware
>>   . new register set
>>   . supports NOR flash, NAND flash and SPI flash memory. 
>>   . 5 chip select pins (CE0 ∼ CE4)
>>
>> - SPI Flash Controller (called SPI in the spec)  
>>   . base address at 0x16300000
>>   . host Firmware
>>   . exotic register set, between old and new ...
>>   . supports SPI flash memory
>>   . 1 chip select pin (CE0)
> 
> This should be (except for the base address) be in some documentation,
> it helps.

Sure. I will add that.

>> Aspeed SoC AST2500 defines has a similar set of SMC (Static Memory 
>> Controller) controllers, more in the vein of the AST2400 FMC  :
>>
>> - Legacy Static Memory Controller is gone, NOR and NAND support also
>>
>> - Firmware SPI Memory Controller (called FMC in the spec)  
>>   . base address at 0x16200000
>>   . BMC firmware
>>   . new register set
>>   . supports SPI flash memory.
>>   . 3 chip select pins (CE0 ~ CE2)
>>
>> - SPI Flash Controller (called SPI1 in the spec) first
>>   . base address at 0x16300000
>>   . host firmware
>>   . new register set
>>   . supports SPI flash memory.
>>   . 2 chip select pins (CE0 ~ CE1)
>>
>> - SPI Flash Controller (called SPI2 in the spec) second
>>   . base address at 0x16310000
>>   . host firmware
>>   . new register set
>>   . supports SPI flash memory.
>>   . 2 chip select pins (CE0 ~ CE1)
>>
>>
>> So, these are the reasons behind the naming mess. Added to that the 
>> driver considers the acronym SMC to stand for SPI Memory Controller, 
>> which is wrong. I tried to reduce the confusion with some comments but 
>> that was a failure :)
> 
> The explanation above is awesome though.
> 
>> In qemu, we have used FMC (Firmware ...) and SPI to name the controllers 
>> and we just dropped the legacy SMC. I think using the same naming scheme
>> is a good idea. We don't support anything else than SPI either so we can 
>> drop the other types for the moment.
> 
> One thing which I still ponder about is how do you support those
> controllers which support NOR and NAND flash and SPI, do you tap
> into all subsystems ?

Aspeed dropped support for NAND and NOR flash in the AST2500 SoC, 
all controllers are SPI only and the AST2400 boards we have also 
only use SPI. So we did not consider the other flash flavors for 
the driver even though some board might use it, but I don't know
that.

Cheers,

C.
