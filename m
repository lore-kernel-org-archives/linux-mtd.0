Received: from mail-in-10.arcor-online.net ([151.189.21.50])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDsY-0006mK-Qq
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:52:58 -0400
In-Reply-To: <46640892.2030408@ru.mvista.com>
References: <7fc919fce0761f861be3069a853d3169@bga.com>	
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>	
	<4662EAA9.70104@ru.mvista.com>
	<1180905120.31677.22.camel@localhost.localdomain>
	<46640892.2030408@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <f24cbe6245fb2a52d153edb9be678f5a@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Mon, 4 Jun 2007 16:49:32 +0200
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
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

>> You make no sense to me. It's like saying that knowing that a 8250 
>> chip
>> on ISA cannot be accessed if you don't know it's IO ports so it
>> shouldn't say "8250" in compatible property ?!?!?!?
>
>    No, it's a completely different case.  Base address and even flash 
> size are not the only things that matter.  There's bus width

Bus width is an (inherent) property of the _parent_
node.  Device width is normally equal to that, and
if not, it is obvious from the device model.

Also, you need to know if the devices are byte-addressable
or only per natural unit; and even more importantly,
the same question for the flash bus.

> and interleave factors

Not a property of the flash chips really.

> that influence the access (and possibly, byte-swapping too, although 
> this is unlikely to happen in PPC world).

Byte swapping?  1) This should _never_ be necessary,
just swap the data on the device itself, duh; 2) more
likely this would be determined by the flash bus, not
per flash device.

And, 3) why would you want to include this in the flash
binding while we don't yet have a reasonable overview
of in what circumstances byte swap is needed/used?

>> Also, whatever shortcomings of the linux MTD drivers are totally
>> irrelevant to what is correct to have in a device-tree. While we do
>> tailor our device-tree specification around linux needs in most cases,
>> there are cases like this one where common sense should be enough to
>> understand that it's not because the linux MTD subsystem, as of today,
>> cannot be told what programming interface to use, that we shouldn't
>> provide that information in the tree.
>
>    We did provide it, in the form of probing hints ("probe-type" prop).

Which is 103% redundant.  That same information (and
more!) is required in the "compatible" property, already.


Segher
