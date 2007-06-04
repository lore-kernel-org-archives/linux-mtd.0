Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvCfm-0003xU-Cu
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 09:32:40 -0400
Message-ID: <466414D0.4090403@ru.mvista.com>
Date: Mon, 04 Jun 2007 17:34:08 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
	<466312C2.4090200@ru.mvista.com>
	<548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<193459b778ff98aa95ee7ac38a842c16@kernel.crashing.org>
In-Reply-To: <193459b778ff98aa95ee7ac38a842c16@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Segher Boessenkool wrote:

>>>>> This has nothing to do with a "chip level", it is plain and
>>>>> simply the most basic device tree stuff.

>>>>    If it was as "plain and simple" as you say, there would be 
>>>> nothing to argue about.

>>> There isn't as far as I am concerned; the purpose and
>>> meaning of the "compatible" property, as well as of any
>>> other standard OF properties, is clear.

>>    Erm, concerning matching those with drivers it wasn't as clear that 
>> those props aren't the same as driver names b/c of the follwing 
>> passage in Generic Names:

> [huge snip]

> Please point out the exact passage you don't understand, and
> what you don't understand about it, if you want any help.

    Ah, nevermind... It was too late in the Sunday evening. :-)

>>> Yes, the more complex (and sometimes insane) ways that
>>> flash chips are connected to systems can be really hard
>>> to describe properly.  Which is why I don't even want
>>> to make a "binding" for it (yet).  It seems easy enough

>>    Neither do we. :-)

>>> to do this for single flash chips (possibly direct-mapped)
>>> though.

>>    Erm, FSL boards seem to generally have dual 16-bit NOR flash chips 
>> interleaved -- and that's seems quite a common case, not only in PPC 
>> world.

> It's not all that common; I can see why it would be used on
> flash controllers that handle a 32-bit bus only.

    OK, maybe it's just we, embedded guys, that comes to see only such cheapo 
boards. :-)

>>    Perhaps... those interleaved chips could really be merged 
>> (abstracted) into a single one, with the bus width being a sum of two?

> Perhaps.  It is a nasty situation, it'll take long hard
> thinking to come up with a reasonably good solution.

    I hoped to get some hints from the linux-mtd list as well...

>>>  Get the simple cases
>>> (that actually are used in real life) right, first.

>>    We pursued this task exactly. Get it working, quick. :-)

> That is something *TOTALLY DIFFERENT* and quite a bad plan
> IMNSHO.

    I haven't considered 2 inteleaved 16-bit CFI NOR flashes a complex case so 
far, sorry. :-) And that's what I had on my board. Prior to my acquaintance 
with the device trees, this was indeed a no-brainer. :-)

> Segher

WBR, Sergei
