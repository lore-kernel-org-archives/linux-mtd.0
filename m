Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177Ct6-0007C2-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 11:17:05 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Woodhouse <dwmw2@infradead.org>,
	franck.fleter@netbricks.com
Subject: Re: Boot from NAND flash ???
Date: Mon, 13 May 2002 22:11:07 +1200
Cc: linux-mtd@lists.infradead.org
References: <3CDF6922.9A0A870F@netbricks.com> <16389.1021282176@redhat.com>
In-Reply-To: <16389.1021282176@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020513101623.DE1A14235@tiger.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

What Daid wrote is generally true....
On Mon, 13 May 2002 21:29, you wrote:
> franck.fleter@netbricks.com said:
> > I read in mails archive that Linux kernel can't boot from NAND flash.
> > It can  boot from NOR flash. Does Linux  kernel not able to boot  from
> > NAND flash because :
> >     1) a NAND flash is connected to an I/O controller and not to a BUS.
>
> That's the one. You cannot just put a NAND flash chip at the CPU's startup
> vector and let it boot from it. You need _something_ for the CPU to start
> with, be that SROM, a tiny NOR flash or ROM, or something else. All you
> need is a few bytes to set up your DRAM and start pulling the real
> bootloader off the NAND flash.

There are however two mechanisms to get around this:
* Some people and micros implement a "data pump" state machine to extract an 
executable sequence from a NAND device.
* Some of the newer NAND devices can be accessed directly from the bus and 
can do the job of a boot ROM. 

There is however a limitation to both of these. The NAND can only be accessed 
sequentially (it is not random access like NOR) which limits the types of 
instruction the boot code can perform. In particular it can't branch or fetch 
from elsewhere in ROM.

The way this works is to use these mechanisms to build up a limited bootstrap 
in RAM by using load immediate instructions. ie something like {using ARM-ish 
here}:

 ; r0 is the start address of our bootstrap.
 ; r1 is used as an indexing address for building up the bootstrap
 ; r2 is used as the data register.

 ; build up start address
  ldr  r0,#0xaa000000
  or   r0,r0,#0x00bb0000
  or   r0,r0,#0x0000cc00
  or   r0,r0,#0x000000dd

 ; set up r1
  mov  r1,r0

  ; fill the bootstrap by doing a load immediate, then store for each byte we 
  ; need to transfer into RAM.
  ldrb r2,#0x11
  strb r2,[r1],#1
  ldrb r2,#0x22
  strb r2,[r1],#1
  ......
 ; jump to start of bootstrap.
  mov pc,r0

 Some preamble (eg initialising memory controller) has been ommitted.
 
 The bootstrap we load is then something pretty normal (eg. reads in the next 
level bootloader from NAND for execution).

This works, though it might seem rather contrived. 

-- Charles
