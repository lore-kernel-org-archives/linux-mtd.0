Received: from the.earth.li ([193.201.200.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GAkX5-0004R6-I1
	for linux-mtd@lists.infradead.org; Wed, 09 Aug 2006 05:39:45 -0400
Received: from noodles by the.earth.li with local (Exim 4.50)
	id 1GAkSB-0005Js-4W
	for linux-mtd@lists.infradead.org; Wed, 09 Aug 2006 10:34:19 +0100
Date: Wed, 9 Aug 2006 10:34:19 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-mtd@lists.infradead.org
Subject: Re: 2.6.18-rc4 jffs2 problems
Message-ID: <20060809093419.GA14187@earth.li>
References: <1154976111.17725.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1154976111.17725.8.camel@localhost.localdomain>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 07, 2006 at 07:41:50PM +0100, Richard Purdie wrote:
> I previous reported problems with jffs2 on the Zaurus. I tested
> 2.6.18-rc4 and nothing has changed - I see the following when booting,
> both with filesystems that work with 2.6.17 and freshly reflashed
> systems:
> 
> Linux version 2.6.18-rc4-.dev-snapshot-20060807 (richard@tim) (gcc version 3.4.3) #1 PREEMPT Mon Aug 7 17:47:07 BST 2006
> CPU: XScale-PXA250 [69052904] revision 4 (ARMv5TE), cr=0000397f
> Machine: SHARP Poodle
> [...]
> Sharp SL series flash device: 800000@0
> Using static partision definition
> Creating 1 MTD partitions on "sharpsl-flash":
> 0x00120000-0x007f0000 : "Boot PROM Filesystem"
> NAND device: Manufacturer ID: 0x98, Chip ID: 0x76 (Toshiba NAND 64MiB 3,3V 8-bit)
> Scanning device for bad blocks
> Creating 3 MTD partitions on "sharpsl-nand":
> 0x00000000-0x00700000 : "System Area"
> 0x00700000-0x01d00000 : "Root Filesystem"
> 0x01d00000-0x04000000 : "Home Filesystem"
> [...]
> Empty flash@0x0054bc5c ends at 0x0054be00
> VFS: Mounted root (jffs2 filesystem) readonly.
> Freeing init memory: 100K
> JFFS2 error: (472) jffs2_get_inode_nodes: short read@0x074e84: 68 instead of 380.
> JFFS2 error: (472) jffs2_do_read_inode_internal: cannot read nodes for ino 153, returned error is -5

I'm seeing similar problems on the Amstrad Delta, both with a filesystem
that works fine under 2.6.16 and a completely clean fs. Like the Zaurus
this is a NAND device.

dmesg output (the jffs2 partition is / and never gets fully mounted) is:

JFFS2 error: (1) check_node_data: short read at 0x1a14200: 17 instead of 849.
JFFS2 error: (1) check_node: check_node_data() returned error: -5.
kernel BUG at fs/jffs2/readinode.c:700!
Unable to handle kernel NULL pointer dereference at virtual address 00000000    
pgd = c0004000                                                                  
[00000000] *pgd=00000000                                                        
Internal error: Oops: 817 [#1]                                                  
Modules linked in:                                                              
CPU: 0                                                                          
PC is at __bug+0x40/0x54                                                        
LR is at 0x1                                                                    
pc : [<c0025c90>]    lr : [<00000001>]    Not tainted                           
sp : c0373ab8  ip : 60000093  fp : c0373ac4                                     
r10: c1d16320  r9 : c1d091f4  r8 : c1d1ecd8                                     
r7 : c1d16340  r6 : c1d16340  r5 : fffffffb  r4 : 00000000                      
r3 : 00000000  r2 : 00000000  r1 : 60000013  r0 : 00000001                      
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel                      
Control: 317F  Table: 10018000  DAC: 00000017                                   
Process swapper (pid: 1, stack limit = 0xc0372250)                              
Stack: (0xc0373ab8 to 0xc0374000)                                               
3aa0:                                                       c0373b50 c0373ac8   
3ac0: c0103c20 c0025c60 c0020800 c0020800 c1cae0b4 c0373b08 0000050d c0020800   
3ae0: 00000000 c0017cd8 c1d1ed58 c0373be0 c0017cc8 c1cd3a00 00000000 c1d16340   
3b00: 00000200 c0176354 00000000 00000200 00000000 c0373b30 00000000 c1d16340   
3b20: c012f348 c0373b80 c0372000 c0017cc8 c0373b5c c1d11475 000002ab c1cd3ae8   
3b40: c1cd3a00 c0373bac c0373b54 c0104520 c0102ee0 00000000 c0373be0 00000000   
3b60: c0373b80 c0373b70 c01005dc c00382d4 00000000 c0373c0c c0373b84 c0104258   
3b80: c01005b4 c0017cf4 c1cd3800 d8acb8a2 c1d11475 c1cd6914 c0017cf4 c0017cc8   
3ba0: c0373c4c c0373bb0 c010abf4 c010432c c1cd3a00 00000013 c1d16340 00000148   
3bc0: c00219f8 00000000 00000148 00000000 c02fc40c 00000000 c1cd3a00 c1d115a0   
3be0: c0373bfc c0373bf0 c010b8ec c0079958 c0373c1c c0373c00 c009940c c010b8e0   
3c00: c1d115a0 c0017cf4 c0372000 000002ab c0373c4c c0373c20 c0099fb4 c0099dc8   
3c20: 00000000 c0017cf4 c1cd3800 d8acb8a2 c1d11475 c1cd6914 000002ab c1d11460   
3c40: c0373c80 c0373c50 c00fdf6c c010ab84 00000000 c1d14b74 fffffff4 c1cd6914   
3c60: c1d14b74 c1d14be4 c0373e94 c0373cc8 c0373cc0 c0373cb0 c0373c84 c008cf6c   
3c80: c00fde2c c0364220 00000000 c0373e94 c1d14b74 c0373d00 c1d0cc80 c0373cc0   
3ca0: c1d0cc93 c0373cfc c0373cb4 c008dc64 c008cec0 00000000 00000013 00000001   
3cc0: c0364220 c1cd6c78 d8acb8a2 0000000d c1d0cc86 00000000 c0373e94 c1d0cc80   
3ce0: c0373d00 c1d0cc80 c0373d7c 00000000 c0373d6c c0373d00 c008e2c0 c008d1dc   
3d00: c1c1f570 c0364220 c1d14754 c0364220 c1cd6dec 00000101 00000001 00000001   
3d20: c007c5ec c1d0cc80 c03a64e0 c0373f00 00000000 ffffff9c 00000001 c0383000   3d40: c0373ef8 00000011 00000000 c03a63a0 00000000 c0373e94 c0372000 c1cd6990   
3d60: c0373db8 c0373d70 c008dfb4 c008e240 00000000 c0022738 00000101 c0364220   
3d80: c1cd6990 019ff37b 00000004 c025505e c0372000 c0373e94 c0255058 c0373dbc   
3da0: 00000001 00000000 c0255058 c0373e28 c0373dbc c008e2c0 c008d1dc c1c1f570   
3dc0: c0364220 c1d14754 c0364220 c1cd6dec 00000101 00000001 00000000 c007c5ec   
3de0: c0066d68 c03a64e0 c0373f00 00000000 ffffff9c 00000001 c0383000 c0373ef8   
3e00: 00000011 00000000 c03a63a0 c0372000 c0255058 c0373e94 00000000 c0373e54   
3e20: c0373e2c c008e6bc c008e240 c0373e38 ffffff9c c0255058 00000001 c0373e94   
3e40: c029959c c0373f2c c0373e74 c0373e58 c008e820 c008e3a0 c1d26c00 c0255058   
3e60: c0299510 c0373e94 c0373e8c c0373e78 c008e884 c008e7dc 00000011 00000000   
3e80: c0373f00 c0373e90 c0089814 c008e870 00000011 c1cd6c78 c0364220 c1d14754   
3ea0: c0364220 c1cd6dec 00000101 00000001 00000001 c007c5ec c1d0cc80 c03a64e0   
3ec0: c0373f00 00000000 ffffff9c 00000001 c0383000 c0373ef8 00000011 00000000   
3ee0: c03a63a0 c1d26c00 c0255058 c0299510 fffffff4 c0373f28 c0373f04 c008a8e0   
3f00: c00897f4 c0255058 c029959c c0299510 c0373f2c 00000001 c001e598 c0373f90   
3f20: c0373f2c c00257d8 c008a8b0 00000000 00000000 00000000 00000000 00000000   
3f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000   
3f60: 00000000 00000000 00000000 00000000 00000000 c02f28c8 c001e598 c0372000   
3f80: c001ead4 c0373fa0 c0373f94 c0021070 c00257a8 c0373ff4 c0373fa4 c0021268   
3fa0: c0021060 00000001 c0021ec4 c00380b0 00000000 00000000 c002107c c003ef74   3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000   
3fe0: 00000000 00000000 00000000 c0373ff8 c003ef74 c002108c 0a000008 e591300c   
Backtrace:                                                                      
[<c0025c50>] (__bug+0x0/0x54) from [<c0103c20>] (jffs2_do_read_inode_internal+0xd50/0x1394)                                                                     
[<c0102ed0>] (jffs2_do_read_inode_internal+0x0/0x1394) from [<c0104520>] (jffs2_do_read_inode+0x204/0x228)                                                      
[<c010431c>] (jffs2_do_read_inode+0x0/0x228) from [<c010abf4>] (jffs2_read_inode+0x80/0x3b4)                                                                    
[<c010ab74>] (jffs2_read_inode+0x0/0x3b4) from [<c00fdf6c>] (jffs2_lookup+0x150/0x19c)                                                                          
[<c00fde1c>] (jffs2_lookup+0x0/0x19c) from [<c008cf6c>] (do_lookup+0xbc/0x170)  
[<c008ceb0>] (do_lookup+0x0/0x170) from [<c008dc64>] (__link_path_walk+0xa98/0x1064)                                                                            
[<c008d1cc>] (__link_path_walk+0x0/0x1064) from [<c008e2c0>] (link_path_walk+0x90/0x160)                                                                        
[<c008e230>] (link_path_walk+0x0/0x160) from [<c008dfb4>] (__link_path_walk+0xde8/0x1064)                                                                       
 r7 = C1CD6990  r6 = C0372000  r5 = C0373E94  r4 = 00000000                   
[<c008d1cc>] (__link_path_walk+0x0/0x1064) from [<c008e2c0>] (link_path_walk+0x90/0x160)                                                                        
[<c008e230>] (link_path_walk+0x0/0x160) from [<c008e6bc>] (do_path_lookup+0x32c/0x354)                                                                          
 r7 = 00000000  r6 = C0373E94  r5 = C0255058  r4 = C0372000                     
[<c008e390>] (do_path_lookup+0x0/0x354) from [<c008e820>] (__path_lookup_intent_open+0x54/0x94)                                                                 
[<c008e7cc>] (__path_lookup_intent_open+0x0/0x94) from [<c008e884>] (path_lookup_open+0x24/0x2c)                                                                
 r7 = C0373E94  r6 = C0299510  r5 = C0255058  r4 = C1D26C00                     
[<c008e860>] (path_lookup_open+0x0/0x2c) from [<c0089814>] (open_exec+0x30/0xe0)
[<c00897e4>] (open_exec+0x0/0xe0) from [<c008a8e0>] (do_execve+0x40/0x1c4)      
 r7 = FFFFFFF4  r6 = C0299510  r5 = C0255058  r4 = C1D26C00                     
[<c008a8a0>] (do_execve+0x0/0x1c4) from [<c00257d8>] (execve+0x40/0x88)         
[<c0025798>] (execve+0x0/0x88) from [<c0021070>] (run_init_process+0x20/0x2c)   
 r7 = C001EAD4  r6 = C0372000  r5 = C001E598  r4 = C02F28C8                     
[<c0021050>] (run_init_process+0x0/0x2c) from [<c0021268>] (init+0x1ec/0x270)   
[<c002107c>] (init+0x0/0x270) from [<c003ef74>] (do_exit+0x0/0x958)             
Code: 1b005e2a e59f0014 eb005e28 e3a03000 (e5833000)                            
 <0>Kernel panic - not syncing: Attempted to kill init!                   

J.

-- 
] http://www.earth.li/~noodles/ []      I don't know. I'm a dog.       [
]  PGP/GPG Key @ the.earth.li   []                                     [
] via keyserver, web or email.  []                                     [
] RSA: 4DC4E7FD / DSA: 5B430367 []                                     [
