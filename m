Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSQiU-0001Tq-Kf
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 07:54:10 +0000
Subject: Re: ubi crash after change to read-only
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Esteban Lopez <elopez@softel.net.mx>
In-Reply-To: <1260818568.6544.24.camel@r2d2.local>
References: <1260818568.6544.24.camel@r2d2.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 09:51:47 +0200
Message-Id: <1262764307.4263.143.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

could you please do things described here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

and when you send a bug report, do it also like described there.

It is especially important to try pull the 2.6.27 back-port tree.
Although I do not support it anymore, it is up-to-date so far.

On Mon, 2009-12-14 at 13:22 -0600, Esteban Lopez wrote:
> Hello Everybody, 
> 
> I have a ubifs over nandflash memory, my kernel version is 2.6.27, my uC
> is an at91sam9260 by ATMEL and I created my ubi image with the following
> commands:
> 
> >mkfs.ubifs -e 0x1F800 -c 2048 -m 0x800 -x zlib -r MY_RFS_PATH -o
> myRFS.ubifs
> 
>  >ubinize -p 128KiB -m 2048 -s 512 -o myRFS.ubi myRFS-ubinize.cfg
> 
> >mkfs.ubifs -V
> Version 1.2
> 
> > ubinize -V
> 1.0

There is a more fresh tool, BTW.

> My system run very well but after some days or months my rfs change
> suddenly to read-only mode, then if I reboot the system, ubi fail during
> its recovery process with this messanges
> 
> UBIFS: recovery
> needed                                                          
> [<c028f70c>] (dump_stack+0x0/0x14) from [<c011ea80>] (alloc_lpt_leb
> +0xd0/0xd8)  
> [<c011e9b0>] (alloc_lpt_leb+0x0/0xd8) from [<c011f554>]
> (ubifs_lpt_start_commit+
> 0x50c/0x710)                                                                    
> [<c011f048>] (ubifs_lpt_start_commit+0x0/0x710) from [<c0113a74>]
> (do_commit+0xc
> 8/0x6f0)                                                                        
> [<c01139ac>] (do_commit+0x0/0x6f0) from [<c0114128>] (ubifs_run_commit
> +0x8c/0xa0
> )                                                                               
>  r8:c3819d28 r7:c3a04800 r6:0000056f r5:c392a0e4
> r4:c392a000                    
> [<c011409c>] (ubifs_run_commit+0x0/0xa0) from [<c011c6f4>]
> (ubifs_rcvry_gc_commi
> t
> +0x218/0x228)                                                                  
>  r5:c392a000
> r4:00000000                                                        
> [<c011c4dc>] (ubifs_rcvry_gc_commit+0x0/0x228) from [<c010a1b8>]
> (ubifs_get_sb+0
> xc18/0xf70)                                                                     
>  r8:c3a04a00 r7:00000000 r6:0001f5d0 r5:00000001
> r4:00000000                    
> [<c01095a0>] (ubifs_get_sb+0x0/0xf70) from [<c0081fd0>] (vfs_kern_mount
> +0x58/0xb
> 0)                                                                              
> [<c0081f78>] (vfs_kern_mount+0x0/0xb0) from [<c0082084>] (do_kern_mount
> +0x3c/0xd
> 8)                                                                              
>  r8:c034388c r7:c3a5b000 r6:00000000 r5:c39ff000
> r4:00008000                    
> [<c0082048>] (do_kern_mount+0x0/0xd8) from [<c0097ff0>] (do_new_mount
> +0x5c/0x84)
>  r9:c3a5b000 r8:c39ff000 r7:c3819e98 r6:00000000
> r5:00008000                    
> r4:c3a5b000                                                                     
> [<c0097f94>] (do_new_mount+0x0/0x84) from [<c0098cd8>] (do_mount
> +0x170/0x198)   
>  r7:c3819e98 r6:00000000 r5:00008000
> r4:00000000                                
> [<c0098b68>] (do_mount+0x0/0x198) from [<c0098d8c>] (sys_mount
> +0x8c/0xd4)       
> [<c0098d00>] (sys_mount+0x0/0xd4) from [<c0008c1c>] (do_mount_root
> +0x28/0xb0)   
>  r7:00008000 r6:c384f000 r5:c0024844
> r4:c384f000                                
> [<c0008bf4>] (do_mount_root+0x0/0xb0) from [<c0008ea4>]
> (mount_block_root+0x100/
> 0x220)                                                                          
> 
> r4:c384f000                                                                    
> [<c0008da4>] (mount_block_root+0x0/0x220) from [<c0009160>]
> (prepare_namespace+0
> xa0/0x1d0)                                                                      
>  r8:00000000 r7:00000000 r6:00000000 r5:c0024844
> r4:c0024854                    
> [<c00090c0>] (prepare_namespace+0x0/0x1d0) from [<c0008464>]
> (kernel_init+0xc8/0
> xf4)                                                                            
>  r5:00000000
> r4:c0357920                                                        
> [<c000839c>] (kernel_init+0x0/0xf4) from [<c0040260>] (do_exit
> +0x0/0x6fc)       
> 
> r4:00000000                                                                    
> UBIFS error (pid 1): do_commit: commit failed, error
> -28                        
> UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error
> -28     
> VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0)                
> Please append a correct "root=" boot option; here are the available
> partitions: 
> 1f00      65536 mtdblock0
> (driver?)                                             
> 1f01     458752 mtdblock1
> (driver?)                                             
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)  
> Rebooting in 5
> seconds..RomBOOT                                                 
> > 
> 
> I have always the same error . Is there some documented bug in kernel
> about this or Could you tell me some idea about how debug or fix this?

It is difficult to tell what happened. Please, do what the link I've
provided tell, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
