Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1PNM-0003IQ-06
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 08:37:57 -0500
Date: Wed, 16 Feb 2005 14:37:54 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050216133753.GD16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050216124409.GC16239@synertronixx3>
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-16 13:44 +0100 schrieb Konstantin Kletschke:
> Am 2005-02-16 13:24 +0100 schrieb Thomas Gleixner:
> 
> > Can you verify, that this happens with MTD CVS code too ?
> 
> I linked drivers/mtd and fs/jffs2 into 2.6.10:
> 
>   LD      fs/built-in.o
>   drivers/mtd/Makefile:11: /Makefile.inc: No such file or directory

Stupid me, patchin.sh :)

elevator: using cfq as default io scheduler
Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
 Intel/Sharp Extended Query Table at 0x0031             
Using buffer write method                  
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
mtd: Giving out device 0 to U-boot
0x00020000-0x00040000 : "U-boot_env"
mtd: Giving out device 1 to U-boot_env
0x00040000-0x00140000 : "kernel"      
mtd: Giving out device 2 to kernel
0x00140000-0x00540000 : "root"    
mtd: Giving out device 3 to root
0x00540000-0x00940000 : "fs"    
mtd: Giving out device 4 to fs
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
NET: Registered protocol family 1                       
NET: Registered protocol family 17
EEEEEK. jffs2_mark_node_obsolete called with NULL node
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000                                                              
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in:          
CPU: 0            
pc : [<c00bfed0>]    lr : [<00000001>]    Not tainted
sp : c0219d24  ip : 60000093  fp : c0219d44          
r10: c031c8ac  r9 : c031c8c4  r8 : 00000000
r7 : c031c800  r6 : c0219d48  r5 : c033067c  r4 : 00000000
r3 : c01b1ed4  r2 : 00000000  r1 : 00000b1f  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 08004000  DAC: 0000001D         
Process swapper (pid: 1, stack limit = 0xc0218190)
Stack: (0xc0219d24 to 0xc021a000)                 
9d20:          c033067c 00000000 c031c800 c0219d4c 00000000 c0219d70 c0219d48 
9d40: c00bfcf8 c00bfeb0 00000000 00000021 c031c894 c031c89c c031c8a4 c031c8b4 
9d60: c031c8bc c0219db8 c0219d74 c00c0234 c00bfb24 c031c8f8 c031c800 c031c8dc 
9d80: c031c8d4 c031c8cc c031c8ec c00d3c90 00020000 c031c800 00000000 c031c600 
9da0: c02f7400 00000000 00000000 c0219ddc c0219dbc c00c1f0c c00c001c c031c600 
9dc0: c031c800 00008000 00000000 c02f7400 c0219e00 c0219de0 c00c2548 c00c1dec 
9de0: ffffffea 00000003 c032a000 00008000 c01b97bc c0219e70 c0219e04 c00c2794 
9e00: c00c24c0 c02f7400 c007e1a8 c020ca1c c0209600 c0219ed0 c0219ed0 c0219e68 
9e20: 00000001 00000001 00000000 0000000a c02092a0 c02fa200 c032a000 00008000 
9e40: 00000000 c0219e70 c0219e54 c02092a0 fffffff4 c01b97bc c032a000 00008000 
9e60: 00000000 c0219e98 c0219e74 c006d730 c00c2610 ffffffff c032a000 00000000 
9e80: 00008000 c0219ed0 00000000 c0219ec0 c0219e9c c0082414 c006d6e4 00008000 
9ea0: 00000000 c0329000 00000000 c032a000 c0219ed0 c0219f38 c0219ec4 c0082ab4 
9ec0: c00823a0 c032a000 00000000 c0328000 c020c554 c0209600 c0219ee4 00000000 
9ee0: c0187708 00000001 00000001 00000000 00000000 00000000 c0219f14 c0219f08 
9f00: c004f5b4 00001000 c0219f38 c0219f18 00000000 00000000 c0187708 c0329000 
9f20: 00008000 00000000 00000000 c0219f6c c0219f3c c0082ed4 c0082974 00000000 
9f40: 00000000 c032a000 c0328000 c0224000 c0224000 00008000 c0187708 c01cda20 
9f60: c0219f84 c0219f70 c0008f20 c0082e40 00000000 c0224000 c0219fc8 c0219f88 
9f80: c0009004 c0008f00 c0046318 01f00003 c0187708 00000000 00000000 00000000 
9fa0: 00000000 c0219fc8 c0016720 00000000 00000000 00000000 00000000 c0219fe0 
9fc0: c0219fcc c000919c c0008fbc 00000000 c0187520 c0219ff4 c0219fe4 c0018250 
9fe0: c000914c 00000000 00000000 c0219ff8 c003475c c0018210 e3530000 091baff0 
Backtrace:                                                                    
Function entered at [<c00bfea0>] from [<c00bfcf8>]
 r8 = 00000000  r7 = C0219D4C  r6 = C031C800  r5 = 00000000
 r4 = C033067C                                             
Function entered at [<c00bfb14>] from [<c00c0234>]
 r8 = C031C8BC  r7 = C031C8B4  r6 = C031C8A4  r5 = C031C89C
 r4 = C031C894                                             
Function entered at [<c00c000c>] from [<c00c1f0c>]
Function entered at [<c00c1ddc>] from [<c00c2548>]
 r8 = C02F7400  r7 = 00000000  r6 = 00008000  r5 = C031C800
 r4 = C031C600                                             
Function entered at [<c00c24b0>] from [<c00c2794>]
 r8 = C01B97BC  r7 = 00008000  r6 = C032A000  r5 = 00000003
 r4 = FFFFFFEA                                             
Function entered at [<c00c2600>] from [<c006d730>]
Function entered at [<c006d6d4>] from [<c0082414>]
Function entered at [<c0082390>] from [<c0082ab4>]
Function entered at [<c0082964>] from [<c0082ed4>]
Function entered at [<c0082e30>] from [<c0008f20>]
 r8 = C01CDA20  r7 = C0187708  r6 = 00008000  r5 = C0224000
 r4 = C0224000                                             
Function entered at [<c0008ef0>] from [<c0009004>]
 r4 = C0224000                                    
Function entered at [<c0008fac>] from [<c000919c>]
 r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
 r4 = C0016720                                             
Function entered at [<c000913c>] from [<c0018250>]
 r4 = C0187520                                    
Function entered at [<c0018200>] from [<c003475c>]
 r4 = 00000000                                    
Code: 0a000005 e1a01004 e1a00007 ebffe497 (e5944000) 
 <0>Kernel panic - not syncing: Attempted to kill init!

>>EIP; c00bfed0 <jffs2_build_remove_unlinked_inode+30/ec>   <=====

>>r3; c01b1ed4 <log_wait+0/8>

Trace; c00bfea0 <jffs2_build_remove_unlinked_inode+0/ec>
Trace; c00bfcf8 <jffs2_build_filesystem+1e4/38c>
Trace; c00bfb14 <jffs2_build_filesystem+0/38c>
Trace; c00c0234 <jffs2_do_mount_fs+228/270>
Trace; c00c000c <jffs2_do_mount_fs+0/270>
Trace; c00c1f0c <jffs2_do_fill_super+130/238>
Trace; c00c1ddc <jffs2_do_fill_super+0/238>
Trace; c00c2548 <jffs2_get_sb_mtd+98/f8>
Trace; c00c24b0 <jffs2_get_sb_mtd+0/f8>
Trace; c00c2794 <jffs2_get_sb+194/1d0>

>>r8; c01b97bc <jffs2_fs_type+0/20>

Trace; c00c2600 <jffs2_get_sb+0/1d0>
Trace; c006d730 <do_kern_mount+5c/f4>
Trace; c006d6d4 <do_kern_mount+0/f4>
Trace; c0082414 <do_new_mount+84/b8>
Trace; c0082390 <do_new_mount+0/b8>
Trace; c0082ab4 <do_mount+150/16c>
Trace; c0082964 <do_mount+0/16c>
Trace; c0082ed4 <sys_mount+a4/e8>
Trace; c0082e30 <sys_mount+0/e8>
Trace; c0008f20 <do_mount_root+30/bc>

>>r8; c01cda20 <names_cachep+0/4>
>>r7; c0187708 <__func__.4+450/18c48>

Trace; c0008ef0 <do_mount_root+0/bc>
Trace; c0009004 <mount_block_root+58/124>
Trace; c0008fac <mount_block_root+0/124>
Trace; c000919c <prepare_namespace+60/a0>

>>r4; c0016720 <root_device_name+0/4>

Trace; c000913c <prepare_namespace+0/a0>
Trace; c0018250 <init+50/f0>

>>r4; c0187520 <__func__.4+268/18c48>

Trace; c0018200 <init+0/f0>
Trace; c003475c <do_exit+0/3d8>

Code;  c00bfec0 <jffs2_build_remove_unlinked_inode+20/ec>
00000000 <_EIP>:
Code;  c00bfec0 <jffs2_build_remove_unlinked_inode+20/ec>
   0:   05 00 00 0a 04            add    $0x40a0000,%eax
Code;  c00bfec5 <jffs2_build_remove_unlinked_inode+25/ec>
   5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
Code;  c00bfecb <jffs2_build_remove_unlinked_inode+2b/ec>
   b:   e1 97                     loope  ffffffa4 <_EIP+0xffffffa4>
Code;  c00bfecd <jffs2_build_remove_unlinked_inode+2d/ec>
   d:   e4 ff                     in     $0xff,%al
Code;  c00bfecf <jffs2_build_remove_unlinked_inode+2f/ec>   <=====
   f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
Code;  c00bfed1 <jffs2_build_remove_unlinked_inode+31/ec>
  11:   40                        inc    %eax
Code;  c00bfed2 <jffs2_build_remove_unlinked_inode+32/ec>
  12:   94                        xchg   %eax,%esp
Code;  c00bfed3 <jffs2_build_remove_unlinked_inode+33/ec>
  13:   e5 00                     in     $0x0,%eax

 <0>Kernel panic - not syncing: Attempted to kill init!

K

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
