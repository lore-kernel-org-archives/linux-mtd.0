Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvCOG-0003Oy-Cw
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 09:14:35 -0400
Message-ID: <46641093.7080404@ru.mvista.com>
Date: Mon, 04 Jun 2007 17:16:03 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<1180905120.31677.22.camel@localhost.localdomain>
	<03427692d8865878b0eb2a91e7f6969e@kernel.crashing.org>
In-Reply-To: <03427692d8865878b0eb2a91e7f6969e@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-mtd@lists.infradead.org, Milton Miller <miltonm@bga.com>,
	linuxppc-dev@ozlabs.org
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

>> Regarding physical address ranges for the flash mapping, I suppose the
>> best is to define a property for flash chips for it.

> There is, namely "reg".  How to best describe flash chips
> interleaved on the bus is still an open problem.  And things
> like combining two sequential in address space flash chips
> into a virtual one, or describing flash "partitions" doesn't
> belong in the device tree at all; it is a policy thing, not
> a hardware thing.

    Gah, it's becoming worse and worse...
    While I would agree with that argument, not having flash partition table 
in the device tree makes things even more ugly -- as we *already* can't use 
platform device to pass that info, we'll have to either force the user to 
supply that via the kernel option, or add more kludgery to Linux/MTD. :-/

> Segher

WBR, Sergei
