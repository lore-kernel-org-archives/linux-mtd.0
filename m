From: eric.dejonc@thales-e-transactions.com (Eric DEJONC)
Date: Thu, 27 Mar 2003 17:58:05 +0100
Subject: Unable to handle kernel paging request at virtualaddress80000013
References: <3E8303F3.980B0F02@thales-e-transactions.com>
 <1048774361.14203.145.camel@passion.cambridge.redhat.com>
 <3E8307BF.43FC7C28@thales-e-transactions.com> <1048778440.30799.76.camel@henrik.marasystems.com>
Message-ID: <3E832D9D.8C65AC7@thales-e-transactions.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thank you all for your help,
I gave the vmlinux file but  compiled with the cross compiler I  think it was
the right think to do, i gave too the system.map and the sykms. The output
seems to denote that the problem comes from the jffs2, driver?

I'd be gratefull to you if you could give me your opinion.

Best regards,
Eric

Internal error: Oops: c1623003
CPU: 0
pc : [<c0095ab4>]    lr : [<80000093>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c0be3e9c  ip : 80000013  fp : c0be3eec
r10: c0b6b07c  r9 : c1f5392c  r8 : c0b6b21c
Warning (Oops_set_i370_regs): garbage 'r9 : c1f5392c  r8 : c0b6b21c ' at end of
i370 register line ignored
r7 : c0b9a340  r6 : 00000000  r5 : c0b9b100  r4 : c0be3eb8
r3 : 00000044  r2 : 003c0050  r1 : 0001ffb0  r0 : 00000000
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: C162317F  Table: C162317F  DAC: 00000015
Process lash (pid: 41, stackpage=c1609360)
Stack: (0xc0be3e8c to 0xc0be4000)
3e80:                            80000093 c0095ab4 80000093 ffffffff 003c000c
3ea0: c0be3eb8 c0be3ebc c0be3ec0 00000007 c0b6b1e0 c0be15e0 00000044 0001ffb0
3ec0: 003c0050 000001a4 c0b6b07c 00000000 c0be15e0 c0be3f60 c0be2000 00000242
3ee0: c0be3f0c c0be3ef0 c006e864 c00958a4 c0be15e0 c0be1560 000001b6 c1f50000
3f00: c0be3f5c c0be3f10 c006ea38 c006e7dc c0042b58 c0be3f20 c0024e80 c0be3f68
3f20: 00000000 00000000 00000002 000001b6 c0be15e0 00000241 00000003 000001b6
3f40: c1f50000 c001d824 c0be2000 00000241 c0be3f8c c0be3f60 c005c778 c006e898
3f60: c0be1560 c02323a0 c1f50005 00000007 329f54fd 00000010 00000000 00000241
3f80: c0be3fac c0be3f90 c005cb88 c005c750 02066eb8 bffffe34 02066e48 00000005
3fa0: 00000000 c0be3fb0 c001d6a0 c005cb50 02066eb8 c0025660 02066e72 00000241
3fc0: 000001b6 00000001 02066eb8 bffffe34 02066e48 00000000 00000000 bffffe24
3fe0: 00000241 bffffee8 400ae1a0 bffffdc4 02021650 400ae1a4 20000010 02066e72
Backtrace: frame pointer underflow
Function entered at [<c0095898>] from [<c006e864>]
Function entered at [<c006e7d0>] from [<c006ea38>]
 r7 = C1F50000  r6 = 000001B6  r5 = C0BE1560  r4 = C0BE15E0
Function entered at [<c006e88c>] from [<c005c778>]
Function entered at [<c005c744>] from [<c005cb88>]
 r4 = 00000241
Function entered at [<c005cb44>] from [<c001d6a0>]
 r7 = 00000005  r6 = 02066E48  r5 = BFFFFE34  r4 = 02066EB8
Code: e50b1030 e10fc000 e38ce080 e121f00e (e59ce000)

>>EIP; c0095ab4 <jffs2_create+21c/58c>   <=====
>>r10; c0b6b07c <_end+996d24/664dd08>
Trace; c0095898 <jffs2_create+0/58c>
Trace; c006e864 <vfs_create+94/bc>
Trace; c006e7d0 <vfs_create+0/bc>
Trace; c006ea38 <open_namei+1ac/79c>
Trace; c006e88c <open_namei+0/79c>
Trace; c005c778 <filp_open+34/50>
Trace; c005c744 <filp_open+0/50>
Trace; c005cb88 <sys_open+44/88>
Trace; c005cb44 <sys_open+0/88>
Trace; c001d6a0 <ret_fast_syscall+0/38>
Code;  c0095aa4 <jffs2_create+20c/58c>
00000000 <_EIP>:
Code;  c0095aa4 <jffs2_create+20c/58c>
   0:   30 10                     xor    %dl,(%eax)
Code;  c0095aa6 <jffs2_create+20e/58c>
   2:   0b e5                     or     %ebp,%esp
Code;  c0095aa8 <jffs2_create+210/58c>
   4:   00 c0                     add    %al,%al
Code;  c0095aaa <jffs2_create+212/58c>
   6:   0f e1 80 e0 8c e3 0e      psraw  0xee38ce0(%eax),%mm0
Code;  c0095ab1 <jffs2_create+219/58c>
   d:   f0 21 e1                  lock and %esp,%ecx
Code;  c0095ab4 <jffs2_create+21c/58c>   <=====
  10:   00 e0                     add    %ah,%al   <=====
Code;  c0095ab6 <jffs2_create+21e/58c>
  12:   9c                        pushf
Code;  c0095ab7 <jffs2_create+21f/58c>
  13:   e5 00                     in     $0x0,%eax

Henrik Nordstrom a ?crit :

> See linux/Documentation/oops-tracing.txt
>
> tor 2003-03-27 klockan 15.16 skrev Eric DEJONC:
> > How can I decode the oops?
> >
> > David Woodhouse a ?crit :
> >
> > > You didn't bother to decode the oops. I can't be bothered to speculate.
> > >
> > > --
> > > dwmw2
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> --
> Henrik Nordstrom <hno@marasystems.com>
> MARA Systems AB
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
