Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkS5s-0007GA-Gl
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 09:37:06 +0000
Date: Wed, 23 Aug 2017 11:36:38 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: lockdep warning in jffs2
Message-ID: <20170823093638.xuc2ikklrrybnkgn@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I saw the following splat on a machine:

[ 8909.508078]                                                                                                                                                                         
[ 8909.509620] =================================                                                                                                                                       
[ 8909.513996] [ INFO: inconsistent lock state ]                                                                                                                                       
[ 8909.518378] 4.9.26 #1 Tainted: G        W                                                                                                                                           
[ 8909.522929] ---------------------------------                                                                                                                                       
[ 8909.527307] inconsistent {RECLAIM_FS-ON-W} -> {IN-RECLAIM_FS-W} usage.                                                                                                              
[ 8909.533858] kswapd0/24 [HC0[0]:SC0[0]:HE1:SE1] takes:                                                                                                                               
[ 8909.538926]  (&f->sem){+.+.?.}, at: [<803512f4>] jffs2_do_clear_inode+0x20/0x134                                                                                                    
{RECLAIM_FS-ON-W} state was registered at:                                                                                                                                             
[ 8909.550305]   lockdep_trace_alloc+0xa4/0x128                                                                                                                                        
[ 8909.554603]   __kmalloc+0x3c/0x194                                                                                                                                                  
[ 8909.558030]   jffs2_do_read_inode_internal+0x44/0x1914                                                                                                                              
[ 8909.563193]   jffs2_do_read_inode+0xfc/0x208                                                                                                                                        
[ 8909.567486]   jffs2_iget+0x7c/0x350                                                                                                                                                 
[ 8909.570998]   jffs2_do_fill_super+0xd8/0x250                                                                                                                                        
[ 8909.575291]   jffs2_fill_super+0xe0/0x138                                                                                                                                           
[ 8909.579328]   mount_mtd_aux+0x84/0xd4                                                                                                                                               
[ 8909.583015]   mount_mtd+0x104/0x144                                                                                                                                                 
[ 8909.586526]   jffs2_mount+0x1c/0x28                                                                                                                                                 
[ 8909.590038]   mount_fs+0x1c/0xb0                                                                                                                                                    
[ 8909.593290]   vfs_kern_mount+0x5c/0x134                                                                                                                                             
[ 8909.597149]   do_mount+0x154/0xcc4                                                                                                                                                  
[ 8909.600575]   SyS_mount+0x9c/0xc4                                                                                                                                                   
[ 8909.603915]   ret_fast_syscall+0x0/0x1c                                                                                                                                             
[ 8909.607769] irq event stamp: 155265                                                                                                                                                 
[ 8909.611287] hardirqs last  enabled at (155265): [<8010d34c>] __irq_svc+0x8c/0xb0                                                                                                    
[ 8909.618707] hardirqs last disabled at (155264): [<8010d320>] __irq_svc+0x60/0xb0                                                                                                    
[ 8909.626133] softirqs last  enabled at (155254): [<801271b8>] __do_softirq+0x220/0x2c4                                                                                               
[ 8909.633988] softirqs last disabled at (155213): [<801275d4>] irq_exit+0xc8/0xe4                                                                                                     
[ 8909.641313]                                                                                                                                                                         
[ 8909.641313] other info that might help us debug this:                                                                                                                               
[ 8909.647859]  Possible unsafe locking scenario:                                                                                                                                      
[ 8909.647859]                                                                                                                                                                         
[ 8909.653798]        CPU0                                                                                                                                                             
[ 8909.656259]        ----                                                                                                                                                             
[ 8909.658718]   lock(&f->sem);                                                                                                                                                        
[ 8909.661661]   <Interrupt>                                                                                                                                                           
[ 8909.664297]     lock(&f->sem);                                                                                                                                                      
[ 8909.667410]                                                                                                                                                                         
[ 8909.667410]  *** DEADLOCK ***                                                                                                                                                       
[ 8909.667410]                                                                                                                                                                         
[ 8909.673357] 2 locks held by kswapd0/24:                                                                                                                                             
[ 8909.677208]  #0:  (shrinker_rwsem){++++..}, at: [<801e9ab8>] shrink_slab.part.0.constprop.8+0x34/0x300                                                                              
[ 8909.686630]  #1:  (&type->s_umount_key#30){.+.+..}, at: [<80227b3c>] trylock_super+0x1c/0x60                                                                                        
[ 8909.695212]                                                                                                                                                                         
[ 8909.695212] stack backtrace:                                                                                                                                                        
[ 8909.699600] CPU: 0 PID: 24 Comm: kswapd0 Tainted: G        W       4.9.26 #1                                                                                                        
[ 8909.706667] Hardware name: Freescale i.MX6 Ultralite (Device Tree)                                                                                                                  
[ 8909.712863] Backtrace:                                                                                                                                                              
[ 8909.715366] [<8010c4cc>] (dump_backtrace) from [<8010c770>] (show_stack+0x18/0x1c)                                                                                                  
[ 8909.722963]  r7:00000080 r6:ffffffff r5:20010093 r4:00000000                                                                                                                        
[ 8909.728651] [<8010c758>] (show_stack) from [<803facdc>] (dump_stack+0xac/0xe0)                                                                                                      
[ 8909.735906] [<803fac30>] (dump_stack) from [<8016bce8>] (print_usage_bug+0x1e4/0x2d8)                                                                                               
[ 8909.743764]  r10:00000002 r9:80a76ba8 r8:8152cf08 r7:00000008 r6:0000000a r5:80eae86c                                                                                               
[ 8909.751613]  r4:8e9ba4c0 r3:00000002                                                                                                                                                
[ 8909.755219] [<8016bb04>] (print_usage_bug) from [<8016c364>] (mark_lock+0x588/0x6d0)                                                                                                
[ 8909.762990]  r9:80d1fce0 r8:8016b168 r7:8e9ba4c0 r6:00000008 r5:8e9ba9c0 r4:0000000a                                                                                                
[ 8909.770763] [<8016bddc>] (mark_lock) from [<8016cd88>] (__lock_acquire+0x2f0/0x186c)                                                                                                
[ 8909.778534]  r10:00000002 r9:80d1fce0 r8:00000002 r7:814debd4 r6:8e9ba4c0 r5:8e9ba9c0                                                                                               
[ 8909.786383]  r4:000002d9 r3:00000004                                                                                                                                                
[ 8909.789988] [<8016ca98>] (__lock_acquire) from [<8016e6c0>] (lock_acquire+0x74/0x94)                                                                                                
[ 8909.797761]  r10:00000003 r9:00000006 r8:8e9ba4c0 r7:00000001 r6:00000001 r5:60010013                                                                                               
[ 8909.805608]  r4:00000000                                                                                                                                                            
[ 8909.808177] [<8016e64c>] (lock_acquire) from [<80864a64>] (mutex_lock_nested+0x58/0x474)                                                                                            
[ 8909.816292]  r7:814debd4 r6:803512f4 r5:00000000 r4:8e73c9e0                                                                                                                        
[ 8909.821983] [<80864a0c>] (mutex_lock_nested) from [<803512f4>] (jffs2_do_clear_inode+0x20/0x134)                                                                                    
[ 8909.830796]  r10:00000003 r9:00000006 r8:8dcb700c r7:8dcb7000 r6:8dc1c800 r5:8e73c9e0                                                                                               
[ 8909.838643]  r4:8e73ca40                                                                                                                                                            
[ 8909.841207] [<803512d4>] (jffs2_do_clear_inode) from [<803569b8>] (jffs2_evict_inode+0x34/0x38)                                                                                     
[ 8909.849930]  r7:8dcb7000 r6:80911564 r5:8dc1c800 r4:8e73ca40                                                                                                                        
[ 8909.855622] [<80356984>] (jffs2_evict_inode) from [<80243090>] (evict+0xa4/0x164)                                                                                                   
[ 8909.863125]  r5:8e73cb3c r4:8e73ca40                                                                                                                                                
[ 8909.866731] [<80242fec>] (evict) from [<8024318c>] (dispose_list+0x3c/0x4c)                                                                                                         
[ 8909.873717]  r7:8dcb7000 r6:00000009 r5:00000001 r4:8ea5fd30                                                                                                                        
[ 8909.879408] [<80243150>] (dispose_list) from [<80244388>] (prune_icache_sb+0x48/0x58)                                                                                               
[ 8909.887258]  r5:00000001 r4:8ea5fd30                                                                                                                                                
[ 8909.890868] [<80244340>] (prune_icache_sb) from [<80227cd0>] (super_cache_scan+0x150/0x1a0)                                                                                         
[ 8909.899240]  r5:8dcb74ec r4:8ea5fdc0                                                                                                                                                
[ 8909.902848] [<80227b80>] (super_cache_scan) from [<801e9cb8>] (shrink_slab.part.0.constprop.8+0x234/0x300)                                                                          
[ 8909.912531]  r10:00000000 r9:00000000 r8:80c53638 r7:8dcb74ec r6:00000400 r5:0000000d                                                                                               
[ 8909.920378]  r4:0000000d                                                                                                                                                            
[ 8909.922942] [<801e9a84>] (shrink_slab.part.0.constprop.8) from [<801ecb2c>] (shrink_node+0x73c/0x8bc)                                                                               
[ 8909.932188]  r10:80d53ba0 r9:8ea5fed0 r8:00000000 r7:00000007 r6:0000011b r5:8ea5fe44                                                                                               
[ 8909.940034]  r4:00000004                                                                                                                                                            
[ 8909.942595] [<801ec3f0>] (shrink_node) from [<801ed55c>] (kswapd+0x354/0x648)                                                                                                       
[ 8909.949758]  r10:8ea5e000 r9:80d53400 r8:00000000 r7:ffffffff r6:80d530c0 r5:00000000                                                                                               
[ 8909.957605]  r4:80d53400                                                                                                                                                            
[ 8909.960169] [<801ed208>] (kswapd) from [<801437ac>] (kthread+0xf8/0x114)                                                                                                            
[ 8909.966899]  r10:00000000 r9:00000000 r8:00000000 r7:801ed208 r6:80d53400 r5:8ea4e340                                                                                               
[ 8909.974746]  r4:00000000                                                                                                                                                            
[ 8909.977310] [<801436b4>] (kthread) from [<80107f30>] (ret_from_fork+0x14/0x24)                                                                                                      
[ 8909.984557]  r7:00000000 r6:00000000 r5:801436b4 r4:8ea4e340                                                                                                                        

I'm not fluent enough in lockdep to immediatly understand the problem,
so I wonder if this is already known and maybe even worked at before
spending time here.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
