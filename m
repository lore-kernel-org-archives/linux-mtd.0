Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CylA4-0002cX-ME
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2005 06:17:19 +0000
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id CEC7462C19C
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Feb 2005 17:16:36 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id A8C3C62C11C
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Feb 2005 17:16:36 +1100 (EST)
Message-ID: <4209AAC3.2090806@magellan-technology.com>
Date: Wed, 09 Feb 2005 17:16:35 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <ctsr0r$94m$1@sea.gmane.org>	<20050206220713.D99FE15504@desire.actrix.co.nz>	<cu7934$irr$1@sea.gmane.org>
	<20050208000532.543131604C@desire.actrix.co.nz>
In-Reply-To: <20050208000532.543131604C@desire.actrix.co.nz>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Writing frequently to NAND - wearing, caching?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> On Monday 07 February 2005 21:33, Martin Egholm Nielsen wrote:
> 
>>Hi,
>>
>>
>>>>I have an application which may need to write states frequently to my
>>>>nand-fs in order to have these states in case of powerdown.
>>>>But I'm a bit concerned about wearing the nand if I write to frequently.
 > <snip>
> (because we're not using explicite wear levelling) we still have only reached 
> 24,000 - only 24% of the 100,000 cycle lifetime of the flash.
> 

... and then there is the fact that the 100,000 write cycle limit is generally 
a conservative estimate based on testing of the device at an operating 
temperature of around 125 celcius! Most likely the device will be able to 
withstand over to 1,000,000 write cycles before failure. If your FS uses write 
verification to make sure the data is secure then you shouldn't have any 
problems even if you do reach this limit on some areas of the Flash.

 From the "Toshiba NAND Flash Applications Design Guide"

"NOR Flash is typically limited to around 100,000 cycles. Since the electron 
flow-path due to the hot electron injection for programming is different from 
the one due to tunneling from the floating gate to the source for erasing, 
degradation is enhanced. However, in NAND Flash, both the programming and 
erasing is achieved by uniform Fowler- Nordheim tunneling between the floating 
gate and the substrate. This uniform programming and uniform erasing technology 
guarantees a wide cell threshold window even after 1,000,000 cycles."

and

"There is one question that often comes up  Is ECC really necessary?  After 
all, the likeliest cause of a bit error is during the programming process. For 
example, if you program a block, then verify it has no errors, how reliable is 
the data? In these ROM-like applications where the write/erase cycles is very 
low, the actual failure rate for a block is about 3 ppm after 10 years (i.e. 3 
blocks out of every million blocks will have a bit error after 10 years) in 
which a block failure is defined as a single bit error. This result was derived 
from testing 29708 pieces of 512Mb NAND (0.16um) by writing a checkerboard 
pattern into blocks and storing at 125C. Since there will be a non-zero data 
retention failure rate, you should limit the amount of code to 1 block to 
achieve a low ppm probability of failure."


regards,

Aras
