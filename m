Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hsa3s-0001jj-88
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 03:54:57 -0400
Message-ID: <465A89D6.2050708@parrot.com>
Date: Mon, 28 May 2007 09:50:46 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 memory usage and OOM killer
Content-Type: multipart/mixed; boundary="------------060402050206070101060108"
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060402050206070101060108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On a system with 16 MB of ram  (6700KB free at the time of mounting), I
have a 50 MB jffs2 partition with a big file on it (30 MB). This file
was uploaded with xmodem, and a dump of the partition show that the
inode node are very small (128 o).


After the file was uploaded on the jffs2 partition and a reboot :

if I do a rw mount, the partition is mounted, but jffs2 memory usage
increase until it eats all the memory and the system die (see jffs2_oom1
attachement).

if I do a ro mount, the partition is mounted (use 2MB of RAM), but if I
list directory, jffs2 start to eat all memory until OOM killer is called
(see jffs2_oom attachement).


I know that jffs2 eats some memory, but I am impressed that it can eat
so much memory.


Matthieu

PS : The ML keep think that the "Message has a
suspicious header", even after several retry.




--------------060402050206070101060108
Content-Type: text/plain;
 name="jffs2_oom"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_oom"

# free                                                                                                                         
              total         used         free       shared      buffers                                                        
  Mem:        13948         7168         6780            0            0                                                        
 Swap:            0            0            0                                                                                  
Total:        13948         7168         6780                                                                                  
#                                                                                                                              
#                                                                                                                              
#                                                                                                                              
#                                                                                                                              
# mount /dev/mtdblock3 /mnt/ -o ro -t jffs2                                                                                    
# free                                                                                                                         
              total         used         free       shared      buffers                                                        
  Mem:        13948         9712         4236            0            0                                                        
 Swap:            0            0            0                                                                                  
Total:        13948         9712         4236                                                                                  
# free                                                                                                                         
              total         used         free       shared      buffers                                                        
  Mem:        13948         9712         4236            0            0                                                        
 Swap:            0            0            0                                                                                  
Total:        13948         9712         4236                                                                                  
# free                                                                                                                         
              total         used         free       shared      buffers                                                        
  Mem:        13948         9712         4236            0            0                                                        
 Swap:            0            0            0                                                                                  
Total:        13948         9712         4236                                                                                  
# ls /mnt/                                                                                                                     
[   71.110000] [<c00261b0>] (dump_stack+0x0/0x14) from [<c005d444>] (out_of_memory+0x78/0x204)                                 
[   71.115000] [<c005d3cc>] (out_of_memory+0x0/0x204) from [<c005ed94>] (__alloc_pages+0x228/0x2a4)                            
[   71.125000]  r8 = 00000000  r7 = C02C6580  r6 = 000000D0  r5 = 00000000                                                     
[   71.130000]  r4 = 00000000                                                                                                  
[   71.135000] [<c005eb6c>] (__alloc_pages+0x0/0x2a4) from [<c0074b34>] (cache_alloc_refill+0x2e0/0x5a4)                       
[   71.140000] [<c0074854>] (cache_alloc_refill+0x0/0x5a4) from [<c0074848>] (kmem_cache_alloc+0x5c/0x68)                      
[   71.150000] [<c00747ec>] (kmem_cache_alloc+0x0/0x68) from [<c00c2f90>] (jffs2_alloc_tmp_dnode_info+0x1c/0x24)               
[   71.160000]  r6 = C000909C  r5 = 00000200  r4 = 75AE4D26                                                                    
[   71.165000] [<c00c2f74>] (jffs2_alloc_tmp_dnode_info+0x0/0x24) from [<c00c4ea8>] (jffs2_do_read_inode_internal+0x964/0x167c)
[   71.180000] [<c00c4544>] (jffs2_do_read_inode_internal+0x0/0x167c) from [<c00c5e78>] (jffs2_do_read_inode+0x20c/0x228)      
[   71.190000] [<c00c5c6c>] (jffs2_do_read_inode+0x0/0x228) from [<c00cd07c>] (jffs2_read_inode+0x78/0x334)                    
[   71.200000] [<c00cd004>] (jffs2_read_inode+0x0/0x334) from [<c00bfc84>] (jffs2_lookup+0x128/0x16c)                          
[   71.210000] [<c00bfb5c>] (jffs2_lookup+0x0/0x16c) from [<c007fecc>] (do_lookup+0xbc/0x184)                                  
[   71.215000] [<c007fe10>] (do_lookup+0x0/0x184) from [<c0081c14>] (__link_path_walk+0xa90/0x103c)                            
[   71.225000] [<c0081184>] (__link_path_walk+0x0/0x103c) from [<c008224c>] (link_path_walk+0x8c/0x154)                        
[   71.235000] [<c00821c0>] (link_path_walk+0x0/0x154) from [<c00827a0>] (do_path_lookup+0x2e0/0x308)                          
[   71.245000]  r8 = 00000001  r7 = C0921000  r6 = C0903EC8  r5 = 00000000                                                     
[   71.250000]  r4 = C02AD3A0                                                                                                  
[   71.255000] [<c00824c0>] (do_path_lookup+0x0/0x308) from [<c00830bc>] (__user_walk_fd+0x44/0x64)                            
[   71.260000] [<c0083078>] (__user_walk_fd+0x0/0x64) from [<c007b9c0>] (vfs_lstat_fd+0x24/0x54)                               
[   71.270000]  r7 = 000000C4  r6 = 0008387D  r5 = C0903EC8  r4 = C0903F40                                                     
[   71.275000] [<c007b99c>] (vfs_lstat_fd+0x0/0x54) from [<c007ba58>] (vfs_lstat+0x1c/0x20)                                    
[   71.285000]  r5 = BEFCB970  r4 = C0903F40                                                                                   
[   71.290000] [<c007ba3c>] (vfs_lstat+0x0/0x20) from [<c007ba7c>] (sys_lstat64+0x20/0x44)                                     
[   71.300000] [<c007ba5c>] (sys_lstat64+0x0/0x44) from [<c0021e60>] (ret_fast_syscall+0x0/0x2c)                               
[   71.305000]  r5 = 00000000  r4 = 00083878                                                                                   
[   71.310000] Mem-info:                                                                                                       
[   71.315000] DMA per-cpu:                                                                                                    
[   71.315000] CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0                                
[   71.320000] Active:70 inactive:0 dirty:0 writeback:0 unstable:0 free:127 slab:2331 mapped:0 pagetables:9                    
[   71.325000] DMA free:508kB min:508kB low:632kB high:760kB active:280kB inactive:0kB present:16256kB pages_scanned:504 all_us
[   71.330000] lowmem_reserve[]: 0 0                                                                                           
[   71.335000] DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB                
[   71.345000] Swap cache: add 0, delete 0, find 0/0, race 0+0                                                                 
[   71.350000] Free swap  = 0kB                                                                                                
[   71.355000] Total swap = 0kB                                                                                                
[   71.355000] Free swap:            0kB                                                                                       
[   71.360000] 4096 pages of RAM                                                                                               
[   71.365000] 154 free pages                                                                                                  
[   71.365000] 1360 reserved pages                                                                                             
[   71.370000] 2331 slab pages                                                                                                 
[   71.370000] 23 pages shared                                                                                                 
[   71.375000] 0 pages swap cached                                                                                             
[   71.380000] Out of memory: kill process 709 (sh) score 29 or a child                                                        
[   71.385000] Killed process 725 (sh)                                                                                         
[   72.455000] sh: page allocation failure. order:0, mode:0xd0                                                                 
[   72.455000] [<c00261b0>] (dump_stack+0x0/0x14) from [<c005edfc>] (__alloc_pages+0x290/0x2a4)                                
[   72.465000] [<c005eb6c>] (__alloc_pages+0x0/0x2a4) from [<c0074b34>] (cache_alloc_refill+0x2e0/0x5a4)                       
[   72.470000] [<c0074854>] (cache_alloc_refill+0x0/0x5a4) from [<c0074848>] (kmem_cache_alloc+0x5c/0x68)                      
[   72.480000] [<c00747ec>] (kmem_cache_alloc+0x0/0x68) from [<c00c2ffc>] (jffs2_alloc_full_dnode+0x1c/0x24)                   
[   72.490000]  r6 = C00091D4  r5 = 00000200  r4 = 00000080                                                                    
[   72.495000] [<c00c2fe0>] (jffs2_alloc_full_dnode+0x0/0x24) from [<c00c50e0>] (jffs2_do_read_inode_internal+0xb9c/0x167c)    
[   72.505000] [<c00c4544>] (jffs2_do_read_inode_internal+0x0/0x167c) from [<c00c5e78>] (jffs2_do_read_inode+0x20c/0x228)      
[   72.520000] [<c00c5c6c>] (jffs2_do_read_inode+0x0/0x228) from [<c00cd07c>] (jffs2_read_inode+0x78/0x334)                    
[   72.530000] [<c00cd004>] (jffs2_read_inode+0x0/0x334) from [<c00bfc84>] (jffs2_lookup+0x128/0x16c)                          
[   72.535000] [<c00bfb5c>] (jffs2_lookup+0x0/0x16c) from [<c007fecc>] (do_lookup+0xbc/0x184)                                  
[   72.545000] [<c007fe10>] (do_lookup+0x0/0x184) from [<c0081c14>] (__link_path_walk+0xa90/0x103c)                            
[   72.555000] [<c0081184>] (__link_path_walk+0x0/0x103c) from [<c008224c>] (link_path_walk+0x8c/0x154)                        
[   72.565000] [<c00821c0>] (link_path_walk+0x0/0x154) from [<c00827a0>] (do_path_lookup+0x2e0/0x308)                          
[   72.575000]  r8 = 00000001  r7 = C0921000  r6 = C0903EC8  r5 = 00000000                                                     
[   72.580000]  r4 = C02AD3A0                                                                                                  
[   72.580000] [<c00824c0>] (do_path_lookup+0x0/0x308) from [<c00830bc>] (__user_walk_fd+0x44/0x64)                            
[   72.590000] [<c0083078>] (__user_walk_fd+0x0/0x64) from [<c007b9c0>] (vfs_lstat_fd+0x24/0x54)                               
[   72.600000]  r7 = 000000C4  r6 = 0008387D  r5 = C0903EC8  r4 = C0903F40                                                     
[   72.605000] [<c007b99c>] (vfs_lstat_fd+0x0/0x54) from [<c007ba58>] (vfs_lstat+0x1c/0x20)                                    
[   72.615000]  r5 = BEFCB970  r4 = C0903F40                                                                                   
[   72.620000] [<c007ba3c>] (vfs_lstat+0x0/0x20) from [<c007ba7c>] (sys_lstat64+0x20/0x44)                                     
[   72.625000] [<c007ba5c>] (sys_lstat64+0x0/0x44) from [<c0021e60>] (ret_fast_syscall+0x0/0x2c)                               
[   72.635000]  r5 = 00000000  r4 = 00083878                                                                                   
[   72.640000] Mem-info:                                                                                                       
[   72.640000] DMA per-cpu:                                                                                                    
[   72.645000] CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0                                
[   72.650000] Active:70 inactive:0 dirty:0 writeback:0 unstable:0 free:0 slab:2458 mapped:0 pagetables:9                      
[   72.655000] DMA free:0kB min:508kB low:632kB high:760kB active:280kB inactive:0kB present:16256kB pages_scanned:565 all_unrs
[   72.660000] lowmem_reserve[]: 0 0                                                                                           
[   72.665000] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 0kB                  
[   72.675000] Swap cache: add 0, delete 0, find 0/0, race 0+0                                                                 
[   72.680000] Free swap  = 0kB                                                                                                
[   72.680000] Total swap = 0kB                                                                                                
[   72.685000] Free swap:            0kB                                                                                       
[   72.690000] 4096 pages of RAM                                                                                               
[   72.690000] 27 free pages                                                                                                   
[   72.695000] 1360 reserved pages                                                                                             
[   72.695000] 2458 slab pages                                                                                                 
[   72.700000] 23 pages shared                                                                                                 
[   72.705000] 0 pages swap cached                                                                                             
[   72.705000] JFFS2 error: (725) read_dnode: alloc fn failed                                                                  
[   72.970000] JFFS2 error: (725) jffs2_do_read_inode_internal: cannot read nodes for ino 2, returned error is -12             
Killed                                                                                                                         
#                                                                                                                              
# ls /mnt/                                                                                                                     
ls: /mnt/luxo-jr.mpg: Input/output error                                                                                       
# free                                                                                                                         
              total         used         free       shared      buffers                                                        
  Mem:        13948         9604         4344            0            0                                                        
 Swap:            0            0            0                                                                                  
Total:        13948         9604         4344




--------------060402050206070101060108
Content-Type: text/plain;
 name="jffs2_oom1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_oom1"

# mount /dev/mtdblock3 /mnt/ -t jffs2                                                                                          
# [ 1333.055000] sh invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0                                                
[ 1333.055000] [<c00261b0>] (dump_stack+0x0/0x14) from [<c005d444>] (out_of_memory+0x78/0x204)                                 
[ 1333.060000] [<c005d3cc>] (out_of_memory+0x0/0x204) from [<c005ed94>] (__alloc_pages+0x228/0x2a4)                            
[ 1333.070000]  r8 = 00000000  r7 = C0293040  r6 = 000201D2  r5 = 00000000                                                     
[ 1333.080000] jffs2_gcd_mtd3 invoked oom-killer: gfp_mask=0xd0, order=0, oomkilladj=0                                         
[ 1333.085000] [<c00261b0>] (dump_stack+0x0/0x14) from [<c005d444>] (out_of_memory+0x78/0x204)                                 
[ 1333.095000] [<c005d3cc>] (out_of_memory+0x0/0x204) from [<c005ed94>] (__alloc_pages+0x228/0x2a4)                            
[ 1333.105000]  r8 = 00000000  r7 = C02C6040  r6 = 000000D0  r5 = 00000000                                                     
[ 1333.110000]  r4 = 00000000                                                                                                  
[ 1333.115000] [<c005eb6c>] (__alloc_pages+0x0/0x2a4) from [<c0074b34>] (cache_alloc_refill+0x2e0/0x5a4)                       
[ 1333.120000] [<c0074854>] (cache_alloc_refill+0x0/0x5a4) from [<c0074848>]  r4 = 00000000                                    
[ 1333.130000] [<c005eb6c>] (__alloc_pages+0x0/0x2a4) from [<c0060c28>] (__do_page_cache_readahead+0x104/0x2b0)                
[ 1333.140000] [<c0060b24>] (__do_page_cache_readahead+0x0/0x2b0) from [<c006116c>] (do_page_cache_readahead+0x60/0x6c)        
[ 1333.150000] [<c006110c>] (do_page_cache_readahead+0x0/0x6c) from [<c005c3fc>] (filemap_nopage+0x1a0/0x42c)                  
[ 1333.160000]  r7 = 00000003  r6 = C02B0BA0  r5 = 00000000  r4 = 00000000                                                     
[ 1333.165000] [<c005c25c>] (filemap_nopage+0x0/0x42c) from [<c00681bc>] (__handle_mm_fault+0x168/0xae8)                       
[ 1333.175000] [<c0068054>] (__handle_mm_fault+0x0/0xae8) from [<c0027c18>] (do_page_fault+0xec/0x238)                         
[ 1333.185000] [<c0027b2c>] (do_page_fault+0x0/0x238) from [<c0027e18>] (do_translation_fault+0x20/0x80)                       
[ 1333.195000] [<c0027df8>] (do_translation_fault+0x0/0x80) from [<c0027e90>] (do_PrefetchAbort+0x18/0x1c)                     
[ 1333.205000]  r5 = 0007F678  r4 = FFFFFFFF                                                                                   
[ 1333.210000] [<c0027e78>] (do_PrefetchAbort+0x0/0x1c) from [<c0021e08>] (ret_from_exception+0x0/0x10)                        
[ 1333.220000] Mem-info:                                                                                                       
[ 1333.220000] DMA per-cpu:                                                                                                    
[ 1333.225000] CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0                                
[ 1333.230000] (kmem_cache_alloc+0x5c/0x68)                                                                                    
[ 1333.235000] [<c00747ec>] (kmem_cache_alloc+0x0/0x68) from [<c00c2f90>] (jffs2_alloc_tmp_dnode_info+0x1c/0x24)               
[ 1333.245000]  r6 = C00094E8  r5 = 00000200  r4 = 75AE4D26                                                                    
[ 1333.250000] [<c00c2f74>] (jffs2_alloc_tmp_dnode_info+0x0/0x24) from [<c00c4ea8>] (jffs2_do_read_inode_internal+0x964/0x167c)
[ 1333.260000] [<c00c4544>] (jffs2_do_read_inode_internal+0x0/0x167c) from [<c00c5c1c>] (jffs2_do_crccheck_inode+0x5c/0xac)    
[ 1333.275000] [<c00c5bc0>] (jffs2_do_crccheck_inode+0x0/0xac) Active:56 inactive:0 dirty:0 writeback:0 unstable:0 free:127 sl6
[ 1333.285000] DMA free:508kB min:508kB low:632kB high:760kB active:224kB inactive:0kB present:16256kB pages_scanned:819 all_us
[ 1333.290000] lowmem_reserve[]: 0 0                                                                                           
[ 1333.295000] DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB                
[ 1333.305000] Swap cache: add 0, delete 0, find 0/0, race 0+0                                                                 
[ 1333.310000] Free swap  = 0kB                                                                                                
[ 1333.310000] Total swap = 0kB                                                                                                
[ 1333.315000] Free swap:            0kB                                                                                       
[ 1333.320000] 4096 pages of RAM                                                                                               
[ 1333.320000] 151 free pages                                                                                                  
[ 1333.325000] 1360 reserved pages                                                                                             
[ 1333.325000] 2321 slab pages                                                                                                 
[ 1333.330000] 0 pages shared                                                                                                  
[ 1333.335000] 0 pages swap cached                                                                                             
[ 1333.335000] Out of memory: kill process 709 (sh) score 19 or a child                                                        
[ 1333.345000] Killed process 709 (sh)                                                                                         
[ 1333.510000]  r7 = C0F8B400  r6 = 00000001  r5 = C04B2000  r4 = C0FEE560                                                     
[ 1333.510000] [<c00c942c>] (jffs2_garbage_collect_pass+0x0/0x191c) from [<c00cc020>] (jffs2_garbage_collect_thread+0x12c/0x18)
[ 1333.520000] [<c00cbef4>] (jffs2_garbage_collect_thread+0x0/0x188) from [<c0037424>] (do_exit+0x0/0x8b0)                     
[ 1333.530000]  r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000                                                     
[ 1333.535000] Mem-info:                                                                                                       
[ 1333.540000] DMA per-cpu:                                                                                                    
[ 1333.540000] CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0                                
[ 1333.545000] Active:21 inactive:31 dirty:0 writeback:0 unstable:0 free:165 slab:2322 mapped:0 pagetables:3                   
[ 1333.550000] DMA free:660kB min:508kB low:632kB high:760kB active:84kB inactive:124kB present:16256kB pages_scanned:0 all_uno
[ 1333.555000] lowmem_reserve[]: 0 0                                                                                           
[ 1333.660000] DMA: 7*4kB 14*8kB 2*16kB 0*32kB 0*64kB 0*128kB 0*256kB 1*512kB 0*1024kB 0*2048kB 0*4096kB = 684kB               
[ 1333.665000] Swap cache: add 0, delete 0, find 0/0, race 0+0                                                                 
[ 1333.670000] Free swap  = 0kB                                                                                                
[ 1333.670000] Total swap = 0kB                                                                                                
[ 1333.675000] Free swap:            0kB                                                                                       
[ 1333.680000] 4096 pages of RAM                                                                                               
[ 1333.680000] 191 free pages                                                                                                  
[ 1333.685000] 1360 reserved pages                                                                                             
[ 1333.685000] 2322 slab pages                                                                                                 
[ 1333.690000] 9 pages shared                                                                                                  
[ 1333.690000] 0 pages swap cached                                                                                             
[ 1333.695000] Kernel panic - not syncing: Out of memory and no killable processes...




--------------060402050206070101060108--
