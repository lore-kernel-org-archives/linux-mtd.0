Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D101s-0000j6-On
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 05:34:06 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050214143601.GB27046@synertronixx3>
References: <20050214143601.GB27046@synertronixx3>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 13:33:31 +0300
Message-Id: <1108463611.26412.27.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops in 2.6.10-rc2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 15:36 +0100, Konstantin Kletschke wrote:
> Hi people!
> 
> I have an Oops in 2.6.10-rc2. Sadly I can't update to 2.6.10 so I want
> to ask what in particular I should fix in 2.6.10-rc2 if this bug is
> fixed already.
> 
> I can reproduce it:
> flash bootloader, kernel, rootfs and adjust bootargs kernel cmdline to
> match the layout. Then I boot kernel, system comes up without a hitch.
> then scp rootfs.tar (some userspace binary additions) into /tmp which is
> tmpfs. Then go to / and do tar xf /tmp/rootfs.tar:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> Internal error: Oops: 807 [#1]
> CPU: 0                   
> pc : [<c00926c8>]    lr : [<c01de994>]    Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
> sp : c031de18  ip : 00000000  fp : c031de68
> r10: c026ff54  r9 : c031de34  r8 : c0261600
> r7 : c026c830  r6 : c031de2c  r5 : 00000000  r4 : 000300d4
> r3 : 00000000  r2 : 00000030  r1 : c026ff34  r0 : c026ff44
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: C000317F  Table: 08C10000  DAC: 00000015
> Stack: (0xc031de18 to 0xc031e000)
> de00:                                                       c031de2c c031de34
> de20: c0c4e4f4 c0c4d224 00000003 0000000c c0ebc002 c0021985 00000044 98f7fb1d
> de40: 00000000 c0c4d298 c0eb74f4 c0c4d24c c0015ea4 c0c4d224 c031defc c031decc
> de60: c031de6c c009a6c4 c0092134 00000000 0034ebb8 00000000 00000000 00000044
> de80: 00000000 00000000 c0261600 c0c4e4f4 00011448 0034ebb8 00000000 f9126449
> dea0: c0068160 c031defc 00000046 c0c4d24c 000041ed c0c7319c c031c000 0000fc80
> dec0: c031def8 c031ded0 c0075428 c0099fe0 0000005a 3296684c c0c4d2b4 ffffffff
> dee0: 00000000 c031df48 c00177e4 c031df44 c031defc c0059f04 c007531c 00000046
> df00: c031df28 000001f5 00000064 c01b1000 c031df48 0000005a 3296684c 0000005a
> df20: 3296684c 0000005a 3296684c 000001f5 000001f5 00000064 c031dfa4 c031df48
> df40: c0059fd4 c0059e50 c0c7319c c0193360 00000007 c01b1004 00000000 00000000
> df60: 00000001 00000000 c031df74 c005aec8 c005ab9c 00000400 00000000 00000000
> df80: 00000200 4006db10 ffffffff 4006daa8 4006da68 00000010 00000000 c031dfa8
> dfa0: c0017660 c0059fa0 ffffffff c001de44 4006daf8 000001f5 00000064 00000065
> dfc0: ffffffff 4006daa8 4006da68 4006da68 4006daa8 00000000 0000fc80 00000000
> dfe0: 0000ffff befffb84 0000f9f0 4005dfcc 80000010 4006daf8 00087805 00087806
> Backtrace:
> Function entered at [<c0092124>] from [<c009a6c4>]
> Function entered at [<c0099fd0>] from [<c0075428>]
> Function entered at [<c007530c>] from [<c0059f04>]
>  r8 = C00177E4  r7 = C031DF48  r6 = 00000000  r5 = FFFFFFFF
>  r4 = C0C4D2B4
> Function entered at [<c0059e40>] from [<c0059fd4>]
>  r5 = 00000064  r4 = 000001F5
> Function entered at [<c0059f90>] from [<c0017660>]
>  r7 = 00000010  r6 = 4006DA68  r5 = 4006DAA8  r4 = FFFFFFFF
> Code: 0587a02c e5903000 e3530000 13a03000 (15833000)
> 
> 
> >>EIP; c00926c8 <jffs2_mark_node_obsolete+5a4/664>   <=====
>                          
> Trace; c0092124 <jffs2_mark_node_obsolete+0/664>
> Trace; c009a6c4 <jffs2_do_setattr+6f4/780>
> Trace; c0099fd0 <jffs2_do_setattr+0/780>
> Trace; c0075428 <notify_change+11c/184>
> Trace; c007530c <notify_change+0/184>
> Trace; c0059f04 <chown_common+c4/f8>
>                          
> >>r8; c00177e4 <sys_call_table+0/0>
>                          
> Trace; c0059e40 <chown_common+0/f8>
> Trace; c0059fd4 <sys_lchown+44/58>
> Trace; c0059f90 <sys_lchown+0/58>
> Trace; c0017660 <ret_fast_syscall+0/2c>
>                          
> Code;  c00926b8 <jffs2_mark_node_obsolete+594/664>
> 00000000 <_EIP>:         
> Code;  c00926b8 <jffs2_mark_node_obsolete+594/664>
>    0:   2c a0                     sub    $0xa0,%al
> Code;  c00926ba <jffs2_mark_node_obsolete+596/664>
>    2:   87 05 00 30 90 e5         xchg   %eax,0xe5903000
> Code;  c00926c0 <jffs2_mark_node_obsolete+59c/664>
>    8:   00 00                     add    %al,(%eax)
> Code;  c00926c2 <jffs2_mark_node_obsolete+59e/664>
>    a:   53                        push   %ebx
> Code;  c00926c3 <jffs2_mark_node_obsolete+59f/664>
>    b:   e3 00                     jecxz  d <_EIP+0xd>
> Code;  c00926c5 <jffs2_mark_node_obsolete+5a1/664>   <=====
>    d:   30 a0 13 00 30 83         xor    %ah,0x83300013(%eax)   <=====
> Code;  c00926cb <jffs2_mark_node_obsolete+5a7/664>
>   13:   15 00 00 00 00            adc    $0x0,%eax
> 
> 
> My question is if this bug is fixed, which changes from 10-rc2 to 10
> are concerned by the fix? I can't update because porting my usb stuff
> will take ages and I don't wan't to destabilize things which are stable
> now (well, all except this one).

IIRC, there were some NOR-related bug fixes. I would just see the
revision of your nodemngmnt.c file and compare with the latest revision.
I believe the distance is one or two commits. You may port them or just
use the latest nodemngmnt.c - with high probability it will work well.

> 
> REgards, Konstantin Kletschke
> 
