Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHjOI-00082f-Lt
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 18:32:32 +0000
Received: from [10.9.9.162] (helo=pepper.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LHjO9-0007OQ-Q0
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 19:32:21 +0100
Received: from [74.94.155.203] (helo=[192.168.12.139])
	by pepper.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LHjO8-0005UV-HF
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 19:32:21 +0100
Message-ID: <495A6931.9030108@runbox.com>
Date: Tue, 30 Dec 2008 13:32:17 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
Content-Type: multipart/mixed; boundary="------------050403040907060106010102"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050403040907060106010102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I had back ported ubifs_shrinker and it does get called from 
__alloc_pages as it should.

Here's a failing case:

If /var/log is on the nand, and I do a (cd /var/log; tar -cvf 
/someotherdevice.tar .) I notice ubifs_shrinker get called. nr is 128, 
and clean_zn_cnt starts out at 1500 or so. But after tar has run a bit, 
clean_zn_cnt bobbles around 400 or so. If I then kill the tar, and wait 
about a minuite, clean_zn_cnt makes it back up to the 1500.

The system I'm running on may not have enough memory to support PEAK 
UBIFS demands.

Where is the code that recycles the memory? Is it the per file system 
daemons that get created on mount? How can I change the memory hold 
timers in UBIFS so it'll let go a lot earlier?

I can't get it to crash when the CONFIG_DEBUG_SLAB_LEAK is on as the 
system runs that much slower.

Attched are cats of proc/slabinfo.txt and slab_allocators.txt

Cal Page



--------------050403040907060106010102
Content-Type: text/plain;
 name="slab_allocators.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="slab_allocators.txt"

ubifs_inode_slab: 214 ubifs_alloc_inode+0x1c/0x5c
UNIX: 9 sk_alloc+0x2c/0x124
ip_conntrack: 29 ip_conntrack_alloc+0x1d8/0x294
ubi_wl_entry_slab: 385 ubi_wl_init_scan+0x130/0x360
ubi_wl_entry_slab: 7802 ubi_wl_init_scan+0x238/0x360
cfq_ioc_pool: 8 cfq_set_request+0x41c/0x45c
cfq_pool: 5 cfq_get_queue+0xa0/0x1ec
journal_head: 5 journal_add_journal_head+0x3c/0x1e0
revoke_table: 1 journal_init_revoke+0x70/0x244
revoke_table: 1 journal_init_revoke+0x138/0x244
ext3_inode_cache: 84 ext3_alloc_inode+0x1c/0x44
inotify_watch_cache: 1 sys_inotify_add_watch+0xe4/0x198
shmem_inode_cache: 898 shmem_alloc_inode+0x1c/0x34
tcp_bind_bucket: 8 inet_bind_bucket_create+0x20/0x58
inet_peer_cache: 1 inet_getpeer+0xd8/0x23c
ip_fib_alias: 10 fn_hash_insert+0x4fc/0x6d4
ip_fib_hash: 10 fn_hash_insert+0x520/0x6d4
ip_dst_cache: 68 dst_alloc+0x44/0xc0
arp_cache: 5 neigh_create+0x1f4/0x5c8
RAW: 2 sk_alloc+0x2c/0x124
UDP: 20 sk_alloc+0x2c/0x124
TCP: 10 sk_alloc+0x2c/0x124
sgpool-128: 32 mempool_alloc_slab+0x1c/0x20
sgpool-64: 32 mempool_alloc_slab+0x1c/0x20
sgpool-32: 32 mempool_alloc_slab+0x1c/0x20
sgpool-16: 32 mempool_alloc_slab+0x1c/0x20
sgpool-8: 32 mempool_alloc_slab+0x1c/0x20
blkdev_ioc: 8 current_io_context+0x34/0x7c
blkdev_queue: 10 blk_alloc_queue_node+0x1c/0x9c
blkdev_requests: 8 mempool_alloc_slab+0x1c/0x20
biovec-256: 1 mempool_alloc_slab+0x1c/0x20
biovec-128: 1 mempool_alloc_slab+0x1c/0x20
biovec-64: 2 mempool_alloc_slab+0x1c/0x20
biovec-16: 4 mempool_alloc_slab+0x1c/0x20
biovec-4: 4 mempool_alloc_slab+0x1c/0x20
biovec-1: 4 mempool_alloc_slab+0x1c/0x20
bio: 256 mempool_alloc_slab+0x1c/0x20
sock_inode_cache: 51 sock_alloc_inode+0x1c/0x60
proc_inode_cache: 173 proc_alloc_inode+0x20/0x84
radix_tree_node: 393 radix_tree_node_alloc+0x24/0x60
radix_tree_node: 7 radix_tree_preload+0x54/0xb8
bdev_cache: 2 bdev_alloc_inode+0x1c/0x34
sysfs_dir_cache: 3965 sysfs_new_dirent+0x24/0x7c
mnt_cache: 22 alloc_vfsmnt+0x20/0xd4
inode_cache: 2076 alloc_inode+0x38/0x10c
dentry_cache: 3421 d_alloc+0x24/0x1b0
filp: 336 get_empty_filp+0x68/0x150
idr_layer_cache: 109 idr_pre_get+0x24/0x5c
buffer_head: 27 alloc_buffer_head+0x1c/0x78
mm_struct: 15 mm_alloc+0x1c/0x48
mm_struct: 9 copy_process+0x914/0x12c8
vm_area_struct: 251 copy_process+0xa28/0x12c8
vm_area_struct: 287 split_vma+0x40/0x120
vm_area_struct: 15 do_brk+0x158/0x214
vm_area_struct: 393 do_mmap_pgoff+0x374/0x750
vm_area_struct: 15 setup_arg_pages+0x78/0x18c
fs_cache: 23 copy_process+0x4b4/0x12c8
files_cache: 24 dup_fd+0x30/0x304
signal_cache: 43 copy_process+0x73c/0x12c8
sighand_cache: 42 copy_process+0x698/0x12c8
sighand_cache: 1 flush_old_exec+0x60/0x938
anon_vma: 334 anon_vma_prepare+0x58/0x118
pid: 97 alloc_pid+0x20/0x30c
size-2048: 1 camera_init+0x1c/0x314
size-2048: 1 netlink_proto_init+0x30/0x178
size-2048: 1 xt_init+0x1c/0x9c
size-2048: 1 journal_init_revoke+0xd4/0x244
size-2048: 1 journal_init_revoke+0x1b8/0x244
size-2048: 1 journal_init_inode+0x6c/0x138
size-2048: 2 ubifs_fill_super+0x34/0x18a0
size-2048: 6 ubifs_wbuf_init+0x20/0xe4
size-2048: 2 ubifs_read_master+0x20/0xe1c
size-2048: 4 alloc_tty_struct+0x1c/0x24
size-2048: 1 tty_write+0xd8/0x234
size-2048: 1 nand_scan_bbt+0x58/0x480
size-2048: 1 ubi_attach_mtd_dev+0xdc/0x9f4
size-2048: 1 input_allocate_device+0x1c/0x84
size-2048: 3 neigh_sysctl_register+0x30/0x1f8
size-2048: 1 xt_alloc_table_info+0x64/0xa4
size-2048: 3 devinet_sysctl_register+0x2c/0x120
size-1024: 1 xt_dccp_init+0x1c/0x64
size-1024: 1 mempool_create_node+0x4c/0xd8
size-1024: 5 alloc_fd_array+0x24/0x34
size-1024: 6 ubifs_lpt_init+0x78/0x9dc
size-1024: 2 ubifs_lpt_init+0xb0/0x9dc
size-1024: 1 ipc_rcu_alloc+0x60/0x6c
size-1024: 2 tty_buffer_request_room+0xd4/0x164
size-1024: 3 tty_write+0xd8/0x234
size-1024: 1 tty_register_driver+0x44/0x1cc
size-1024: 2 kobj_map_init+0x24/0x9c
size-1024: 2 video_device_alloc+0x1c/0x24
size-1024: 2 ubi_read_volume_table+0x3ac/0x8b0
size-1024: 1 ubi_read_volume_table+0x5cc/0x8b0
size-1024: 1 usb_alloc_dev+0x2c/0x1bc
size-1024: 2 mxci2c_probe+0x2c/0x234
size-1024: 2 snd_card_new+0x30/0x210
size-1024: 1 alloc_netdev+0x3c/0x90
size-1024: 3 xt_alloc_table_info+0x64/0xa4
size-512: 1 mt9v111_init+0x48/0x94
size-512: 1 mxcnd_probe+0x28/0x2cc
size-512: 1 mxc_alsa_audio_probe+0x48/0x1a8
size-512: 1 inet_init+0x12c/0x354
size-512: 1 inet_init+0x140/0x354
size-512: 1 __vmalloc_area_node+0x70/0x15c
size-512: 18 sget+0x1a4/0x3bc
size-512: 7 alloc_pipe_info+0x20/0x48
size-512: 2 alloc_wbufs+0x24/0xcc
size-512: 6 ubifs_wbuf_init+0x4c/0xe4
size-512: 2 cfq_init_queue+0x20/0x190
size-512: 1 fbcon_startup+0x16c/0x3d8
size-512: 6 alloc_tty_driver+0x20/0x4c
size-512: 4 set_inverse_transl+0x3c/0xa0
size-512: 3 platform_device_alloc+0x24/0x64
size-512: 1 mx_wm8974_detect+0x3c/0x110
size-512: 2 probe_hwif+0x1b8/0x7dc
size-512: 1 usb_create_hcd+0x28/0xd0
size-512: 1 usb_set_configuration+0xd4/0x3a0
size-512: 1 usb_get_configuration+0xa8/0xc44
size-512: 2 usb_create_ep_files+0xa8/0x1cc
size-512: 1 mmc_alloc_host_sysfs+0x20/0x5c
size-512: 19 snd_timer_new+0x34/0x124
size-512: 2 snd_pcm_new+0x38/0x104
size-512: 10 sk_alloc+0x38/0x124
size-512: 1 xt_alloc_table_info+0x64/0xa4
size-256: 4 param_sysfs_setup+0x74/0x134
size-256: 1 __jbd_kmalloc+0x20/0x24
size-256: 2 ubifs_fill_super+0x598/0x18a0
size-256: 11 dirty_cow_znode+0xc4/0x20c
size-256: 1631 tnc_insert+0x294/0x700
size-256: 234 ubifs_load_znode+0x6c/0x7a4
size-256: 2 elevator_alloc+0x7c/0xdc
size-256: 21 alloc_disk_node+0x20/0xa0
size-256: 1 alloc_disk_node+0x4c/0xa0
size-256: 2 cfq_init_queue+0x98/0x190
size-256: 1 uart_register_driver+0x34/0x178
size-256: 1 init_irq+0x1e0/0x5c4
size-256: 12 add_mtd_partitions+0x48/0x540
size-256: 1 hub_probe+0x94/0x618
size-256: 18 snd_pcm_new_stream+0x128/0x398
size-256: 1 qdisc_alloc+0x24/0xa8
size-192: 1 mt9v111_init+0x20/0x94
size-192: 2 fib_hash_init+0x80/0x104
size-192: 1 groups_alloc+0x44/0xe8
size-192: 7 param_sysfs_setup+0x74/0x134
size-192: 8 mempool_kmalloc+0x1c/0x20
size-192: 97 alloc_arraycache+0x24/0x40
size-192: 1 ext3_fill_super+0xb0/0x1314
size-192: 1 con_clear_unimap+0x54/0xcc
size-192: 2 cn_queue_add_callback+0x2c/0x1ac
size-192: 651 class_device_create+0x40/0xc4
size-192: 18 class_create+0x24/0x74
size-192: 1 cfi_cmdset_0002+0x2c/0x530
size-192: 2 inetdev_init+0x4c/0x150
size-192: 6 fib_create_info+0x288/0x97c
size-128: 1 inet_init+0x174/0x354
size-128: 1 inet_init+0x188/0x354
size-128: 5 mempool_create_node+0x4c/0xd8
size-128: 12 __vmalloc_area_node+0x70/0x15c
size-128: 14 alloc_arraycache+0x24/0x40
size-128: 224 proc_create+0x90/0xd4
size-128: 1067 ubifs_get_pnode+0x64/0x25c
size-128: 11 ubifs_lpt_lookup_dirty+0x120/0x314
size-128: 941 ubifs_lpt_scan_nolock+0x2c8/0x484
size-128: 3 ipc_rcu_alloc+0x60/0x6c
size-128: 3 con_insert_unipair+0x40/0xd8
size-128: 24 con_insert_unipair+0x8c/0xd8
size-128: 1 mtd_do_chip_probe+0x13c/0x2e4
size-128: 16 snd_ctl_new+0x2c/0x80
size-128: 1 neigh_hash_alloc+0x20/0x4c
size-128: 1 netlink_kernel_create+0x88/0x164
size-96: 1 rtnetlink_init+0x48/0xdc
size-96: 1 inet_init+0x150/0x354
size-96: 1 inet_init+0x164/0x354
size-96: 1 inet_diag_init+0x1c/0x80
size-96: 7 param_sysfs_setup+0x74/0x134
size-96: 17 cdev_alloc+0x1c/0x4c
size-96: 29 __register_chrdev_region+0x2c/0x16c
size-96: 478 proc_create+0x90/0xd4
size-96: 2 __jbd_kmalloc+0x20/0x24
size-96: 37 tnc_read_node_nm+0x1e8/0x228
size-96: 37 dirty_cow_nnode+0x68/0x16c
size-96: 471 ubifs_read_nnode+0x5c/0x184
size-96: 169 ubifs_lpt_scan_nolock+0x24c/0x484
size-96: 2 ipc_rcu_alloc+0x60/0x6c
size-96: 2 elevator_alloc+0x20/0xdc
size-96: 1 tty_register_driver+0x44/0x1cc
size-96: 10 dma_pool_create+0x88/0x19c
size-96: 1 usb_alloc_urb+0x18/0x4c
size-96: 1 evdev_connect+0x64/0x10c
size-96: 134 snd_info_create_entry+0x20/0xa8
size-96: 6 snd_mixer_oss_build_input+0x3d8/0x530
size-96: 2 neigh_parms_alloc+0x24/0xfc
size-96: 5 ip_mc_inc_group+0x70/0x24c
size-64: 30 kernel_param_sysfs_setup+0x2c/0x94
size-64: 1 spi_register_board_info+0x28/0xc0
size-64: 1 alsa_timer_init+0x80/0x190
size-64: 1 inet_init+0x198/0x354
size-64: 1 inet_init+0x1ac/0x354
size-64: 9 __create_workqueue+0x3c/0x110
size-64: 12 param_sysfs_setup+0x74/0x134
size-64: 2 __vmalloc_area_node+0x70/0x15c
size-64: 3 init_list+0x28/0x108
size-64: 10 alloc_arraycache+0x24/0x40
size-64: 90 do_tune_cpucache+0x1c8/0x2a8
size-64: 28 kmem_cache_create+0x4c8/0x608
size-64: 15 d_alloc+0x50/0x1b0
size-64: 5 expand_files+0x94/0x2cc
size-64: 4 seq_open+0x34/0x90
size-64: 1 inotify_init+0x20/0x8c
size-64: 1 sys_inotify_init+0x7c/0x220
size-64: 50 ext3_init_block_alloc_info+0x24/0x68
size-64: 4 ubifs_symlink+0x150/0x2a8
size-64: 14 tnc_read_node_nm+0x1e8/0x228
size-64: 2 load_msg+0x40/0x1a4
size-64: 1 __crypto_alloc_tfm+0xa4/0x1d0
size-64: 44 kobject_add_dir+0x28/0x80
size-64: 4 kmp_init+0x2c/0xd0
size-64: 1 fb_add_videomode+0x54/0xb4
size-64: 1 soft_cursor+0x78/0x1c4
size-64: 3 init_dev+0x15c/0x56c
size-64: 3 init_dev+0x1b0/0x56c
size-64: 1 init_dev+0x244/0x56c
size-64: 1 init_dev+0x294/0x56c
size-64: 1 kbd_connect+0x68/0xa0
size-64: 1 cn_queue_alloc_dev+0x24/0x98
size-64: 2 uart_open+0xb4/0x510
size-64: 1 platform_device_add_resources+0x2c/0x58
size-64: 1 dma_pool_alloc+0xc4/0x27c
size-64: 30 __ide_add_setting+0x7c/0x17c
size-64: 164 scsi_dev_info_list_add+0x30/0x100
size-64: 12 mtdblock_add_mtd+0x24/0x64
size-64: 1 cfi_probe_chip+0xdc/0x49c
size-64: 1 mxcflash_probe+0x30/0x16c
size-64: 170 ubi_wl_get_peb+0x24/0x24c
size-64: 2 usb_cache_string+0x64/0x9c
size-64: 1 usb_get_configuration+0x634/0xc44
size-64: 1 usb_get_configuration+0x820/0xc44
size-64: 5 device_ioctl+0x1c0/0x798
size-64: 6 sound_insert_unit+0x38/0x18c
size-64: 3 dev_mc_add+0x2c/0x184
size-64: 1 neigh_table_init_no_netlink+0x78/0x1a4
size-64: 1 neigh_table_init_no_netlink+0xe0/0x1a4
size-64: 4 neigh_resolve_output+0x10c/0x2a8
size-64: 5 xt_alloc_table_info+0x3c/0xa4
size-64: 2 inet_alloc_ifa+0x1c/0x34
size-64: 4 fz_hash_alloc+0x20/0x48
size-64: 1 unix_bind+0x84/0x2b8
size-32: 1 mnt_init+0x14c/0x244
size-32: 3 ipc_init_proc_interface+0x2c/0x80
size-32: 1 loop_init+0x8c/0x28c
size-32: 1 mxc_ide_init+0x6c/0x380
size-32: 1 spi_init+0x1c/0x8c
size-32: 32 netlink_proto_init+0x90/0x178
size-32: 1 inet_init+0x1bc/0x354
size-32: 1 inet_init+0x1d0/0x354
size-32: 31 __dma_alloc+0x1f4/0x450
size-32: 19 __request_region+0x2c/0xcc
size-32: 12 register_sysctl_table+0x24/0xe0
size-32: 9 __create_workqueue+0x24/0x110
size-32: 3 set_acceptable_latency+0x24/0x144
size-32: 3 set_acceptable_latency+0x3c/0x144
size-32: 22 request_irq+0x64/0xb8
size-32: 15 mempool_create_node+0x2c/0xd8
size-32: 9 mempool_create_node+0x4c/0xd8
size-32: 2 set_shrinker+0x24/0x78
size-32: 26 __get_vm_area_node+0x98/0x1e0
size-32: 7 __vmalloc_area_node+0x70/0x15c
size-32: 4 shmem_fill_super+0xd4/0x1c4
size-32: 41 cache_alloc_refill+0x49c/0x770
size-32: 121 alloc_arraycache+0x24/0x40
size-32: 10 alloc_fdset+0x30/0x40
size-32: 22 alloc_vfsmnt+0xb0/0xd4
size-32: 1 single_open+0x28/0x8c
size-32: 1 bioset_create+0x28/0xd4
size-32: 4 proc_symlink+0x58/0xb4
size-32: 890 sysfs_create_link+0x8c/0x134
size-32: 890 sysfs_create_link+0xac/0x134
size-32: 1 ext3_fill_super+0x6c0/0x1314
size-32: 15 insert_old_idx+0x28/0xe0
size-32: 3 ubifs_replay_journal+0x724/0x1178
size-32: 261 ubifs_add_bud_to_log+0x30/0x580
size-32: 2 ubifs_lpt_init+0x54/0x9dc
size-32: 2 dbg_failure_mode_registration+0x20/0xc0
size-32: 4 copy_semundo+0x48/0x94
size-32: 1 sys_semtimedop+0x258/0x768
size-32: 2 sys_semtimedop+0x340/0x768
size-32: 20 register_blkdev+0x74/0x124
size-32: 1 kmp_init+0x2c/0xd0
size-32: 1 fb_alloc_cmap+0x44/0xd4
size-32: 1 fb_alloc_cmap+0x5c/0xd4
size-32: 1 fb_alloc_cmap+0x74/0xd4
size-32: 1 bit_cursor+0x30c/0x4b0
size-32: 21 rand_initialize_disk+0x20/0x3c
size-32: 5 device_add+0x118/0x4b0
size-32: 649 class_device_add+0x110/0x444
size-32: 1 platform_device_add_data+0x24/0x4c
size-32: 2 kobj_map_init+0x34/0x9c
size-32: 53 kobj_map+0x50/0x114
size-32: 11 dma_pool_alloc+0xc4/0x27c
size-32: 1 mx_wm8974_detect+0x6c/0x110
size-32: 30 __ide_add_setting+0x98/0x17c
size-32: 1 ide_disk_probe+0x4c/0x15c
size-32: 1 register_mtd_blktrans+0x38/0x1f4
size-32: 1 cfi_read_pri+0x58/0xd4
size-32: 1 cfi_cmdset_0002+0x38c/0x530
size-32: 2 ubi_open_volume+0x5c/0x240
size-32: 1 ubi_eba_init_scan+0x88/0x270
size-32: 1 hub_probe+0x134/0x618
size-32: 1 hub_probe+0x158/0x618
size-32: 1 usb_cache_string+0x64/0x9c
size-32: 1 usb_get_configuration+0xc8/0xc44
size-32: 1 usb_get_configuration+0x1d8/0xc44
size-32: 1 usb_create_ep_files+0x48/0x1cc
size-32: 1 mxc_kpp_probe+0x1d8/0x438
size-32: 1 mxc_kpp_probe+0x1ec/0x438
size-32: 6 mxc_kpp_probe+0x220/0x438
size-32: 6 mxc_kpp_probe+0x238/0x438
size-32: 1 mxc_kpp_probe+0x288/0x438
size-32: 1 mxc_kpp_probe+0x2a0/0x438
size-32: 2 i2cdev_attach_adapter+0x40/0x134
size-32: 1 sah_Queue_Construct+0x1c/0x38
size-32: 1 sah_Queue_Manager_Init+0x1c/0x74
size-32: 1 sah_Init_Mem_Map+0x20/0xa0
size-32: 9 vpu_ioctl+0x50/0x414
size-32: 7 snd_register_device+0x34/0x17c
size-32: 134 snd_info_create_entry+0x38/0xa8
size-32: 1 snd_ctl_register_ioctl+0x20/0x70
size-32: 22 snd_device_new+0x2c/0x84
size-32: 4 snd_register_oss_device+0x50/0x174
size-32: 5 snd_oss_info_register+0x58/0x98
size-32: 4 sock_kmalloc+0x5c/0x90
size-32: 1 proto_register+0x7c/0x200
size-32: 1 proto_register+0xfc/0x200
size-32: 3 neigh_sysctl_register+0x16c/0x1f8
size-32: 1 netlink_alloc_groups+0xd8/0xfc
size-32: 8 netlink_kernel_create+0x88/0x164
size-32: 1 genl_register_family+0xe4/0x168
size-32: 3 devinet_sysctl_register+0x94/0x120
size-32: 2 fib_hash_alloc+0x1c/0x44
size-32: 1 fz_hash_alloc+0x20/0x48
size-32: 5 fn_hash_insert+0x4c/0x6d4
size-32: 10 xfrm_hash_alloc+0x20/0x94
size-32: 2 unix_bind+0x84/0x2b8

--------------050403040907060106010102
Content-Type: text/plain;
 name="slabinfo.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="slabinfo.txt"

slabinfo - version: 2.1 (statistics)
# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> : slabdata <active_slabs> <num_slabs> <sharedavail> : globalstat <listallocs> <maxobjs> <grown> <reaped> <error> <maxfreeable> <nodeallocs> <remotefrees> <alienoverflow> : cpustat <allochit> <allocmiss> <freehit> <freemiss>
jbd_4k                 0      0   4096    1    1 : tunables   24   12    0 : slabdata      0      0      0 : globalstat      84      7    72   72 				   0    0    0    0    0 : cpustat   2122     79   2201      0
ubifs_inode_slab     213    220    380   10    1 : tunables   32   16    0 : slabdata     22     22      0 : globalstat    2057    270    27    1 				   0    1    0    0    0 : cpustat   1362    181   1302     28
UNIX                   9     10    368   10    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      69     10     1    0 				   0    0    0    0    0 : cpustat    147     43    181      0
ipt_hashlimit          0      0     52   72    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
ip_conntrack_expect      0      0    116   33    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
ip_conntrack          35     48    248   16    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat    1831     64     4    1 				   0    0    0    0    0 : cpustat    732    120    818      0
flow_cache             0      0     92   42    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
ubi_wl_entry_slab   8187   8249     32  113    1 : tunables   32   16    0 : slabdata     73     73      0 : globalstat    8200   8200    73    0 				   0    0    0    0    0 : cpustat   7607    580      0      0
cfq_ioc_pool          23     40     96   40    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     352     24     1    0 				   0    0    0    0    0 : cpustat     40     22     54      0
cfq_pool              20     36    108   36    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     368     21     1    0 				   0    0    0    0    0 : cpustat     27     23     45      0
jffs2_inode_cache      0      0     36  101    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_node_frag        0      0     36  101    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_refblock         0      0    264   15    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_tmp_dnode        0      0     44   84    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_raw_inode        0      0     80   48    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_raw_dirent       0      0     52   72    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_full_dnode       0      0     28  127    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
jffs2_i                0      0    348   11    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
fat_inode_cache        0      0    356   11    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
fat_cache              0      0     32  113    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
journal_handle        16    113     32  113    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     208     16    13   12 				   0    0    0    0    0 : cpustat 330174     13 330187      0
journal_head          20     59     64   59    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat  169648   4709  1084    7 				   0    1    0    0    0 : cpustat 187750  10961 188118  10585
revoke_table           2    145     24  145    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      16     16     1    0 				   0    0    0    0    0 : cpustat      1      1      0      0
revoke_record          0      0     28  127    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat     128     32     7    7 				   0    0    0    0    0 : cpustat     91      8     99      0
ext3_inode_cache      98    180    428    9    1 : tunables   32   16    0 : slabdata     20     20      0 : globalstat    1013    585    66    6 				   0    3    0    0    0 : cpustat    961     99    928     49
dnotify_cache          0      0     32  113    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
eventpoll_pwq          0      0     48   78    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
eventpoll_epi          0      0     92   42    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
inotify_event_cache      0      0     40   92    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
inotify_watch_cache      1     72     52   72    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      16     16     1    0 				   0    0    0    0    0 : cpustat      0      1      0      0
kioctx                 0      0    168   23    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
kiocb                  0      0    144   27    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
fasync_cache           0      0     28  127    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
shmem_inode_cache    898    900    396   10    1 : tunables   32   16    0 : slabdata     90     90      0 : globalstat     921    900    90    0 				   0    0    0    0    0 : cpustat   1494     94    690      0
posix_timers_cache      0      0     96   40    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
uid_cache              0      0     56   67    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
tcp_bind_bucket        8    127     28  127    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      80     23     1    0 				   0    0    0    0    0 : cpustat     20      5     17      0
inet_peer_cache        1     67     56   67    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      32     17     1    0 				   0    0    0    0    0 : cpustat      0      2      1      0
secpath_cache          0      0     44   84    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
xfrm_dst_cache         0      0    272   14    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
ip_fib_alias          10    101     36  101    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      32     21     1    0 				   0    0    0    0    0 : cpustat      8      2      0      0
ip_fib_hash           10    113     32  113    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      32     21     1    0 				   0    0    0    0    0 : cpustat      8      2      0      0
ip_dst_cache          83     96    248   16    1 : tunables   32   16    0 : slabdata      6      6      0 : globalstat    1841     96     7    0 				   0    0    0    0    0 : cpustat    379    137    436     12
arp_cache              6     29    136   29    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     591     29     1    0 				   0    0    0    0    0 : cpustat     24     37     55      0
RAW                    2      8    452    8    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      14      8     1    0 				   0    0    0    0    0 : cpustat     31      2     31      0
UDP                   20     24    460    8    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat     255     24     4    1 				   0    0    0    0    0 : cpustat    186     59    225      0
tw_sock_TCP            0      0    108   36    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat     272     16    17   17 				   0    0    0    0    0 : cpustat      0     17     17      0
request_sock_TCP       0      0     72   53    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat     288     16    18   18 				   0    0    0    0    0 : cpustat      1     18     19      0
TCP                   10     14   1064    7    2 : tunables   24   12    0 : slabdata      2      2      0 : globalstat      32     14     2    0 				   0    0    0    0    0 : cpustat     38      6     34      0
sgpool-128            32     33   2060    3    2 : tunables   24   12    0 : slabdata     11     11      0 : globalstat      33     33    11    0 				   0    0    0    0    0 : cpustat     21     11      0      0
sgpool-64             32     35   1036    7    2 : tunables   24   12    0 : slabdata      5      5      0 : globalstat      35     35     5    0 				   0    0    0    0    0 : cpustat     27      5      0      0
sgpool-32             32     35    524    7    1 : tunables   32   16    0 : slabdata      5      5      0 : globalstat      35     35     5    0 				   0    0    0    0    0 : cpustat     27      5      0      0
sgpool-16             32     42    268   14    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat      42     42     3    0 				   0    0    0    0    0 : cpustat     29      3      0      0
sgpool-8              32     56    140   28    1 : tunables   32   16    0 : slabdata      2      2      0 : globalstat      44     44     2    0 				   0    0    0    0    0 : cpustat     29      3      0      0
scsi_io_context        0      0    116   33    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
blkdev_ioc            23     92     40   92    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     352     24     1    0 				   0    0    0    0    0 : cpustat     41     22     54      0
blkdev_queue          10     12    952    4    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat      12     12     3    0 				   0    0    0    0    0 : cpustat      7      3      0      0
blkdev_requests       21     21    188   21    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     683     63     8    5 				   0    0    0    0    0 : cpustat  10712     50  10737     17
biovec-256             1      2   3084    2    2 : tunables   24   12    0 : slabdata      1      1      0 : globalstat       2      2     1    0 				   0    0    0    0    0 : cpustat      0      1      0      0
biovec-128             1      5   1548    5    2 : tunables   24   12    0 : slabdata      1      1      0 : globalstat       5      5     1    0 				   0    0    0    0    0 : cpustat      0      1      0      0
biovec-64              2      5    780    5    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat       5      5     1    0 				   0    0    0    0    0 : cpustat      1      1      0      0
biovec-16              4     19    204   19    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      16     16     1    0 				   0    0    0    0    0 : cpustat      3      1      0      0
biovec-4               4     63     60   63    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      16     16     1    0 				   0    0    0    0    0 : cpustat      3      1      0      0
biovec-1              20    145     24  145    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat  107638   2142   170    1 				   0    1    0    0    0 : cpustat 158510   6835 158646   6695
bio                  272    300     76   50    1 : tunables   32   16    0 : slabdata      6      6      0 : globalstat  107234   2382   687    2 				   0    1    0    0    0 : cpustat 158478   7119 158687   6654
sock_inode_cache      51     55    340   11    1 : tunables   32   16    0 : slabdata      5      5      0 : globalstat     294     55     5    0 				   0    0    0    0    0 : cpustat    442     63    454      0
skbuff_fclone_cache      5     12    328   12    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     617     12    41   40 				   0    0    0    0    0 : cpustat   2091     52   2143      0
skbuff_head_cache     17     46    168   23    1 : tunables   32   16    0 : slabdata      2      2      0 : globalstat     464    177    13    2 				   0    1    0    0    0 : cpustat 361926     36 361936     26
file_lock_cache        0      0    104   37    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat     832     19    21   21 				   0    0    0    0    0 : cpustat   5660     52   5712      0
proc_inode_cache     180    180    320   12    1 : tunables   32   16    0 : slabdata     15     15      0 : globalstat    1671    192    60    7 				   0    1    0    0    0 : cpustat   3044    135   2986     24
sigqueue               0      0    156   25    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat     288     16    18   18 				   0    0    0    0    0 : cpustat    370     18    388      0
radix_tree_node      401    624    288   13    1 : tunables   32   16    0 : slabdata     48     48      0 : globalstat    3913    715    55    0 				   0    0    0    0    0 : cpustat  10265    268   9989    147
bdev_cache             2      9    404    9    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      25      9     1    0 				   0    0    0    0    0 : cpustat      0      3      1      0
sysfs_dir_cache     3965   4020     56   67    1 : tunables   32   16    0 : slabdata     60     60      0 : globalstat    4009   3969    60    0 				   0    0    0    0    0 : cpustat   3742    298     75      0
mnt_cache             22     31    124   31    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat      73     31     1    0 				   0    0    0    0    0 : cpustat     18      5      1      0
inode_cache         2084   2106    304   13    1 : tunables   32   16    0 : slabdata    162    162      0 : globalstat    3572   2912   226   13 				   0    2    0    0    0 : cpustat   2872    272   1024     45
dentry_cache        3430   3752    140   28    1 : tunables   32   16    0 : slabdata    134    134      0 : globalstat   11115   4412   159    0 				   0    1    0    0    0 : cpustat  24311    738  21251    383
filp                 350    504    140   28    1 : tunables   32   16    0 : slabdata     18     18      0 : globalstat   11935    812    47    0 				   0    0    0    0    0 : cpustat 271314    759 271024    717
names_cache            5      5   4096    1    1 : tunables   24   12    0 : slabdata      5      5      0 : globalstat      20      5    16   11 				   0    0    0    0    0 : cpustat 317273     19 317292      0
idr_layer_cache      109    130    148   26    1 : tunables   32   16    0 : slabdata      5      5      0 : globalstat     154    124     5    0 				   0    0    0    0    0 : cpustat    103     12      6      0
buffer_head           31    354     64   59    1 : tunables   32   16    0 : slabdata      6      6      0 : globalstat  115254   8984   396    1 				   0    0    0    0    0 : cpustat 157199   7328 157412   7093
mm_struct             30     30    396   10    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat     565     30     3    0 				   0    0    0    0    0 : cpustat   3009     82   3067      0
vm_area_struct       960   1080     96   40    1 : tunables   32   16    0 : slabdata     27     27      0 : globalstat   29710   1072    47    8 				   0    1    0    0    0 : cpustat  69580   1880  68835   1666
fs_cache              38     84     44   84    1 : tunables   32   16    0 : slabdata      1      1      0 : globalstat     992     40     1    0 				   0    0    0    0    0 : cpustat   2805     62   2844      0
files_cache           39     60    196   20    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat    1088     96     5    1 				   0    1    0    0    0 : cpustat   2797     71   2838      6
signal_cache          55     55    352   11    1 : tunables   32   16    0 : slabdata      5      5      0 : globalstat     825     55     5    0 				   0    0    0    0    0 : cpustat   2823     68   2848      0
sighand_cache         48     48   1296    3    1 : tunables   24   12    0 : slabdata     16     16      0 : globalstat     459     51    17    1 				   0    0    0    0    0 : cpustat   2800     91   2848      0
task_struct          102    102    672    6    1 : tunables   32   16    0 : slabdata     17     17      0 : globalstat     695    102    28    7 				   0    5    0    0    0 : cpustat   2935    120   2954      5
anon_vma             342    507     20  169    1 : tunables   32   16    0 : slabdata      3      3      0 : globalstat    2378    362     5    2 				   0    1    0    0    0 : cpustat   9952    151   9734     37
pid                  112    156     48   78    1 : tunables   32   16    0 : slabdata      2      2      0 : globalstat    1374    117     2    0 				   0    0    0    0    0 : cpustat   2969     86   2952      6
size-131072(DMA)       0      0 131072    1   32 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-131072            0      0 131072    1   32 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       2      1     2    2 				   0    0    0    0    0 : cpustat      2      2      4      0
size-65536(DMA)        0      0  65536    1   16 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-65536             3      3  65536    1   16 : tunables    8    4    0 : slabdata      3      3      0 : globalstat       3      3     3    0 				   0    0    0    0    0 : cpustat      0      3      0      0
size-32768(DMA)        0      0  32768    1    8 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-32768             3      3  32768    1    8 : tunables    8    4    0 : slabdata      3      3      0 : globalstat       7      4     5    2 				   0    0    0    0    0 : cpustat     11      7     15      0
size-16384(DMA)        0      0  16384    1    4 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-16384             0      0  16384    1    4 : tunables    8    4    0 : slabdata      0      0      0 : globalstat     202      3   111  111 				   0    0    0    0    0 : cpustat  32238    186  32424      0
size-8192(DMA)         0      0   8192    1    2 : tunables    8    4    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-8192              1      1   8192    1    2 : tunables    8    4    0 : slabdata      1      1      0 : globalstat      57      5    47   46 				   0    0    0    0    0 : cpustat 165148     57 165204      0
size-4096(DMA)         0      0   4096    1    1 : tunables   24   12    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-4096             24     24   4096    1    1 : tunables   24   12    0 : slabdata     24     24      0 : globalstat     126     26   119   95 				   0    0    0    0    0 : cpustat   2011    126   2114      0
size-2048(DMA)         0      0   2060    3    2 : tunables   24   12    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-2048             36     36   2060    3    2 : tunables   24   12    0 : slabdata     12     12      0 : globalstat      44     36    13    1 				   0    0    0    0    0 : cpustat 143931     16 143916      0
size-1024(DMA)         0      0   1036    7    2 : tunables   24   12    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-1024             59     70   1036    7    2 : tunables   24   12    0 : slabdata     10     10      0 : globalstat     363    203    47    6 				   0    3    0    0    0 : cpustat 169242     55 169236     23
size-512(DMA)          0      0    524    7    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-512             117    133    524    7    1 : tunables   32   16    0 : slabdata     19     19      0 : globalstat     249    133    19    0 				   0    0    0    0    0 : cpustat  63934     29  63860      7
size-256(DMA)          0      0    268   14    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-256            1909   1918    268   14    1 : tunables   32   16    0 : slabdata    137    137      0 : globalstat   53871   3052   751    2 				   0    2    0    0    0 : cpustat  74463   3523  72885   3192
size-192(DMA)          0      0    204   19    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-192             815    817    204   19    1 : tunables   32   16    0 : slabdata     43     43      0 : globalstat    1723    816    66   23 				   0    0    0    0    0 : cpustat  77408    147  76757      0
size-128(DMA)          0      0    140   28    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-128            2325   2352    140   28    1 : tunables   32   16    0 : slabdata     84     84      0 : globalstat    3989   2343    85    1 				   0    0    0    0    0 : cpustat   3137    304   1116      0
size-96(DMA)           0      0    108   36    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-96             1430   1512    108   36    1 : tunables   32   16    0 : slabdata     42     42      0 : globalstat    3610   1492    43    1 				   0    1    0    0    0 : cpustat   8933    261   7713     66
size-64(DMA)           0      0     76   50    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-32(DMA)           0      0     44   84    1 : tunables   32   16    0 : slabdata      0      0      0 : globalstat       0      0     0    0 				   0    0    0    0    0 : cpustat      0      0      0      0
size-64              768   1250     76   50    1 : tunables   32   16    0 : slabdata     25     25      0 : globalstat   11765   8666   188    0 				   0    0    0    0    0 : cpustat 497437    936 496932    686
size-32             3539   4284     44   84    1 : tunables   32   16    0 : slabdata     51     51      0 : globalstat   46009  23232   445    1 				   0    0    0    0    0 : cpustat  55423   3262  52563   2599
kmem_cache           120    120    160   24    1 : tunables   32   16    0 : slabdata      5      5      0 : globalstat     121    120     5    0 				   0    0    0    0    0 : cpustat     81     39      0      0

--------------050403040907060106010102--
