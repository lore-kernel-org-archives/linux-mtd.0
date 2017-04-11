Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxqwL-0000Y2-Ku
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 08:14:19 +0000
Received: from player690.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id ACD3B35972
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 10:13:53 +0200 (CEST)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
Date: Tue, 11 Apr 2017 10:13:40 +0200
MIME-Version: 1.0
In-Reply-To: <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
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

Hello Marek,

On 04/06/2017 09:28 PM, Marek Vasut wrote:
> On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
>> This is only for SPI controllers as U-Boot should have done it already
>> for the FMC controller using DMAs.
>>
>> The algo is based on the one found in the OpenPOWER pflash tool. It
>> first reads a golden buffer at low speed and then performs reads with
>> different clocks and delay cycles settings to find the fastest
>> configuration for the chip.
>>
>> It can be deactivated at boot time with the kernel parameter :
> 
> Something tells me this is likely gonna be pretty flaky and might lead
> to unreliable configurations. The hardware manufacturer should be able
> to determine the limits of the hardware and those should be put into DT
> at manufacturing time IMO.

It is not a common method but we have been using it on many OpenPOWER
platforms (P8) using the AST2400 (palmetto, habanero, firestone, 
garrison, etc) and also on the newer P9 platforms using the AST2500
(romulus, zaius, witherspoon). So I would say that experience 'proves' 
that it works. We didn't invent the SPI Timing Calibration algo, it is
described in the specs of the manufacturer.

Also, all these platforms use sockets to hold the different flash 
modules of the system. We don't know in advance what we will find 
and so it makes difficult to put any timing in the DT.    

And the values of the "data input delay cycle" (REG94) depend on the 
chip model and on the length of the wires of the board. If we were to 
hard-code such values in the DT, we would need to put only safe and slow 
settings known to work in all configurations. which is a bit what we 
do in the current driver using really slow ones.

Here is a proposal. We could activate this algo using a property such
as :
 
	"speed-mode" = "freq" or "auto-adjust"

How's that ? 

Thanks,

C.
