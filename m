Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPRsE-0000eW-HM
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 10:03:35 +0000
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
To: Arnd Bergmann <arnd@arndb.de>, Brian Norris <computersforpeace@gmail.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <3482823.TCe8doMvLu@wuerfel> <20160718195511.GA137880@google.com>
 <1715321.52KD2CMTqu@wuerfel>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <nicolas.ferre@atmel.com>,
 <boris.brezillon@free-electrons.com>, <marex@denx.de>,
 <linux-kernel@vger.kernel.org>
Message-ID: <512741bf-9dce-90f3-d969-3d3cb167fe25@atmel.com>
Date: Tue, 19 Jul 2016 12:03:11 +0200
MIME-Version: 1.0
In-Reply-To: <1715321.52KD2CMTqu@wuerfel>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 18/07/2016 à 21:59, Arnd Bergmann a écrit :
> On Monday, July 18, 2016 12:55:11 PM CEST Brian Norris wrote:
>> On Mon, Jul 18, 2016 at 09:35:39PM +0200, Arnd Bergmann wrote:
>>> On Friday, July 15, 2016 5:45:07 PM CEST Brian Norris wrote:
>>>> Applied to l2-mtd.git with that fixup.
>>>
>>> I'm getting this build error now on a randconfig build:
>>>
>>> drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
>>> :(.text+0x1ee3c): undefined reference to `_memcpy_toio'
>>> :(.text+0x1ee48): undefined reference to `_memcpy_fromio'
>>
>> Whoops, I noticed those during review, but I don't know why I forgot to
>> mention them nor fix them up before applying.
>>
>>> On ARCH_EBSA, which doesn't build the file that contains the two
>>> functions. I don't see any other driver on ARM using those two
>>> functions directly. What is the specific reason for using them
>>> here? Do you require byte-wise accesses, or could you use
>>> the normal memcpy_toio/memcpy_fromio that turn into aligned
>>> 32-bit word accesses instead?
>>
>> Good questions. I would suspect that aligned 32-bit accesses are what
>> they're looking for, but I'm not absolutely sure.
> 
> Ok, so we should look at that first. If the driver supports 32-bit
> access, using the regular accessors will also make the transfers
> much faster.
> 
>>> If you have to use the non-portable
>>> functions, maybe we can just make the driver depend on !ARCH_EBSA?
>>
>> I don't see an ARCH_EBSA. Did you mean ARCH_EBSA110?
> 
> Yes, sorry for the typo.
> 
>> Or we could just drop the '|| (ARM && COMPILE_TEST)' clause for now:
>>
>>         depends on ARCH_AT91 || (ARM && COMPILE_TEST)
> 
> I'd prefer to keep the COMPILE_TEST option, after all it's how
> I found the problem. On a related note, what is the ARM dependency
> for? Is that just for the _memcpy_toio/_memcpy_fromio? Maybe we
> can drop too if we find the right architecture-independent
> replacement for those two calls.
> 
> 	Arnd
> 


Indeed I added the ARM dependency for the COMPILE_TEST case only for
_memcpy_toio() and _memcpy_fromio(). I thought it would be enough.

Also, I use _memcpy_toio() and _memcpy_fromio() on purpose as opposed to
memcpy_toio() and mempcy_fromio(). I've tested the two latest functions quite
a long time ago and it didn't work. If I remember, on our architecture,
memcpy_toio() and memcpy_fromio() are simply implemented with the regular
memcpy().

The additional memory barriers inserted by readb() and writeb() seems to be
needed to guarantee the IO accesses are not reordered on the system bus.

In the atmel-quadspi.c driver, there is a comment on the use of memcpy():
/* Then fallback to a PIO transfer (memcpy() DOES NOT work!) */


Best regards,

Cyrille
