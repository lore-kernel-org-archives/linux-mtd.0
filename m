Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Husoh-0000Cw-PB
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 12:20:35 -0400
Message-ID: <4662EAA9.70104@ru.mvista.com>
Date: Sun, 03 Jun 2007 20:22:01 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
In-Reply-To: <bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
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

>>I think "direct-mapped" as compatible is a bit too broad or vague.

>>The compatible is supposed to be useable to find and match a driver
>>without regard to the name of the node.  Perhaps direct-mapped-rom?
>>(as opossed to a direct-mapped-ram, sram, or some width flash bank).

> "actual-name-of-the-chip", "cfi-command-set-#", "cfi" seems
> like a good start.

    No, it doesn't -- since that info is almost *absolutely* useless (the only 
exception is "cfi") in the context of Linux MTD subsys.
    Please, try to understand that knowing that chip is CFI compatible in 
itself doesn't yet guarantee that you can access the chip -- it all depends on 
its mapping to the real physical address range, therefore this group IMO 
cannot even constitute a valid "compatible" property.

>>Actually, looking back at your device tree {1], your list several
>>properties for flash, including bank-width and partition names.
>>Perhaps first compatible should be direct-mapped-partitioned-flash,
>>direct-mapped-partitioned-rom, direct-mapped-rom  (to me a
>>direct-mapped-rom driver would expose one section of address space
>>read-only). I'm assuming that your driver for this "direct-mapped"
>>device will look at these properties from the of device node and
>>call the mtd layer somewhat directly with their contents.

> People here tried to create a generic "flash" device binding.
> It didn't work out (part of the problem is its scope was way
> too big; another problem is it was too Linux-mtd specific).

    And that's why its worked, and the abstaractly "correct" scheme wouldn't have.

> Now since the probing is done in platform-specific code here,
> you don't *need* an "official" binding -- just get your
> "compatible" prop right so you can correctly probe the device
> node, and then maybe add some node-specific properties if you
> need them.

    I wonder what are you trying to get us to do: directly call stuff from 
drivers/mtd/ or what (that's especially starnge because we now have an OF 
driver for simply mapped NOR flashes)?

> Segher

WBR, Sergei
