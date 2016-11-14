Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6MDQ-0006lE-FB
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 18:42:54 +0000
Received: by mail-wm0-x241.google.com with SMTP id m203so17765150wma.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Nov 2016 10:42:27 -0800 (PST)
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <CACPK8Xc=AcA=d+O++W07ki+KkCxA86EnXj7dqTRobTpb9WQbUw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6be81da8-84e2-4208-94d7-c0517920b5c4@gmail.com>
Date: Mon, 14 Nov 2016 19:42:07 +0100
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc=AcA=d+O++W07ki+KkCxA86EnXj7dqTRobTpb9WQbUw@mail.gmail.com>
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

On 11/11/2016 05:42 AM, Joel Stanley wrote:
> On Wed, Nov 9, 2016 at 9:12 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> This driver adds mtd support for spi-nor attached to either or both of
>> the Firmware Memory Controller or the SPI Flash Controller (AST2400
>> only).
>>
>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>> ones found on the AST2400. The differences are on the number of
>> supported flash modules and their default mappings in the SoC address
>> space.
>>
>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>> for the host firmware. All controllers have now the same set of
>> registers compatible with the AST2400 FMC controller and the legacy
>> 'SMC' controller is fully gone.
>>
>> Each controller has a memory range on which it maps its flash module
>> slaves. Each slave is assigned a memory window for its mapping that
>> can be changed at bootime with the Segment Address Register.
>>
>> Each SPI flash slave can then be accessed in two modes: Command and
>> User. When in User mode, accesses to the memory segment of the slaves
>> are translated in SPI transfers. When in Command mode, the HW
>> generates the SPI commands automatically and the memory segment is
>> accessed as if doing a MMIO.
>>
>> Currently, only the User mode is supported. Command mode needs a
>> little more work to check that the memory window on the AHB bus fits
>> the module size.
>>
>> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  Tested on:
>>
>>  * OpenPOWER Palmetto (AST2400) with
>>         FMC controller : n25q256a
>>         SPI controller : mx25l25635e and n25q512ax3
>>
>>  * Evaluation board (AST2500) with
>>         FMC controller : w25q256
>>         SPI controller : w25q256
>>
>>  * OpenPOWER Witherspoon (AST2500) with
>>         FMC controller : mx25l25635e * 2
>>         SPI controller : mx66l1g45g
> 
> It's also in use on the Zaius and Barreleye OpenBMC systems.
> 
> In that respect, I would like to see this merged once it's deemed
> ready by the mtd maintainers. We can follow up with the extra features
> in future patches.
> 
> I've reviewed and tested this as Cedric and Milton have developed it,
> so please add:
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 

Thanks! I'll review the patch ASAP (this week).

-- 
Best regards,
Marek Vasut
