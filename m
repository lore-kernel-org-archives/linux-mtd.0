Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw1i4-0008Nk-M4
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 12:21:08 -0500
Date: Tue, 1 Feb 2005 18:21:00 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050201172059.GB26068@synertronixx3>
References: <20050201153945.GA26068@synertronixx3>
	<Pine.LNX.4.61.0502011137020.31479@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0502011137020.31479@localhost.localdomain>
Subject: Re: I need still help with XIP, kernel boots now :)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-01 11:38 -0500 schrieb Nicolas Pitre:
> On Tue, 1 Feb 2005, Konstantin Kletschke wrote:
> 
> > Hi people!
> > 
> > Now I need definately have XIP to get running :/
> > 
> > I use 2.6.11-rc2-mm2 and put the "xipu" patches into it, which make the
> > "make xipuImage" available and the XIP Kernel boots now. heureka.
> > 
> > Due to the fakt I have no hardware partiotionable Flash devices I need
> > to utlize the mtd software support to cexist with an XIP Kernel
> > (CONFIG_MTD_XIP=y).
> 
> Try that option with a non XIP kernel at first, then test writing to 
> flash etc.  See if that works first.

*ourks* This guves a nice Oops.

Internal error: Oops: 0 [#1] 
CPU: 0            
pc : [<c001fdd8>]    lr : [<e5933000>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c01af98c  ip : c01afa00  fp : c01af99c          
r10: c01f69f8  r9 : 00000023  r8 : e0000011
r7 : c0160038  r6 : c01afa00  r5 : e5933000  r4 : 00000003
r3 : 00000000  r2 : e0000011  r1 : 00100000  r0 : e0000011
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 08004000  DAC: 00000017          
Stack: (0xc01af98c to 0xc01b0000)                 
f980:                            00000000 c01af9d8 c01af9a0 c0020400 c001fd94 
f9a0: c01af9ac c01af9a4 c01af9a4 c0171384 00000023 c01afa34 c01573f0 e0000011 
f9c0: c01afa00 60000093 c01f69f8 c01af9fc c01af9dc c001f120 c0020288 ffffffff 
f9e0: c01afa34 00000002 c01633c8 00275680 c01afb24 c01afa00 c001827c c001f0f4 
fa00: 00000001 00000002 00000080 e0000011 00000002 00000001 00000002 c01633c8 
fa20: 00275680 c01f69c0 c01f69f8 c01afb24 00000000 c01afa48 c015ffd0 c016003c 
fa40: 60000093 ffffffff c01d01c9 00000009 c00db9d0 00000006 00000021 00000080 
fa60: c01c1b00 00000200 c01f69f8 c000a7d0 c00b1ff0 0000001f 0000007f 00000007 
fa80: 00000000 c01afad0 c01679d8 c01679cc c01afab0 c01afaa0 c000a3e4 c0051e84 
faa0: 00000000 c01aff64 c01afab4 c000abd0 c000a3d4 c01366d4 c01b3804 c01afac0 
fac0: 00000005 c01afb00 00000001 00000080 00000080 00000000 c01a9d60 c0029f90 
fae0: 00000000 00000000 00000000 c01a9d60 c0029f90 00000000 00000000 00000002 
fb00: 00000001 c01633c8 00000002 0000000c c01f69f8 00275680 c01afc50 c01afb28 
fb20: c0161bf8 c015ff88 c01afb34 00003d39 c004d244 00000080 00000006 00000000 
fb40: 00000000 00000080 c01f69c0 c01afcf4 002756a0 00000001 00000000 000000d0 
fb60: c01a9d60 c01afb84 c01a9d60 c01afbac c00db9d0 c0029df4 c0028c44 00000080 
fb80: c01f69c0 000000d0 000000d0 00000000 0000003b 00003d39 00000005 00000005 
fba0: c01afbc4 c01afbb0 c01afba8 c01afba8 c0171384 00000000 00000080 00000080 
fbc0: 00000080 00000080 00000080 000000e8 000000e8 c01633c8 c01f69f8 c01f69c0 
fbe0: 002756a0 00000030 00000080 00000030 00000070 00000070 00000080 c01afc44 
fc00: c01afc0c c00dc4c4 c002a034 c01a9d60 c0029f90 00000000 00000000 002756a0 
fc20: c01f69f8 00000000 0000000c c01f69f8 00000000 002756a0 00000000 c01f69c0 
fc40: 0000000c c01afc90 c01afc54 c00dceb0 c0160f5c 0000000c c01f69c0 00000040 
fc60: c01633c8 c0253000 00000000 000356a0 00000000 0000000c c01afce0 c01afce8 
fc80: c01afce8 c01afcc8 c01afc94 c00d7d48 c00dcd78 c01afce0 c01afce8 c01afcd4 
fca0: c01afcac 000356a0 00000000 c01afce0 c0264030 c0269a00 c0276694 c01afd1c 
fcc0: c01afccc c009c044 c00d7c9c c01afce0 c01afce8 c00dc780 00400000 c0269a00 
fce0: 00000000 c01ac002 c0021985 000000f5 3d39d2e2 c027561c c027561c c01afd44 
fd00: c0269a00 c01afd48 c0269ac4 c0269aac c01afd40 c01afd20 c00a2a5c c009bad4 
fd20: c01afd48 c027561c c0269a00 00000000 c01afd48 c01afd6c c01afd44 c00a27e8 
fd40: c00a2a3c 00000000 00000025 c0269a94 c0269a9c c0269aa4 c0269ab4 c0269abc 
fd60: c01afdb4 c01afd70 c00a2df4 c00a2618 c0269af8 c0269a00 c0269adc c0269ad4 
fd80: c0269acc c0269aec c00b1ff0 c025a800 c0269a00 00000000 c0269800 c025a800 
fda0: 00000000 00000000 c01afdd8 c01afdb8 c00a4b90 c00a2ba8 c0269800 c0269a00 
fdc0: 00008000 00000000 c025a800 c01afdfc c01afddc c00a51e4 c00a4a64 ffffffea 
fde0: 00000003 c0270000 00008000 c015beb8 c01afe6c c01afe00 c00a5430 c00a515c 
fe00: c025a800 c007a15c c025b5dc c01a7600 c01afecc c01afecc c01afe64 00000001 
fe20: 00000001 00000000 0000000a c01a72a0 c0261680 c0270000 00008000 00000000 
fe40: c01afe6c c01afe50 c01a72a0 fffffff4 c015beb8 c0270000 00008000 00000000 
fe60: c01afe94 c01afe70 c0068ed4 c00a52ac ffffffff c0270000 00000000 00008000 
fe80: c01afecc 00000000 c01afebc c01afe98 c007e600 c0068e88 00008000 00000000 
fea0: c026f000 00000000 c0270000 c01afecc c01aff34 c01afec0 c007eca0 c007e58c 
fec0: c0270000 00000000 c026e000 c01b2554 c01a7600 c01afee0 00000000 c0138cb8 
fee0: 00000001 00000001 00000000 00000000 00000000 c01aff10 c01aff04 c004dff8 
ff00: 00001000 c01aff34 c01aff14 00000000 00000000 c0138cb8 c026f000 00008000 
ff20: 00000000 00000000 c01aff68 c01aff38 c007f0c0 c007eb60 00000000 00000000 
ff40: c0270000 c026e000 c01ca000 c01ca000 00008000 c0138cb8 c01732b0 c01aff80 
ff60: c01aff6c c0008f68 c007f02c 00000000 c01ca000 c01affc4 c01aff84 c000904c 
ff80: c0008f48 c003d8c4 01f00003 c0138cb8 00000000 00000000 00000000 00000000 
ffa0: c01affc4 c0016a18 c00169c8 00000000 00000000 00000000 c01affe0 c01affc8 
ffc0: c0009210 c0009004 00000000 c0138b70 00000000 c01afff4 c01affe4 c00180c4 
ffe0: c0009194 00000000 00000000 c01afff8 c002f820 c0018084 e1530001 9a000007 
Backtrace:                                                                   
Function entered at [<c001fd84>] from [<c0020400>]
 r4 = 00000000                                    
Function entered at [<c0020278>] from [<c001f120>]
Function entered at [<c001f0e4>] from [<c001827c>]
 r8 = 00275680  r7 = C01633C8  r6 = 00000002  r5 = C01AFA34
 r4 = FFFFFFFF                                             
Function entered at [<c015ff78>] from [<c0161bf8>]
Function entered at [<c0160f4c>] from [<c00dceb0>]
Function entered at [<c00dcd68>] from [<c00d7d48>]
Function entered at [<c00d7c8c>] from [<c009c044>]
Function entered at [<c009bac4>] from [<c00a2a5c>]
Function entered at [<c00a2a2c>] from [<c00a27e8>]
 r8 = C01AFD48  r7 = 00000000  r6 = C0269A00  r5 = C027561C
 r4 = C01AFD48                                             
Function entered at [<c00a2608>] from [<c00a2df4>]
 r8 = C0269ABC  r7 = C0269AB4  r6 = C0269AA4  r5 = C0269A9C
 r4 = C0269A94                                             
Function entered at [<c00a2b98>] from [<c00a4b90>]
Function entered at [<c00a4a54>] from [<c00a51e4>]
 r8 = C025A800  r7 = 00000000  r6 = 00008000  r5 = C0269A00
 r4 = C0269800                                             
Function entered at [<c00a514c>] from [<c00a5430>]
 r8 = C015BEB8  r7 = 00008000  r6 = C0270000  r5 = 00000003
 r4 = FFFFFFEA                                             
Function entered at [<c00a529c>] from [<c0068ed4>]
Function entered at [<c0068e78>] from [<c007e600>]
Function entered at [<c007e57c>] from [<c007eca0>]
Function entered at [<c007eb50>] from [<c007f0c0>]
Function entered at [<c007f01c>] from [<c0008f68>]
 r8 = C01732B0  r7 = C0138CB8  r6 = 00008000  r5 = C01CA000
 r4 = C01CA000                                             
Function entered at [<c0008f38>] from [<c000904c>]
 r4 = C01CA000                                    
Function entered at [<c0008ff4>] from [<c0009210>]
 r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = C00169C8
 r4 = C0016A18                                             
Function entered at [<c0009184>] from [<c00180c4>]
 r5 = 00000000  r4 = C0138B70                     
Function entered at [<c0018074>] from [<c002f820>]
 r4 = 00000000                                    
Code: e21e1601 0a000008 e1a02000 e3a03000 (e4d21001)


>>EIP; c001fdd8 <do_alignment_ldrstr+54/108>   <=====

>>r7; c0160038 <xip_udelay+c0/950>

Trace; c001fd84 <do_alignment_ldrstr+0/108>
Trace; c0020400 <do_alignment+188/2c8>
Trace; c0020278 <do_alignment+0/2c8>
Trace; c001f120 <do_DataAbort+3c/a0>
Trace; c001f0e4 <do_DataAbort+0/a0>
Trace; c001827c <__dabt_svc+3c/60>

>>r7; c01633c8 <scb9328_map+0/30>

Trace; c015ff78 <xip_udelay+0/950>
Trace; c0161bf8 <do_write_buffer+cac/10f8>
Trace; c0160f4c <do_write_buffer+0/10f8>
Trace; c00dceb0 <cfi_intelext_write_buffers+148/1a4>
Trace; c00dcd68 <cfi_intelext_write_buffers+0/1a4>
Trace; c00d7d48 <part_write+bc/f8>
Trace; c00d7c8c <part_write+0/f8>
Trace; c009c044 <jffs2_mark_node_obsolete+580/76c>
Trace; c009bac4 <jffs2_mark_node_obsolete+0/76c>
Trace; c00a2a5c <jffs2_build_remove_unlinked_inode+30/ec>
Trace; c00a2a2c <jffs2_build_remove_unlinked_inode+0/ec>
Trace; c00a27e8 <jffs2_build_filesystem+1e0/424>
Trace; c00a2608 <jffs2_build_filesystem+0/424>
Trace; c00a2df4 <jffs2_do_mount_fs+25c/2bc>
Trace; c00a2b98 <jffs2_do_mount_fs+0/2bc>
Trace; c00a4b90 <jffs2_do_fill_super+13c/25c>
Trace; c00a4a54 <jffs2_do_fill_super+0/25c>
Trace; c00a51e4 <jffs2_get_sb_mtd+98/f8>
Trace; c00a514c <jffs2_get_sb_mtd+0/f8>
Trace; c00a5430 <jffs2_get_sb+194/1d0>

>>r8; c015beb8 <jffs2_fs_type+0/20>

Trace; c00a529c <jffs2_get_sb+0/1d0>
Trace; c0068ed4 <do_kern_mount+5c/f4>
Trace; c0068e78 <do_kern_mount+0/f4>
Trace; c007e600 <do_new_mount+84/b8>
Trace; c007e57c <do_new_mount+0/b8>
Trace; c007eca0 <do_mount+150/16c>
Trace; c007eb50 <do_mount+0/16c>
Trace; c007f0c0 <sys_mount+a4/e8>
Trace; c007f01c <sys_mount+0/e8>
Trace; c0008f68 <do_mount_root+30/bc>

>>r8; c01732b0 <names_cachep+0/4>
>>r7; c0138cb8 <__func__.1+33c/ed04>

Trace; c0008f38 <do_mount_root+0/bc>
Trace; c000904c <mount_block_root+58/124>
Trace; c0008ff4 <mount_block_root+0/124>
Trace; c0009210 <prepare_namespace+8c/d0>

>>r5; c00169c8 <root_device_name+0/4>
>>r4; c0016a18 <root_delay+0/4>

Trace; c0009184 <prepare_namespace+0/d0>
Trace; c00180c4 <init+50/10c>

>>r4; c0138b70 <__func__.1+1f4/ed04>

Trace; c0018074 <init+0/10c>
Trace; c002f820 <do_exit+0/328>

Code;  c001fdc8 <do_alignment_ldrstr+44/108>
00000000 <_EIP>:
Code;  c001fdc8 <do_alignment_ldrstr+44/108>
   0:   01 16                     add    %edx,(%esi)
Code;  c001fdca <do_alignment_ldrstr+46/108>
   2:   1e                        push   %ds
Code;  c001fdcb <do_alignment_ldrstr+47/108>
   3:   e2 08                     loop   d <_EIP+0xd>
Code;  c001fdcd <do_alignment_ldrstr+49/108>
   5:   00 00                     add    %al,(%eax)
Code;  c001fdcf <do_alignment_ldrstr+4b/108>
   7:   0a 00                     or     (%eax),%al
Code;  c001fdd1 <do_alignment_ldrstr+4d/108>
   9:   20 a0 e1 00 30 a0         and    %ah,0xa03000e1(%eax)
Code;  c001fdd7 <do_alignment_ldrstr+53/108>   <=====
   f:   e3 01                     jecxz  12 <_EIP+0x12>   <=====
Code;  c001fdd9 <do_alignment_ldrstr+55/108>
  11:   10 d2                     adc    %dl,%dl
Code;  c001fddb <do_alignment_ldrstr+57/108>
  13:   e4 00                     in     $0x0,%al


If xip_udelay is to blame I suspect my xip.h is broken, 
otherwise I have no clue.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
