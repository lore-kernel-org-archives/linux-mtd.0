Date: Tue, 16 Nov 2004 13:00:15 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041116124403.GC15759@synertronixx3>
Message-ID: <Pine.LNX.4.58.0411161258350.25950@phoenix.infradead.org>
References: <20041116124403.GC15759@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc1-mm5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

is it possible to somehow describe how to reproduce this? How to create 
such JFFS2 image?


On Tue, 16 Nov 2004, Konstantin Kletschke wrote:

> Hi there!
> 
> I am porting my i.MX processor stuff from 2.6.9 to 2.6.10-rc1-mm5
> because I need the XIP stuff in there.
> All is working well, but when 2.6.10-rc1-mm5 should mount its newly
> flashed jffs2 filesystem it Oopses the way you see in the attachement.
> 
> Weird thing is, when I boot my 2.6.9 kernel for testing purposes it
> mounts the / fine and after that the 2.6.10-rc1-mm5 likes the filesystem
> also and mounts it.
> 
> I created the jffs2 filestem that way:
> 
> mkfs.jffs2 -q --eraseblock=128KiB -o
> /home/konsti/svn/ptxdist-0.5.2-trunk/root_scb9328 -D
> /home/konsti/svn/ptxdist-0.5.2-trunk/src/device_table.txt
> --root=/home/konsti/svn/ptxdist-0.5.2-trunk/root
> 
> with mkfs.jffs2: revision 1.42
> 
> This is, when 2.6.10-rc1-mm5 investigates the system after 2.6.9 has
> "initialized" the /:
> 
> Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
> scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
>  Intel/Sharp Extended Query Table at 0x0031             
>  Using buffer write method                  
>  cfi_cmdset_0001: Erase suspend on write enabled
>  4 cmdlinepart partitions found on MTD device scb9328_flash
>  Creating 4 MTD partitions on "scb9328_flash":             
>  0x00000000-0x00020000 : "U-boot"             
>  0x00020000-0x00040000 : "U-boot_env"
>  0x00040000-0x00140000 : "kernel"    
>  0x00140000-0x01000000 : "root"  
>  NET: Registered protocol family 2
>  IP: routing cache hash table of 512 buckets, 4Kbytes
>  TCP: Hash tables configured (established 1024 bind 2048)
>  VFS: Mounted root (jffs2 filesystem).                   
>  Freeing init memory: 56K             
>  init started:  BusyBox v1.00-pre10 (2004.11.15-11:11+0000) multi-call
>  binary
>  starting the system ...
>  mounted sys, proc, tmp & pts
> 
>  synertronixx GmbH, http://www.synertronixx.de
> 
>  To set time and date do 'rdate -s ptbtime1.ptb.de'
>  after 'ifup eth0'
> 
>  scb9328 login: root
>  Password: 
>  Jan  1 02:00:09 login[99]: root login  on `ttySMX0'
> 
> 
> 
>  BusyBox v1.00-pre10 (2004.11.15-11:11+0000) Built-in shell (ash)
>  Enter 'help' for a list of built-in commands.
> 
>  root@scb9328 ~ # uname -a
>  Linux scb9328 2.6.10-rc1-mm5-imx1 #78 Tue Nov 16 12:41:37 CET 2004
>  armv4tl unknown
> 
> Well, if someone might know, where an error is (may be me?), please tell
> me :)
> 
> Regards, Konstantin Kletschke
> 
> ksymoops 2.4.9 on i686 2.6.10-rc1-mm5.  Options used
>      -V (default)
>      -k /proc/ksyms (default)
>      -l /proc/modules (default)
>      -o /lib/modules/2.6.10-rc1-mm5/ (default)
>      -m ./System.map (specified)
> 
> Error (regular_file): read_ksyms stat /proc/ksyms failed
> No modules in ksyms, skipping objects
> No ksyms, skipping lsmod
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> Internal error: Oops: 5 [#1]
> CPU: 0            
> pc : [<c00b8e98>]    lr : [<00000001>]    Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
> sp : c01e1d24  ip : 60000093  fp : c01e1d44          
> r10: c029eeac  r9 : c029eec4  r8 : 00000000
> r7 : c029ee00  r6 : c01e1d48  r5 : c02a3b2c  r4 : 00000000
> r3 : c017fe5c  r2 : 00000000  r1 : c01e0000  r0 : 0000003a
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
> Control: C000717F  Table: 08004000  DAC: 0000001D         
> Stack: (0xc01e1d24 to 0xc01e2000)                 
> 1d20:          c02a3b2c c01e1d4c c029ee00 c01e1d4c 00000000 c01e1d70 c01e1d48 
> 1d40: c00b8ce0 c00b8e78 00000000 00000068 c029ee94 c029ee9c c029eea4 c029eeb4 
> 1d60: c029eebc c01e1db8 c01e1d74 c00b91fc c00b8b1c c029eef8 c029ee00 c029eedc 
> 1d80: c029eed4 c029eecc c029eeec 00000000 00020000 c029ee00 00000000 c029ec00 
> 1da0: c0289a00 00000000 00000000 c01e1ddc c01e1dbc c00bb268 c00b8fe4 c029ec00 
> 1dc0: c029ee00 00008000 00000000 c0289a00 c01e1e00 c01e1de0 c00bb8a0 c00bb148 
> 1de0: ffffffea 00000003 c029d000 00008000 c0183fe0 c01e1e70 c01e1e04 c00bbaec 
> 1e00: c00bb818 c0289a00 c00c7a5c c021dcc4 c01d2600 00000000 c01e1ed0 c01e1e68 
> 1e20: 00000001 00000001 00000000 0000000a c01d22a0 c028f700 c029d000 00008000 
> 1e40: 00000000 c01e1e70 c01e1e54 c01d22a0 fffffff4 c0183fe0 c029d000 00008000 
> 1e60: 00000000 c01e1e98 c01e1e74 c007b9cc c00bb968 ffffffff c029d000 00000000 
> 1e80: 00008000 c01e1ed0 00000000 c01e1ec0 c01e1e9c c00931dc c007b980 00008000 
> 1ea0: 00000000 c029c000 00000000 c029d000 c01e1ed0 c01e1f38 c01e1ec4 c0093960 
> 1ec0: c0093168 c029d000 00000000 c0297000 c01d5554 c01d2600 c005a700 00000000 
> 1ee0: c015f3f8 00000001 00000001 00000000 00000000 00000000 c01e1f14 c01e1f08 
> 1f00: c005631c 00001000 c01e1f38 c01e1f18 00000000 00000000 c015f3f8 c029c000 
> 1f20: 00008000 00000000 00000000 c01e1f6c c01e1f3c c0093dac c0093820 00000000 
> 1f40: 00000000 c029d000 c0297000 c01e7000 c01e7000 00008000 c015f3f8 c01964bc 
> 1f60: c01e1f84 c01e1f70 c0008efc c0093d14 00000000 c01e7000 c01e1fc8 c01e1f88 
> 1f80: c0008fe0 c0008edc c004b014 01f00003 c015f3f8 00000000 00000000 00000000 
> 1fa0: 00000000 c01e1fc8 c00147dc 00000000 00000000 00000000 00000000 c01e1fe0 
> 1fc0: c01e1fcc c0009178 c0008f98 00000000 c015f278 c01e1ff4 c01e1fe4 c00160e0 
> 1fe0: c0009128 00000000 00000000 c01e1ff8 c0036934 c001609c e5942000 e2433001 
> Backtrace:                                                                    
> Function entered at [<c00b8e68>] from [<c00b8ce0>]
>  r8 = 00000000  r7 = C01E1D4C  r6 = C029EE00  r5 = C01E1D4C
>  r4 = C02A3B2C                                             
> Function entered at [<c00b8b0c>] from [<c00b91fc>]
>  r8 = C029EEBC  r7 = C029EEB4  r6 = C029EEA4  r5 = C029EE9C
>  r4 = C029EE94                                             
> Function entered at [<c00b8fd4>] from [<c00bb268>]
> Function entered at [<c00bb138>] from [<c00bb8a0>]
>  r8 = C0289A00  r7 = 00000000  r6 = 00008000  r5 = C029EE00
>  r4 = C029EC00                                             
> Function entered at [<c00bb808>] from [<c00bbaec>]
>  r8 = C0183FE0  r7 = 00008000  r6 = C029D000  r5 = 00000003
>  r4 = FFFFFFEA                                             
> Function entered at [<c00bb958>] from [<c007b9cc>]
> Function entered at [<c007b970>] from [<c00931dc>]
> Function entered at [<c0093158>] from [<c0093960>]
> Function entered at [<c0093810>] from [<c0093dac>]
> Function entered at [<c0093d04>] from [<c0008efc>]
>  r8 = C01964BC  r7 = C015F3F8  r6 = 00008000  r5 = C01E7000
>  r4 = C01E7000                                             
> Function entered at [<c0008ecc>] from [<c0008fe0>]
>  r4 = C01E7000                                    
> Function entered at [<c0008f88>] from [<c0009178>]
>  r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
>  r4 = C00147DC                                             
> Function entered at [<c0009118>] from [<c00160e0>]
>  r4 = C015F278                                    
> Function entered at [<c001608c>] from [<c0036934>]
>  r4 = 00000000                                    
> Code: 0a000005 e1a01004 e1a00007 ebffe3ad (e5944000) 
> 
> 
> >>EIP; c00b8e98 <jffs2_build_remove_unlinked_inode+30/ec>   <=====
> 
> >>r3; c017fe5c <log_wait+0/8>
> 
> Trace; c00b8e68 <jffs2_build_remove_unlinked_inode+0/ec>
> Trace; c00b8ce0 <jffs2_build_filesystem+1d4/35c>
> Trace; c00b8b0c <jffs2_build_filesystem+0/35c>
> Trace; c00b91fc <jffs2_do_mount_fs+228/270>
> Trace; c00b8fd4 <jffs2_do_mount_fs+0/270>
> Trace; c00bb268 <jffs2_do_fill_super+130/238>
> Trace; c00bb138 <jffs2_do_fill_super+0/238>
> Trace; c00bb8a0 <jffs2_get_sb_mtd+98/f8>
> Trace; c00bb808 <jffs2_get_sb_mtd+0/f8>
> Trace; c00bbaec <jffs2_get_sb+194/1d0>
> 
> >>r8; c0183fe0 <jffs2_fs_type+0/20>
> 
> Trace; c00bb958 <jffs2_get_sb+0/1d0>
> Trace; c007b9cc <do_kern_mount+5c/f4>
> Trace; c007b970 <do_kern_mount+0/f4>
> Trace; c00931dc <do_new_mount+84/b8>
> Trace; c0093158 <do_new_mount+0/b8>
> Trace; c0093960 <do_mount+150/16c>
> Trace; c0093810 <do_mount+0/16c>
> Trace; c0093dac <sys_mount+a8/f0>
> Trace; c0093d04 <sys_mount+0/f0>
> Trace; c0008efc <do_mount_root+30/bc>
> 
> >>r8; c01964bc <names_cachep+0/4>
> >>r7; c015f3f8 <__func__.1+370/f6e8>
> 
> Trace; c0008ecc <do_mount_root+0/bc>
> Trace; c0008fe0 <mount_block_root+58/124>
> Trace; c0008f88 <mount_block_root+0/124>
> Trace; c0009178 <prepare_namespace+60/a0>
> 
> >>r4; c00147dc <root_device_name+0/4>
> 
> Trace; c0009118 <prepare_namespace+0/a0>
> Trace; c00160e0 <init+54/f8>
> 
> >>r4; c015f278 <__func__.1+1f0/f6e8>
> 
> Trace; c001608c <init+0/f8>
> Trace; c0036934 <do_exit+0/504>
> 
> Code;  c00b8e88 <jffs2_build_remove_unlinked_inode+20/ec>
> 00000000 <_EIP>:
> Code;  c00b8e88 <jffs2_build_remove_unlinked_inode+20/ec>
>    0:   05 00 00 0a 04            add    $0x40a0000,%eax
> Code;  c00b8e8d <jffs2_build_remove_unlinked_inode+25/ec>
>    5:   10 a0 e1 07 00 a0         adc    %ah,0xa00007e1(%eax)
> Code;  c00b8e93 <jffs2_build_remove_unlinked_inode+2b/ec>
>    b:   e1 ad                     loope  ffffffba <_EIP+0xffffffba>
> Code;  c00b8e95 <jffs2_build_remove_unlinked_inode+2d/ec>
>    d:   e3 ff                     jecxz  e <_EIP+0xe>
> Code;  c00b8e97 <jffs2_build_remove_unlinked_inode+2f/ec>   <=====
>    f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
> Code;  c00b8e99 <jffs2_build_remove_unlinked_inode+31/ec>
>   11:   40                        inc    %eax
> Code;  c00b8e9a <jffs2_build_remove_unlinked_inode+32/ec>
>   12:   94                        xchg   %eax,%esp
> Code;  c00b8e9b <jffs2_build_remove_unlinked_inode+33/ec>
>   13:   e5 00                     in     $0x0,%eax
> 
>  <0>Kernel panic - not syncing: Attempted to kill init!
> 
> 1 error issued.  Results may not be reliable.
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
