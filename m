Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Zvrr-0001SJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 15:53:59 +0100
Message-Id: <5.1.0.14.0.20010823095635.00b00ca0@mail.spewey.com>
Date: Thu, 23 Aug 2001 10:00:06 -0500
To: Luke <luke_epsilon@yahoo.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: ZFMicro MachZ success with the Am29LV065D 
In-Reply-To: <20010823145404.4969.qmail@web13601.mail.yahoo.com>
References: <5.1.0.14.0.20010823052444.00a6f488@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 07:54 AM 8/23/2001 -0700, Luke wrote:
>Howdy,
>
>I am trying to mount part of the flash0 device right now as I don't want 
>to mount the portion that
>has my bios or initrd or kernel - this "looks" straightforward for the 
>ZFMicro but I am getting
>some interesting errors.  I will work on messing with the second physical 
>flash device later.
>
>in the ZFL registers space I set
>     MemWindow0 window size to 500000h (I want a 5 Mbyte section mounted)
>     MemWindow0 page address to 1c0000h (the initrd and kernel are below this)
>     MemWindow0 base address to 10000000h (this will be mapped at 256Mbyte 
> in the
>                                           physical memory space - above 
> any SDRAM
>                                           conflicts)

Normally, one map's the entire flash as far as the chip select's are 
concerned, and set's the start/length logically in the map driver (in your 
case physmap.c).
Of course you don't want to start/stop in the middle of a sector. Only on 
sector boundaries please :)

Not quite sure if this is causing your JFFS2 panic, but it's worth trying 
out. If this is not it, then you have to run the oops messages through 
ksymoops and provide a trace as to where in the src the panic is taking place.

Vipin


>As I have it right now, linux loads and I see:
>
>physmap flash device: 500000 at 10000000
>Physically mapped flash: Found 1 x8 devices at 0x0 in 8-bit mode
>  Amd/Fujitsu Extended Query Table v1.1 at 0x0040
>number of CFI chips: 1
>mtd: Giving out device 0 to Physically mapped flash
>
>and if I cat /proc/mtd I see
>dev:      size        erasesize          name
>mtd0    00800000      00010000        "physically mapped flash"
>
>should this size still be 8 Mbytes?  That is the physical size of the 
>flash but I should be
>mapping only part of the flash.
>
>When I try to mount mtdblock0 I get the following (I made a directory 
>/mnt/mtd before the next
>line):
>
># mount -t jffs2 /dev/mtdblock0 /mnt/mtd
>mtdblock_open
>ok
>JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
>JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
>JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
>...
>(this continues erasing 64k chunks at a time until)
>...
>JFFS2: Erase block at 0x004c0000 is not formatted. It will be erased
>JFFS2: Erase block at 0x004d0000 is not formatted. It will be erased
>JFFS2: Erase block at 0x004e0000 is not formatted. It will be erased
>JFFS2: Erase block at 0x004f0000 is not formatted. It will be erased
>Unable to handle kernel paging request at virtual address c2d00000
>  printing eip:
>c018eacd
>*pde = 01f93067
>*pte = 00000000
>Oops: 0000
>CPU:    0
>EIP:    0010:[<c018eacd>]
>EFLAGS: 00010216
>eax: c2d00000   ebx: 0000000c   ecx: 00000003   edx: c1bafe30
>esi: c2d00000   edi: c1bafe30   ebp: 0000000c   esp: c1bafd80
>ds: 0018   es: 0018   ss: 0018
>Process mount (pid: 16, stackpage=c1baf000)
>Stack: c10988d8 c1bafde4 c1bafdf4 c018bcec c01c6600 c1bafe30 00500000 
>0000000c
>        00500000 00000000 00000000 c10988a0 c01c6600 c01a2581 c01e2670 
> c01e2a3f
>        00500000 00000000 00000010 ffffffff 00000005 00000000 c1bae000 
> 00000000
>Call Trace: [<c018bcec>] [<c01a2581>] [<c015c2aa>] [<c015bffd>] 
>[<c015e7ad>]
>    [<c015b4d7>] [<c012f6d3>] [<c013008f>] [<c01301a3>] [<c013042b>] 
> [<c01246eb>]
>
>    [<c013028f>] [<c01304cc>] [<c0106f83>]
>
>Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 5b 5e 5f c3 53
>  <0>Kernel panic: Aiee, killing interrupt handler!
>In interrupt handler - not syncing
>
>----
>any ideas on what to try?  I am using the standard "physmap" driver and 
>the mtd stuff in kernel
>2.4.8-ac7.
>
>Thanks,
>Luke
>
>__________________________________________________
>Do You Yahoo!?
>Make international calls for as low as $.04/minute with Yahoo! Messenger
>http://phonecard.yahoo.com/
