Received: from mail-in-03.arcor-online.net ([151.189.21.43])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv7fr-0007Er-Li
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 04:13:20 -0400
In-Reply-To: <1180905120.31677.22.camel@localhost.localdomain>
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<1180905120.31677.22.camel@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <03427692d8865878b0eb2a91e7f6969e@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Mon, 4 Jun 2007 10:11:55 +0200
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Regarding physical address ranges for the flash mapping, I suppose the
> best is to define a property for flash chips for it.

There is, namely "reg".  How to best describe flash chips
interleaved on the bus is still an open problem.  And things
like combining two sequential in address space flash chips
into a virtual one, or describing flash "partitions" doesn't
belong in the device tree at all; it is a policy thing, not
a hardware thing.


Segher
