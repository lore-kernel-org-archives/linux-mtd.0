Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18M0p3-0007qT-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 06:58:22 +0000
Received: from localhost (saturn@localhost)
	by structure.biochem.nchu.edu.tw (8.11.6/8.11.6) with ESMTP id gBAJhTm16659
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 03:43:29 +0800
Date: Wed, 11 Dec 2002 03:43:29 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: RE: EP7312 can't use 32MB DRAM
In-Reply-To: <Pine.LNX.4.44.0212100420450.14112-100000@structure.biochem.nchu.edu.tw>
Message-ID: <Pine.LNX.4.44.0212110340470.16580-100000@structure.biochem.nchu.edu.tw>
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

This is my ksymoops extract.

>>EIP; c0055804 <kmem_cache_grow+1ac/4a8>   <=====
>>r10; c0031154 <__arm720_proc_info+0/0>
Trace; c005565c <kmem_cache_grow+4/4a8>
Trace; c0055fb8 <kmalloc+200/240>
Trace; c0055dbc <kmalloc+4/240>
Trace; c007dac0 <proc_create+80/c4>
Trace; c007da3c <proc_kill_inodes+ac/b0>
Trace; c007dccc <create_proc_entry+74/b8>
Trace; c007dc54 <proc_mkdir+64/68>
Trace; c002dd48 <proc_misc_init+40/180>
Trace; c002dd08 <proc_misc_init+0/180>
Trace; c002dbb8 <proc_root_init+54/f0>
Trace; c002db64 <proc_root_init+0/f0>
Trace; c0028644 <start_kernel+fc/144>
Trace; c0028548 <start_kernel+0/144>
Trace; c0028080 <__mmap_switched+0/30>
Code;  c00557f4 <kmem_cache_grow+19c/4a8>
00000000 <_EIP>:
Code;  c00557f4 <kmem_cache_grow+19c/4a8>
   0:   81 30 83 e0 03 41         xorl   $0x4103e083,(%eax)
Code;  c00557fa <kmem_cache_grow+1a2/4a8>
   6:   82                        (bad)
Code;  c00557fb <kmem_cache_grow+1a3/4a8>
   7:   e0 18                     loopne 21 <_EIP+0x21> c0055815 
<kmem_cache_grow+1bd/4a8>
Code;  c00557fd <kmem_cache_grow+1a5/4a8>
   9:   02 9f e5 e2 a5 ff         add    0xffa5e2e5(%edi),%bl
Code;  c0055803 <kmem_cache_grow+1ab/4a8>   <=====
   f:   eb 00                     jmp    11 <_EIP+0x11> c0055805 
<kmem_cache_grow+1ad/4a8>   <=====
Code;  c0055805 <kmem_cache_grow+1ad/4a8>
  11:   50                        push   %eax
Code;  c0055806 <kmem_cache_grow+1ae/4a8>
  12:   84 e5                     test   %ah,%ch

Kernel panic: Attempted to kill the idle task!


Any suggestion would be greatly appreciated.

Brian

On Tue, 10 Dec 2002, shadow wrote:

> 
> 
> ---------- Forwarded message ----------
> Date: Mon, 9 Dec 2002 23:29:19 +0800 (CST)
> From: shadow <saturn@structure.biochem.nchu.edu.tw>
> To: PA Nilsson <pa@glaze.se>
> Subject: RE: EP7312 can't use 32MB DRAM
> 
> Thanks for your suggestion.
> I had modified my source code but still can not work.
>  mi->bank[0].start = 0xc0000000;
>  mi->bank[0].size = 32*1024*1024;
>  mi->bank[0].node = 0;
>  mi->nr_banks = 1;
> 
> I also rewrited my bootloader(hermit), in the linux.c, I specified
> page_size, page_number, page_number_in_bank. 
> 
> 	/* system page size */
>         ps->u1.s.page_size = 0x1000;
> 	/* number of pages in all banks */
> 	ps->u1.s.nr_pages = 8192;
> 	/* pages per bank */
> 	ps->u1.s.pages_in_bank[0] = 8192;
> 
> 
> In hermit's boot.S, I reconfigured the SDRAM size, 32MB.
> 	
> 	mov r1, #0x42 		/* 32MB */
>         add r1, r1, #0x0500
>         mov r2, #0x2300
>         add r2, r2, r0
>         str r1, [r2]
> 
>         mov r1, #0x240                  /* 36MHz SDRAM refresh period */
>         mov r2, #0x2340
>         add r2, r2, r0
>         str r1, [r2]
> 
> I wonder the above initial code of SDRAM, if it is also needed by linux 
> kernel's boot.S or it only needed to executed once at the bootloader ?
> 
> Sadly, it still can not work after the above course.
> Any suggestion would be greatly appreciated.
> 
> Thanks in advance,
> Brian
> 
> 
> 
> On Thu, 5 Dec 2002, PA Nilsson wrote:
> 
> > Since I am a hardware designer, software is not my strongest side but this
> > might help you.
> > 
> > You do not write anything about what board you are running on, but here is
> > one possibility why your code might crash:
> > 
> > If your board is set up with two 16-bit wide DRAMs to form a 32-bit wide
> > bus, all of your memory will be located in the same bank, not over both
> > banks. That would mean that you should only configure one bank, but twice
> > the size.
> > 
> > Make sure that you have set up your DRAM-controller in your bootloader
> > aswell, depending on the physical layout on the board.
> > 
> > /PA
> > 
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
