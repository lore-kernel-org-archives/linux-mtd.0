Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEUTZ-0005nM-Gh
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 15:37:53 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BEUTX-0001AN-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2004 16:37:51 +0200
Date: Fri, 16 Apr 2004 16:37:51 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <20040416143751.GB2171@tkeitel001.bln.innominate.local>
References: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
	<20040415144756.GV29551@tkeitel001.bln.innominate.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20040415144756.GV29551@tkeitel001.bln.innominate.local>
Sender: Tino Keitel <tino.keitel@innominate.com>
Subject: Re: JFFS2 writes fail with 2.4.25
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2004 at 16:47:56 +0200, Tino Keitel wrote:
> On Thu, Apr 15, 2004 at 16:40:31 +0200, Tino Keitel wrote:
> > Hi folks,
> > 
> > I just switched from 2.4.19 to 2.4.25 and was afraid that there are
> > problems with file creation. Here is an example:
> > 
> > # mkdir x
> 
> [a lot of debugging output]
> 
> > The system is an Intel XScale IXP425 board (ARM little endian) with 16
> > MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints what's
> > wrong here?
> 
> Maybe I should mention that the system hangs after the mkdir command.

I also captured two kernel Oopses which occur occasionally. I attached
them to this mail.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=Oops_filemap_fdatawait

Unable to handle kernel paging request at virtual address 4cc1a5a2
Internal error: Oops: 8f3
CPU: 0
pc : [<c0039800>]    lr : [<c006043c>]    Not tainted
sp : c02ddee4  ip : c02ddf0c  fp : c02ddf08
r10: c1a59e54  r9 : 690541c0  r8 : 00000000
r7 : 00000000  r6 : c1fc6000  r5 : c1a59e44  r4 : c1a59e53
r3 : 4cc1a59e  r2 : 53ffed91  r1 : c1a59d88  r0 : c1a59e44
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 39FF  Table: 01B54000  DAC: 0000001D
Stack: (0xc02ddee4 to 0xc02de000)
dee0:          00000001 c1a59d80 c1fc6000 c1fc6064 c018abb8 00016b08 c02ddf2c
df00: c02ddf0c c006043c c00397d8 c02ddfc8 c02dc000 c018ab2c c02dc000 c0188d7c
df20: c02ddf44 c02ddf30 c004f2ac c0060360 c02ddfc8 c02dc000 c02ddff4 c02ddf48
df40: c004f648 c004f2a8 00000000 00000000 00000000 00000000 00000000 20000013
df60: c018aae4 c02dc000 c02dc000 c02ee000 00000000 c0188000 c0188000 c02ddfb0
df80: 00000000 00000000 00000013 00000000 00000000 00000000 00000000 00000000
dfa0: 00000000 c02ddfb0 c001a7cc c00241ec 00000000 00000000 00010e00 c004f504
dfc0: 00000000 c02f8000 00000000 c02dc000 00000000 00000000 00000000 c02f8000
dfe0: c01c939c c01c9390 00000000 c02ddff8 c001bfbc c004f510 00000402 00000000
Backtrace:
Function entered at [<c00397cc>] from [<c006043c>]
Function entered at [<c0060354>] from [<c004f2ac>]
 r8 = C0188D7C  r7 = C02DC000  r6 = C018AB2C  r5 = C02DC000
 r4 = C02DDFC8
Function entered at [<c004f29c>] from [<c004f648>]
 r5 = C02DC000  r4 = C02DDFC8
Function entered at [<c004f504>] from [<c001bfbc>]
 r7 = C01C9390  r6 = C01C939C  r5 = C02F8000  r4 = 00000000
Code: e5954010 e5942004 e5943000 e3a07000 (e5832004)


>>LR;  c006043c <sync_unlocked_inodes+e8/1ac>

>>PC;  c0039800 <filemap_fdatawait+34/b4>   <=====

Trace; c00397cc <filemap_fdatawait+0/b4>
Trace; c006043c <sync_unlocked_inodes+e8/1ac>
Trace; c0060354 <sync_unlocked_inodes+0/1ac>
Trace; c004f2ac <sync_old_buffers+10/90>

>>r8; c0188d7c <cr_alignment+0/4>
>>r6; c018ab2c <kupdate_wait+0/c>

Trace; c004f29c <sync_old_buffers+0/90>
Trace; c004f648 <kupdate+144/18c>
Trace; c004f504 <kupdate+0/18c>
Trace; c001bfbc <arch_kernel_thread+38/48>

>>r7; c01c9390 <__machine_arch_type+0/4>
>>r6; c01c939c <processor_id+0/4>

Code;  c00397f0 <filemap_fdatawait+24/b4>
00000000 <_PC>:
Code;  c00397f0 <filemap_fdatawait+24/b4>
   0:   104095e5  subne   r9, r0, r5, ror #11
Code;  c00397f4 <filemap_fdatawait+28/b4>
   4:   042094e5  streqt  r9, [r0], -#1253
Code;  c00397f8 <filemap_fdatawait+2c/b4>
   8:   003094e5  eoreqs  r9, r0, r5, ror #9
Code;  c00397fc <filemap_fdatawait+30/b4>
   c:   0070a0e3  rsbeqs  sl, r0, r3, ror #1
Code;  c0039800 <filemap_fdatawait+34/b4>
  10:   042083e5  streqt  r8, [r0], -#997


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=Oops_kfree

pc : [<c00408e4>]    lr : [<c0040890>]    Not tainted
sp : c1807e04  ip : c1e22000  fp : c1807e1c rebooting we need to send back
Warning (Oops_set_regs): garbage 'rebooting we need to send back' at end of register line ignored
r10: 00000000  r9 : c1fc60fc  r8 : c1a594b4device again for a few seconds
Warning (Oops_set_regs): garbage 'vice again for a few seconds' at end of register line ignored
r7 : c1f70100  r6 : a0000013  r5 : c1a59444  r4 : c1a59444
r3 : c297c314  r2 : c1a59454  r1 : c1a59453  r0 : 003c8bb4
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 39FF  Table: 019FC000  DAC: 00000015
Stack: (0xc1807e04 to 0xc1808000)
7e00:          c1acf920 c1807e60 00000006 c1807e2c c1807e20 c007467c c0040844
7e20: c1807e8c c1807e30 c007f22c c007466c 00000523 003cb230 00000003 00000000
7e40: 00000000 00000000 c1e22000 00014dd0 003cb230 00000523 00000c2a c185e000
7e60: 90c19901 00000c2a c1807eb4 c1f70124 00000000 c1f70100 c02a6dfc c1a59380
7e80: c1807ee0 c1807e90 c0077b70 c007eedc 00000000 00000c2a c1807eb0 c1a593c4
7ea0: 00000000 c1fc60fc c1a594b4 00000c2a 00000000 386d4782 00000000 c02a6dfc
7ec0: c1e22000 00000000 c1a59380 00000c2a 00000000 c1807f44 c1807ee4 c003d160
7ee0: c0077914 c1807f0c 00000c2a c02a6e14 c02f50b4 00000000 c1a59444 c188cd60
7f00: 0010a000 c188cd40 00000000 00000000 00000000 00000c2a c004ae0a c1a593ec
7f20: c188cd40 ffffffea c1a59380 00000c2a 0010a000 c188cd40 c1807f78 c1807f48
7f40: c003d66c c003ce34 c1807f84 c188cd60 00000c2a c188cd40 ffffffea 00000000
7f60: 0010a000 c1806000 00000002 c1807fa4 c1807f7c c004a38c c003d530 c1807f88
7f80: c0049bf0 00000c2a 00000003 0010ac29 00000004 c001a8e4 00000000 c1807fa8
7fa0: c001a720 c004a2bc 00000c2a c0020910 00000003 0010a000 00000c2a 00000c2a
7fc0: 00000c2a 00000003 0010ac29 0010a000 00000000 bffff88c 00000002 bffff7f4
7fe0: bffff7f8 bffff7e4 00041ef8 000be104 20000010 00000003 00107ff0 00102ab0
Backtrace:
Function entered at [<c0040838>] from [<c007467c>]
 r6 = 00000006  r5 = C1807E60  r4 = C1ACF920
Function entered at [<c0074660>] from [<c007f22c>]
Function entered at [<c007eed0>] from [<c0077b70>]
Function entered at [<c0077908>] from [<c003d160>]
Function entered at [<c003ce28>] from [<c003d66c>]
Function entered at [<c003d524>] from [<c004a38c>]
Function entered at [<c004a2b0>] from [<c001a720>]
 r8 = C001A8E4  r7 = 00000004  r6 = 0010AC29  r5 = 00000003
 r4 = 00000C2A
Code: e5843000 e2853010 e5843004 e5854010 (ea00000f)


>>LR;  c0040890 <kfree+58/fc>

>>PC;  c00408e4 <kfree+ac/fc>   <=====

Trace; c0040838 <kfree+0/fc>
Trace; c007467c <jffs2_free_comprbuf+1c/20>
Trace; c0074660 <jffs2_free_comprbuf+0/20>
Trace; c007f22c <jffs2_write_inode_range+35c/558>
Trace; c007eed0 <jffs2_write_inode_range+0/558>
Trace; c0077b70 <jffs2_commit_write+268/394>
Trace; c0077908 <jffs2_commit_write+0/394>
Trace; c003d160 <do_generic_file_write+338/4b4>
Trace; c003ce28 <do_generic_file_write+0/4b4>
Trace; c003d66c <generic_file_write+148/178>
Trace; c003d524 <generic_file_write+0/178>
Trace; c004a38c <sys_write+dc/15c>
Trace; c004a2b0 <sys_write+0/15c>
Trace; c001a720 <ret_fast_syscall+0/38>

>>r8; c001a8e4 <sys_call_table+0/0>

Code;  c00408d4 <kfree+9c/fc>
00000000 <_PC>:
Code;  c00408d4 <kfree+9c/fc>
   0:   003084e5  eoreqs  r8, r0, r5, ror #9
Code;  c00408d8 <kfree+a0/fc>
   4:   103085e2  eornes  r8, r0, r2, ror #11
Code;  c00408dc <kfree+a4/fc>
   8:   043084e5  ldreqt  r8, [r0], -#1253
Code;  c00408e0 <kfree+a8/fc>
   c:   104085e5  subne   r8, r0, r5, ror #11
Code;  c00408e4 <kfree+ac/fc>
  10:   0f0000ea  swieq   0x000000ea


2 warnings issued.  Results may not be reliable.

--HlL+5n6rz5pIUxbD--
