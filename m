Received: from mx.sjtu.edu.cn ([202.112.26.52])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlnfQ-0006n4-OY
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 09:57:03 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mx.sjtu.edu.cn (Postfix) with ESMTP id 670501DA1DA
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Jun 2006 21:29:52 +0800 (CST)
Received: from mx.sjtu.edu.cn ([127.0.0.1])
	by localhost (mx [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28826-02 for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jun 2006 21:29:52 +0800 (CST)
Received: from [192.168.1.12] (unknown [202.120.40.69])
	by mx.sjtu.edu.cn (Postfix) with ESMTP id 4E9F31DA153
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Jun 2006 21:29:52 +0800 (CST)
Message-ID: <447EEB2A.70307@sjtu.edu.cn>
Date: Thu, 01 Jun 2006 21:27:06 +0800
From: "Chen,Xi" <xichen@sjtu.edu.cn>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: XIP kernel(2.6.11 with MTD) fail in compiling
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm working on a PXA-272 based development board and trying to enable a 
XIP kernel for it.
The root file system needs to be JFFS2, so MTD support should be 
included. When I tried to
boot the kernel, it stalled at that message:
===============================================
......
eth0: cs8900 rev K found at 0xf0000300 no EEPROM
cs89x0: No EEPROM, relying on command line....
cs89x0 media RJ-45, IRQ 41, programmed I/O, MAC 00:0b:f4:2f:9b:e5
Probing flash0 at physical address 0x00000000 (32-bit bankwidth)
===============================================

I found an option in kernel configuration, named "MTD_XIP" and it seemed 
a solution.
I also added a "-mlong-calls" option to CFLAGS when XIP enabled, in case 
some function
calls exceeded the PC24 limitation in ARM.
Compilation errors occured like that:
===============================================
drivers/built-in.o(.text+0x59130): In function `cfi_intelext_write_words':
: relocation truncated to fit: R_ARM_PC24 .data
drivers/built-in.o(.text+0x591bc): In function `cfi_intelext_write_words':
: relocation truncated to fit: R_ARM_PC24 .data
drivers/built-in.o(.text+0x59270): In function `cfi_intelext_write_words':
: relocation truncated to fit: R_ARM_PC24 .data
drivers/built-in.o(.text+0x593e4): In function `cfi_intelext_write_buffers':
: relocation truncated to fit: R_ARM_PC24 .data
drivers/built-in.o(.data+0x8a40): In function `do_xxlock_oneblock':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x8aa4): In function `do_xxlock_oneblock':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x8d14): In function `do_xxlock_oneblock':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x8dbc): In function `do_xxlock_oneblock':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x8eb4): In function `do_write_oneword':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x8f38): In function `do_write_oneword':
: relocation truncated to fit: R_ARM_PC24 .text
drivers/built-in.o(.data+0x92e4): In function `do_write_oneword':
: additional relocation overflows omitted from the output
make: *** [.tmp_vmlinux1] Error 1
===============================================

Anyone knows why the linker still complains, even with "-mlong-calls" used?

My cross compile toolchain versions:
arm-linux-gcc 3.4.3
binutils 2.16
And some basic info about my memory layout:
flash memory start from 0x00000000, 64MB
SDRAM start from 0xa0000000, 64MB

Thanks a lot for your time.

Chen,Xi
