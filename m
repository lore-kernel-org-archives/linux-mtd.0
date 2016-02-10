Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTXSp-00028G-9p
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2016 16:18:00 +0000
Message-ID: <56BB629D.2040209@denx.de>
Date: Wed, 10 Feb 2016 17:17:33 +0100
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>, Vignesh R <vigneshr@ti.com>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com>
 <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com>
In-Reply-To: <56BB60F1.9070306@opensource.altera.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/10/2016 05:10 PM, Graham Moore wrote:
> On 02/08/2016 09:27 AM, Marek Vasut wrote:
>> On Monday, February 08, 2016 at 12:19:25 PM, Vignesh R wrote:
>>> On 02/06/2016 01:12 PM, Marek Vasut wrote:
>>>> On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
>>>>> On 2/4/2016 4:55 PM, Marek Vasut wrote:
>>> [...]
>>>
>>>>> Yeah, there is delay(of few ns) required between writing to
>>>>> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
>>>>> call). This is specific to TI K2G SoC and needs to be tied to the new
>>>>> binding.
>>>>
>>>> Can't you somehow poll the hardware to check whether or not it's ready
>>>> instead of adding some random delay ?
>>>
>>> There is no dedicated register to poll as such.
>>>
>>> According to TRM:
>>> "Wait for couple of cycles of QSPI_REF_CLK(functional clock of QSPI
>>> @384MHz) until CQSPI_REG_INDIRECTWR[0] bit is internally synchronized by
>>> the QSPI module before writing to flash".
>>>
>>> So, a few ns(~6ns @384MHz) delay is needed (or accessing a QSPI module
>>> register should be sufficient as it will take more than 2 clock cycles).
>>> I believe this delay is specific to TI K2G SoC and maybe needs to be
>>> tied to the binding.
>>
>> OK, got it. Dinh/Graham, can you check if this might be needed on
>> SoCFPGA too
>> please?
>>
> 
> I don't see any such requirement in the data sheet.  It's working
> without it.  So I think it's not needed on SoCFPGA

All right, so we will just add a special property or compat string for
the TI SoC. But we need to get this driver mainlined first :)
