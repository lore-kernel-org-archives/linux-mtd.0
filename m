Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz3yx-00049S-AL
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 16:22:01 +0000
Received: by mail-wm0-x234.google.com with SMTP id w64so133538874wma.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2017 09:21:38 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
Date: Fri, 14 Apr 2017 18:18:44 +0200
MIME-Version: 1.0
In-Reply-To: <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
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

On 04/11/2017 10:13 AM, Cédric Le Goater wrote:
> Hello Marek,
> 
> On 04/06/2017 09:28 PM, Marek Vasut wrote:
>> On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
>>> This is only for SPI controllers as U-Boot should have done it already
>>> for the FMC controller using DMAs.
>>>
>>> The algo is based on the one found in the OpenPOWER pflash tool. It
>>> first reads a golden buffer at low speed and then performs reads with
>>> different clocks and delay cycles settings to find the fastest
>>> configuration for the chip.
>>>
>>> It can be deactivated at boot time with the kernel parameter :
>>
>> Something tells me this is likely gonna be pretty flaky and might lead
>> to unreliable configurations. The hardware manufacturer should be able
>> to determine the limits of the hardware and those should be put into DT
>> at manufacturing time IMO.
> 
> It is not a common method but we have been using it on many OpenPOWER
> platforms (P8) using the AST2400 (palmetto, habanero, firestone, 
> garrison, etc) and also on the newer P9 platforms using the AST2500
> (romulus, zaius, witherspoon). So I would say that experience 'proves' 
> that it works. We didn't invent the SPI Timing Calibration algo, it is
> described in the specs of the manufacturer.
> 
> Also, all these platforms use sockets to hold the different flash 
> modules of the system. We don't know in advance what we will find 
> and so it makes difficult to put any timing in the DT.    
> 
> And the values of the "data input delay cycle" (REG94) depend on the 
> chip model and on the length of the wires of the board. If we were to 
> hard-code such values in the DT, we would need to put only safe and slow 
> settings known to work in all configurations. which is a bit what we 
> do in the current driver using really slow ones.

Aha, thanks for clarifying.

> Here is a proposal. We could activate this algo using a property such
> as :
>  
> 	"speed-mode" = "freq" or "auto-adjust"
> 
> How's that ? 

Thinking about it a bit more, I think having a module parameter is the
right approach here ... or maybe compile-time switch. This shouldn't be
in DT as it's not HW property.

> Thanks,
> 
> C.
> 


-- 
Best regards,
Marek Vasut
