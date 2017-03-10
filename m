Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmLKT-0001ck-7c
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 14:15:40 +0000
Received: by mail-wm0-x244.google.com with SMTP id v190so2507622wme.3
 for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2017 06:15:16 -0800 (PST)
Subject: Re: [v2, 2/4] mtd: spi-nor: Add Octal SPI support to Cadence QSPI
 driver.
To: Artur Jedrysek <jartur@cadence.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960178-11079-1-git-send-email-jartur@cadence.com>
 <891f9177-e03c-85e0-ebab-2dc7df2ce9e0@gmail.com>
 <DM5PR07MB278038D86D5AD05FA2F5AAA1D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
 <8315061c-716d-89c9-3f04-687b48fbac22@gmail.com>
 <DM5PR07MB2780DC9981927880E1ED1B37D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <23371579-495a-1336-cce9-3860a2e2a4c1@gmail.com>
Date: Fri, 10 Mar 2017 15:15:13 +0100
MIME-Version: 1.0
In-Reply-To: <DM5PR07MB2780DC9981927880E1ED1B37D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/10/2017 03:09 PM, Artur Jedrysek wrote:

CCing Dinh.

[...]

>>>>> +	/* Determine, whether or not octal transfer MAY be supported */
>>>>
>>>> But you already know that from DT, no ?
>>>>
>>>
>>> Cadence Octal (formerly Quad) SPI Controller is sold as an IP, and is
>>> configurable. This includes max SPI mode. It is possible to detect, that
>>> Octal SPI controller is configured (during hardware compilation) to support
>>> up to Quad mode, using revision register.
>>
>> So the octal-spi controller always has this config register, but the
>> quad-spi controller may or may not have this register ?
>>
> 
> This register was always present. In Quad-SPI, however, it didn't contain
> information about maximum possible mode, as only quad was possible, and
> meaning of bits checked here was different.

OK

>>>>> +	rev_reg = readl(cqspi->iobase + CQSPI_REG_MODULEID);
>>>>> +	dev_info(dev, "CQSPI Module id %x\n", rev_reg);
>>>>> +
>>>>> +	switch (rev_reg & CQSPI_REG_MODULEID_CONF_ID_MASK) {
>>>>> +	case CQSPI_REG_MODULEID_CONF_ID_OCTAL_PHY:
>>>>> +	case CQSPI_REG_MODULEID_CONF_ID_OCTAL:
>>>>> +		mode = SPI_NOR_OCTAL;
>>>>> +		break;
>>>>> +	case CQSPI_REG_MODULEID_CONF_ID_QUAD:
>>>>> +	case CQSPI_REG_MODULEID_CONF_ID_QUAD_PHY:
>>>>
>>>> Does this work on all revisions of CQSPI ?
>>>>
>>>
>>> After having a more thorough look at specification of older IP version
>>> (quad only) it seems, that revision register format has indeed changed.
>>> This will be fixed in the next version of the patch.
>>
>> Can the quad-spi controller be configured only as dual or single ?
>> What about the octal one ? These cases should probably be handled
>> somehow too, right ?
>>
> 
> Quad-SPI controller can always support single, dual and quad. There was
> no option to configure max mode. Octal-SPI controller can be configured
> to support either octal or quad mode. No controller could be configured 
> (during hardware compilation/synthesis) to support only single/dual 
> SPI mode. To put it shortly: single, dual and quad is always supported.

So basically the whole check you need to perform here is

mode = quad;
if (controller->flags & CAN_DO_OCTAL) {
 if (readl(ID_REGISTER) & IS_CONFIGURED_AS_OCTAL)
   mode = octal;
}

-- 
Best regards,
Marek Vasut
