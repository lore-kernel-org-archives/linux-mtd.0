Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Levn-0005dK-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 07:35:51 +0000
Received: from localhost (saturn@localhost)
	by structure.biochem.nchu.edu.tw (8.11.6/8.11.6) with ESMTP id gB9KKta14591
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 04:20:55 +0800
Date: Tue, 10 Dec 2002 04:20:55 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: RE: EP7312 can't use 32MB DRAM (fwd)
Message-ID: <Pine.LNX.4.44.0212100420450.14112-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


---------- Forwarded message ----------
Date: Mon, 9 Dec 2002 23:29:19 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: PA Nilsson <pa@glaze.se>
Subject: RE: EP7312 can't use 32MB DRAM

Thanks for your suggestion.
I had modified my source code but still can not work.
 mi->bank[0].start = 0xc0000000;
 mi->bank[0].size = 32*1024*1024;
 mi->bank[0].node = 0;
 mi->nr_banks = 1;

I also rewrited my bootloader(hermit), in the linux.c, I specified
page_size, page_number, page_number_in_bank. 

	/* system page size */
        ps->u1.s.page_size = 0x1000;
	/* number of pages in all banks */
	ps->u1.s.nr_pages = 8192;
	/* pages per bank */
	ps->u1.s.pages_in_bank[0] = 8192;


In hermit's boot.S, I reconfigured the SDRAM size, 32MB.
	
	mov r1, #0x42 		/* 32MB */
        add r1, r1, #0x0500
        mov r2, #0x2300
        add r2, r2, r0
        str r1, [r2]

        mov r1, #0x240                  /* 36MHz SDRAM refresh period */
        mov r2, #0x2340
        add r2, r2, r0
        str r1, [r2]

I wonder the above initial code of SDRAM, if it is also needed by linux 
kernel's boot.S or it only needed to executed once at the bootloader ?

Sadly, it still can not work after the above course.
Any suggestion would be greatly appreciated.

Thanks in advance,
Brian



On Thu, 5 Dec 2002, PA Nilsson wrote:

> Since I am a hardware designer, software is not my strongest side but this
> might help you.
> 
> You do not write anything about what board you are running on, but here is
> one possibility why your code might crash:
> 
> If your board is set up with two 16-bit wide DRAMs to form a 32-bit wide
> bus, all of your memory will be located in the same bank, not over both
> banks. That would mean that you should only configure one bank, but twice
> the size.
> 
> Make sure that you have set up your DRAM-controller in your bootloader
> aswell, depending on the physical layout on the board.
> 
> /PA
> 
