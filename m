Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Fw6R-00066E-00
	for mtd-list@infradead.org; Tue, 09 Jan 2001 10:34:07 +0000
Received: from atlas.lure.u-psud.fr ([193.55.24.209])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Fw3Q-00065M-00
	for mtd@infradead.org; Tue, 09 Jan 2001 10:31:24 +0000
From: flynn@lure.u-psud.fr
Date: Tue, 9 Jan 2001 11:14:19 +0100
To: mtd@infradead.org
Subject: Booting Arcom SBC
Message-ID: <20010109111419.A21801@jupiter.lure.net>
Reply-To: flynn@lure.u-psud.fr
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hello,

  I am attempting to adapt the sbc_mediagx flash booting code to a different Arcom card.
I also need to adapt it to allow booting bzImage kernels.  My understanding is that the only
difference between booting a bzImage and a zImage kernel is that the kernel code needs to
be loaded at 0x100000 instead of at 0x10000, the setup code going to the same location as 
for zImage and the loader also starts kernel execution at the same address.

  Now sbc_mediagx.c already seems to set the kernel load address correctly for a big kernel
so the only modification I thought necessary (a part of course from removing the error termination in
case of a big kernel) was to read the system size from the kernel image instead of assuming a
size of (512-10)k.  Since the C code is running under protected mode and as far as I can tell
the code and data segment descriptors have been set up to access the full 32 bit address space
I thought that the sbc_mediagx_copy_from function should work correctly with a target address
of 0x100000.

  Unfortunately when I do this the machine locks up.  A little investigation has lead me to see that
I appear to be able to read/write to addresses above 0x100000 without difficulty but as soon
as I try to write a significant amount of data to those addresses, say more than 64 bytes, the machine locks up.
The code works and launches the kernel if I use a zImage loading at 0x1000.

  Does anyone see anything obvious that might explain this behavior or have an idea about what might 
be going on ?  Any help would be greatly appreciated.

Gerard

-- 
Gerard FLYNN                 Tel : 33.01.64.46.82.46
LURE Departement Anneaux     Fax : 33.01.64.46.74.97
Centre Universitaire Paris-Sud  BP 34
91898 ORSAY FRANCE



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
