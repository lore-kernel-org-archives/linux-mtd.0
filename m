Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSHlD-0006HE-VU
 for linux-mtd@lists.infradead.org; Tue, 04 Jul 2017 06:56:39 +0000
Subject: Re: ubifs error after power-cut
To: zhouwarcraft@sina.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>
References: <20170704061551.B6D4481000E5@webmail.sinamail.sina.com.cn>
From: Richard Weinberger <richard@nod.at>
Message-ID: <febf67f4-7e1d-3aa8-5003-0b4283a8cb4a@nod.at>
Date: Tue, 4 Jul 2017 08:56:07 +0200
MIME-Version: 1.0
In-Reply-To: <20170704061551.B6D4481000E5@webmail.sinamail.sina.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zhou,

Am 04.07.2017 um 08:15 schrieb Zhou:
>  Dear Richard
> 
> Please forgive my rudeness,I try to send this to mtd mailing list,but my
> office only can send HTML email.

:-(

> I read ubi & ubifs faq on www.linux-mtd.infradead.org/doc/ and surfed
> online,but can't find any answer about this problem.
> The project use UBIFS on a Nor-flash (MX25L51245G) as 3 data
>  partitions.
> 
> kernel version :3.14.19
> 
> error log:
> 
> [    0.852742] Freeing unused kernel memory: 192K (c05e0000 - c0610000)
> Mount /sys.
> Attached mtd to ubi.
> [    1.041152] UBI: attaching mtd2 to ubi0
> [    1.045967] UBI: scanning is finished
> [    1.052457] UBI: attached mtd2 (name "data", size 5 MiB) to ubi0
> [    1.058472] UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> [    1.064983] UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
> [    1.071056] UBI: VID header offset: 64 (aligned 64), data offset: 128
> [    1.077475] UBI: good PEBs: 80, bad PEBs: 0, corrupted PEBs: 0
> [    1.083290] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> [    1.090401] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 2056918313
> [    1.099412] UBI: available PEBs: 0, total reserved PEBs: 80, PEBs reserved for bad PEB handling: 0
> [    1.108346] UBI: background thread "ubi_bgt0d" started, PID 45
> UBI device number 0, total 80 LEBs (5232640 bytes, 5.0 MiB), available 0 LEBs (0 bytes), LEB size 65408 bytes (63.9 KiB)
> Make ubi volume.
> ubimkvol: error!: UBI device does no[    1.130146] UBIFS: background thread "ubifs_bgt0_0" started, PID 48
> t have f[    1.137089] UBIFS: recovery needed
> ree logical eraseblocks
> Mount ubifs.
> [    1.305638] UBIFS: recovery completed
> [    1.309372] UBIFS: mounted UBI device 0, volume 0, name "sflashfs"
> [    1.315542] UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 bytes/256 bytes
> [    1.324134] UBIFS: FS size: 4316928 bytes (4 MiB, 66 LEBs), journal size 523265 bytes (0 MiB, 6 LEBs)
> [    1.333323] UBIFS: reserved for root: 203898 bytes (199 KiB)
> [    1.338971] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 415B310F-7DB0-49E9-B120-1216FDF2030D, small LPT model
> /data:
> .     ..    conf  log   root
>  
> /data/conf:
> .   ..
>  
> /data/log:
> .   ..
>  
> /data/root:
> .   ..
> Mount successful.
> Unmount /sys.
> Mount /sys.
> Attached mtd to ubi.
> [    1.497743] UBI: attaching mtd3 to ubi1
> [    1.503039] UBI: scanning is finished
> [    1.509662] UBI: attached mtd3 (name "data1", size 10 MiB) to ubi1
> [    1.515843] UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> [    1.522351] UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
> [    1.528431] UBI: VID header offset: 64 (aligned 64), data offset: 128
> [    1.534850] UBI: good PEBs: 160, bad PEBs: 0, corrupted PEBs: 0
> [    1.540751] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> [    1.547864] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 267157987
> [    1.556788] UBI: available PEBs: 0, total reserved PEBs: 160, PEBs reserved for bad PEB handling: 0
> [    1.565810] UBI: background thread "ubi_bgt1d" started, PID 56
> UBI device number 1, total 160 LEBs (10465280 bytes, 10.0 MiB), available 0 LEBs (0 bytes), LEB size 65408 bytes (63.9 KiB)
> Make ubi volume.
> ubimkvol: error!: UBI dev[    1.587008] UBIFS: background thread "ubifs_bgt1_0" started, PID 59
> ice does[    1.593845] UBIFS: recovery needed
>  not have free logical eraseblocks
> Mount ubifs.
> [    1.925846] UBIFS: recovery completed
> [    1.929611] UBIFS: mounted UBI device 1, volume 0, name "sflashfs1"
> [    1.935864] UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 bytes/256 bytes
> [    1.944452] UBIFS: FS size: 9549568 bytes (9 MiB, 146 LEBs), journal size 523265 bytes (0 MiB, 7 LEBs)
> [    1.953727] UBIFS: reserved for root: 451049 bytes (440 KiB)
> [    1.959374] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 0B65F047-B1AB-416C-B509-52608BF5CD50, small LPT model
> /data1:
> [    2.084260] UBIFS error (pid 60): ubifs_check_node: bad CRC: calculated 0x2603efdc, read 0x6265efa9

The data corrupted after writing.

> [    2.093535] UBIFS error (pid 60): ubifs_check_node: bad node at LEB 11:2200
> [    2.100479]  magic          0x6101831
> [    2.104139]  crc            0x6265efa9
> [    2.107879]  node_type      0 (inode node)
> [    2.111965]  group_type     2 (last of node group)
> [    2.116742]  sqnum          861
> [    2.119878]  len            160
> [    2.123016]  key            (68, inode)
> [    2.126842]  creat_sqnum    857
> [    2.129978]  size           1152310
> [    2.133443]  nlink          1
> [    2.136407]  atime          33.0
> [    2.139629]  mtime          33.0
> [    2.142852]  ctime          33.0
> [    2.146073]  uid            0
> [    2.149021]  gid            0
> [    2.151985]  mode           33188
> [    2.155293]  flags          0x1
> [    2.158429]  xattr_cnt      0
> [    2.161377]  xattr_size     0
> [    2.164339]  xattr_names    0
> [    2.167302]  compr_type     0x1
> [    2.170439]  data len       0
> [    2.173395] CPU: 0 PID: 60 Comm: ls Not tainted 3.14.19 #1
> [    2.178902] [<c0015910>] (unwind_backtrace) from [<c0011ff8>] (show_stack+0x10/0x14)
> [    2.186632] [<c0011ff8>] (show_stack) from [<c0475264>] (dump_stack+0x80/0x90)
> [    2.193844] [<c0475264>] (dump_stack) from [<c01a5c00>] (ubifs_check_node+0x180/0x298)
> [    2.201747] [<c01a5c00>] (ubifs_check_node) from [<c01a7448>] (ubifs_read_node+0xe4/0x2e4)
> [    2.209990] [<c01a7448>] (ubifs_read_node) from [<c01c7d14>] (ubifs_tnc_read_node+0x4c/0x1e8)
> [    2.218491] [<c01c7d14>] (ubifs_tnc_read_node) from [<c01ab158>] (ubifs_tnc_locate+0x1a4/0x1ac)
> [    2.227164] [<c01ab158>] (ubifs_tnc_locate) from [<c01a16ac>] (ubifs_iget+0x98/0x5f8)
> [    2.234973] [<c01a16ac>] (ubifs_iget) from [<c019e880>] (ubifs_lookup+0x120/0x244)
> [    2.242531] [<c019e880>] (ubifs_lookup) from [<c00ad564>] (lookup_real+0x20/0x4c)
> [    2.250003] [<c00ad564>] (lookup_real) from [<c00adeb0>] (__lookup_hash+0x34/0x3c)
> [    2.257563] [<c00adeb0>] (__lookup_hash) from [<c00aeab0>] (lookup_slow+0x38/0xa4)
> [    2.265119] [<c00aeab0>] (lookup_slow) from [<c00b0638>] (path_lookupat+0x6d8/0x720)
> [    2.272844] [<c00b0638>] (path_lookupat) from [<c00b06a0>] (filename_lookup.isra.54+0x20/0x60)
> [    2.281431] [<c00b06a0>] (filename_lookup.isra.54) from [<c00b2f2c>] (user_path_at_empty+0x50/0x78)
> [    2.290451] [<c00b2f2c>] (user_path_at_empty) from [<c00b2f68>] (user_path_at+0x14/0x1c)
> [    2.298521] [<c00b2f68>] (user_path_at) from [<c00a9038>] (vfs_fstatat+0x44/0x98)
> [    2.305986] [<c00a9038>] (vfs_fstatat) from [<c00a9748>] (SyS_lstat64+0x14/0x30)
> [    2.313366] [<c00a9748>] (SyS_lstat64) from [<c000ebe0>] (ret_fast_syscall+0x0/0x30)
> [    2.321083] UBIFS error (pid 60): ubifs_read_node: expected node type 0
> [    2.327676] UBIFS error (pid 60): ubifs_iget: failed to read inode 68, error -117
> [    2.335171] UBIFS error (pid 60): ubifs_lookup: dead directory entry 'flashNo3', error -117
> [    2.343522] UBIFS warning (pid 60): ubifs_ro_mode: switched to read-only mode, error -117
> [    2.351684] CPU: 0 PID: 60 Comm: ls Not tainted 3.14.19 #1
> [    2.357169] [<c0015910>] (unwind_backtrace) from [<c0011ff8>] (show_stack+0x10/0x14)
> [    2.364898] [<c0011ff8>] (show_stack) from [<c0475264>] (dump_stack+0x80/0x90)
> [    2.372110] [<c0475264>] (dump_stack) from [<c019e994>] (ubifs_lookup+0x234/0x244)
> [    2.379664] [<c019e994>] (ubifs_lookup) from [<c00ad564>] (lookup_real+0x20/0x4c)
> [    2.387137] [<c00ad564>] (lookup_real) from [<c00adeb0>] (__lookup_hash+0x34/0x3c)
> [    2.394698] [<c00adeb0>] (__lookup_hash) from [<c00aeab0>] (lookup_slow+0x38/0xa4)
> [    2.402256] [<c00aeab0>] (lookup_slow) from [<c00b0638>] (path_lookupat+0x6d8/0x720)
> [    2.409979] [<c00b0638>] (path_lookupat) from [<c00b06a0>] (filename_lookup.isra.54+0x20/0x60)
> [    2.418566] [<c00b06a0>] (filename_lookup.isra.54) from [<c00b2f2c>] (user_path_at_empty+0x50/0x78)
> [    2.427586] [<c00b2f2c>] (user_path_at_empty) from [<c00b2f68>] (user_path_at+0x14/0x1c)
> [    2.435655] [<c00b2f68>] (user_path_at) from [<c00a9038>] (vfs_fstatat+0x44/0x98)
> [    2.443122] [<c00a9038>] (vfs_fstatat) from [<c00a9748>] (SyS_lstat64+0x14/0x30)
> [    2.450501] [<c00a9748>] (SyS_lstat64) from [<c000ebe0>] (ret_fast_syscall+0x0/0x30)
> ls: /data1/flashNo3: Structure needs cleaning
> .         ..        bt.data   flashNo1  f[    2.469926] UBIFS: un-mount UBI device 1, volume 0
> lashNo2 UBIFS: background thread "ubifs_bgt1_0" stops
> [0m
> ubi1:sflashfs1 on /data1 type ubifs (ro,relatime)
> Unmount /data1.
> Mount successful. But probably data filesystem is damaged.
> Remove ubi volume.
> Detached ubi.
> [    2.836303] UBI: detaching mtd3 from ubi1
> [    2.984358] UBI: mtd3 is detached from ubi1
> Erase mtd3 device.
> Erasing 64 Kibyte @ a00000 - 100% complete.
> At[   27.455657] UBI: attaching mtd3 to ubi1
> tached mtd to ub[   27.460869] UBI: scanning is finished
> i. (retr[   27.464998] UBI: empty MTD device detected
> y)
> [   27.828063] UBI: attached mtd3 (name "data1", size 10 MiB) to ubi1
> [   27.834249] UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> [   27.840758] UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
> [   27.846839] UBI: VID header offset: 64 (aligned 64), data offset: 128
> [   27.853257] UBI: good PEBs: 160, bad PEBs: 0, corrupted PEBs: 0
> [   27.859160] UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
> [   27.866272] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 2382463312
> [   27.875290] UBI: available PEBs: 156, total reserved PEBs: 4, PEBs reserved for bad PEB handling: 0
> [   27.884311] UBI: background thread "ubi_bgt1d" started, PID 68
> UBI device number 1, total 160 LEBs (10465280 bytes, 10.0 MiB), available 156 LEBs (10203648 bytes, 9.7 MiB), LEB size 65408 bytes (63.9 KiB)
> Make ubi volume. (second try)
> Set volume size to 10203648
> Volume ID 0, size 156 LEBs (10203648 bytes, 9.7 [   33.619701] UBIFS error (pid 70): ubifs_mount: cannot open "ubi1:sflashfs", error -19
> MiB), LEB size 65408 bytes (63.9 KiB), dynamic, name "sflashfs1", alignment 1
> Mount ubifs. (retry)
> mount: mounting ubi1:sflashfs on /data failed: No such device
> WARNING: Failed to mount Data partition (/dev/mtdblock3). setup Data partition on DDR.
> Unmount /sys.
> Mount /sys.
> Attached mtd to ubi.
> [   33.657061] UBI: attaching mtd4 to ubi2
> [   36.381053] UBI: scanning is finished
> [   39.162967] UBI: attached mtd4 (name "data2", size 10 MiB) to ubi2
> [   39.169157] UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> [   39.175669] UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
> [   39.181750] UBI: VID header offset: 64 (aligned 64), data offset: 128
> [   39.188168] UBI: good PEBs: 160, bad PEBs: 0, corrupted PEBs: 0
> [   39.194070] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> [   39.201181] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 2758875152
> [   39.210194] UBI: available PEBs: 0, total reserved PEBs: 160, PEBs reserved for bad PEB handling: 0
> [   39.219225] UBI: background thread "ubi_bgt2d" started, PID 76
> UBI device number 2, total 160 LEBs (10465280 bytes, 10.0 MiB), available 0 LEBs (0 bytes), LEB size 65408 bytes (63.9 KiB)
> Make ubi volume.
> ubimkvol: error!: UBI device does not have free logical eraseblocks
> Mount ubifs.
> [   41.924339] UBIFS: background thread "ubifs_bgt2_0" started, PID 79
> [   42.701389] UBIFS: recovery needed
> [   52.829808] UBIFS: recovery completed
> [   52.833533] UBIFS: mounted UBI device 2, volume 0, name "sflashfs2"
> [   52.839792] UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 bytes/256 bytes
> [   52.848378] UBIFS: FS size: 9549568 bytes (9 MiB, 146 LEBs), journal size 523265 bytes (0 MiB, 7 LEBs)
> [   52.857652] UBIFS: reserved for root: 451049 bytes (440 KiB)
> [   52.863299] UBIFS: media format: w4/r0 (latest is w4/r0), UUID D922488C-A456-4966-A3E4-4B81EA7BC23F, small LPT model
> /data2:
> .         ..        bt.data   flashNo1  flashNo2  flashNo3
> Mount successful.
> Unmount /sys.
> 
> //error log end
> 
> mounting script:
> //choose mount /data/ as an example
> if [ "x$SYSTEM_TYPE" = "xSERIAL_CS2_FLASH" ];then
> 193                 wait_device mtdblock2 3
> 194                 if [ $? -ne 0 ];then
> 195                         echo "WARNING: Failed to mount Data partition (/dev/mtdblock2). setup Data partition on DDR."
> 196                         make_virtual_data_partition
> 197                 else
> 198                         echo "Mount /sys."
> 199                         mount /sys
> 200                         echo "Attached mtd to ubi."
> 201                         /usr/sbin/ubiattach /dev/ubi_ctrl -d 0 -m 2 2>/dev/null
> 202                         echo "Make ubi volume."
> 203                         /usr/sbin/ubimkvol /dev/ubi0 -N sflashfs -m 2>/dev/null
> 204                         echo "Mount ubifs."
> 205                         mount -t ubifs ubi0:sflashfs /data
> 206                         #mount -t ubifs ubi0:sflashfs -o sync /data
> 207                         #mount -t ubifs ubi0:sflashfs -o sync,no_chk_data_crc /data
> 208                         if [ $? -ne 0 ];then
> 209                                 echo "Mount failed. Probably data filesystem is damaged."
> 210                                 cs2_ubifs_reformat
> 211                         else
> 212                                 ls -aR /data >/dev/null 2>&1
> 213                                 mount -v | fgrep '/data type ubifs (ro' >/dev/null
> 214                                 if [ $? -ne 0 ];then
> 215                                         echo "Mount successful."
> 216                                 else
> 217                                         echo "Unmount /data."
> 218                                         umount /data
> 219                                         echo "Mount successful. But probably data filesystem is damaged."
> 220                                         cs2_ubifs_reformat
> 221                                 fi
> 222                         fi
> 223                         echo "Unmount /sys."
> 224                         umount /sys
> 225                 fi
> 226                 make_data_dir
> 227         fi
> //
> 
> 
> Mounting failed does not occur every time,it aways happen after power
> -cut,maybe 1/100.
> 
> if mounting failed happen,I must use flash_eraseall /dev/mtd to
>  retry(even if data is lost).
> 
> I'm not a linux expert .After I joined the project this problem
> confuse me for a long time , I have no idea and need your help.
> 
> what  you think about this problem? Is it a hardware problem?

It could be a hardware issues, yes. But also a misconfiguration
of your flash chip.
Maybe you give your flash not enough time to write data and after a power-cut
already written data corrupts.

Thanks,
//richard
