From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 31 Mar 2003 10:02:55 +0100
Subject: Unable to handle kernel paging request at virtualaddress80000013
In-Reply-To: <3E87F022.F65810C7@thales-e-transactions.com>
References: <3E8303F3.980B0F02@thales-e-transactions.com>
 <200303272119.02420.tglx@linutronix.de>
 <3E87F022.F65810C7@thales-e-transactions.com>
Message-ID: <200303311102.55397.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Monday 31 March 2003 09:37, Eric DEJONC wrote:
> Hi,
>
>  I have a question....
>   What is the physical start adress of flash mapping, and where can I find
> it. I get different results if I change this value. In the
> arch/arm/machsa1100/trizeps.c, its is written:
The physical address is defined by your board design. It depends on the 
chipselect, addressdecoding...
The virtual address is the address which is used inside the kernel driver 
code. This address is translated by the MMU into a physical address.
e.g.
MTD driver uses virtual address 0xf0000000 according to chip-mapping. So a 
read from 0xf0000000 is a read from the physical address 0x30000000, which is 
the physical hardware address of the flash chip.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
