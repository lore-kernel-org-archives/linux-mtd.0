Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTACx-0006eN-Co
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 14:23:32 +0000
Date: Wed, 4 Mar 2015 15:23:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [RFC] How to configure nand address cycles in a generic way
Message-ID: <20150304152307.134a1721@bbrezillon>
In-Reply-To: <CAGnW=BbyGzQwpb0BvdNVnK+ZFfMmnKjLBmRHzTBMzJ8Vq9FDag@mail.gmail.com>
References: <CAGnW=BbyGzQwpb0BvdNVnK+ZFfMmnKjLBmRHzTBMzJ8Vq9FDag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: kalluripunnaiahchoudary@gmail.com, sivadur@xilinx.com, michals@xilinx.com,
 "Gupta,
 Pekon" <pekon@ti.com>, pcrost@xilinx.com, Punnaiah Choudary <kpc528@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Punnaiah,

On Wed, 25 Feb 2015 21:14:06 +0530
punnaiah choudary kalluri <punnaia@xilinx.com> wrote:

> Hi,
> 
>   We are using pl353 smc controller in our zynq soc and currently the
> patches for this driver
> are under review. Till now we have tested various nand parts (micron
> and spansion)
> and all these devices require five address cycles for read/write
> operations (3 row and 2 column address cycles).Even in our driver the
> address cycles value is hard coded to five.
> 
>    Recently we come across testing the new part i.e Spansion S34ML01G
> and this devices requires four address cycles( 2 row and 2 column
> cycles) so, now we want to generalize this by reading the address
> cycles information from the onfi parameter page.

That's expected.
NAND with 'big pages' (> 512 bytes) and size < 128MB only require 4
address cycles (see nand_base implementation of cmdfunc [1]).

> 
>  I see that the controller driver can retrieve the address cycles
> information from the nand_onfi_params structure. But the number of
> address cycles to be configured is different for different commands.
> like
>  Page read/write operation: row + col address cycles
>  Block erase                    : row address cycles
>  onfi parameter page         : one address cycles.
> 
> Currently in our driver we are reading the address cycles information
> from the nand_onfi_params structure and deriving the required address
> cycles based on the given command. Ideally this information should
> come from the nand core. So, one way i thought that the core should
> pass the
> required address cycles using the cmdfuncion as below. so the
> controller driver can blindly program this information to the
> controller.
> 
> void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
>                              int page_addr, int address_cycles);
> 
> Please suggest is there any better solution to handle this case ?

Actually I worked on a similar patch but for different reasons: most
controllers are now handling full NAND operations (cmd + addr cycles +
data transfer), but the framework kind of force the cmd + addr cycles
and data transfer separation.
We could benefit from the performance improvement induced by this single
NAND operation step (you wait for the whole operation to finish
instead of waking the thread several times to handle each step).
Note that some drivers are already implementing this logic internally.

My idea is to add an ->opfunc() callback that is called in place of the
->cmdfunc() + ->read/write_buf() sequence.

Here is the status of my work [2].

Best Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L714
[2]http://code.bulix.org/9askmm-87977


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
