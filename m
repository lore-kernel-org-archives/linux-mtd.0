Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz4gI-0005vU-UE
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 09:02:48 +0000
Subject: Re: Can not mount UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E6=9E=97=E4=BA=8E=E5=B3=BB?= <okpalin@gmail.com>
In-Reply-To: <a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 12:00:58 +0300
Message-ID: <1270544458.6754.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-16 at 16:13 +0800, 林于峻 wrote:
> Dear all,
> 
> I try to sync /driver/mtd/ubi/*, /fs/ubifs/*, and
> /include/linux/mtd/ubi.h with
> git://git.infradead.org/~dedekind/ubifs-v2.6.29.git
> But mount still fail.
> I will try nandsim latter.
> 
> To get more information, I enable UBI and UBIFS debugging message,
> described below..
> I enable UBI debugging: UBI debugging messages, Extra self-check, and
> all Aditional UBI debugging messages.
> I also enable UBIFS: Enable debugging with message level 3 and Enable
> extra checks.
> 
> Below are my entered command and debug message get from "adb logcat"
> 
> My entered command:
>     # cat /proc/mtd
>     cat /proc/mtd
>     dev:    size   erasesize  name
>     mtd0: 00500000 00020000 "recovery"
>     mtd1: 00800000 00020000 "boot"
>     mtd2: 077a0000 00020000 "system"
>     mtd3: 02000000 00020000 "cache"
>     mtd4: 14b00000 00020000 "userdata"
> 
>     # flash_eraseall /dev/mtd/mtd3
>     flash_eraseall /dev/mtd/mtd3
>     Erasing 128 Kibyte @ 2000000 -- 100 % complete.
> 
>     # ubiattach /dev/ubi_ctrl -m 3
>     ubiattach /dev/ubi_ctrl -m 3
>     UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
> available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
> (124.0 KiB)
> 
>     # ubinfo
>     ubinfo
>     UBI version:                    1
>     Count of UBI devices:           1
>     UBI control device major/minor: 10:57
>     Present UBI devices:            ubi0
> 
>     # ubimkvol /dev/ubi0 -N rootfs -s 10MiB
>     ubimkvol /dev/ubi0 -N rootfs -s 10MiB
>     Volume ID 0, size 83 LEBs (10539008 bytes, 10.1 MiB), LEB size
> 126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
> 
>     # ubinfo -a
>     ubinfo -a
>     UBI version:                    1
>     Count of UBI devices:           1
>     UBI control device major/minor: 10:57
>     Present UBI devices:            ubi0
> 
>     ubi0
>     Volumes count:                           1
>     Logical eraseblock size:                 126976 bytes, 124.0 KiB
>     Total amount of logical eraseblocks:     256 (32505856 bytes, 31.0 MiB)
>     Amount of available logical eraseblocks: 167 (21204992 bytes, 20.2 MiB)
>     Maximum count of volumes                 128
>     Count of bad physical eraseblocks:       0
>     Count of reserved physical eraseblocks:  2
>     Current maximum erase counter value:     2
>     Minimum input/output unit size:          2048 bytes
>     Character device major/minor:            249:0
>     Present volumes:                         0
> 
>     Volume ID:   0 (on ubi0)
>     Type:        dynamic
>     Alignment:   1
>     Size:        83 LEBs (10539008 bytes, 10.1 MiB)
>     State:       OK
>     Name:        rootfs
>     Character device major/minor: 249:1
> 
>     # mount -t ubifs ubi0_0 /cache
>     mount -t ubifs ubi0_0 /cache
>     mount: Invalid argument
> 
>     # mount -t ubifs ubi0:rootfs /cache
>     mount -t ubifs ubi0:rootfs /cache
>     mount: Invalid argument
> 
> Debug message from "adb logcat":
> <7>UBIFS DBG (pid 1378): ubifs_get_sb: name ubi0:rootfs, flags 0x8000
> <7>UBI DBG (pid 1378): ubi_open_volume_path: open volume ubi0:rootfs, mode 1
> <7>UBI DBG (pid 1378): ubi_open_volume_nm: open device 0, volume rootfs, mode 1
> <7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 1
> <7>UBIFS DBG (pid 1378): ubifs_get_sb: opened ubi0_0
> <7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 2
> <7>UBI DBG (pid 1378): ubi_is_mapped: test LEB 0:0
> <7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 0:0, superblock node, length 4096
> <7>UBI DBG (pid 1378): ubi_leb_read: read 4096 bytes from LEB 0:0:0
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 4096 bytes from offset 0
> of LEB 0:0, PEB 1
> <7>UBI DBG (pid 1378): ubi_io_read: read 4096 bytes from PEB 1:4096
> <7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 1:0
> <7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:1:0
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
> 0 of LEB 0:1, PEB 129
> <7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 129:4096
> <7>UBIFS DBG (pid 1380): ubifs_bg_thread: background thread
> "ubifs_bgt0_0" started, PID 1380
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:0 (126976 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:512 (126464 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2048 (124928 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2560 (124416 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:4096 (122880 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
> <7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 1 at offset 4096
> <7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 2:0
> <7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:2:0
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
> 0 of LEB 0:2, PEB 130
> <7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 130:4096
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:0 (126976 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:512 (126464 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 2048
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2560 (124416 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 4096
> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:4096 (122880 bytes left)
> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
> <7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 2 at offset 4096
> <7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 10:0, indexing node, length 48
> <7>UBI DBG (pid 1378): ubi_leb_read: read 48 bytes from LEB 0:10:0
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 48 bytes from offset 0
> of LEB 0:10, PEB 131
> <7>UBI DBG (pid 1378): ubi_io_read: read 48 bytes from PEB 131:4096
> <5>UBIFS: recovery needed
> <7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking index head at 10:2048
> <7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:10:2048
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
> 2048 of LEB 0:10, PEB 131
> <7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 131:6144
> <7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking LPT head at 6:2048
> <7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:6:2048
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
> 2048 of LEB 0:6, PEB 2
> <7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 2:6144
> <7>UBI DBG (pid 1378): ubi_leb_read: read 11 bytes from LEB 0:6:419
> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 11 bytes from offset 419
> of LEB 0:6, PEB 2
> <7>UBI DBG (pid 1378): ubi_io_read: read 11 bytes from PEB 2:4515
> <3>UBIFS error (pid 1378): check_lpt_type: invalid type (0) in LPT node type 2

Looks like your drive has problems with reading 11 bytes. Please,
validate it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
