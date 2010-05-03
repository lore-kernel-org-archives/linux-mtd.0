Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O8uE6-0007r4-KZ
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 11:54:19 +0000
Received: by wyg36 with SMTP id 36so1289240wyg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 May 2010 04:54:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1270544458.6754.15.camel@localhost>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
Date: Mon, 3 May 2010 19:54:16 +0800
Message-ID: <r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
Subject: Re: Can not mount UBIFS
From: =?Big5?B?qkykX65t?= <okpalin@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

Thank you for your support.
I can mount UBIFS now after fixing mtd read function.

However, if I enable the "extra checks" of UBI and UBIFS, then I can
not mount UBIFS.
What's the different after enable "extra checks" of UBI and UBIFS.

Thank you,
Best regards,

2010/4/6 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-03-16 at 16:13 +0800, =C1=D6=D3=DA=BE=FE wrote:
>> Dear all,
>>
>> I try to sync /driver/mtd/ubi/*, /fs/ubifs/*, and
>> /include/linux/mtd/ubi.h with
>> git://git.infradead.org/~dedekind/ubifs-v2.6.29.git
>> But mount still fail.
>> I will try nandsim latter.
>>
>> To get more information, I enable UBI and UBIFS debugging message,
>> described below..
>> I enable UBI debugging: UBI debugging messages, Extra self-check, and
>> all Aditional UBI debugging messages.
>> I also enable UBIFS: Enable debugging with message level 3 and Enable
>> extra checks.
>>
>> Below are my entered command and debug message get from "adb logcat"
>>
>> My entered command:
>>     # cat /proc/mtd
>>     cat /proc/mtd
>>     dev:    size   erasesize  name
>>     mtd0: 00500000 00020000 "recovery"
>>     mtd1: 00800000 00020000 "boot"
>>     mtd2: 077a0000 00020000 "system"
>>     mtd3: 02000000 00020000 "cache"
>>     mtd4: 14b00000 00020000 "userdata"
>>
>>     # flash_eraseall /dev/mtd/mtd3
>>     flash_eraseall /dev/mtd/mtd3
>>     Erasing 128 Kibyte @ 2000000 -- 100 % complete.
>>
>>     # ubiattach /dev/ubi_ctrl -m 3
>>     ubiattach /dev/ubi_ctrl -m 3
>>     UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
>> available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
>> (124.0 KiB)
>>
>>     # ubinfo
>>     ubinfo
>>     UBI version:                    1
>>     Count of UBI devices:           1
>>     UBI control device major/minor: 10:57
>>     Present UBI devices:            ubi0
>>
>>     # ubimkvol /dev/ubi0 -N rootfs -s 10MiB
>>     ubimkvol /dev/ubi0 -N rootfs -s 10MiB
>>     Volume ID 0, size 83 LEBs (10539008 bytes, 10.1 MiB), LEB size
>> 126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
>>
>>     # ubinfo -a
>>     ubinfo -a
>>     UBI version:                    1
>>     Count of UBI devices:           1
>>     UBI control device major/minor: 10:57
>>     Present UBI devices:            ubi0
>>
>>     ubi0
>>     Volumes count:                           1
>>     Logical eraseblock size:                 126976 bytes, 124.0 KiB
>>     Total amount of logical eraseblocks:     256 (32505856 bytes, 31.0 M=
iB)
>>     Amount of available logical eraseblocks: 167 (21204992 bytes, 20.2 M=
iB)
>>     Maximum count of volumes                 128
>>     Count of bad physical eraseblocks:       0
>>     Count of reserved physical eraseblocks:  2
>>     Current maximum erase counter value:     2
>>     Minimum input/output unit size:          2048 bytes
>>     Character device major/minor:            249:0
>>     Present volumes:                         0
>>
>>     Volume ID:   0 (on ubi0)
>>     Type:        dynamic
>>     Alignment:   1
>>     Size:        83 LEBs (10539008 bytes, 10.1 MiB)
>>     State:       OK
>>     Name:        rootfs
>>     Character device major/minor: 249:1
>>
>>     # mount -t ubifs ubi0_0 /cache
>>     mount -t ubifs ubi0_0 /cache
>>     mount: Invalid argument
>>
>>     # mount -t ubifs ubi0:rootfs /cache
>>     mount -t ubifs ubi0:rootfs /cache
>>     mount: Invalid argument
>>
>> Debug message from "adb logcat":
>> <7>UBIFS DBG (pid 1378): ubifs_get_sb: name ubi0:rootfs, flags 0x8000
>> <7>UBI DBG (pid 1378): ubi_open_volume_path: open volume ubi0:rootfs, mo=
de 1
>> <7>UBI DBG (pid 1378): ubi_open_volume_nm: open device 0, volume rootfs,=
 mode 1
>> <7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 1
>> <7>UBIFS DBG (pid 1378): ubifs_get_sb: opened ubi0_0
>> <7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 2
>> <7>UBI DBG (pid 1378): ubi_is_mapped: test LEB 0:0
>> <7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 0:0, superblock node, leng=
th 4096
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 4096 bytes from LEB 0:0:0
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 4096 bytes from offset 0
>> of LEB 0:0, PEB 1
>> <7>UBI DBG (pid 1378): ubi_io_read: read 4096 bytes from PEB 1:4096
>> <7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 1:0
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:1:0
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
>> 0 of LEB 0:1, PEB 129
>> <7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 129:4096
>> <7>UBIFS DBG (pid 1380): ubifs_bg_thread: background thread
>> "ubifs_bgt0_0" started, PID 1380
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:0 (126976 bytes left)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:512 (126464 bytes lef=
t)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset no=
w 2048
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2048 (124928 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2560 (124416 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset no=
w 4096
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:4096 (122880 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
>> <7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 1 at offset 4=
096
>> <7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 2:0
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:2:0
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
>> 0 of LEB 0:2, PEB 130
>> <7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 130:4096
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:0 (126976 bytes left)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:512 (126464 bytes lef=
t)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset no=
w 2048
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2048 (124928 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2560 (124416 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset no=
w 4096
>> <7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:4096 (122880 bytes le=
ft)
>> <7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
>> <7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 2 at offset 4=
096
>> <7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 10:0, indexing node, lengt=
h 48
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 48 bytes from LEB 0:10:0
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 48 bytes from offset 0
>> of LEB 0:10, PEB 131
>> <7>UBI DBG (pid 1378): ubi_io_read: read 48 bytes from PEB 131:4096
>> <5>UBIFS: recovery needed
>> <7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking index head at=
 10:2048
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:10:2048
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
>> 2048 of LEB 0:10, PEB 131
>> <7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 131:6144
>> <7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking LPT head at 6=
:2048
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:6:2048
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
>> 2048 of LEB 0:6, PEB 2
>> <7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 2:6144
>> <7>UBI DBG (pid 1378): ubi_leb_read: read 11 bytes from LEB 0:6:419
>> <7>UBI DBG (pid 1378): ubi_eba_read_leb: read 11 bytes from offset 419
>> of LEB 0:6, PEB 2
>> <7>UBI DBG (pid 1378): ubi_io_read: read 11 bytes from PEB 2:4515
>> <3>UBIFS error (pid 1378): check_lpt_type: invalid type (0) in LPT node =
type 2
>
> Looks like your drive has problems with reading 11 bytes. Please,
> validate it.
>
> --
> Best Regards,
> Artem Bityutskiy (=A7=A1=A7=E2=A7=E4=A7=D7=A7=DE =A7=A2=A7=DA=A7=E4=A7=F0=
=A7=E8=A7=DC=A7=DA=A7=DB)
>
>
