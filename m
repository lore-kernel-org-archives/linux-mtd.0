Received: from lilly.ping.de ([83.97.42.2])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN3oE-0006aG-Lw
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 13:30:25 +0000
Date: Mon, 29 Nov 2010 14:18:07 +0100
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS oops after remount ro
Message-ID: <20101129131807.GB23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290785057.2552.14.camel@localhost>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I can now reproduce the Oops with CONFIG_UBIFS_FS_DEBUG and your
patch. However, I had to manually apply the hunks because my tree
seems to differ enough for patch to not apply it automatically...

My observations so far:
- I have to re-flash the whole UBI image, simply removing the
  directory that is created with the script is not sufficient
  to trigger the Oops on subsequent re-start.
  My guess is that not only the single remount r/w->r/o  cycle
  from the first script is needed but the complete sequence of
  2 r/w->modify->r/o "cycles" currently in my startup scripts.
  Hopefully it's not really depending on filesystem internal state...
- I have to power cycle the board after flashing.
  (I flash from an NFS-root system) Simply issuing a reboot from
  the NFS-root system does result in a clean restart. When stopping
  the boot progress in the U-Boot prompt and issuing 'reset' from
  there sometimes also triggers the Oops on the following re-start
  with the newly flashed image, but doing a power cycle gave a 100%
  chance to get the oops in my tests.

The inode in question is always the same, but I guess this is not
a surprise as I always start with the same UBI Image?

I have to think about this a bit, still having no clue what is
going on and not too much a clue about what I am looking for either,
so sorry for just posting this weird information...

Regards,
Wolfgang

Here's the oops in the current state with all debugging output:

qqq: kupdated for ubifs
qqq: writing inode 3298
Unable to handle kernel NULL pointer dereference at virtual address 000000ac
pgd = c0004000
[000000ac] *pgd=00000000
Internal error: Oops: 817 [#1] PREEMPT
last sysfs file: /sys/devices/virtual/net/lo/flags
Modules linked in:
CPU: 0    Not tainted  (2.6.32-svn21303 #3)
PC is at mutex_lock+0x4/0x14
LR is at make_reservation+0x74/0x6b0
pc : [<c038cd20>]    lr : [<c015d23c>]    psr: 60000013
sp : df061d28  ip : df82e150  fp : 000000ac
r10: 00000000  r9 : 00000000  r8 : 00000001
r7 : 00000088  r6 : df82e000  r5 : df4f8310  r4 : df060000
r3 : 00000000  r2 : 00000000  r1 : df061d28  r0 : 000000ac
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005397f  Table: 1f090000  DAC: 00000017
Process flush-ubifs_0_1 (pid: 552, stack limit = 0xdf060270)
Stack: (0xdf061d28 to 0xdf062000)
1d20:                   00000001 c002d058 00000000 dfb4a07c 00000080 00000000
1d40: df82e14c 000000a0 00000088 00000001 00000000 dfa1c600 00000000 df82e000
1d60: df4f8310 000000a0 00000000 00000000 00000000 dfa1c600 00000000 c015de84
1d80: c05b2798 00000002 c05b2840 00000000 df922680 00000021 df4f8310 00000001
1da0: df82e000 df4f8458 00000010 00000000 00000000 c0166dd0 df4f8310 00000001
1dc0: 00000b2d c099eb40 00000010 df4f8310 df060000 c0162310 c099eb40 df061f10
1de0: df4f83ac df4f83ac 00000000 c099eb40 df82e008 ffffffff 00000400 df061e3c
1e00: 00000000 c00899f4 df061f10 c008a3a4 0000000e df979900 df4f83ac 00000000
1e20: 00000001 00000001 00000001 c00899e0 df4f83ac 00000000 00000009 00000001
1e40: 00000000 c099eb40 df978030 c04d1290 8f468953 c04d177c 0000000a c05b2798
1e60: 0000000a 00000018 00000017 c0206b44 0000000a c0503cfe c05b2798 00000001
1e80: 0000000a df4f8310 df061f10 df061f10 00000000 df4f83ac 00000000 00000007
1ea0: df82e090 c00cfb64 20000013 df82e068 df061f10 df060000 df4f8310 df82e088
1ec0: 00000000 c00d0868 00000000 dfa8a840 00000000 ffff9cc8 00000007 df4f84a0
1ee0: df4f8318 dfa8a800 df978000 df060000 df061f70 df82e068 00000000 df82e090
1f00: 00000014 df82e008 00000000 c00d0a94 df82e008 00000000 00000000 df061f4c
1f20: 00000400 00000000 00000000 00000000 00000000 00000000 00000014 00000000
1f40: 00000000 df82e0a8 00000000 ffff9110 00000000 df82e068 df061f70 0000092e
1f60: 00000000 00000000 df82e0a8 c00d0dd0 0000092e 00000000 00000000 00000003
1f80: c0048bd4 000001f4 ffff8c14 df82e068 df82e068 00000000 00000000 00000000
1fa0: 00000000 c00d0e1c df060000 df82e008 df82e068 c0098fe0 00000000 df8d9f40
1fc0: df061fd4 c0098f54 df82e068 c00543bc 00000000 00000000 df061fd8 df061fd8
1fe0: 00000000 00000000 00000000 00000000 00000000 c002744c 00000000 00000000
[<c038cd20>] (mutex_lock+0x4/0x14) from [<c015d23c>] (make_reservation+0x74/0x6b0)
[<c015d23c>] (make_reservation+0x74/0x6b0) from [<c015de84>] (ubifs_jnl_write_inode+0xfc/0x270)
[<c015de84>] (ubifs_jnl_write_inode+0xfc/0x270) from [<c0166dd0>] (ubifs_write_inode+0x110/0x19c)
[<c0166dd0>] (ubifs_write_inode+0x110/0x19c) from [<c0162310>] (ubifs_writepage+0x234/0x284)
[<c0162310>] (ubifs_writepage+0x234/0x284) from [<c00899f4>] (__writepage+0x14/0x64)
[<c00899f4>] (__writepage+0x14/0x64) from [<c008a3a4>] (write_cache_pages+0x234/0x384)
[<c008a3a4>] (write_cache_pages+0x234/0x384) from [<c00cfb64>] (writeback_single_inode+0xd8/0x238)
[<c00cfb64>] (writeback_single_inode+0xd8/0x238) from [<c00d0868>] (writeback_inodes_wb+0x3d4/0x4a8)
[<c00d0868>] (writeback_inodes_wb+0x3d4/0x4a8) from [<c00d0a94>] (wb_writeback+0x158/0x1ec)
[<c00d0a94>] (wb_writeback+0x158/0x1ec) from [<c00d0dd0>] (wb_do_writeback+0x1c4/0x1f0)
[<c00d0dd0>] (wb_do_writeback+0x1c4/0x1f0) from [<c00d0e1c>] (bdi_writeback_task+0x20/0x98)
[<c00d0e1c>] (bdi_writeback_task+0x20/0x98) from [<c0098fe0>] (bdi_start_fn+0x8c/0x100)
[<c0098fe0>] (bdi_start_fn+0x8c/0x100) from [<c00543bc>] (kthread+0x7c/0x84)
[<c00543bc>] (kthread+0x7c/0x84) from [<c002744c>] (kernel_thread_exit+0x0/0x8)
Code: ebfffd21 e28dd014 e8bd80f0 e3a03000 (e1001093) 
---[ end trace 60c4657087d3ea99 ]---

And here is the complete console log in case I missed some
important information:

UBIFS: mounted UBI device 0, volume 1, name "rootfs_live"
UBIFS: mounted read-only
UBIFS: file system size:   65802240 bytes (64260 KiB, 62 MiB, 510 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
Freeing init memory: 120K
UBIFS: mounted UBI device 0, volume 2, name "configfiles"
UBIFS: mounted read-only
UBIFS: file system size:   9160704 bytes (8946 KiB, 8 MiB, 71 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: mounted UBI device 0, volume 3, name "configfilesdefault"
UBIFS: mounted read-only
UBIFS: file system size:   9160704 bytes (8946 KiB, 8 MiB, 71 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: mounted UBI device 0, volume 4, name "userdata"
UBIFS: mounted read-only
UBIFS: file system size:   9160704 bytes (8946 KiB, 8 MiB, 71 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)
  PID USER       VSZ STAT COMMAND
    1 root      3284 S    init       
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqqqq: ubifs_remount_rw
d/0]
    4 root[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
         0 SW   [<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
[watchdog/0]
  [<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
  5 root        [<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
 0 SW   [events/[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
0]
    6 root         0 SW   [khelper]
    9 root         0 SW   [async/mgr]
  139 root         0 SW   [sync_supers]
  141 root         0 SWUBIFS DBG (pid 547): ubifs_bg_thread: background thread "ubifs_bgt0_1" started, PID 547
   [bdi-default]
  143 root         0 SW   [kblockd/0]
  150 root         0 SW   [ata/0]
  151 root         0 SW   [ata_aux]
  159 root         0 SW   [khubd]
  162 root         0 SW   [kseriod]
  165 root         0 SW   [kmmcd]
  185 root         0 SW   [rpciod/0]
  193 root         0 SW   [khungtaskd]
  194 root         0 SW   [kswapd0]
  243 root         0 SW   [aio/0]
  251 root         0 SW   [nfsiod]
  257 rootqqq: wb work for ubifs
         0 SW   qqq: wb work for ubifs
[crypto/0]
  39qqq: kupdated for ubifs
7 root         0 SW   [scsi_eh_0]
  400 root         0 SW   [scsi_eh_1]
  407 root         0 SW   [mtdblockd]
  432 root         0 SW   [ubi_bgt0d]
  433 root         0 SW   [spi_gpio.0]
  490 root         0 SW   [mv_crypto]
  527 root         0 SW   [usbhid_resumerqqq: wb work for ubifs
]
  537 root   qqq: kupdated for ubifs
   2344 S    /biqqq: wb work for ubifs
n/sh /etc/init.dqqq: kupdated for ubifs
/rcS 
  545 root      3288 R    ps 
adjusting modules
qqq: wb work for ubifs
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 547): ubifs_bg_thread: background thread "ubifs_bgt0_1" stops
  PID USER       VSZ STAT COMMAND
    1 root      3284 S    init       
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [watchdog/0]
    5 root         0 SW   [events/0]
    6 root         0 SW   [khelper]
    9 root         0 SW   [async/mgr]
  139 root         0 SW   [sync_supers]
  141 root         0 SW   [bdi-default]
  143 root         0 SW   [kblockd/0]
  150 root         0 SW   [ata/0]
  151 root         0 SW   [ata_aux]
  159 root         0 SW   [khubd]
  162 root         0 SW   [kseriod]
  165 root         0 SW   [kmmcd]
  185 root         0 SW   [rpciod/0]
  193 root         0 SW   [khungtaskd]
  194 root         0 SW   [kswapd0]
  243 root         0 SW   [aio/0]
  251 root         0 SW   [nfsiod]
  257 rqqq: ubifs_remount_rw
oot         0 SW[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
   [crypto/0]
 [<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
 397 root       [<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
  0 SW   [scsi_e[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
h_0]
  400 root[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
         0 SW   [scsi_eh_1]
  407 root         0 SW   [mtdblockd]
  432 root         0 SW   [ubi_bgt0d]
  433 root         0 SW   [spi_gpio.0UBIFS DBG (pid 563): ubifs_bg_thread: background thread "ubifs_bgt0_2" started, PI3
]
  490 root         0 SW   [mv_crypto]
  527 qqq: ubifs_remount_rw
root         0 SW   [usbhid_resu[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89)
mer]
  537 root[<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
      2344 S    [<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
/bin/sh /etc/ini[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
t.d/rcS 
  552 [<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
root         0 SW   [flush-ubifs_0_1]
  555 root      3288 R    ps 
/etc/localconfig/deviceid exists: 454d32e8-397e-4c33-9356-5595c550b07b
/etc/localconfig/dUBIFS DBG (pid 565): ubifs_bg_thread: background thread "ubifs_bgt0_3" started, PID 565
isplayid exists: 454d32e8-397e-4c33-9356-5595c550b07b
Warning! remounting /etc/localconfig rw!
Warning! remounting /etc/localconfigdefault rw!
new /etc/localconfig/hostname:Artista_0A:D6:13
Warning! remounting /etc/localconfigdefault ro!
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 565): ubifs_bg_thread: background thread "ubifs_bgt0_3" stops
Warning! remounting /etc/localconfig ro!
qqq: wb work for ubifs
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 563): ubifs_bg_thread: background thread "ubifs_bgt0_2" stops
Setting up network interfaces...
##################### Setting up network #####################
Setting up loopback device...done
Setting hostname to Artista_0A:D6:13...Setting up network interface eth0...
given parameter is:  static
cat: can't open '/etc/localconfig//nameserver': No such file or directory
cat: can't open '/etc/localconfig//domain': No such file or directory
Using static configuration for eth0
        IP Address:     192.168.2.16
        Netmask:        255.255.255.0
        Nameserver:
        Hostname:       Artista_0A:D6:13
        Domain:
        Gateway:        192.168.2.10
deleting routes...
route: SIOCDELRT: No such process
adding routes
qqq: ubifs_remount_rw
[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
[<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
[<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
UBIFS DBG (pid 597): ubifs_bg_thread: background thread "ubifs_bgt0_2" started, PID 597
qqq: wb work for ubifs
qqq: kupdated for ubifs
eth0: link up, 1000 Mb/s, full duplex, flow control disabled
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 597): ubifs_bg_thread: background thread "ubifs_bgt0_2" stops
set value gateway to 
192.168.2.10
cat: can't open '/etc/localconfig//domain': No such file or directory
cat: can't open '/etc/localconfig//resolv.conf': No such file or directory
cat: can't open '/etc/localconfig//host.conf': No such file or dqqq: ubifs_remount_rw
irectory
[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
[<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
[<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
UBIFS DBG (pid 606): ubifs_bg_thread: background thread "ubifs_bgt0_2" started, PID 606
qqq: wb work for ubifs
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 606): ubifs_bg_thread: background thread "ubifs_bgt0_2" stops
set value host.conf to multi on
cat: can't open '/etc/localconfig//hosts': No such file or direcqqq: ubifs_remount_rw
tory
[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
[<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
[<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
UBIFS DBG (pid 612): ubifs_bg_thread: background thread "ubifs_bgt0_2" started, PID 612
qqq: wb work for ubifs
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
UBIFS DBG (pid 612): ubifs_bg_thread: background thread "ubifs_bgt0_2" stops
set value hosts to #/etc/hosts
127.0.0.1 localhost
127.0.1.1 Artista_0A:D6:13
Interface eth0 is set up
##################### Network is set up #####################
done
Starting udev/mdev...
done
Starting dbus...
done
Starting hal...
done
Starting webserver...
 mini_httpd started
done
Starting ftp server...
chmod: /opt/persistent/shows/push: Read-only file system
link /var/www/.htpasswd exists
Warning! remounting / rw!
qqq: ubifs_remount_rw
[<c002b91c>] (unwind_backtrace+0x0/0xd0) from [<c0165e40>] (ubifs_remount_fs+0x138/0x89c)
[<c0165e40>] (ubifs_remount_fs+0x138/0x89c) from [<c00b449c>] (do_remount_sb+0xa4/0xe0)
[<c00b449c>] (do_remount_sb+0xa4/0xe0) from [<c00cbde8>] (do_mount+0x20c/0x74c)
[<c00cbde8>] (do_mount+0x20c/0x74c) from [<c00cc3ac>] (sys_mount+0x84/0xc4)
[<c00cc3ac>] (sys_mount+0x84/0xc4) from [<c0026a00>] (ret_fast_syscall+0x0/0x28)
warning: `proftpd' uses 32-bit capabilities (legacy support in use)
UBIFS DBG (pid 702): ubifs_bg_thread: background thread "ubifs_bgt0_1" started, PID 702
link /var/www/cgi-bin/.htpasswd was created
Warning! remountingqqq: wb work for ubifs
 / ro!
qqq: kupdated for ubifs
qqq: wb work for ubifs
qqq: kupdated for ubifs
done
WARNING: starting telnetd! (only for lab usage!)
UBIFS DBG (pid 702): ubifs_bg_thread: background thread "ubifs_bgt0_1" stops
done
starting netclient
done
socket: Address family not supported by protocol
/sbin/mini_httpd: started as root without requesting chroot(), warning only
sh-3.2# qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: kupdated for ubifs
qqq: writing inode 3298
Unable to handle kernel NULL pointer dereference at virtual address 000000ac
pgd = c0004000
[000000ac] *pgd=00000000
Internal error: Oops: 817 [#1] PREEMPT
last sysfs file: /sys/devices/virtual/net/lo/flags
Modules linked in:
CPU: 0    Not tainted  (2.6.32-svn21303 #3)
PC is at mutex_lock+0x4/0x14
LR is at make_reservation+0x74/0x6b0
pc : [<c038cd20>]    lr : [<c015d23c>]    psr: 60000013
sp : df061d28  ip : df82e150  fp : 000000ac
r10: 00000000  r9 : 00000000  r8 : 00000001
r7 : 00000088  r6 : df82e000  r5 : df4f8310  r4 : df060000
r3 : 00000000  r2 : 00000000  r1 : df061d28  r0 : 000000ac
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005397f  Table: 1f090000  DAC: 00000017
Process flush-ubifs_0_1 (pid: 552, stack limit = 0xdf060270)
Stack: (0xdf061d28 to 0xdf062000)
1d20:                   00000001 c002d058 00000000 dfb4a07c 00000080 00000000
1d40: df82e14c 000000a0 00000088 00000001 00000000 dfa1c600 00000000 df82e000
1d60: df4f8310 000000a0 00000000 00000000 00000000 dfa1c600 00000000 c015de84
1d80: c05b2798 00000002 c05b2840 00000000 df922680 00000021 df4f8310 00000001
1da0: df82e000 df4f8458 00000010 00000000 00000000 c0166dd0 df4f8310 00000001
1dc0: 00000b2d c099eb40 00000010 df4f8310 df060000 c0162310 c099eb40 df061f10
1de0: df4f83ac df4f83ac 00000000 c099eb40 df82e008 ffffffff 00000400 df061e3c
1e00: 00000000 c00899f4 df061f10 c008a3a4 0000000e df979900 df4f83ac 00000000
1e20: 00000001 00000001 00000001 c00899e0 df4f83ac 00000000 00000009 00000001
1e40: 00000000 c099eb40 df978030 c04d1290 8f468953 c04d177c 0000000a c05b2798
1e60: 0000000a 00000018 00000017 c0206b44 0000000a c0503cfe c05b2798 00000001
1e80: 0000000a df4f8310 df061f10 df061f10 00000000 df4f83ac 00000000 00000007
1ea0: df82e090 c00cfb64 20000013 df82e068 df061f10 df060000 df4f8310 df82e088
1ec0: 00000000 c00d0868 00000000 dfa8a840 00000000 ffff9cc8 00000007 df4f84a0
1ee0: df4f8318 dfa8a800 df978000 df060000 df061f70 df82e068 00000000 df82e090
1f00: 00000014 df82e008 00000000 c00d0a94 df82e008 00000000 00000000 df061f4c
1f20: 00000400 00000000 00000000 00000000 00000000 00000000 00000014 00000000
1f40: 00000000 df82e0a8 00000000 ffff9110 00000000 df82e068 df061f70 0000092e
1f60: 00000000 00000000 df82e0a8 c00d0dd0 0000092e 00000000 00000000 00000003
1f80: c0048bd4 000001f4 ffff8c14 df82e068 df82e068 00000000 00000000 00000000
1fa0: 00000000 c00d0e1c df060000 df82e008 df82e068 c0098fe0 00000000 df8d9f40
1fc0: df061fd4 c0098f54 df82e068 c00543bc 00000000 00000000 df061fd8 df061fd8
1fe0: 00000000 00000000 00000000 00000000 00000000 c002744c 00000000 00000000
[<c038cd20>] (mutex_lock+0x4/0x14) from [<c015d23c>] (make_reservation+0x74/0x6b0)
[<c015d23c>] (make_reservation+0x74/0x6b0) from [<c015de84>] (ubifs_jnl_write_inode+0xfc/0x270)
[<c015de84>] (ubifs_jnl_write_inode+0xfc/0x270) from [<c0166dd0>] (ubifs_write_inode+0x110/0x19c)
[<c0166dd0>] (ubifs_write_inode+0x110/0x19c) from [<c0162310>] (ubifs_writepage+0x234/0x284)
[<c0162310>] (ubifs_writepage+0x234/0x284) from [<c00899f4>] (__writepage+0x14/0x64)
[<c00899f4>] (__writepage+0x14/0x64) from [<c008a3a4>] (write_cache_pages+0x234/0x384)
[<c008a3a4>] (write_cache_pages+0x234/0x384) from [<c00cfb64>] (writeback_single_inode+0xd8/0x238)
[<c00cfb64>] (writeback_single_inode+0xd8/0x238) from [<c00d0868>] (writeback_inodes_wb+0x3d4/0x4a8)
[<c00d0868>] (writeback_inodes_wb+0x3d4/0x4a8) from [<c00d0a94>] (wb_writeback+0x158/0x1ec)
[<c00d0a94>] (wb_writeback+0x158/0x1ec) from [<c00d0dd0>] (wb_do_writeback+0x1c4/0x1f0)
[<c00d0dd0>] (wb_do_writeback+0x1c4/0x1f0) from [<c00d0e1c>] (bdi_writeback_task+0x20/0x98)
[<c00d0e1c>] (bdi_writeback_task+0x20/0x98) from [<c0098fe0>] (bdi_start_fn+0x8c/0x100)
[<c0098fe0>] (bdi_start_fn+0x8c/0x100) from [<c00543bc>] (kthread+0x7c/0x84)
[<c00543bc>] (kthread+0x7c/0x84) from [<c002744c>] (kernel_thread_exit+0x0/0x8)
Code: ebfffd21 e28dd014 e8bd80f0 e3a03000 (e1001093) 
---[ end trace 60c4657087d3ea99 ]---
qqq: kupdated for ubifs
qqq: kupdated for ubifs
