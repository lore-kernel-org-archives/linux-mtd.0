Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1413nh-0007sm-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 09:45:17 +0000
Received: from natmail2.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1413nf-0007sg-00
	for mtd@infradead.org; Wed, 29 Nov 2000 09:45:16 +0000
Message-ID: <3A24B000.32747EAB@gmx.de>
Date: Wed, 29 Nov 2000 08:28:00 +0100
From: Helge Wehder <wehder@gmx.de>
MIME-Version: 1.0
To: mtd@infradead.org, cort@fsmlabs.com
Subject: 2.4.0-test11 Bug in 'mm.o' and 'Event interface support' on ppc750]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have some problems while compiling the Kernel on a Powerbook 'pismo'
G3/400 and don't know where to report to. My ggc is 2.95.2 . I'am able
to compile the test6 kernel and able to boot it. But there is only one
terminal available on the test6 Kernel.

Here are some info's about what i have done without known make this and
that stuff:

Making mrproper

arch/ppc/mm/mm.o: In function `map_page':
arch/ppc/mm/mm.o(.text+0xe04): undefined reference to `set_pgdir'
arch/ppc/mm/mm.o(.text+0xe04): relocation truncated to fit: R_PPC_REL24
set_pgdir
drivers/input/inputdrv.o: In function `keybdev_event':
drivers/input/inputdrv.o(.text+0x16cc): undefined reference to
`emulate_raw'
drivers/input/inputdrv.o(.text+0x16cc): relocation truncated to fit:
R_PPC_REL24 emulate_raw
make: *** [vmlinux] Error 1

Taking out 'Input core support'>'Event interface support'
Same errors

Change the 'input core support' to module

arch/ppc/mm/mm.o: In function `map_page':
arch/ppc/mm/mm.o(.text+0xe04): undefined reference to `set_pgdir'
arch/ppc/mm/mm.o(.text+0xe04): relocation truncated to fit: R_PPC_REL24
set_pgdir
make: *** [vmlinux] Error 1

Ok, less errors. These errors are new to me. These errors diden't ecured
with the test10 sources.
Taking out 'sound support'

This was stupid. The Error comes from the Memory handling section.
Taking out 'Ram disk support' in the 'Block devices section'
Still the same Errors.

Copying the 'mm' section from the test10 sources to the test11 sources
Still the same Errors. The Error seems to be somewere in the include
files.


Bye Helge...


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
