Received: from avicenna.cc.boun.edu.tr ([193.140.210.25])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JyNE-0001Xa-Tt
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 17:29:29 +0100
Received: from saritepe.cc.boun.edu.tr ([193.140.192.31])
	M2003052519290809056
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 19:29:08 +0300
Message-ID: <1053891017.3ed119c966818@webmail.boun.edu.tr>
Date: Sun, 25 May 2003 19:30:17 +0000
From: kusdogan@boun.edu.tr
To: David Woodhouse <dwmw2@infradead.org>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
	<1053855854.2082.3.camel@passion.cambridge.redhat.com>
	<1053887191.3ed10ad7ea7cf@webmail.boun.edu.tr>
	<1053876687.17182.1.camel@imladris.demon.co.uk>
In-Reply-To: <1053876687.17182.1.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso8859-9;q=1.0
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer dereference
 at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting David Woodhouse <dwmw2@infradead.org>:

> Where exactly is the oops this time, and if it's not in add_mtd_device()
> can you show the (decoded) backtrace too? (you need -mapcs-frame).
> 
> If it's still in add_mtd_device(), please show the entire disassembly of
> that function. What compiler are you compiling with?
> 
> -- 
> dwmw2

It's still at the same line in add_mtd_device()
Compiler gcc-2.95.2
Backtrace :

Unable to handle kernel NULL pointer dereference at virtual address
00000000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c0089200>]    lr : [<00000001>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c0115ee8  ip : 60000013  fp : c0115f04
r10: 00000000  r9 : 00000001  r8 : c00c7928
r7 : c00c77d4  r6 : c00c7804  r5 : ffffffff  r4 : c011d2e0
r3 : 00000000  r2 : c00c7850  r1 : fffffff8  r0 : c011d2e0
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 217F  Table: 4000401D  DAC: 0000001D
Process swapper (pid: 1, stackpage=c0115000)
Stack: (0xc0115ed8 to 0xc0116000)
5ec0:                                                       00000001 c0089200
5ee0: 00000013 ffffffff c011d2e0 c01df160 c00c7804 c00c77d4 c0115f20 c0115f08
5f00: c00885fc c008919c c00c7834 c01df160 c00c7848 c0115f3c c0115f24 c0089608
5f20: c008859c c00c7884 c01df160 c00c77e8 c0115f5c c0115f40 c00865bc c00895e0
5f40: c01df160 c01df060 00000004 00000000 c0115f90 c0115f60 c0087cd8 c008653c
5f60: 00010000 00000003 c00bb748 c00e6494 c00e6498 00000000 c00e6490 
41807202
5f80: 4000fba4 c0115fb4 c0115f94 c000f93c c00877c8 c0010674 c0010678 c00c93f8
5fa0: c00c93ec c00c4b40 c0115fcc c0115fb8 c00088e4 c000f870 00000800 c00e7338
5fc0: c0115fdc c0115fd0 c0008924 c00088d8 c0115ffc c0115fe0 c0011064 c000890c
5fe0: 00000800 c00e7338 c00c93f8 c00c93ec 00000000 c0116000 c0012e38 
c0011064
Backtrace:
Code: e582e000 e121f00c d1a0c002 dbfe2b27 (e5833000)
sh: /usr/bin/objdump: No such file or directory
Error (pclose_local): Oops_decode_part pclose failed 0x7f00
Error (Oops_decode_part): no objdump lines read for /tmp/ksymoops.33xPCD
 
 
>>EIP; c0089200 <add_mtd_blktrans_dev+74/2b0>   <=====
 
>>ip; 60000013 <stack_end+5fffe075/c0002062>
>>r8; c00c7928 <h720x_partitions+0/48>
>>r7; c00c77d4 <mtd_table_mutex+0/14>
>>r6; c00c7804 <mtdblock_tr+0/44>
>>r2; c00c7850 <mtd_table_mutex+0/14>
 
Kernel panic: Attempted to kill init!
