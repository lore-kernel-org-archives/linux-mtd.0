Date: Wed, 16 Feb 2005 11:51:42 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050216114741.GA16239@synertronixx3>
Message-ID: <Pine.LNX.4.58.0502161151020.30538@phoenix.infradead.org>
References: <20050216114741.GA16239@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: mtd liste <linux-mtd@lists.infradead.org>
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Err, can't get it, did you MTD CVS head?

On Wed, 16 Feb 2005, Konstantin Kletschke wrote:
> This way 2.6.10 Oopses on a virgin jffs2. Second boot is fine.
> cat /dev/mtdblock3 > /dev/null
> lasts three times longer than with 2.6.10-rc2.
> 
> Please advise me to fix these two problems :/
> 
> No modules in ksyms, skipping objects
> No ksyms, skipping lsmod
> EEEEEK. jffs2_mark_node_obsolete called with NULL node
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> Internal error: Oops: 5 [#1]
> CPU: 0            
> pc : [<c00bfee0>]    lr : [<00000001>]    Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
> sp : c0219d24  ip : 60000093  fp : c0219d44          
> r10: c030c8ac  r9 : c030c8c4  r8 : 00000000
> r7 : c030c800  r6 : c0219d48  r5 : c0320fac  r4 : 00000000
> r3 : c01b1ed4  r2 : 00000000  r1 : 00000ba6  r0 : 0000003a
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
> Control: C000717F  Table: 08004000  DAC: 0000001D         
> Stack: (0xc0219d24 to 0xc021a000)                 
> 9d20:          c0320fac 00000000 c030c800 c0219d4c 00000000 c0219d70 c0219d48 
> 9d40: c00bfd08 c00bfec0 00000000 0000000c c030c894 c030c89c c030c8a4 c030c8b4 
> 9d60: c030c8bc c0219db8 c0219d74 c00c0244 c00bfb34 c030c8f8 c030c800 c030c8dc 
> 9d80: c030c8d4 c030c8cc c030c8ec c00d3c90 00020000 c030c800 00000000 c030c600 
> 9da0: c02f7400 00000000 00000000 c0219ddc c0219dbc c00c1f1c c00c002c c030c600 
> 9dc0: c030c800 00008000 00000000 c02f7400 c0219e00 c0219de0 c00c2558 c00c1dfc 
> 9de0: ffffffea 00000003 c031a000 00008000 c01b97bc c0219e70 c0219e04 c00c27a4 
> 9e00: c00c24d0 c02f7400 c007e1b8 c0289a1c c0209600 c0219ed0 c0219ed0 c0219e68 
> 9e20: 00000001 00000001 00000000 0000000a c02092a0 c02fa240 c031a000 00008000 
> 9e40: 00000000 c0219e70 c0219e54 c02092a0 fffffff4 c01b97bc c031a000 00008000 
> 9e60: 00000000 c0219e98 c0219e74 c006d740 c00c2620 ffffffff c031a000 00000000 
> 9e80: 00008000 c0219ed0 00000000 c0219ec0 c0219e9c c0082424 c006d6f4 00008000 
> 9ea0: 00000000 c0319000 00000000 c031a000 c0219ed0 c0219f38 c0219ec4 c0082ac4 
> 9ec0: c00823b0 c031a000 00000000 c0318000 c020c554 c0209600 c0219ee4 00000000 
> 9ee0: c0187478 00000001 00000001 00000000 00000000 00000000 c0219f14 c0219f08 
> 9f00: c004f5c4 00001000 c0219f38 c0219f18 00000000 00000000 c0187478 c0319000 
> 9f20: 00008000 00000000 00000000 c0219f6c c0219f3c c0082ee4 c0082984 00000000 
> 9f40: 00000000 c031a000 c0318000 c0224000 c0224000 00008000 c0187478 c01cda20 
> 9f60: c0219f84 c0219f70 c0008f20 c0082e50 00000000 c0224000 c0219fc8 c0219f88 
> 9f80: c0009004 c0008f00 c0046328 01f00003 c0187478 00000000 00000000 00000000 
> 9fa0: 00000000 c0219fc8 c00166a0 00000000 00000000 00000000 00000000 c0219fe0 
> 9fc0: c0219fcc c000919c c0008fbc 00000000 c018728c c0219ff4 c0219fe4 c0018250 
> 9fe0: c000914c 00000000 00000000 c0219ff8 c003476c c0018210 c01d1170 c01bd7b4 
> Backtrace:                                                                    
> Function entered at [<c00bfeb0>] from [<c00bfd08>]
>  r8 = 00000000  r7 = C0219D4C  r6 = C030C800  r5 = 00000000
>  r4 = C0320FAC                                             
> Function entered at [<c00bfb24>] from [<c00c0244>]
>  r8 = C030C8BC  r7 = C030C8B4  r6 = C030C8A4  r5 = C030C89C
>  r4 = C030C894                                             
> Function entered at [<c00c001c>] from [<c00c1f1c>]
> Function entered at [<c00c1dec>] from [<c00c2558>]
>  r8 = C02F7400  r7 = 00000000  r6 = 00008000  r5 = C030C800
>  r4 = C030C600                                             
> Function entered at [<c00c24c0>] from [<c00c27a4>]
>  r8 = C01B97BC  r7 = 00008000  r6 = C031A000  r5 = 00000003
>  r4 = FFFFFFEA                                             
> Function entered at [<c00c2610>] from [<c006d740>]
> Function entered at [<c006d6e4>] from [<c0082424>]
> Function entered at [<c00823a0>] from [<c0082ac4>]
> Function entered at [<c0082974>] from [<c0082ee4>]
> Function entered at [<c0082e40>] from [<c0008f20>]
>  r8 = C01CDA20  r7 = C0187478  r6 = 00008000  r5 = C0224000
>  r4 = C0224000                                             
> Function entered at [<c0008ef0>] from [<c0009004>]
>  r4 = C0224000                                    
> Function entered at [<c0008fac>] from [<c000919c>]
>  r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
>  r4 = C00166A0                                             
> Function entered at [<c000913c>] from [<c0018250>]
>  r4 = C018728C                                    
> Function entered at [<c0018200>] from [<c003476c>]
>  r4 = 00000000                                    
> Code: 0a000005 e1a01004 e1a00007 ebffe497 (e5944000) 
> 
> 
> >>EIP; c00bfee0 <jffs2_build_remove_unlinked_inode+30/ec>   <=====
> 
> >>r3; c01b1ed4 <log_wait+0/8>
> 
> Trace; c00bfeb0 <jffs2_build_remove_unlinked_inode+0/ec>
> Trace; c00bfd08 <jffs2_build_filesystem+1e4/38c>
> Trace; c00bfb24 <jffs2_build_filesystem+0/38c>
> Trace; c00c0244 <jffs2_do_mount_fs+228/270>
> Trace; c00c001c <jffs2_do_mount_fs+0/270>
> Trace; c00c1f1c <jffs2_do_fill_super+130/238>
> Trace; c00c1dec <jffs2_do_fill_super+0/238>
> Trace; c00c2558 <jffs2_get_sb_mtd+98/f8>
> Trace; c00c24c0 <jffs2_get_sb_mtd+0/f8>
> Trace; c00c27a4 <jffs2_get_sb+194/1d0>
> 
> >>r8; c01b97bc <jffs2_fs_type+0/20>
> 
> Trace; c00c2610 <jffs2_get_sb+0/1d0>
> Trace; c006d740 <do_kern_mount+5c/f4>
> Trace; c006d6e4 <do_kern_mount+0/f4>
> Trace; c0082424 <do_new_mount+84/b8>
> Trace; c00823a0 <do_new_mount+0/b8>
> Trace; c0082ac4 <do_mount+150/16c>
> Trace; c0082974 <do_mount+0/16c>
> Trace; c0082ee4 <sys_mount+a4/e8>
> Trace; c0082e40 <sys_mount+0/e8>
> Trace; c0008f20 <do_mount_root+30/bc>
> 
> >>r8; c01cda20 <names_cachep+0/4>
> >>r7; c0187478 <__func__.4+454/18bec>
> 
> Trace; c0008ef0 <do_mount_root+0/bc>
> Trace; c0009004 <mount_block_root+58/124>
> Trace; c0008fac <mount_block_root+0/124>
> Trace; c000919c <prepare_namespace+60/a0>
> 
> >>r4; c00166a0 <root_device_name+0/4>
> 
> Trace; c000913c <prepare_namespace+0/a0>
> Trace; c0018250 <init+50/f0>
> 
> >>r4; c018728c <__func__.4+268/18bec>
> 
> Trace; c0018200 <init+0/f0>
> Trace; c003476c <do_exit+0/3d8>
> 
> Code;  c00bfed0 <jffs2_build_remove_unlinked_inode+20/ec>
> 00000000 <_EIP>:
> Code;  c00bfed0 <jffs2_build_remove_unlinked_inode+20/ec>
>    0:   05 00 00 0a 04            add    $0x40a0000,%eax
> Code;  c00bfed5 <jffs2_build_remove_unlinked_inode+25/ec>
>    5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
> Code;  c00bfedb <jffs2_build_remove_unlinked_inode+2b/ec>
>    b:   e1 97                     loope  ffffffa4 <_EIP+0xffffffa4>
> Code;  c00bfedd <jffs2_build_remove_unlinked_inode+2d/ec>
>    d:   e4 ff                     in     $0xff,%al
> Code;  c00bfedf <jffs2_build_remove_unlinked_inode+2f/ec>   <=====
>    f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
> Code;  c00bfee1 <jffs2_build_remove_unlinked_inode+31/ec>
>   11:   40                        inc    %eax
> Code;  c00bfee2 <jffs2_build_remove_unlinked_inode+32/ec>
>   12:   94                        xchg   %eax,%esp
> Code;  c00bfee3 <jffs2_build_remove_unlinked_inode+33/ec>
>   13:   e5 00                     in     $0x0,%eax
> 
>  <0>Kernel panic - not syncing: Attempted to kill init!
> 
> 1 error issued.  Results may not be reliable.
> 
> 
> Kind regrads, desperated Konsti
> 
> -- 
> GPG KeyID EF62FCEF
> Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
