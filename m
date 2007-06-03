Received: from mail-in-12.arcor-online.net ([151.189.21.52])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HuumZ-0001jO-5h
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 14:26:35 -0400
In-Reply-To: <46630256.8050909@ru.mvista.com>
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<1180769992.14025.1.camel@localhost.localdomain>
	<4662E7EA.70506@ru.mvista.com>
	<d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>
	<46630256.8050909@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <daa1b6f2e18f06f053d538d28d3c046a@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Sun, 3 Jun 2007 20:25:50 +0200
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: ppcdev <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Which Linux driver to use is not something that should
>> be (directly) communicated in a device tree -- even if
>
>    Bah... what's "name" and "compatible" properties are for then.

They communicate to the kernel what exactly a certain device
is.  Nothing more, nothing less.  The kernel is supposed to
use this information to select what device driver to use for
it.  Any extra information the kernel might need/want to drive
the device is described in other properties (or, in some cases,
in different device nodes, even).

> Nobody's talking about the direct match but making the task of 
> selecting a proper driver more complex by specifying the details that 
> don't help (if not hinder) the correct selection is certainly not a 
> way to go.

Nonsense.  If the kernel doesn't care about certain details,
it can just ignore them.

>> -- the device tree on your board doesn't necessarily
>> change when your kernel version does.
>
>    Well, I'm not anticipating any changes either in this case...

That's a problem then.

>>> the CFI/JEDEC interface then can be deduced by probing
>
>> Most of the time, sure.  Not always.
>
>    That's the way the cookie crumbles in Linux MTD for now. It's 
> *always* detecting this by probing -- you only can say what [not] to 
> probe.

So go fix that :-)

>> Who is talking about "probe-type"?  We are talking about "compatible".
>
>    See my other mail where I've told why I don't consider your example 
> of this prop valid...

I haven't read that yet, but I can tell you now that I'm already
very sceptical about the arguments.


Segher
