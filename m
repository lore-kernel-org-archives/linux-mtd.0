Received: from hm8855-n-194.locaweb.com.br ([189.126.112.194])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzPMu-0000ZI-WC
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 13:35:22 +0000
Received: from mcbain0004.correio.biz (189.126.112.85) by
 hm8855-n-31.locaweb.com.br id h9n81i1un3gf for
 <linux-mtd@lists.infradead.org>;
 Thu, 19 Nov 2015 11:34:42 -0200 (envelope-from <ibrahim.neto@writesys.com.br>)
Subject: Re: can't mount ubifs after resizing with ubirsvol
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
Message-ID: <564DCFED.2070902@writesys.com.br>
Date: Thu, 19 Nov 2015 11:34:37 -0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
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

Hi Richard!

Thanks for the response.

What I did was:

1) I created an .ubi file using the following configuration.
[rootfs]
mode=ubi
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_alignment=1
image=rootfs.ubifs
vol_size=80MiB

[data]
mode=ubi
vol_id=1
vol_type=dynamic
vol_name=data
vol_alignment=1
vol_flags=autoresize
vol_size=10MiB

[recover]
mode=ubi
vol_id=2
vol_type=dynamic
vol_name=recover
vol_alignment=1
vol_size=5MiB

2) After booting I tried to shrink "data" and increase the size of 
recover using ubirsvol:

ubirsvol /dev/ubi0 -n 1 -s 4MiB    (data)

ubirsvol /dev/ubi0 -n 2 -s 15MiB (recover)

3) After the resizing I tried to mount "data"

mount /home/data/
[   88.510000] UBIFS error (ubi0:1 pid 668): validate_sb: bad LEB count: 
1159 in superblock, 34 on UBI volume, 20 minimum required
[   88.520000] UBIFS error (ubi0:1 pid 668): validate_sb: bad 
superblock, error 1
[   88.530000]  magic          0x6101831
[   88.530000]  crc            0xceeca05b
[   88.540000]  node_type      6 (superblock node)
[   88.540000]  group_type     0 (no node group)
[   88.550000]  sqnum          1
[   88.550000]  len            4096
[   88.550000]  key_hash       0 (R5)
[   88.560000]  key_fmt        0 (simple)
[   88.560000]  flags          0x0
[   88.560000]  big_lpt        0
[   88.570000]  space_fixup    0
[   88.570000]  min_io_size    2048
[   88.570000]  leb_size       126976
[   88.580000]  leb_cnt        1159
[   88.580000]  max_leb_cnt    1159
[   88.580000]  max_bud_bytes  6729728
[   88.590000]  log_lebs       4
[   88.590000]  lpt_lebs       2
[   88.590000]  orph_lebs      2
[   88.600000]  jhead_cnt      1
[   88.600000]  fanout         8
[   88.600000]  lsave_cnt      256
[   88.600000]  default_compr  1
[   88.610000]  rp_size        5242880
[   88.610000]  rp_uid         0
[   88.610000]  rp_gid         0
[   88.620000]  fmt_version    4
[   88.620000]  time_gran      1000000000
[   88.620000]  UUID 9A5BA9F3-D0AC-480D-8F5B-8BF723E8A517
mount: mounting /dev/ubi0_1 on /home/data failed: Invalid argument


4) Then I tried to mount "recover"

# mount /recover/
[   84.560000] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, 
PID 666
[   84.590000] UBIFS error (ubi0:2 pid 664): ubifs_read_node: bad node 
type (255 but expected 9)
[   84.600000] UBIFS error (ubi0:2 pid 664): ubifs_read_node: bad node 
at LEB 10:0, LEB mapping status 0
[   84.600000] Not a node, first 24 bytes:
[   84.610000] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ........................
[   84.620000] CPU: 0 PID: 664 Comm: mount Not tainted 4.2.6 #1
[   84.630000] Hardware name: Atmel SAMA5
[   84.630000] [<c0013e38>] (unwind_backtrace) from [<c0011d48>] 
(show_stack+0x10/0x14)
[   84.640000] [<c0011d48>] (show_stack) from [<c01a64b8>] 
(ubifs_read_node+0x290/0x30c)
[   84.650000] [<c01a64b8>] (ubifs_read_node) from [<c01aefc8>] 
(dbg_old_index_check_init+0x64/0xa4)
[   84.660000] [<c01aefc8>] (dbg_old_index_check_init) from [<c01a1b4c>] 
(ubifs_mount+0x2fc/0x17b0)
[   84.660000] [<c01a1b4c>] (ubifs_mount) from [<c0095f18>] 
(mount_fs+0x14/0xa4)
[   84.670000] [<c0095f18>] (mount_fs) from [<c00abe64>] 
(vfs_kern_mount+0x4c/0xf8)
[   84.680000] [<c00abe64>] (vfs_kern_mount) from [<c00ae6e8>] 
(do_mount+0x1a0/0xb28)
[   84.690000] [<c00ae6e8>] (do_mount) from [<c00af3cc>] 
(SyS_mount+0x90/0xc4)
[   84.690000] [<c00af3cc>] (SyS_mount) from [<c000f1a0>] 
(ret_fast_syscall+0x0/0x3c)
[   84.700000] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" stops


5) Just to gather some information

# ubinfo -a
UBI version:                    1
Count of UBI devices:           2
UBI control device major/minor: 10:59
Present UBI devices:            ubi0

ubi0
Volumes count:                           3
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     1902 (241508352 bytes, 230.3 MiB)
Amount of available logical eraseblocks: 1043 (132435968 bytes, 126.3 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       4
Count of reserved physical eraseblocks:  36
Current maximum erase counter value:     2
Minimum input/output unit size:          2048 bytes
Character device major/minor:            251:0
Present volumes:                         0, 1, 2

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        661 LEBs (83931136 bytes, 80.0 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 251:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        34 LEBs (4317184 bytes, 4.1 MiB)
State:       OK
Name:        data
Character device major/minor: 251:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        124 LEBs (15745024 bytes, 15.0 MiB)
State:       OK
Name:        recover
Character device major/minor: 251:3

===================================


This is all I managed  to get of information.
Did I forgot something?

Once again, thank you for your help!

--Ibrahim


On 18/11/2015 18:01, Richard Weinberger wrote:
> On Mon, Nov 9, 2015 at 3:04 PM, Ibrahim Mattus Neto
> <ibrahim.neto@writesys.com.br> wrote:
>> Hi!
>>
>> I am having problems resizing a ubifs volume, I used the command ubirsvol
>> (version: 1.5.1) but when I try mounting it I get the following error:
>>
>> [ 8840.450000] UBIFS error (ubi0:1 pid 720): validate_sb: bad LEB count: 413
>> in superblock, 331 on UBI volume, 19 minimum required
>> [ 8840.460000] UBIFS error (ubi0:1 pid 720): validate_sb: bad superblock,
>> error 1
>> [ 8840.470000]  magic          0x6101831
>> [ 8840.480000]  crc            0x539e8e1c
>> [ 8840.480000]  node_type      6 (superblock node)
>> [ 8840.480000]  group_type     0 (no node group)
>> [ 8840.490000]  sqnum          1
>> [ 8840.490000]  len            4096
>> [ 8840.490000]  key_hash       0 (R5)
>> [ 8840.500000]  key_fmt        0 (simple)
>> [ 8840.500000]  flags          0x0
>> [ 8840.500000]  big_lpt        0
>> [ 8840.510000]  space_fixup    0
>> [ 8840.510000]  min_io_size    2048
>> [ 8840.510000]  leb_size       126976
>> [ 8840.520000]  leb_cnt        413
>> [ 8840.520000]  max_leb_cnt    413
>> [ 8840.520000]  max_bud_bytes  2158592
>> [ 8840.530000]  log_lebs       3
>> [ 8840.530000]  lpt_lebs       2
>> [ 8840.530000]  orph_lebs      2
>> [ 8840.540000]  jhead_cnt      1
>> [ 8840.540000]  fanout         8
>> [ 8840.540000]  lsave_cnt      256
>> [ 8840.540000]  default_compr  1
>> [ 8840.550000]  rp_size        2558566
>> [ 8840.550000]  rp_uid         0
>> [ 8840.550000]  rp_gid         0
>> [ 8840.560000]  fmt_version    4
>> [ 8840.560000]  time_gran      1000000000
>> [ 8840.560000]  UUID           B1F16610-EEDF-471F-B5AD-279F21C00729
>> mount: mounting ubi0:recover on /recover failed: Invalid argument
>>
>> I was reading through the archives and found a similar issue but no
>> solution, is there a way to shrink a volume?
>>
>> I was thinking about changing the LEB count inside the superblock but I
>> didn't know how to (and thought it would be too risky)
> Please more details. :)
> What exactly did you do?
>
