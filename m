Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1S3f-0004Vz-K0
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 11:29:49 -0500
Date: Wed, 16 Feb 2005 17:29:45 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050216162944.GE16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
	<20050216133753.GD16239@synertronixx3> <42135E98.E187DD1A@st.com>
	<Pine.LNX.4.58.0502161528260.30538@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0502161528260.30538@phoenix.infradead.org>
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-16 15:28 +0000 schrieb Artem B. Bityuckiy:

> I think Estelle is correct.
> I would offer the following fix:

EEEEEK. jffs2_mark_node_obsolete called with NULL node

Internal error: Oops: 5 [#1]
CPU: 0            
pc : [<c00c319c>]    lr : [<00000001>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c020fd24  ip : 60000093  fp : c020fd44          
r10: c03248ac  r9 : c03248c4  r8 : 00000000
r7 : c0324800  r6 : c020fd48  r5 : c033867c  r4 : 00000000
r3 : c01b7ed4  r2 : 00000000  r1 : 00000b89  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 08004000  DAC: 0000001D         
Stack: (0xc020fd24 to 0xc0210000)                 
fd20:          c033867c 00000000 c0324800 c020fd4c 00000000 c020fd70 c020fd48 
fd40: c00c2fc4 c00c317c 00000000 00000021 c0324894 c032489c c03248a4 c03248b4 
fd60: c03248bc c020fdb8 c020fd74 c00c3500 c00c2df0 c03248f8 c0324800 c03248dc 
fd80: c03248d4 c03248cc c03248ec c00d6f50 00020000 c0324800 00000000 c0324600 
fda0: c02fe400 00000000 00000000 c020fddc c020fdbc c00c51d8 c00c32e8 c0324600 
fdc0: c0324800 00008000 00000000 c02fe400 c020fe00 c020fde0 c00c5814 c00c50b8 
fde0: ffffffea 00000003 c0332000 00008000 c01bf85c c020fe70 c020fe04 c00c5a60 
fe00: c00c578c c02fe400 c00811a8 c0298bb4 c0210600 c020fed0 c020fed0 c020fe68 
fe20: 00000001 00000001 00000000 0000000a c02102a0 c02fff00 c0332000 00008000 
fe40: 00000000 c020fe70 c020fe54 c02102a0 fffffff4 c01bf85c c0332000 00008000 
fe60: 00000000 c020fe98 c020fe74 c0070730 c00c58dc ffffffff c0332000 00000000 
fe80: 00008000 c020fed0 00000000 c020fec0 c020fe9c c0085414 c00706e4 00008000 
fea0: 00000000 c0331000 00000000 c0332000 c020fed0 c020ff38 c020fec4 c0085ab4 
fec0: c00853a0 c0332000 00000000 c0330000 c0213554 c0210600 c020fee4 00000000 
fee0: c018c454 00000001 00000001 00000000 00000000 00000000 c020ff14 c020ff08 
ff00: c00525b4 00001000 c020ff38 c020ff18 00000000 00000000 c018c454 c0331000 
ff20: 00008000 00000000 00000000 c020ff6c c020ff3c c0085ed4 c0085974 00000000 
ff40: 00000000 c0332000 c0330000 c0225000 c0225000 00008000 c018c454 c01d3be0 
ff60: c020ff84 c020ff70 c0008f20 c0085e40 00000000 c0225000 c020ffc8 c020ff88 
ff80: c0009004 c0008f00 c0049318 6264746d 01f00003 00000000 00000000 00000000 
ffa0: 00000000 00000000 c0018d20 00000000 00000000 00000000 00000000 c020ffe0 
ffc0: c020ffcc c0009258 c0008fbc 00000000 c018c26c c020fff4 c020ffe4 c001b250 
ffe0: c0009208 00000000 00000000 c020fff8 c003775c c001b210 e91ba830 e51b2024 
Backtrace:                                                                    
Function entered at [<c00c316c>] from [<c00c2fc4>]
 r8 = 00000000  r7 = C020FD4C  r6 = C0324800  r5 = 00000000
 r4 = C033867C                                             
Function entered at [<c00c2de0>] from [<c00c3500>]
 r8 = C03248BC  r7 = C03248B4  r6 = C03248A4  r5 = C032489C
 r4 = C0324894                                             
Function entered at [<c00c32d8>] from [<c00c51d8>]
Function entered at [<c00c50a8>] from [<c00c5814>]
 r8 = C02FE400  r7 = 00000000  r6 = 00008000  r5 = C0324800
 r4 = C0324600                                             
Function entered at [<c00c577c>] from [<c00c5a60>]
 r8 = C01BF85C  r7 = 00008000  r6 = C0332000  r5 = 00000003
 r4 = FFFFFFEA                                             
Function entered at [<c00c58cc>] from [<c0070730>]
Function entered at [<c00706d4>] from [<c0085414>]
Function entered at [<c0085390>] from [<c0085ab4>]
Function entered at [<c0085964>] from [<c0085ed4>]
Function entered at [<c0085e30>] from [<c0008f20>]
 r8 = C01D3BE0  r7 = C018C454  r6 = 00008000  r5 = C0225000
 r4 = C0225000                                             
Function entered at [<c0008ef0>] from [<c0009004>]
 r4 = C0225000                                    
Function entered at [<c0008fac>] from [<c0009258>]
 r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
 r4 = C0018D20                                             
Function entered at [<c00091f8>] from [<c001b250>]
 r4 = C018C26C                                    
Function entered at [<c001b200>] from [<c003775c>]
 r4 = 00000000                                    
Code: 0a000005 e1a01004 e1a00007 ebffe497 (e5944000) 


>>EIP; c00c319c <zlib_inflate_blocks+168/a6c>   <=====

>>sp; c020fd24 <__log_buf+3f5c/4000>
>>fp; c020fd44 <__log_buf+3f7c/4000>
>>r6; c020fd48 <__log_buf+3f80/4000>
>>r3; c01b7ed4 <ip_mc_source+290/3c0>

Trace; c00c316c <zlib_inflate_blocks+138/a6c>
Trace; c00c2fc4 <zlib_inflate_blocks_reset+5c/78>

>>r7; c020fd4c <__log_buf+3f84/4000>

Trace; c00c2de0 <iowrite16_rep+30/54>
Trace; c00c3500 <zlib_inflate_blocks+4cc/a6c>
Trace; c00c32d8 <zlib_inflate_blocks+2a4/a6c>
Trace; c00c51d8 <huft_build+ec/5b4>
Trace; c00c50a8 <zlib_inflate_addhistory+104/118>
Trace; c00c5814 <zlib_inflate_trees_dynamic+dc/180>
Trace; c00c577c <zlib_inflate_trees_dynamic+44/180>
Trace; c00c5a60 <zlib_inflate_trees_fixed+1a8/1e8>

>>r8; c01bf85c <sleep_on_timeout+a4/a8>

Trace; c00c58cc <zlib_inflate_trees_fixed+14/1e8>
Trace; c0070730 <sync_filesystems+6c/134>
Trace; c00706d4 <sync_filesystems+10/134>
Trace; c0085414 <do_umount+b8/154>
Trace; c0085390 <do_umount+34/154>
Trace; c0085ab4 <do_move_mount+24/250>
Trace; c0085964 <do_loopback+108/16c>
Trace; c0085ed4 <do_add_mount+13c/14c>
Trace; c0085e30 <do_add_mount+98/14c>
Trace; c0008f20 <do_mount_root+3c/bc>

>>r8; c01d3be0 <__func__.1+10098/1ee58>
>>r7; c018c454 <ip_route_output_slow+448/808>

Trace; c0008ef0 <do_mount_root+c/bc>
Trace; c0009004 <mount_block_root+64/124>
Trace; c0008fac <mount_block_root+c/124>
Trace; c0009258 <find_link+38/bc>

>>r4; c0018d20 <default_command_line+44/400>

Trace; c00091f8 <malloc+4/18>
Trace; c001b250 <check_irq_lock+58/94>

>>r4; c018c26c <ip_route_output_slow+260/808>

Trace; c001b200 <check_irq_lock+8/94>
Trace; c003775c <sys_exit_group+c/1c>

Code;  c00c318c <zlib_inflate_blocks+158/a6c>
00000000 <_EIP>:
Code;  c00c318c <zlib_inflate_blocks+158/a6c>
   0:   05 00 00 0a 04            add    $0x40a0000,%eax
Code;  c00c3191 <zlib_inflate_blocks+15d/a6c>
   5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
Code;  c00c3197 <zlib_inflate_blocks+163/a6c>
   b:   e1 97                     loope  ffffffa4 <_EIP+0xffffffa4>
Code;  c00c3199 <zlib_inflate_blocks+165/a6c>
   d:   e4 ff                     in     $0xff,%al
Code;  c00c319b <zlib_inflate_blocks+167/a6c>   <=====
   f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
Code;  c00c319d <zlib_inflate_blocks+169/a6c>
  11:   40                        inc    %eax
Code;  c00c319e <zlib_inflate_blocks+16a/a6c>
  12:   94                        xchg   %eax,%esp
Code;  c00c319f <zlib_inflate_blocks+16b/a6c>
  13:   e5 00                     in     $0x0,%eax

 <0>Kernel panic - not syncing: Attempted to kill init!

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
