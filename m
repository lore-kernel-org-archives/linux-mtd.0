Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTsRv-0000WL-3Q
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 12:01:07 +0000
Received: by mail-we0-f179.google.com with SMTP id w61so774162wes.24
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 05:00:42 -0700 (PDT)
Message-ID: <5255455C.6060606@gmail.com>
Date: Wed, 09 Oct 2013 14:00:28 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/2] pxa3xx: Data buffer dynamic allocation
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131009114803.GA31294@localhost>
In-Reply-To: <20131009114803.GA31294@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09.10.2013 13:48, Ezequiel Garcia wrote:
> On Fri, Oct 04, 2013 at 03:30:36PM -0300, Ezequiel Garcia wrote:
>> As part of my work to support the NAND controllers in Armada 370/XP SoC
>> here's a tiny set of patches to replace the currently data buffer allocation
>> based in a hardcoded buffer size, into a dynamic scheme.
>>
>> We first use kmalloc to request a 256 bytes (big enough for the ONFI paramater
>> page) and then re-allocate (either with kmalloc or using DMA allocators) using
>> the detected page size.
>>
>> The first patch is required to perform the initial NAND operations (READID
>> and friends) using programmable I/O since the DMA buffers are not ready
>> at such early stage.
>>
>> The second patch performs to actual dynamic allocation and it's exactly
>> the same patch I sent a few weeks ago:
>>
>>   http://patchwork.ozlabs.org/patch/275982/
>>
>> Daniel: Can you test these two If they look fine we can add them now,
>> being an improvement to the driver pxa3xx beyond the Armada 370/XP effort.
> 
> Daniel: sorry to bother, any luck testing this?

Sorry for the delay, got other things to do lately ...

I tested these two patches successfully on my board with both use_dma=0
and =1. Nice :) You can take my

	Tested-by: Daniel Mack <zonque@gmail.com>

I hope I can catch up with my pxa DMA cleanups very soon.


Daniel
