Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 May 2010 19:37:24 +0100
Message-ID: <1274207844.6930.7754.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-14 at 14:12 +0200, Joakim Tjernlund wrote:
> +/* erase.c */
> +static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
> +{
> +       jffs2_garbage_collect_trigger(c);
> +} 

Hrm, and now everything which calls jffs2_erase_pending_trigger() needs
_not_ to be holding c->erase_completion_lock, or it'll deadlock...

Eraseblock at 0x001c0000 completely dirtied. Removing from (dirty?) list...                                                                                                      
...and adding to erase_pending_list                                                                                                                                              
                                                                                                                                                                                 
=============================================                                                                                                                                    
[ INFO: possible recursive locking detected ]                                                                                                                                    
2.6.34-rc7 #2                                                                                                                                                                    
---------------------------------------------                                                                                                                                    
dbench/4263 is trying to acquire lock:                                                                                                                                           
 (&(&c->erase_completion_lock)->rlock){+.+...}, at: [<ffffffffa011ae0e>] jffs2_garbage_collect_trigger+0x19/0x4e [jffs2]                                                         
                                                                                                                                                                                 
but task is already holding lock:                                                                                                                                                
 (&(&c->erase_completion_lock)->rlock){+.+...}, at: [<ffffffffa01115cd>] jffs2_mark_node_obsolete+0xcb/0x737 [jffs2]                                                             
                                                                                                                                                                                 
other info that might help us debug this:                                                                                                                                        
5 locks held by dbench/4263:                                                                                                                                                     
 #0:  (&sb->s_type->i_mutex_key#12){+.+.+.}, at: [<ffffffff8107aeda>] generic_file_aio_write+0x47/0xa8                                                                           
 #1:  (&c->alloc_sem){+.+.+.}, at: [<ffffffffa011239f>] jffs2_reserve_space+0x71/0x39e [jffs2]                                                                                   
 #2:  (&f->sem){+.+.+.}, at: [<ffffffffa0115c73>] jffs2_write_inode_range+0xb0/0x2f3 [jffs2]                                                                                     
 #3:  (&c->erase_free_sem){+.+...}, at: [<ffffffffa01115b6>] jffs2_mark_node_obsolete+0xb4/0x737 [jffs2]                                                                         
 #4:  (&(&c->erase_completion_lock)->rlock){+.+...}, at: [<ffffffffa01115cd>] jffs2_mark_node_obsolete+0xcb/0x737 [jffs2]                                                        
                                                                                                                                                                                 
stack backtrace:                                                                                                                                                                 
Pid: 4263, comm: dbench Not tainted 2.6.34-rc7 #2                                                                                                                                
Call Trace:                                                                                                                                                                      
 [<ffffffff8105d40b>] __lock_acquire+0x1633/0x16cd                                                                                                                               
 [<ffffffff8105a16f>] ? trace_hardirqs_off+0xd/0xf                                                                                                                               
 [<ffffffff814d6d71>] ? mutex_lock_nested+0x2c7/0x31a                                                                                                                            
 [<ffffffff8105b1c7>] ? trace_hardirqs_on_caller+0x10c/0x130                                                                                                                     
 [<ffffffff8105d4fc>] lock_acquire+0x57/0x6d                                                                                                                                     
 [<ffffffffa011ae0e>] ? jffs2_garbage_collect_trigger+0x19/0x4e [jffs2]                                                                                                          
 [<ffffffff814d7fdd>] _raw_spin_lock+0x3b/0x4a                                                                                                                                   
 [<ffffffffa011ae0e>] ? jffs2_garbage_collect_trigger+0x19/0x4e [jffs2]                                                                                                          
 [<ffffffffa011ae0e>] jffs2_garbage_collect_trigger+0x19/0x4e [jffs2]                                                                                                            
 [<ffffffffa01118a9>] jffs2_mark_node_obsolete+0x3a7/0x737 [jffs2]                                                                                                               
 [<ffffffff814d4e51>] ? printk+0x3c/0x3e                                                                                                                                         
 [<ffffffffa011022c>] jffs2_obsolete_node_frag+0x2a/0x48 [jffs2]                                                                                                                 
 [<ffffffffa01108e9>] jffs2_add_full_dnode_to_inode+0x2f3/0x3cc [jffs2]                                                                                                          
 [<ffffffffa0115dc6>] jffs2_write_inode_range+0x203/0x2f3 [jffs2]                                                                                                                
 [<ffffffffa010f94e>] jffs2_write_end+0x176/0x25b [jffs2]                                                                                                                        
 [<ffffffff810790ca>] generic_file_buffered_write+0x188/0x282                                                                                                                    

-- 
dwmw2
