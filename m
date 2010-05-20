Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OF5e2-0003Su-6B
	for linux-mtd@lists.infradead.org; Thu, 20 May 2010 13:18:42 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: <linux-mtd@lists.infradead.org>
Subject: Re: ubifs became broken on contigous power-fails
Date: Thu, 20 May 2010 19:18:42 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<201005131408.01573.pazdnikov@prosoft.ural.ru>
	<201005191636.21845.pazdnikov@prosoft.ural.ru>
In-Reply-To: <201005191636.21845.pazdnikov@prosoft.ural.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary-00=_yaT9LYDdvHYBWsQ"
Message-ID: <201005201918.42731.pazdnikov@prosoft.ural.ru>
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_yaT9LYDdvHYBWsQ
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: 7bit

After reboot by poweroff I've got the following:

first mount ubi2:dbfs RO then remount RW

[   11.069330] UBIFS: recovery needed                                                                     
[   13.485344] UBIFS: recovery deferred                                                                   
[   14.781242] UBIFS: mounted UBI device 2, volume 0, name "dbfs"                                         
[   14.787101] UBIFS: mounted read-only                                                                   
[   14.791008] UBIFS: file system size:   189149184 bytes (184716 KiB, 180 MiB, 1466 LEBs)                
[   14.799797] UBIFS: journal size:       9418752 bytes (9198 KiB, 8 MiB, 73 LEBs)                        
[   14.806633] UBIFS: media format:       w4/r0 (latest is w4/r0)                                         
[   14.813468] UBIFS: default compressor: lzo                                                             
[   14.817375] UBIFS: reserved for root:  4952683 bytes (4836 KiB)                                        
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: compiled on:         May 12 2010 at 18:34:36             
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: min. I/O unit size:  2048 bytes                          
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: LEB size:            129024 bytes (126 KiB)              
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: data journal heads:  1                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: UUID:                DC1BB581-CE01-431C-9308-BBA9D0885E3D
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: big_lpt              0                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: log LEBs:            5 (3 - 7)                           
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: LPT area LEBs:       2 (8 - 9)                           
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: orphan area LEBs:    2 (10 - 11)                         
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: main area LEBs:      1466 (12 - 1477)                    
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: index LEBs:          1                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: total index bytes:   46848 (45 KiB, 0 MiB)               
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: key hash type:       0                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: tree fanout:         8                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: reserved GC LEB:     14                                  
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: first main LEB:      12                                  
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. znode size      240                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. index node size 192                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          data 48, inode 160, dentry 56       
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          trun 56, sb 4096, master 512        
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32      
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312    
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: dead watermark:      2048                                
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: dark watermark:      6144                                
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: LEB overhead:        560                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. dark space:     9007104 (8796 KiB, 8 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: maximum bud bytes:   8773632 (8568 KiB, 8 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: BG commit bud bytes: 7128576 (6961 KiB, 6 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: current bud bytes    2572288 (2512 KiB, 2 MiB)
[   14.826164] UBIFS DBG (pid 468): mount_ubifs: max. seq. number:    6955
[   14.826164] UBIFS DBG (pid 468): mount_ubifs: commit number:       5
[   14.890617] UBIFS: completing deferred recovery
[   14.901359] UBIFS DBG (pid 472): ubifs_bg_thread: background thread "ubifs_bgt2_0" started, PID 472
[   21.676746] UBIFS: deferred recovery completed
[   21.681629] UBIFS error (pid 471): dbg_check_space_info: free space changed from 171535545 to 171830940
[   21.691395] UBIFS: saved lprops statistics dump
[   21.696277] (pid 471) Lprops statistics: empty_lebs 1350, idx_lebs  1
[   21.696277]  taken_empty_lebs 0, total_free 174458880, total_dirty 9203536
[   21.696277]  total_used 5442288, total_dark 8777552, total_dead 22792
[   21.696277] UBIFS: current lprops statistics dump
[   21.701160] (pid 471) Lprops statistics: empty_lebs 1360, idx_lebs  1
[   21.701160]  taken_empty_lebs 1, total_free 175742976, total_dirty 7914704
[   21.701160]  total_used 5442288, total_dark 8777552, total_dead 22792
[   21.701160] UBIFS assert failed in dbg_dump_budg at 617 (pid 471)
[   21.707996] [<c0026820>] (unwind_backtrace+0x0/0xe4) from [<c0158c50>] (dbg_dump_budg+0x250/0x334)
[   21.716785] [<c0158c50>] (dbg_dump_budg+0x250/0x334) from [<c0158df4>] (dbg_check_space_info+0xc0/0x114)
[   21.726551] [<c0158df4>] (dbg_check_space_info+0xc0/0x114) from [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc)
[   21.737293] [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc) from [<c008f7ec>] (do_remount_sb+0x8c/0x100)
[   21.746082] [<c008f7ec>] (do_remount_sb+0x8c/0x100) from [<c00a80f0>] (do_mount+0x4c0/0x7cc)
[   21.754871] [<c00a80f0>] (do_mount+0x4c0/0x7cc) from [<c00a8494>] (sys_mount+0x98/0xc8)
[   21.763660] [<c00a8494>] (sys_mount+0x98/0xc8) from [<c0021f40>] (ret_fast_syscall+0x0/0x28)
[   21.772449] (pid 471) Budgeting info: budg_data_growth 0, budg_dd_growth 0, budg_idx_growth 0
[   21.772449]  data budget sum 0, total budget sum 0, freeable_cnt 57
[   21.772449]  min_idx_lebs 3, old_idx_sz 49216, calc_idx_sz 49216, idx_gc_cnt 0
[   21.772449]  dirty_pg_cnt 0, dirty_zn_cnt 0, clean_zn_cnt 280
[   21.772449]  dark_wm 6144, dead_wm 2048, max_idx_node_sz 192
[   21.772449]  gc_lnum 109, ihead_lnum 12
[   21.772449]  jhead 0 (GC)     LEB -1
[   21.772449]  jhead 1 (base)   LEB -1
[   21.772449]  jhead 2 (data)   LEB -1
[   21.772449]  commit state 0
[   21.772449] Budgeting predictions:
[   21.772449]  available: 174003384, outstanding 0, free 171830940
[   21.773426] [<c0026820>] (unwind_backtrace+0x0/0xe4) from [<c0158e0c>] (dbg_check_space_info+0xd8/0x114)
[   21.783191] [<c0158e0c>] (dbg_check_space_info+0xd8/0x114) from [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc)
[   21.792957] [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc) from [<c008f7ec>] (do_remount_sb+0x8c/0x100)
[   21.802723] [<c008f7ec>] (do_remount_sb+0x8c/0x100) from [<c00a80f0>] (do_mount+0x4c0/0x7cc)
[   21.811512] [<c00a80f0>] (do_mount+0x4c0/0x7cc) from [<c00a8494>] (sys_mount+0x98/0xc8)
[   21.819324] [<c00a8494>] (sys_mount+0x98/0xc8) from [<c0021f40>] (ret_fast_syscall+0x0/0x28)

 
--
Best regards,
Sasha

--Boundary-00=_yaT9LYDdvHYBWsQ
Content-Type: text/plain; charset="UTF-8"; name="nand_err_20100520"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="nand_err_20100520"
Content-Description: nand_err_20100520

[   11.069330] UBIFS: recovery needed                                                                     
[   13.485344] UBIFS: recovery deferred                                                                   
[   14.781242] UBIFS: mounted UBI device 2, volume 0, name "dbfs"                                         
[   14.787101] UBIFS: mounted read-only                                                                   
[   14.791008] UBIFS: file system size:   189149184 bytes (184716 KiB, 180 MiB, 1466 LEBs)                
[   14.799797] UBIFS: journal size:       9418752 bytes (9198 KiB, 8 MiB, 73 LEBs)                        
[   14.806633] UBIFS: media format:       w4/r0 (latest is w4/r0)                                         
[   14.813468] UBIFS: default compressor: lzo                                                             
[   14.817375] UBIFS: reserved for root:  4952683 bytes (4836 KiB)                                        
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: compiled on:         May 12 2010 at 18:34:36             
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: min. I/O unit size:  2048 bytes                          
[   14.823234] UBIFS DBG (pid 468): mount_ubifs: LEB size:            129024 bytes (126 KiB)              
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: data journal heads:  1                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: UUID:                DC1BB581-CE01-431C-9308-BBA9D0885E3D
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: big_lpt              0                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: log LEBs:            5 (3 - 7)                           
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: LPT area LEBs:       2 (8 - 9)                           
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: orphan area LEBs:    2 (10 - 11)                         
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: main area LEBs:      1466 (12 - 1477)                    
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: index LEBs:          1                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: total index bytes:   46848 (45 KiB, 0 MiB)               
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: key hash type:       0                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: tree fanout:         8                                   
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: reserved GC LEB:     14                                  
[   14.824211] UBIFS DBG (pid 468): mount_ubifs: first main LEB:      12                                  
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. znode size      240                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. index node size 192                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          data 48, inode 160, dentry 56       
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          trun 56, sb 4096, master 512        
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32      
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312    
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: dead watermark:      2048                                
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: dark watermark:      6144                                
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: LEB overhead:        560                                 
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: max. dark space:     9007104 (8796 KiB, 8 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: maximum bud bytes:   8773632 (8568 KiB, 8 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: BG commit bud bytes: 7128576 (6961 KiB, 6 MiB)
[   14.825187] UBIFS DBG (pid 468): mount_ubifs: current bud bytes    2572288 (2512 KiB, 2 MiB)
[   14.826164] UBIFS DBG (pid 468): mount_ubifs: max. seq. number:    6955
[   14.826164] UBIFS DBG (pid 468): mount_ubifs: commit number:       5
[   14.890617] UBIFS: completing deferred recovery
[   14.901359] UBIFS DBG (pid 472): ubifs_bg_thread: background thread "ubifs_bgt2_0" started, PID 472
[   21.676746] UBIFS: deferred recovery completed
[   21.681629] UBIFS error (pid 471): dbg_check_space_info: free space changed from 171535545 to 171830940
[   21.691395] UBIFS: saved lprops statistics dump
[   21.696277] (pid 471) Lprops statistics: empty_lebs 1350, idx_lebs  1
[   21.696277]  taken_empty_lebs 0, total_free 174458880, total_dirty 9203536
[   21.696277]  total_used 5442288, total_dark 8777552, total_dead 22792
[   21.696277] UBIFS: current lprops statistics dump
[   21.701160] (pid 471) Lprops statistics: empty_lebs 1360, idx_lebs  1
[   21.701160]  taken_empty_lebs 1, total_free 175742976, total_dirty 7914704
[   21.701160]  total_used 5442288, total_dark 8777552, total_dead 22792
[   21.701160] UBIFS assert failed in dbg_dump_budg at 617 (pid 471)
[   21.707996] [<c0026820>] (unwind_backtrace+0x0/0xe4) from [<c0158c50>] (dbg_dump_budg+0x250/0x334)
[   21.716785] [<c0158c50>] (dbg_dump_budg+0x250/0x334) from [<c0158df4>] (dbg_check_space_info+0xc0/0x114)
[   21.726551] [<c0158df4>] (dbg_check_space_info+0xc0/0x114) from [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc)
[   21.737293] [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc) from [<c008f7ec>] (do_remount_sb+0x8c/0x100)
[   21.746082] [<c008f7ec>] (do_remount_sb+0x8c/0x100) from [<c00a80f0>] (do_mount+0x4c0/0x7cc)
[   21.754871] [<c00a80f0>] (do_mount+0x4c0/0x7cc) from [<c00a8494>] (sys_mount+0x98/0xc8)
[   21.763660] [<c00a8494>] (sys_mount+0x98/0xc8) from [<c0021f40>] (ret_fast_syscall+0x0/0x28)
[   21.772449] (pid 471) Budgeting info: budg_data_growth 0, budg_dd_growth 0, budg_idx_growth 0
[   21.772449]  data budget sum 0, total budget sum 0, freeable_cnt 57
[   21.772449]  min_idx_lebs 3, old_idx_sz 49216, calc_idx_sz 49216, idx_gc_cnt 0
[   21.772449]  dirty_pg_cnt 0, dirty_zn_cnt 0, clean_zn_cnt 280
[   21.772449]  dark_wm 6144, dead_wm 2048, max_idx_node_sz 192
[   21.772449]  gc_lnum 109, ihead_lnum 12
[   21.772449]  jhead 0 (GC)     LEB -1
[   21.772449]  jhead 1 (base)   LEB -1
[   21.772449]  jhead 2 (data)   LEB -1
[   21.772449]  commit state 0
[   21.772449] Budgeting predictions:
[   21.772449]  available: 174003384, outstanding 0, free 171830940
[   21.773426] [<c0026820>] (unwind_backtrace+0x0/0xe4) from [<c0158e0c>] (dbg_check_space_info+0xd8/0x114)
[   21.783191] [<c0158e0c>] (dbg_check_space_info+0xd8/0x114) from [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc)
[   21.792957] [<c0128d3c>] (ubifs_remount_fs+0x528/0x8bc) from [<c008f7ec>] (do_remount_sb+0x8c/0x100)
[   21.802723] [<c008f7ec>] (do_remount_sb+0x8c/0x100) from [<c00a80f0>] (do_mount+0x4c0/0x7cc)
[   21.811512] [<c00a80f0>] (do_mount+0x4c0/0x7cc) from [<c00a8494>] (sys_mount+0x98/0xc8)
[   21.819324] [<c00a8494>] (sys_mount+0x98/0xc8) from [<c0021f40>] (ret_fast_syscall+0x0/0x28)

--Boundary-00=_yaT9LYDdvHYBWsQ--
