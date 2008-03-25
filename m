Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeBuS-0002bd-1o
	for linux-mtd@lists.infradead.org; Tue, 25 Mar 2008 16:22:00 +0000
Message-ID: <47E926FB.3030900@ru.mvista.com>
Date: Tue, 25 Mar 2008 19:23:23 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: OF compatible MTD platform RAM driver ?
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251536.17795.laurentp@cse-semaphore.com>
	<47E91A5B.1060406@ru.mvista.com>
	<200803251651.42608.laurentp@cse-semaphore.com>
In-Reply-To: <200803251651.42608.laurentp@cse-semaphore.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Laurent Pinchart wrote:

>>>We're talking about a very specific type of RAM, used for permanent storage 
>>>with a battery backup. The RAM is really meant to be used as an MTD device 
>>>and as such I think it makes sense to describe it as an mtd-compatible device 
>>>on the local bus.

>>>What about the following definition for the RAM node ?

>>>        nvram@2,0000 {

>>    Note that there's a OF "device_type" of "nvram", so your (generic) device 
>>name seems to add some mess. (IIRC, that OF device type didn't actually 
>>represent a "real" device, and only served to provide access to NVRAM for OF).

> Ok.

    Well, I might have gone too far here -- it should be a real device 
(spec'ed in Device Support Extensions recommended practice). It's just that 
the spec didn't mention "reg" property, only "#bytes" (the device capacity). 
So, it may be worth considering...

>>>                compatible = "mtd,ram";

>>    The part before comma should be a company name or a stock ticker. What did 
>>you mean here?

> I didn't know that. Let's say I meant "mtd-ram" :-)

>>>                reg = <2 0x0000 0x00100000>;
>>>                bank-width = <2>;
>>>        };

>>>Or should the node have a device-type property of either 'ram' or 'rom' with 
>>>the compatible property just referencing MTD ?

>>    The "device_type" properties are not required and their further creation 
>>has been discouraged on liunxppc-dev.

> What about

> 	mtdram@2,0000 {
> 		compatible = "mtd-ram";
> 		reg = <2 0x0000 0x00100000>;
> 		bank-width = <2>;
> 	};

> ROMs could use "mtd-rom" for their compatible property.

    Heh, there was a whole company against mentioning "mtd" when we started 
working on this (of course, the first idea was to call the flash device type 
"mtd"). I don't think "mtd" looks good here -- I'd suggest "flash-ram" (if 
this is just a linearly mapped NVRAM).

> Best regards,

WBR, Sergei
