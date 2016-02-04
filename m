Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRNkb-0000eh-0T
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2016 17:31:30 +0000
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
To: Marek Vasut <marex@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602012213.46740.marex@denx.de> <56B30007.1010305@ti.com>
 <201602041225.11679.marex@denx.de>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: "R, Vignesh" <vigneshr@ti.com>
Message-ID: <56B38AB3.3070801@ti.com>
Date: Thu, 4 Feb 2016 23:00:27 +0530
MIME-Version: 1.0
In-Reply-To: <201602041225.11679.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2/4/2016 4:55 PM, Marek Vasut wrote:
> On Thursday, February 04, 2016 at 08:38:47 AM, Vignesh R wrote:
>> On 02/02/2016 02:43 AM, Marek Vasut wrote:
>>> On Monday, February 01, 2016 at 10:03:35 PM, Brian Norris wrote:
>>>> On Wed, Jan 13, 2016 at 03:39:17AM +0100, Marek Vasut wrote:
>>>>> On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
>>>>>> On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
>> [...]
>>
>>>>> All these SoCs should be capable of tweaking the block to fit their
>>>>> needs by just the DT properties. I believe they differ only in the
>>>>> FIFO depth and sometimes someone is greedy and uses 4:16 CS
>>>>> multiplexer, which is an external passive component, but that's all.
>>>>>
>>>>> Would we need soc-specific compatible strings if this is the case?
>>>>
>>>> It's nice when most things can be supported with a small set of DT
>>>> properties, as you've done. But IUIC, I think it's usually good practice
>>>> to define and use SoC-specific (or maybe SoC family) compatible strings
>>>> in the docs and DTS files, in addition to the generic one, in case there
>>>> are future quirks that need to be handled. Note that you don't actually
>>>> have to use these in the driver yet, but it's good to have a definition.
>>>>
>>>> So you can, today, have:
>>>> 	foo@xxxx {
>>>> 	
>>>> 		compatible = "ti,baz-12345", "cdns,qspi-nor";
>>>> 		...
>>>> 	
>>>> 	};
>>>>
>>>> And we have the option to pick up "ti,baz-12345" in the Linux driver *if
>>>> needed.*
>>
>> The support for TI SoC that has this IP is not in upstream yet. I will
>> add TI-specific compatible later. It will be:
>>
>> 	foo@xxxx {
>> 		compatible = "ti,k2g-qspi", "cdns,qspi-nor";
>>  		...
>>  	};
> 
> Do you expect any specifics which cannot be handled by the current bindings btw?
> In my socfpga case, the compatible strings will be probably:
> 

Yeah, there is delay(of few ns) required between writing to
INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
call). This is specific to TI K2G SoC and needs to be tied to the new
binding.
