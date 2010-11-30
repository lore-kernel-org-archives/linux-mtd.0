Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PNNea-0000ND-QS
	for linux-mtd@lists.infradead.org; Tue, 30 Nov 2010 10:41:57 +0000
Message-ID: <4CF4D4CA.8040906@aimvalley.nl>
Date: Tue, 30 Nov 2010 11:41:14 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
References: <20101129195014.19224240@wker>
In-Reply-To: <20101129195014.19224240@wker>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Eric_Holmberg@Trimble.com, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Did you read the mail discussions
"UBIFS Corrupt during power failure"
dated april 2009 from Eric Holmberg.

He did some great work in making UBIFS on NOR flash
more reliable for power-cuts.

One of the problems was UBI/UBIFS assumes a (CFI) write
buffer size of 8 bytes. Maybe this is still the case.
I think for your NOR flash it is 64 bytes though.

hth,
Norbert van Bolhuis.






Anatolij Gustschin wrote:
> Hello,
> 
> using kernel 2.6.34.7 with applied UBI/UBIFS back-port patches from
> 2.6.34 UBIFS back-port tree and an UBIFS filesystem in a partition
> on Spansion NOR Flash S29GL512P (2 x16 chips in a 32-bit bank) we are
> not able to mount the filesystem after around 30 power cut test
> cycles. Has anyone seen similar issues before?
> 
> The power failure test is simulated by triggering an external reset
> of the board while a simple program is writing data into a file on
> the UBIFS partition. Each test cycle consists of the following steps:
> 
>  - booting the kernel
>  - attaching the MTD device
>  - mounting the UBIFS partition
>  - starting a program for writing the test data into a file on the
>    mounted UBIFS partition (only if mounting of this partition
>    succeeded)
>  - triggering a reset after about 15 sec.
> 
> After a number of test cycles we end up with corrupted partition
> which cannot be recovered any more and mounting the partition
> does not succeed. Two kernel logs with enabled UBIFS debug output
> are included below.
> 
> Previous to the above tests we also validated the flash access by
> running some MTD tests (mtd_readtest/mtd_stresstest) and these MTD
> tests didn't show any errors or warnings.
> 
> The problem can also be reproduced when running with UBIFS extra
> self checks enabled, but here it seems that we need to run more
> test cycles until the issue pops up.
> 
> Used UBI/UBIFS configuration:
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_RESERVE=1
> 
> CONFIG_UBIFS_FS=y
> # CONFIG_UBIFS_FS_XATTR is not set
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=y
> CONFIG_UBIFS_FS_ZLIB=y
> CONFIG_UBIFS_FS_DEBUG=y
> CONFIG_UBIFS_FS_DEBUG_MSG_LVL=1
> CONFIG_UBIFS_FS_DEBUG_CHKS=y
> 
> Our flash device is a Spansion S29GL512P NOR flash,
> 2 x16 in a 32-bit bank.
> 
> # cat /proc/mtd 
> dev:    size   erasesize  name
> mtd0: 02ac0000 00040000 "rootfs"
> mtd1: 00040000 00040000 "env-0"
> mtd2: 00040000 00040000 "env-1"
> mtd3: 00040000 00040000 "splash-image"
> mtd4: 00500000 00040000 "linux"
> mtd5: 03400000 00040000 "homefs"
> mtd6: 00002000 00001000 "50040000.mram0"
> mtd7: 00008000 00001000 "50042000.mram1"
> 
> The UBIFS partition is on mtd5.
> 
> The kernel version is 2.6.34.7 with updated UBI/UBIFS pulled from
> 2.6.34 back-port tree.
> 
> Kernel log:
> 
> UBI: attaching mtd5 to ubi0
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    262016 bytes
> UBI: smallest flash I/O unit:    1
> UBI: VID header offset:          64 (aligned 64)
> UBI: data offset:                128
> UBI: max. sequence number:       2348
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "homefs"
> UBI: MTD device size:            52 MiB
> UBI: number of good PEBs:        208
> UBI: number of bad PEBs:         0
> UBI: number of corrupted PEBs:   0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 208
> UBI: number of PEBs reserved for bad PEB handling: 0
> UBI: max/mean erase counter: 24/16
> UBI: image sequence number:  1966556915
> UBI: background thread "ubi_bgt0d" started, PID 1287
> UBIFS DBG (pid 1288): ubifs_start_scan: scan LEB 1:0
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:0 (262016 bytes left)
> UBIFS DBG (pid 1290): ubifs_bg_thread: background thread "ubifs_bgt0_0" started, PID 1290
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:512 (261504 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:1024 (260992 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:1536 (260480 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:2048 (259968 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:2560 (259456 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:3072 (258944 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:3584 (258432 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:4096 (257920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:4608 (257408 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:5120 (256896 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:5632 (256384 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:6144 (255872 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:6656 (255360 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:7168 (254848 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:7680 (254336 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:8192 (253824 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:8704 (253312 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:9216 (252800 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:9728 (252288 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:10240 (251776 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:10752 (251264 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:11264 (250752 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:11776 (250240 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:12288 (249728 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:12800 (249216 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:13312 (248704 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:13824 (248192 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:14336 (247680 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:14848 (247168 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:15360 (246656 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:15872 (246144 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:16384 (245632 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:16896 (245120 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:17408 (244608 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:17920 (244096 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:18432 (243584 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:18944 (243072 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:19456 (242560 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:19968 (242048 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:20480 (241536 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:20992 (241024 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:21504 (240512 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:22016 (240000 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:22528 (239488 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:23040 (238976 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:23552 (238464 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:24064 (237952 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:24576 (237440 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:25088 (236928 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:25600 (236416 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:26112 (235904 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:26624 (235392 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:27136 (234880 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:27648 (234368 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:28160 (233856 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:28672 (233344 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:29184 (232832 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:29696 (232320 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:30208 (231808 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:30720 (231296 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:31232 (230784 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:31744 (230272 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:32256 (229760 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:32768 (229248 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:33280 (228736 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:33792 (228224 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:34304 (227712 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:34816 (227200 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:35328 (226688 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:35840 (226176 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:36352 (225664 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:36864 (225152 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:37376 (224640 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:37888 (224128 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:38400 (223616 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:38912 (223104 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:39424 (222592 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:39936 (222080 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:40448 (221568 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:40960 (221056 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:41472 (220544 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:41984 (220032 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:42496 (219520 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:43008 (219008 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:43520 (218496 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:44032 (217984 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:44544 (217472 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:45056 (216960 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:45568 (216448 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:46080 (215936 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:46592 (215424 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:47104 (214912 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:47616 (214400 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:48128 (213888 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:48640 (213376 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:49152 (212864 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:49664 (212352 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:50176 (211840 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:50688 (211328 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:51200 (210816 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:51712 (210304 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:52224 (209792 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:52736 (209280 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:53248 (208768 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:53760 (208256 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:54272 (207744 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:54784 (207232 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:55296 (206720 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:55808 (206208 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:56320 (205696 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:56832 (205184 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:57344 (204672 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:57856 (204160 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:58368 (203648 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:58880 (203136 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:59392 (202624 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:59904 (202112 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:60416 (201600 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:60928 (201088 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:61440 (200576 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:61952 (200064 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:62464 (199552 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:62976 (199040 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:63488 (198528 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:64000 (198016 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:64512 (197504 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:65024 (196992 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:65536 (196480 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:66048 (195968 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:66560 (195456 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:67072 (194944 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:67584 (194432 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:68096 (193920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:68608 (193408 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:69120 (192896 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:69632 (192384 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:70144 (191872 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:70656 (191360 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:71168 (190848 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:71680 (190336 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:72192 (189824 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:72704 (189312 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:73216 (188800 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 1:73728 (188288 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1288): ubifs_end_scan: stop scanning LEB 1 at offset 73728
> UBIFS DBG (pid 1288): ubifs_start_scan: scan LEB 2:0
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:0 (262016 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:512 (261504 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:1024 (260992 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:1536 (260480 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:2048 (259968 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:2560 (259456 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:3072 (258944 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:3584 (258432 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:4096 (257920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:4608 (257408 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:5120 (256896 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:5632 (256384 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:6144 (255872 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:6656 (255360 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:7168 (254848 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:7680 (254336 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:8192 (253824 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:8704 (253312 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:9216 (252800 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:9728 (252288 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:10240 (251776 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:10752 (251264 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:11264 (250752 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:11776 (250240 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:12288 (249728 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:12800 (249216 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:13312 (248704 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:13824 (248192 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:14336 (247680 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:14848 (247168 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:15360 (246656 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:15872 (246144 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:16384 (245632 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:16896 (245120 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:17408 (244608 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:17920 (244096 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:18432 (243584 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:18944 (243072 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:19456 (242560 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:19968 (242048 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:20480 (241536 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:20992 (241024 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:21504 (240512 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:22016 (240000 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:22528 (239488 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:23040 (238976 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:23552 (238464 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:24064 (237952 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:24576 (237440 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:25088 (236928 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:25600 (236416 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:26112 (235904 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:26624 (235392 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:27136 (234880 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:27648 (234368 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:28160 (233856 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:28672 (233344 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:29184 (232832 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:29696 (232320 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:30208 (231808 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:30720 (231296 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:31232 (230784 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:31744 (230272 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:32256 (229760 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:32768 (229248 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:33280 (228736 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:33792 (228224 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:34304 (227712 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:34816 (227200 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:35328 (226688 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:35840 (226176 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:36352 (225664 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:36864 (225152 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:37376 (224640 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:37888 (224128 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:38400 (223616 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:38912 (223104 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:39424 (222592 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:39936 (222080 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:40448 (221568 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:40960 (221056 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:41472 (220544 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:41984 (220032 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:42496 (219520 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:43008 (219008 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:43520 (218496 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:44032 (217984 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:44544 (217472 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:45056 (216960 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:45568 (216448 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:46080 (215936 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:46592 (215424 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:47104 (214912 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:47616 (214400 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:48128 (213888 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:48640 (213376 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:49152 (212864 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:49664 (212352 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:50176 (211840 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:50688 (211328 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:51200 (210816 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:51712 (210304 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:52224 (209792 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:52736 (209280 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:53248 (208768 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:53760 (208256 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:54272 (207744 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:54784 (207232 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:55296 (206720 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:55808 (206208 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:56320 (205696 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:56832 (205184 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:57344 (204672 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:57856 (204160 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:58368 (203648 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:58880 (203136 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:59392 (202624 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:59904 (202112 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:60416 (201600 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:60928 (201088 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:61440 (200576 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:61952 (200064 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:62464 (199552 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:62976 (199040 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:63488 (198528 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:64000 (198016 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:64512 (197504 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:65024 (196992 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:65536 (196480 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:66048 (195968 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:66560 (195456 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:67072 (194944 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:67584 (194432 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:68096 (193920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:68608 (193408 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:69120 (192896 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:69632 (192384 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:70144 (191872 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:70656 (191360 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:71168 (190848 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:71680 (190336 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:72192 (189824 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:72704 (189312 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:73216 (188800 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 2:73728 (188288 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1288): ubifs_end_scan: stop scanning LEB 2 at offset 73728
> UBIFS: recovery needed
> UBIFS DBG (pid 1288): ubifs_recover_inl_heads: checking index head at 173:204000
> UBIFS DBG (pid 1288): ubifs_recover_inl_heads: checking LPT head at 7:45864
> UBIFS DBG (pid 1288): ubifs_start_scan: scan LEB 6:0
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 6:0 (262016 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning commit start node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 6:32 (261984 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 6:96 (261920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 6:160 (261856 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1288): ubifs_end_scan: stop scanning LEB 6 at offset 160
> UBIFS DBG (pid 1288): ubifs_start_scan: scan LEB 3:0
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 3:0 (262016 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning commit start node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 3:32 (261984 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 3:96 (261920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1288): ubifs_scan: look at LEB 3:160 (261856 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1288): ubifs_end_scan: stop scanning LEB 3 at offset 160
> UBIFS DBG (pid 1288): ubifs_recover_leb: 162:210456
> UBIFS DBG (pid 1288): ubifs_start_scan: scan LEB 162:210456
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:210456 (51560 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:210616 (51400 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:210776 (51240 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:210936 (51080 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211096 (50920 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211256 (50760 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211416 (50600 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211576 (50440 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211736 (50280 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:211896 (50120 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212056 (49960 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212216 (49800 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212376 (49640 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212536 (49480 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212696 (49320 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:212856 (49160 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213016 (49000 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213176 (48840 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213336 (48680 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213496 (48520 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213656 (48360 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213816 (48200 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:213976 (48040 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:214136 (47880 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning unknown node
> UBIFS DBG (pid 1288): no_more_nodes: unexpected bad common header at 162:214136
> UBIFS DBG (pid 1288): ubifs_recover_leb: look at LEB 162:214136 (47880 bytes left)
> UBIFS DBG (pid 1288): ubifs_scan_a_node: scanning unknown node
> UBIFS error (pid 1288): ubifs_check_node: bad node type 255
> UBIFS error (pid 1288): ubifs_check_node: bad node at LEB 162:214136
> 	magic          0x6101831
> 	crc            0xc06989c8
> 	node_type      255 (unknown node)
> 	group_type     255 (unknown)
> 	sqnum          18446744073709551615
> 	len            4294967295
> node type 255 was not recognized
> Call Trace:
> [c602db80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
> [c602dbc0] [c013e980] ubifs_check_node+0x17c/0x308
> [c602dbe0] [c0147dec] ubifs_scan_a_node+0x15c/0x2d8
> [c602dc10] [c015d1c0] ubifs_recover_leb+0x3f0/0x940
> [c602dc80] [c01486fc] replay_buds+0xb4/0xb4c
> [c602dd20] [c0149894] ubifs_replay_journal+0x700/0xf48
> [c602dda0] [c013b060] ubifs_fill_super+0xda0/0x1600
> [c602de00] [c013cbb4] ubifs_get_sb+0x10c/0x344
> [c602de80] [c007b9a4] vfs_kern_mount+0x60/0x150
> [c602dea0] [c007bae4] do_kern_mount+0x40/0x100
> [c602dec0] [c00926c0] do_mount+0x40c/0x718
> [c602df10] [c0092a5c] sys_mount+0x90/0xd8
> [c602df40] [c0010b44] ret_from_syscall+0x0/0x38
> --- Exception: c01 at 0xfe93d18
>     LR = 0x1000347c
> UBIFS DBG (pid 1288): no_more_nodes: unexpected bad common header at 162:214136
> UBIFS error (pid 1288): ubifs_recover_leb: bad node
> UBIFS error (pid 1288): ubifs_scanned_corruption: corruption at LEB 162:214136
> UBIFS error (pid 1288): ubifs_scanned_corruption: first 8192 bytes from LEB 162:214136
> 00000000: 31181006 c88969c0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  1.....i.........................
> 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000060: ffffffff ffffffff a4810000 00000000 00000000 00000000 00000000 00000000  ................................
> 00000080: 00000000 00000000 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000300: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000320: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000400: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000440: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000460: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000480: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000500: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000520: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000540: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000560: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000580: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000600: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000620: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000640: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000660: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000680: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000700: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000720: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000740: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000760: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000780: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000800: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000820: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000840: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000860: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000880: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000900: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000920: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000960: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000980: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000aa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ac0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ae0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ba0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000be0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ca0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000cc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ce0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000da0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000dc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000de0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ea0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ec0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ee0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001000: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001300: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001320: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001400: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001440: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001460: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001480: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001500: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001520: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001540: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001560: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001580: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001600: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001620: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001640: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001660: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001680: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001700: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001720: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001740: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001760: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001780: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001800: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001820: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001840: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001860: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001880: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001900: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001920: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001960: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001980: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001aa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ac0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ae0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ba0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001be0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ca0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001cc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ce0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001dc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001de0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ea0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ec0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ee0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> UBIFS error (pid 1288): ubifs_recover_leb: LEB 162 scanning failed
> UBIFS DBG (pid 1290): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
> 
> 
> Kernel log after trying to mount corrupted partition from another
> test run. I'm including it here since it has different pattern
> in corrupted node. Here the debug level is increased to 3:
> 
> UBI: attaching mtd5 to ubi0
> UBI DBG (pid 1346): io_init: min_io_size      1
> UBI DBG (pid 1346): io_init: hdrs_min_io_size 1
> UBI DBG (pid 1346): io_init: ec_hdr_alsize    64
> UBI DBG (pid 1346): io_init: vid_hdr_alsize   64
> UBI DBG (pid 1346): io_init: vid_hdr_offset   64
> UBI DBG (pid 1346): io_init: vid_hdr_aloffset 64
> UBI DBG (pid 1346): io_init: vid_hdr_shift    0
> UBI DBG (pid 1346): io_init: leb_start        128
> UBI DBG (pid 1346): io_init: max_erroneous    20
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    262016 bytes
> UBI: smallest flash I/O unit:    1
> UBI: VID header offset:          64 (aligned 64)
> UBI: data offset:                128
> UBI DBG (pid 1346): ubi_scan: process PEB 0
> UBI DBG (pid 1346): ubi_scan: process PEB 1
> UBI DBG (pid 1346): ubi_scan: process PEB 2
> UBI DBG (pid 1346): ubi_scan: process PEB 3
> UBI DBG (pid 1346): ubi_scan: process PEB 4
> UBI DBG (pid 1346): ubi_scan: process PEB 5
> UBI DBG (pid 1346): ubi_scan: process PEB 6
> UBI DBG (pid 1346): ubi_scan: process PEB 7
> UBI DBG (pid 1346): ubi_scan: process PEB 8
> UBI DBG (pid 1346): ubi_scan: process PEB 9
> UBI DBG (pid 1346): ubi_scan: process PEB 10
> UBI DBG (pid 1346): ubi_scan: process PEB 11
> UBI DBG (pid 1346): ubi_scan: process PEB 12
> UBI DBG (pid 1346): ubi_scan: process PEB 13
> UBI DBG (pid 1346): ubi_scan: process PEB 14
> UBI DBG (pid 1346): ubi_scan: process PEB 15
> UBI DBG (pid 1346): ubi_scan: process PEB 16
> UBI DBG (pid 1346): ubi_scan: process PEB 17
> UBI DBG (pid 1346): ubi_scan: process PEB 18
> UBI DBG (pid 1346): ubi_scan: process PEB 19
> UBI DBG (pid 1346): ubi_scan: process PEB 20
> UBI DBG (pid 1346): ubi_scan: process PEB 21
> UBI DBG (pid 1346): ubi_scan: process PEB 22
> UBI DBG (pid 1346): ubi_scan: process PEB 23
> UBI DBG (pid 1346): ubi_scan: process PEB 24
> UBI DBG (pid 1346): ubi_scan: process PEB 25
> UBI DBG (pid 1346): ubi_scan: process PEB 26
> UBI DBG (pid 1346): ubi_scan: process PEB 27
> UBI DBG (pid 1346): ubi_scan: process PEB 28
> UBI DBG (pid 1346): ubi_scan: process PEB 29
> UBI DBG (pid 1346): ubi_scan: process PEB 30
> UBI DBG (pid 1346): ubi_scan: process PEB 31
> UBI DBG (pid 1346): ubi_scan: process PEB 32
> UBI DBG (pid 1346): ubi_scan: process PEB 33
> UBI DBG (pid 1346): ubi_scan: process PEB 34
> UBI DBG (pid 1346): ubi_scan: process PEB 35
> UBI DBG (pid 1346): ubi_scan: process PEB 36
> UBI DBG (pid 1346): ubi_scan: process PEB 37
> UBI DBG (pid 1346): ubi_scan: process PEB 38
> UBI DBG (pid 1346): ubi_scan: process PEB 39
> UBI DBG (pid 1346): ubi_scan: process PEB 40
> UBI DBG (pid 1346): ubi_scan: process PEB 41
> UBI DBG (pid 1346): ubi_scan: process PEB 42
> UBI DBG (pid 1346): ubi_scan: process PEB 43
> UBI DBG (pid 1346): ubi_scan: process PEB 44
> UBI DBG (pid 1346): ubi_scan: process PEB 45
> UBI DBG (pid 1346): ubi_scan: process PEB 46
> UBI DBG (pid 1346): ubi_scan: process PEB 47
> UBI DBG (pid 1346): ubi_scan: process PEB 48
> UBI DBG (pid 1346): ubi_scan: process PEB 49
> UBI DBG (pid 1346): ubi_scan: process PEB 50
> UBI DBG (pid 1346): ubi_scan: process PEB 51
> UBI DBG (pid 1346): ubi_scan: process PEB 52
> UBI DBG (pid 1346): ubi_scan: process PEB 53
> UBI DBG (pid 1346): ubi_scan: process PEB 54
> UBI DBG (pid 1346): ubi_scan: process PEB 55
> UBI DBG (pid 1346): ubi_scan: process PEB 56
> UBI DBG (pid 1346): ubi_scan: process PEB 57
> UBI DBG (pid 1346): ubi_scan: process PEB 58
> UBI DBG (pid 1346): ubi_scan: process PEB 59
> UBI DBG (pid 1346): ubi_scan: process PEB 60
> UBI DBG (pid 1346): ubi_scan: process PEB 61
> UBI DBG (pid 1346): ubi_scan: process PEB 62
> UBI DBG (pid 1346): ubi_scan: process PEB 63
> UBI DBG (pid 1346): ubi_scan: process PEB 64
> UBI DBG (pid 1346): ubi_scan: process PEB 65
> UBI DBG (pid 1346): ubi_scan: process PEB 66
> UBI DBG (pid 1346): ubi_scan: process PEB 67
> UBI DBG (pid 1346): ubi_scan: process PEB 68
> UBI DBG (pid 1346): ubi_scan: process PEB 69
> UBI DBG (pid 1346): ubi_scan: process PEB 70
> UBI DBG (pid 1346): ubi_scan: process PEB 71
> UBI DBG (pid 1346): ubi_scan: process PEB 72
> UBI DBG (pid 1346): ubi_scan: process PEB 73
> UBI DBG (pid 1346): ubi_scan: process PEB 74
> UBI DBG (pid 1346): ubi_scan: process PEB 75
> UBI DBG (pid 1346): ubi_scan: process PEB 76
> UBI DBG (pid 1346): ubi_scan: process PEB 77
> UBI DBG (pid 1346): ubi_scan: process PEB 78
> UBI DBG (pid 1346): ubi_scan: process PEB 79
> UBI DBG (pid 1346): ubi_scan: process PEB 80
> UBI DBG (pid 1346): ubi_scan: process PEB 81
> UBI DBG (pid 1346): ubi_scan: process PEB 82
> UBI DBG (pid 1346): ubi_scan: process PEB 83
> UBI DBG (pid 1346): ubi_scan: process PEB 84
> UBI DBG (pid 1346): ubi_scan: process PEB 85
> UBI DBG (pid 1346): ubi_scan: process PEB 86
> UBI DBG (pid 1346): ubi_scan: process PEB 87
> UBI DBG (pid 1346): ubi_scan: process PEB 88
> UBI DBG (pid 1346): ubi_scan: process PEB 89
> UBI DBG (pid 1346): ubi_scan: process PEB 90
> UBI DBG (pid 1346): ubi_scan: process PEB 91
> UBI DBG (pid 1346): ubi_scan: process PEB 92
> UBI DBG (pid 1346): ubi_scan: process PEB 93
> UBI DBG (pid 1346): ubi_scan: process PEB 94
> UBI DBG (pid 1346): ubi_scan: process PEB 95
> UBI DBG (pid 1346): ubi_scan: process PEB 96
> UBI DBG (pid 1346): ubi_scan: process PEB 97
> UBI DBG (pid 1346): ubi_scan: process PEB 98
> UBI DBG (pid 1346): ubi_scan: process PEB 99
> UBI DBG (pid 1346): ubi_scan: process PEB 100
> UBI DBG (pid 1346): ubi_scan: process PEB 101
> UBI DBG (pid 1346): ubi_scan: process PEB 102
> UBI DBG (pid 1346): ubi_scan: process PEB 103
> UBI DBG (pid 1346): ubi_scan: process PEB 104
> UBI DBG (pid 1346): ubi_scan: process PEB 105
> UBI DBG (pid 1346): ubi_scan: process PEB 106
> UBI DBG (pid 1346): ubi_scan: process PEB 107
> UBI DBG (pid 1346): ubi_scan: process PEB 108
> UBI DBG (pid 1346): ubi_scan: process PEB 109
> UBI DBG (pid 1346): ubi_scan: process PEB 110
> UBI DBG (pid 1346): ubi_scan: process PEB 111
> UBI DBG (pid 1346): ubi_scan: process PEB 112
> UBI DBG (pid 1346): ubi_scan: process PEB 113
> UBI DBG (pid 1346): ubi_scan: process PEB 114
> UBI DBG (pid 1346): ubi_scan: process PEB 115
> UBI DBG (pid 1346): ubi_scan: process PEB 116
> UBI DBG (pid 1346): ubi_scan: process PEB 117
> UBI DBG (pid 1346): ubi_scan: process PEB 118
> UBI DBG (pid 1346): ubi_scan: process PEB 119
> UBI DBG (pid 1346): ubi_scan: process PEB 120
> UBI DBG (pid 1346): ubi_scan: process PEB 121
> UBI DBG (pid 1346): ubi_scan: process PEB 122
> UBI DBG (pid 1346): ubi_scan: process PEB 123
> UBI DBG (pid 1346): ubi_scan: process PEB 124
> UBI DBG (pid 1346): ubi_scan: process PEB 125
> UBI DBG (pid 1346): ubi_scan: process PEB 126
> UBI DBG (pid 1346): ubi_scan: process PEB 127
> UBI DBG (pid 1346): ubi_scan: process PEB 128
> UBI DBG (pid 1346): ubi_scan: process PEB 129
> UBI DBG (pid 1346): ubi_scan: process PEB 130
> UBI DBG (pid 1346): ubi_scan: process PEB 131
> UBI DBG (pid 1346): ubi_scan: process PEB 132
> UBI DBG (pid 1346): ubi_scan: process PEB 133
> UBI DBG (pid 1346): ubi_scan: process PEB 134
> UBI DBG (pid 1346): ubi_scan: process PEB 135
> UBI DBG (pid 1346): ubi_scan: process PEB 136
> UBI DBG (pid 1346): ubi_scan: process PEB 137
> UBI DBG (pid 1346): ubi_scan: process PEB 138
> UBI DBG (pid 1346): ubi_scan: process PEB 139
> UBI DBG (pid 1346): ubi_scan: process PEB 140
> UBI DBG (pid 1346): ubi_scan: process PEB 141
> UBI DBG (pid 1346): ubi_scan: process PEB 142
> UBI DBG (pid 1346): ubi_scan: process PEB 143
> UBI DBG (pid 1346): ubi_scan: process PEB 144
> UBI DBG (pid 1346): ubi_scan: process PEB 145
> UBI DBG (pid 1346): ubi_scan: process PEB 146
> UBI DBG (pid 1346): ubi_scan: process PEB 147
> UBI DBG (pid 1346): ubi_scan: process PEB 148
> UBI DBG (pid 1346): ubi_scan: process PEB 149
> UBI DBG (pid 1346): ubi_scan: process PEB 150
> UBI DBG (pid 1346): ubi_scan: process PEB 151
> UBI DBG (pid 1346): ubi_scan: process PEB 152
> UBI DBG (pid 1346): ubi_scan: process PEB 153
> UBI DBG (pid 1346): ubi_scan: process PEB 154
> UBI DBG (pid 1346): ubi_scan: process PEB 155
> UBI DBG (pid 1346): ubi_scan: process PEB 156
> UBI DBG (pid 1346): ubi_scan: process PEB 157
> UBI DBG (pid 1346): ubi_scan: process PEB 158
> UBI DBG (pid 1346): ubi_scan: process PEB 159
> UBI DBG (pid 1346): ubi_scan: process PEB 160
> UBI DBG (pid 1346): ubi_scan: process PEB 161
> UBI DBG (pid 1346): ubi_scan: process PEB 162
> UBI DBG (pid 1346): ubi_scan: process PEB 163
> UBI DBG (pid 1346): ubi_scan: process PEB 164
> UBI DBG (pid 1346): ubi_scan: process PEB 165
> UBI DBG (pid 1346): ubi_scan: process PEB 166
> UBI DBG (pid 1346): ubi_scan: process PEB 167
> UBI DBG (pid 1346): ubi_scan: process PEB 168
> UBI DBG (pid 1346): ubi_scan: process PEB 169
> UBI DBG (pid 1346): ubi_scan: process PEB 170
> UBI DBG (pid 1346): ubi_scan: process PEB 171
> UBI DBG (pid 1346): ubi_scan: process PEB 172
> UBI DBG (pid 1346): ubi_scan: process PEB 173
> UBI DBG (pid 1346): ubi_scan: process PEB 174
> UBI DBG (pid 1346): ubi_scan: process PEB 175
> UBI DBG (pid 1346): ubi_scan: process PEB 176
> UBI DBG (pid 1346): ubi_scan: process PEB 177
> UBI DBG (pid 1346): ubi_scan: process PEB 178
> UBI DBG (pid 1346): ubi_scan: process PEB 179
> UBI DBG (pid 1346): ubi_scan: process PEB 180
> UBI DBG (pid 1346): ubi_scan: process PEB 181
> UBI DBG (pid 1346): ubi_scan: process PEB 182
> UBI DBG (pid 1346): ubi_scan: process PEB 183
> UBI DBG (pid 1346): ubi_scan: process PEB 184
> UBI DBG (pid 1346): ubi_scan: process PEB 185
> UBI DBG (pid 1346): ubi_scan: process PEB 186
> UBI DBG (pid 1346): ubi_scan: process PEB 187
> UBI DBG (pid 1346): ubi_scan: process PEB 188
> UBI DBG (pid 1346): ubi_scan: process PEB 189
> UBI DBG (pid 1346): ubi_scan: process PEB 190
> UBI DBG (pid 1346): ubi_scan: process PEB 191
> UBI DBG (pid 1346): ubi_scan: process PEB 192
> UBI DBG (pid 1346): ubi_scan: process PEB 193
> UBI DBG (pid 1346): ubi_scan: process PEB 194
> UBI DBG (pid 1346): ubi_scan: process PEB 195
> UBI DBG (pid 1346): ubi_scan: process PEB 196
> UBI DBG (pid 1346): ubi_scan: process PEB 197
> UBI DBG (pid 1346): ubi_scan: process PEB 198
> UBI DBG (pid 1346): ubi_scan: process PEB 199
> UBI DBG (pid 1346): ubi_scan: process PEB 200
> UBI DBG (pid 1346): ubi_scan: process PEB 201
> UBI DBG (pid 1346): ubi_scan: process PEB 202
> UBI DBG (pid 1346): ubi_scan: process PEB 203
> UBI DBG (pid 1346): ubi_scan: process PEB 204
> UBI DBG (pid 1346): ubi_scan: process PEB 205
> UBI DBG (pid 1346): ubi_scan: process PEB 206
> UBI DBG (pid 1346): ubi_scan: process PEB 207
> UBI DBG (pid 1346): ubi_scan: scanning is finished
> UBI: max. sequence number:       145
> UBI DBG (pid 1346): process_lvol: check layout volume
> UBI DBG (pid 1346): uif_init: ubi0 major is 253
> UBI DBG (pid 1346): ubi_add_volume: add volume 0
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "homefs"
> UBI: MTD device size:            52 MiB
> UBI: number of good PEBs:        208
> UBI: number of bad PEBs:         0
> UBI: number of corrupted PEBs:   0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 208
> UBI: number of PEBs reserved for bad PEB handling: 0
> UBI: max/mean erase counter: 3/1
> UBI: image sequence number:  1966556915
> UBI: background thread "ubi_bgt0d" started, PID 1349
> UBI DBG (pid 1350): ubi_open_volume_path: open volume /dev/ubi0_0, mode 1
> UBI DBG (pid 1350): ubi_open_volume: open device 0, volume 0, mode 1
> UBI DBG (pid 1350): ubi_open_volume: open device 0, volume 0, mode 2
> UBI DBG (pid 1350): ubi_is_mapped: test LEB 0:0
> UBI DBG (pid 1350): ubi_leb_read: read 4096 bytes from LEB 0:0:0
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 1:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:1:0
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:0 (262016 bytes left)
> UBIFS DBG (pid 1352): ubifs_bg_thread: background thread "ubifs_bgt0_0" started, PID 1352
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:512 (261504 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:1024 (260992 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:1536 (260480 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:2048 (259968 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:2560 (259456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:3072 (258944 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:3584 (258432 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:4096 (257920 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:4608 (257408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:5120 (256896 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:5632 (256384 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 1:6144 (255872 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 1 at offset 6144
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 2:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:2:0
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:0 (262016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:512 (261504 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:1024 (260992 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:1536 (260480 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:2048 (259968 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:2560 (259456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:3072 (258944 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:3584 (258432 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:4096 (257920 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:4608 (257408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:5120 (256896 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:5632 (256384 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning master node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 2:6144 (255872 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 2 at offset 6144
> UBI DBG (pid 1350): ubi_leb_read: read 88 bytes from LEB 0:12:221424
> UBIFS: recovery needed
> UBIFS DBG (pid 1350): ubifs_recover_inl_heads: checking index head at 12:221512
> UBI DBG (pid 1350): ubi_leb_read: read 8 bytes from LEB 0:12:221512
> UBIFS DBG (pid 1350): ubifs_recover_inl_heads: checking LPT head at 7:2296
> UBI DBG (pid 1350): ubi_leb_read: read 8 bytes from LEB 0:7:2296
> UBI DBG (pid 1350): ubi_leb_read: read 12 bytes from LEB 0:7:1960
> UBI DBG (pid 1350): ubi_leb_unmap: unmap LEB 0:8
> UBI DBG (pid 1350): ubi_leb_read: read 13 bytes from LEB 0:7:2279
> UBI DBG (pid 1350): ubi_leb_read: read 13 bytes from LEB 0:7:2168
> UBI DBG (pid 1350): ubi_leb_read: read 13 bytes from LEB 0:7:1990
> UBI DBG (pid 1350): ubi_leb_read: read 18 bytes from LEB 0:7:1972
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 5:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:5:0
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:0 (262016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning commit start node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:32 (261984 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:96 (261920 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:160 (261856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:224 (261792 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 5:288 (261728 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 5 at offset 288
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 6:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:6:0
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:0 (262016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning commit start node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:32 (261984 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:96 (261920 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:160 (261856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:224 (261792 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:288 (261728 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:352 (261664 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:416 (261600 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:480 (261536 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:544 (261472 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:608 (261408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:672 (261344 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:736 (261280 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:800 (261216 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:864 (261152 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:928 (261088 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:992 (261024 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1056 (260960 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1120 (260896 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1184 (260832 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1248 (260768 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1312 (260704 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1376 (260640 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning reference node
> UBIFS DBG (pid 1350): ubifs_scan: look at LEB 6:1440 (260576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 6 at offset 1440
> UBIFS DBG (pid 1350): ubifs_recover_leb: 86:1920
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 86:1920
> UBI DBG (pid 1350): ubi_leb_read: read 260096 bytes from LEB 0:86:1920
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:1920 (260096 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2080 (259936 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2240 (259776 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2400 (259616 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2560 (259456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2720 (259296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:2880 (259136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3040 (258976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3200 (258816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3360 (258656 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3520 (258496 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3680 (258336 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:3840 (258176 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: ing inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18080 (243936 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18240 (243776 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18400 (243616 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18560 (243456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18720 (243296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:18880 (243136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19040 (242976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19200 (242816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19360 (242656 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19520 (242496 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19680 (242336 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:19840 (242176 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20000 (242016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20160 (241856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20320 (241696 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20480 (241536 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20640 (241376 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20800 (241216 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:20960 (241056 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21120 (240896 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21280 (240736 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21440 (240576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21600 (240416 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21760 (240256 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:21920 (240096 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22080 (239936 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22240 (239776 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22400 (239616 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22560 (239456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22720 (239296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:22880 (239136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23040 (238976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23200 (238816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23360 (238656 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23520 (238496 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23680 (238336 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:23840 (238176 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24000 (238016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24160 (237856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24320 (237696 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24480 (237536 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24640 (237376 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24800 (237216 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:24960 (237056 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25120 (236896 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25280 (236736 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25440 (236576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25600 (236416 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25760 (236256 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:25920 (236096 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26080 (235936 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26240 (235776 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26400 (235616 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26560 (235456 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26720 (235296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:26880 (235136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:27040 (234976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning inode node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 86:27200 (234816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 86 at offset 27200
> UBIFS DBG (pid 1350): ubifs_recover_leb: 89:4144
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 89:4144
> UBI DBG (pid 1350): ubi_leb_read: read 257872 bytes from LEB 0:89:4144
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:4144 (257872 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:8288 (253728 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:12432 (249584 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:16576 (245440 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:20720 (241296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:24864 (237152 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:29008 (233008 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:33152 (228864 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:37296 (224720 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:41440 (220576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:45584 (216432 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:49728 (212288 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:53872 (208144 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:58016 (204000 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:62160 (199856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:66304 (195712 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:70448 (191568 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:74592 (187424 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:78736 (183280 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:82880 (179136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:87024 (174992 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:91168 (170848 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:95312 (166704 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:99456 (162560 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:103600 (158416 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:107744 (154272 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:111888 (150128 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:116032 (145984 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:120176 (141840 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:124320 (137696 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:128464 (133552 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:132608 (129408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:136752 (125264 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:140896 (121120 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:145040 (116976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:149184 (112832 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:153328 (108688 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:157472 (104544 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:161616 (100400 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:165760 (96256 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:169904 (92112 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:174048 (87968 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:178192 (83824 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:182336 (79680 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:186480 (75536 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:190624 (71392 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:194768 (67248 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:198912 (63104 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:203056 (58960 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:207200 (54816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:211344 (50672 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:215488 (46528 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:219632 (42384 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:223776 (38240 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:227920 (34096 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:232064 (29952 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:236208 (25808 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:240352 (21664 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:244496 (17520 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:248640 (13376 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:252784 (9232 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:256928 (5088 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 89:261072 (944 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 89 at offset 261072
> UBIFS DBG (pid 1350): ubifs_recover_leb: 57:0
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 57:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:57:0
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:0 (262016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:4144 (257872 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:8288 (253728 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:12432 (249584 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:16576 (245440 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:20720 (241296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:24864 (237152 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:29008 (233008 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:33152 (228864 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:37296 (224720 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:41440 (220576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:45584 (216432 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:49728 (212288 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:53872 (208144 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:58016 (204000 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:62160 (199856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:66304 (195712 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:70448 (191568 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:74592 (187424 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:78736 (183280 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:82880 (179136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:87024 (174992 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:91168 (170848 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:95312 (166704 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:99456 (162560 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:103600 (158416 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:107744 (154272 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:111888 (150128 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:116032 (145984 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:120176 (141840 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:124320 (137696 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:128464 (133552 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:132608 (129408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:136752 (125264 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:140896 (121120 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:145040 (116976 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:149184 (112832 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:153328 (108688 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:157472 (104544 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:161616 (100400 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:165760 (96256 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:169904 (92112 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:174048 (87968 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:178192 (83824 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:182336 (79680 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:186480 (75536 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:190624 (71392 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:194768 (67248 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:198912 (63104 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:203056 (58960 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:207200 (54816 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:211344 (50672 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:215488 (46528 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:219632 (42384 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:223776 (38240 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:227920 (34096 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:232064 (29952 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:236208 (25808 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:240352 (21664 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:244496 (17520 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:248640 (13376 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:252784 (9232 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:256928 (5088 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 57:261072 (944 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: hit empty space
> UBIFS DBG (pid 1350): ubifs_end_scan: stop scanning LEB 57 at offset 261072
> UBIFS DBG (pid 1350): ubifs_recover_leb: 11:0
> UBIFS DBG (pid 1350): ubifs_start_scan: scan LEB 11:0
> UBI DBG (pid 1350): ubi_leb_read: read 262016 bytes from LEB 0:11:0
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:0 (262016 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:4144 (257872 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:8288 (253728 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:12432 (249584 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:16576 (245440 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:20720 (241296 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:24864 (237152 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:29008 (233008 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:33152 (228864 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:37296 (224720 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:41440 (220576 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:45584 (216432 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:49728 (212288 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:53872 (208144 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:58016 (204000 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:62160 (199856 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:66304 (195712 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:70448 (191568 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:74592 (187424 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:78736 (183280 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:82880 (179136 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:87024 (174992 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:91168 (170848 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:95312 (166704 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:99456 (162560 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:103600 (158416 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:107744 (154272 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:111888 (150128 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:116032 (145984 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:120176 (141840 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:124320 (137696 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:128464 (133552 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:132608 (129408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning unknown node
> UBIFS DBG (pid 1350): no_more_nodes: unexpected bad common header at 11:132608
> UBIFS DBG (pid 1350): ubifs_recover_leb: look at LEB 11:132608 (129408 bytes left)
> UBIFS DBG (pid 1350): ubifs_scan_a_node: scanning unknown node
> UBIFS error (pid 1350): ubifs_check_node: bad node type 255
> UBIFS error (pid 1350): ubifs_check_node: bad node at LEB 11:132608
> 	magic          0x6101831
> 	crc            0x495c96f5
> 	node_type      255 (unknown node)
> 	group_type     255 (unknown)
> 	sqnum          281470681808895
> 	len            65535
> node type 255 was not recognized
> Call Trace:
> [c6037b80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
> [c6037bc0] [c013e980] ubifs_check_node+0x17c/0x308
> [c6037be0] [c0147dec] ubifs_scan_a_node+0x15c/0x2d8
> [c6037c10] [c015d1c0] ubifs_recover_leb+0x3f0/0x940
> [c6037c80] [c01486fc] replay_buds+0xb4/0xb4c
> [c6037d20] [c0149894] ubifs_replay_journal+0x700/0xf48
> [c6037da0] [c013b060] ubifs_fill_super+0xda0/0x1600
> [c6037e00] [c013cbb4] ubifs_get_sb+0x10c/0x344
> [c6037e80] [c007b9a4] vfs_kern_mount+0x60/0x150
> [c6037ea0] [c007bae4] do_kern_mount+0x40/0x100
> [c6037ec0] [c00926c0] do_mount+0x40c/0x718
> [c6037f10] [c0092a5c] sys_mount+0x90/0xd8
> [c6037f40] [c0010b44] ret_from_syscall+0x0/0x38
> --- Exception: c01 at 0xfe93d18
>     LR = 0x1000347c
> UBIFS DBG (pid 1350): no_more_nodes: unexpected bad common header at 11:132608
> UBIFS error (pid 1350): ubifs_recover_leb: bad node
> UBIFS error (pid 1350): ubifs_scanned_corruption: corruption at LEB 11:132608
> UBIFS error (pid 1350): ubifs_scanned_corruption: first 8192 bytes from LEB 11:132608
> 00000000: 31181006 f5965c49 ffff0000 ffff0000 ffff0000 ffff0000 ffff0000 ffff0020  1.....\I....................... 
> 00000020: 00000000 00000000 00100000 00000000 f747be92 df3f8fc0 f1e9a37c 01b63b8c  .................G...?.....|..;.
> 00000040: b8b202a5 e569195d 38bdb7e7 b57d99ac c4583ea3 97cd6388 b60604b8 bc3f4474  .....i.]8....}...X>...c......?Dt
> 00000060: f24619d7 b03235e8 efeccfa4 6969512d c18fd058 5d33e013 39e4cbf5 23106915  .F...25.....iiQ-...X]3..9...#.i.
> 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000300: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000320: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000400: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000440: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000460: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000480: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000004e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000500: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000520: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000540: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000560: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000580: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000005e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000600: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000620: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000640: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000660: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000680: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000006e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000700: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000720: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000740: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000760: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000780: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000007e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000800: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000820: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000840: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000860: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000880: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000008e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000900: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000920: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000960: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000980: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000009e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000a80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000aa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ac0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ae0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000b80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ba0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000be0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000c80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ca0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000cc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ce0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000d80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000da0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000dc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000de0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000e80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ea0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ec0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000ee0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000f80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00000fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001000: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000010e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000011e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000012e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001300: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001320: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000013e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001400: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001440: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001460: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001480: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000014e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001500: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001520: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001540: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001560: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001580: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000015e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001600: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001620: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001640: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001660: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001680: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000016e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001700: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001720: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001740: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001760: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001780: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000017e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001800: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001820: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001840: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001860: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001880: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000018e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001900: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001920: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001960: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001980: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 000019e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001a80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001aa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ac0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ae0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001b80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ba0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001be0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001c80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ca0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001cc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ce0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001d80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001dc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001de0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001e80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ea0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ec0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001ee0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001f80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> UBIFS error (pid 1350): ubifs_recover_leb: LEB 11 scanning failed
> UBIFS DBG (pid 1352): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
> 
> Thanks,
> Anatolij
> 
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
