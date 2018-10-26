Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG70v-0007v1-Q1
 for linux-mtd@lists.infradead.org; Fri, 26 Oct 2018 18:39:19 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id F155740A5ED
 for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2018 11:39:01 -0700 (PDT)
To: linux-mtd@lists.infradead.org
From: Ben Greear <greearb@candelatech.com>
Subject: read-only FS with error -2
Message-ID: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
Date: Fri, 26 Oct 2018 11:39:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I did something to my OpenWRT system (running 4.14.78 + 4.19 backports kernel),
and it went read-only.  Upon reboot, it is still read-only.  Is there something
I can to do debug and/or fix this?

root@LF-R7800-6ab8:/home/lanforge# dmesg|grep -i ubif
[   11.595662] UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 143
[   11.674298] UBIFS (ubi0:1): recovery needed
[   12.028518] UBIFS (ubi0:1): recovery completed
[   12.028598] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
[   12.031847] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   12.039815] UBIFS (ubi0:1): FS size: 83042304 bytes (79 MiB, 654 LEBs), journal size 4190208 bytes (3 MiB, 33 LEBs)
[   12.049711] UBIFS (ubi0:1): reserved for root: 3922293 bytes (3830 KiB)
[   12.059957] UBIFS (ubi0:1): media format: w4/r0 (latest is w5/r0), UUID 036CCB1F-5608-4069-B5A0-D22544398634, small LPT model
[   12.085050] mount_root: switching to ubifs overlay
[   31.942522] UBIFS error (ubi0:1 pid 570): ubifs_iget: failed to read inode 1623, error -2
[   31.942588] UBIFS error (ubi0:1 pid 570): ubifs_lookup: dead directory entry 'dhcpd', error -2
[   31.949813] UBIFS warning (ubi0:1 pid 570): ubifs_ro_mode.part.0: switched to read-only mode, error -2
[   31.985721] [<c0782b58>] (dump_stack) from [<c0472824>] (ubifs_lookup+0x2d8/0x394)
[   31.992757] [<c0472824>] (ubifs_lookup) from [<c03f70b0>] (lookup_slow+0xe0/0x15c)
[   31.152936] kmodloader: done loading kernel modules from /etc/modules.d/*


And the backtrace in question:

....
[   31.387880] Unsafe core_pattern used with fs.suid_dumpable=2.
[   31.387880] Pipe handler or fully qualified core dump path required.
[   31.387880] Set kernel.core_pattern before fs.suid_dumpable.
[   31.942522] UBIFS error (ubi0:1 pid 570): ubifs_iget: failed to read inode 1623, error -2
[   31.942588] UBIFS error (ubi0:1 pid 570): ubifs_lookup: dead directory entry 'dhcpd', error -2
[   31.949813] UBIFS warning (ubi0:1 pid 570): ubifs_ro_mode.part.0: switched to read-only mode, error -2
[   31.958326] CPU: 1 PID: 570 Comm: sh Not tainted 4.14.78 #0
[   31.967477] Hardware name: Generic DT based system
[   31.972987] [<c030f58c>] (unwind_backtrace) from [<c030b7a4>] (show_stack+0x14/0x20)
[   31.977827] [<c030b7a4>] (show_stack) from [<c0782b58>] (dump_stack+0x88/0x9c)
[   31.985721] [<c0782b58>] (dump_stack) from [<c0472824>] (ubifs_lookup+0x2d8/0x394)
[   31.992757] [<c0472824>] (ubifs_lookup) from [<c03f70b0>] (lookup_slow+0xe0/0x15c)
[   32.000309] [<c03f70b0>] (lookup_slow) from [<c03f8a84>] (lookup_one_len_unlocked+0xe8/0x104)
[   32.007866] [<c03f8a84>] (lookup_one_len_unlocked) from [<c049f6f8>] (ovl_lookup_single+0x28/0x2dc)
[   32.016457] [<c049f6f8>] (ovl_lookup_single) from [<c049f9fc>] (ovl_lookup_layer+0x50/0x178)
[   32.025308] [<c049f9fc>] (ovl_lookup_layer) from [<c049ffb8>] (ovl_lookup+0xac/0x670)
[   32.033988] [<c049ffb8>] (ovl_lookup) from [<c03f70b0>] (lookup_slow+0xe0/0x15c)
[   32.041711] [<c03f70b0>] (lookup_slow) from [<c03f9644>] (walk_component+0x108/0x2fc)
[   32.049175] [<c03f9644>] (walk_component) from [<c03f9ee0>] (path_lookupat+0x164/0x1e4)
[   32.056904] [<c03f9ee0>] (path_lookupat) from [<c03fbca8>] (filename_lookup+0x90/0xf0)
[   32.064725] [<c03fbca8>] (filename_lookup) from [<c03f1314>] (vfs_statx+0x68/0xcc)
[   32.072704] [<c03f1314>] (vfs_statx) from [<c03f1ad8>] (SyS_stat64+0x2c/0x50)
[   32.080257] [<c03f1ad8>] (SyS_stat64) from [<c0307e60>] (ret_fast_syscall+0x0/0x54)
....

Any help will be appreciated!

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
