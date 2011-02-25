Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pt4rZ-00084p-Te
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 21:06:12 +0000
From: "Marco Cesarano" <mcesaran@broadcom.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Fri, 25 Feb 2011 13:03:07 -0800
Subject: RE: UBI power cut
Message-ID: <2B8D104E6375C044820294EF730F789F582C219251@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>,
	<1298435559.2431.2.camel@koala>
In-Reply-To: <1298435559.2431.2.camel@koala>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

thanks for your answer. I enabled the debugging mode and I pasted the logs:

Adjust partition entire_device size from entire device to ff00000 to avoid =
overl
ap with BBT reserved space
Creating 3 MTD partitions on "brcmnand.0":
0x000000500000-0x00000ff00000 : "rootfs"
0x000000000000-0x00000ff00000 : "entire_device"
0x000000000000-0x000000500000 : "kernel"
EBI CS0: setting up NOR flash
physmap platform flash device: 04000000 at 1c000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
UBI: attaching mtd0 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
eth0 Link UP.
Auto config phy
eth0: Link is up, 100 Mbps Full Duplex
UBI: max. sequence number:       0
UBI: volume 0 ("rootfs") re-sized from 42 to 1972 LEBs
UBI: attached mtd0 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            250 MiB
UBI: number of good PEBs:        1995
UBI: number of bad PEBs:         5
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1995
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 0/0
UBI: image sequence number:  719378999
UBI: background thread "ubi_bgt0d" started, PID 385
UBI: scrubbed PEB 17 (LEB 0:15), data moved to PEB 1842
UBI: scrubbed PEB 13 (LEB 0:11), data moved to PEB 1831
UBI: scrubbed PEB 32 (LEB 0:30), data moved to PEB 1718
UBI: scrubbed PEB 40 (LEB 0:38), data moved to PEB 1655
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   248999936 bytes (243164 KiB, 237 MiB, 1961 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:12.
Freeing unused kernel memory: 172k freed
starting pid 1, tty '': '/etc/init.d/rcS'
UBI: scrubbed PEB 26 (LEB 0:24), data moved to PEB 1624
Mounting virtual filesystems
Starting mdev
* WARNING: THIS STB CONTAINS GPLv3 SOFTWARE
* GPLv3 programs must be removed in order to enable security.
* See: http://www.gnu.org/licenses/gpl-faq.html#Tivoization
/bin/mocacfg: MoCA utilities are not installed
Configuring eth0 interface
brcm-pm: enabling moca_genet clocks
brcm-pm: enabling enet clocks
eth0 Link DOWN.
Configuring eth1 interface
Configuring lo interface
Starting network services
starting pid 1, tty '/dev/ttyS0': '/bin/login -f root'
Jan  1 00:00:11 login[421]: root login on 'ttyS0'
# eth0 Link UP.
Auto config phy
eth0: Link is up, 100 Mbps Full Duplex

# mount stb-bld-00:/exp/mcesaran /mnt/nfs/
# cp /mnt/nfs/ubifs_test2.sh .; sync; chmod +x ./ubifs_test2.sh; umount /mn=
t/nfs
/

#
# ./ubifs_test2.sh
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_0
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_1
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_2
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_3
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_4
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_5
Call Trace:
[<80016390>] dump_stack+0x8/0x34
[<8033a3b4>] ubi_io_write+0x3f0/0x4b4
[<803370e0>] ubi_eba_write_leb+0x398/0x8cc
[<80334c58>] ubi_leb_write+0x18c/0x194
[<80211a94>] dbg_leb_write+0x10c/0x124
[<801e1298>] ubifs_wbuf_write_nolock+0x188/0xa60
[<801d3838>] ubifs_jnl_write_data+0x17c/0x414
[<801d6fb8>] do_writepage+0x1d0/0x44c
[<800997f0>] __writepage+0x18/0x170
[<8009a74c>] write_cache_pages+0x298/0x510
[<8009aa60>] do_writepages+0x78/0x80
[<800f01d0>] writeback_single_inode+0xb0/0x438
[<800f0d54>] generic_sync_sb_inodes+0x4f0/0x75c
[<800f1118>] writeback_inodes+0x98/0x164
[<8009b81c>] balance_dirty_pages_ratelimited_nr+0x37c/0x43c
[<80091a4c>] generic_file_buffered_write+0x1e0/0x398
[<80092208>] __generic_file_aio_write_nolock+0x278/0x608
[<80092a4c>] generic_file_aio_write+0x78/0x12c
[<801d47b0>] ubifs_aio_write+0x134/0x248
[<800c9c54>] do_sync_write+0xe0/0x158
[<800ca934>] vfs_write+0xb4/0x174
[<800caaec>] sys_write+0x4c/0xa4
[<80003d7c>] stack_done+0x20/0x3c

UBI warning: ubi_eba_write_leb: failed to write data to PEB 50
UBI: recover PEB 50, move data to PEB 1074
UBI: data was successfully recovered
UBI: run torture test for PEB 50
UBI: PEB 50 passed torture test, do not mark it a bad
UBI warning: ubi_eba_write_leb: failed to write data to PEB 53
UBI warning: ubi_ro_mode: switch to read-only mode
UBIFS error (pid 445): ubifs_wbuf_write_nolock: cannot write 4144 bytes to =
LEB 1
964:81920, error 5
Call Trace:
[<80016390>] dump_stack+0x8/0x34
[<801e1940>] ubifs_wbuf_write_nolock+0x830/0xa60
[<801d3838>] ubifs_jnl_write_data+0x17c/0x414
[<801d6fb8>] do_writepage+0x1d0/0x44c
[<800997f0>] __writepage+0x18/0x170
[<8009a74c>] write_cache_pages+0x298/0x510
[<8009aa60>] do_writepages+0x78/0x80
[<800f01d0>] writeback_single_inode+0xb0/0x438
[<800f0d54>] generic_sync_sb_inodes+0x4f0/0x75c
[<800f1118>] writeback_inodes+0x98/0x164
[<8009b81c>] balance_dirty_pages_ratelimited_nr+0x37c/0x43c
[<80091a4c>] generic_file_buffered_write+0x1e0/0x398
[<80092208>] __generic_file_aio_write_nolock+0x278/0x608
[<80092a4c>] generic_file_aio_write+0x78/0x12c
[<801d47b0>] ubifs_aio_write+0x134/0x248
[<800c9c54>] do_sync_write+0xe0/0x158
[<800ca934>] vfs_write+0xb4/0x174
[<800caaec>] sys_write+0x4c/0xa4
[<80003d7c>] stack_done+0x20/0x3c

UBIFS error (pid 445): ubifs_check_node: bad CRC: calculated 0x5bc413d4, re=
ad 0x
ae0a6952
UBIFS error (pid 445): ubifs_check_node: bad node at LEB 1964:82784
Call Trace:
[<80016390>] dump_stack+0x8/0x34
[<801e1e1c>] ubifs_check_node+0x1b4/0x320
[<801ebee0>] ubifs_scan_a_node+0x194/0x488
[<801ec274>] ubifs_scan+0xa0/0x454
[<80215750>] dbg_dump_leb+0x90/0x180
[<801e17a4>] ubifs_wbuf_write_nolock+0x694/0xa60
[<801d3838>] ubifs_jnl_write_data+0x17c/0x414
[<801d6fb8>] do_writepage+0x1d0/0x44c
[<800997f0>] __writepage+0x18/0x170
[<8009a74c>] write_cache_pages+0x298/0x510
[<8009aa60>] do_writepages+0x78/0x80
[<800f01d0>] writeback_single_inode+0xb0/0x438
[<800f0d54>] generic_sync_sb_inodes+0x4f0/0x75c
[<800f1118>] writeback_inodes+0x98/0x164
[<8009b81c>] balance_dirty_pages_ratelimited_nr+0x37c/0x43c
[<80091a4c>] generic_file_buffered_write+0x1e0/0x398
[<80092208>] __generic_file_aio_write_nolock+0x278/0x608
[<80092a4c>] generic_file_aio_write+0x78/0x12c
[<801d47b0>] ubifs_aio_write+0x134/0x248
[<800c9c54>] do_sync_write+0xe0/0x158
[<800ca934>] vfs_write+0xb4/0x174
[<800caaec>] sys_write+0x4c/0xa4
[<80003d7c>] stack_done+0x20/0x3c

UBIFS error (pid 445): ubifs_scan: bad node
UBIFS error (pid 445): ubifs_scanned_corruption: corruption at LEB 1964:827=
84
UBIFS error (pid 445): ubifs_scanned_corruption: first 8192 bytes from LEB =
1964:
82784
UBIFS error (pid 445): ubifs_scan: LEB 1964 scanning failed
UBIFS error (pid 445): dbg_dump_leb: scan error -135
UBIFS warning (pid 445): ubifs_ro_mode: switched to read-only mode, error 5
UBIFS error (pid 159): make_reservation: cannot reserve 2849 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 9 of inode 333, erro=
r -30
UBIFS error (pid 159): make_reservation: cannot reserve 160 bytes in jhead =
1, er
ror -30
UBIFS error (pid 159): ubifs_write_inode: can't write inode 334, error -30
Call Trace:
[<80016390>] dump_stack+0x8/0x34
[<801d388c>] ubifs_jnl_write_data+0x1d0/0x414
[<801d6fb8>] do_writepage+0x1d0/0x44c
[<800997f0>] __writepage+0x18/0x170
[<8009a74c>] write_cache_pages+0x298/0x510
[<8009aa60>] do_writepages+0x78/0x80
[<800f01d0>] writeback_single_inode+0xb0/0x438
[<800f0d54>] generic_sync_sb_inodes+0x4f0/0x75c
[<800f1118>] writeback_inodes+0x98/0x164
[<8009b81c>] balance_dirty_pages_ratelimited_nr+0x37c/0x43c
[<80091a4c>] generic_file_buffered_write+0x1e0/0x398
[<80092208>] __generic_file_aio_write_nolock+0x278/0x608
[<80092a4c>] generic_file_aio_write+0x78/0x12c
[<801d47b0>] ubifs_aio_write+0x134/0x248
[<800c9c54>] do_sync_write+0xe0/0x158
[<800ca934>] vfs_write+0xb4/0x174
[<800caaec>] sys_write+0x4c/0xa4
UBIFS error (pid 159): make_reservation: cannot reserve 160 bytes in jhead =
1, er
ror -30
UBIFS error (pid 159): ubifs_write_inode: can't write inode 335, error -30
UBIFS error (pid 159): make_reservation: cannot reserve 160 bytes in jhead =
1, er
ror -30
UBIFS error (pid 159): ubifs_write_inode: can't write inode 336, error -30
UBIFS error (pid 159): make_reservation: cannot reserve 2922 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 10 of inode 333, err=
or -3
0
UBIFS error (pid 159): make_reservation: cannot reserve 2442 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 1 of inode 334, erro=
r -30
[<80003d7c>] stack_done+0x20/0x3c

UBIFS error (pid 445): do_writepage: cannot write page 367 of inode 332, er=
ror 5
UBIFS error (pid 159): make_reservation: cannot reserve 2442 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 1 of inode 335, erro=
r -30
UBIFS error (pid 159): make_reservation: cannot reserve 2442 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 1 of inode 336, erro=
r -30
UBIFS error (pid 159): make_reservation: cannot reserve 2974 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 11 of inode 333, err=
or -3
0
UBIFS error (pid 159): make_reservation: cannot reserve 3266 bytes in jhead=
 2, e
rror -30
UBIFS error (pid 159): do_writepage: cannot write page 2 of inode 334, erro=
r -30
UBIFS error (pid 159): make_reservation: cannot reserve 394 bytes in jhead =
2, er
ror -30
UBIFS error (pid 159): do_writepage: cannot write page 368 of inode 332, er=
ror -
30
cp: write error:UBIFS error (pid 159): make_reservation: cannot reserve 326=
6 byt
es in jhead 2, error -30
 Read-only file UBIFS error (pid 159): do_writepage: cannot write page 2 of=
 inod
e 335, error -30
system
UBIFS error (pid 159): make_reservation: cannot reserve 160 bytes in jhead =
1, er
ror -30
cp /lib/libstdc+UBIFS error (pid 159): ubifs_write_inode: can't write inode=
 336,
 error -30
+.so.6.0.13 /rooUBIFS error (pid 159): make_reservation: cannot reserve 290=
1 byt
es in jhead 2, error -30
t/libstdc++_6
cUBIFS error (pid 159): do_writepage: cannot write page 12 of inode 333, er=
ror -
30
p: can't create UBIFS error (pid 159): make_reservation: cannot reserve 234=
8 byt
es in jhead 2, error -30
'/root/libstdc++UBIFS error (pid 159): do_writepage: cannot write page 3 of=
 inod
e 334, error -30
_6': Read-only fUBIFS error (pid 159): make_reservation: cannot reserve 992=
 byte
s in jhead 2, error -30
ile system
cp /UBIFS error (pid 159): do_writepage: cannot write page 369 of inode 332=
, err
or -30
lib/libstdc++.so.6.0.13 /root/libstdc++_7
cp: can't create '/root/libstdc++_7': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_8
cp: can't create '/root/libstdc++_8': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_9
cp: can't create '/root/libstdc++_9': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_10
cp: can't create '/root/libstdc++_10': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_11
cp: can't create '/root/libstdc++_11': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_12
cp: can't create '/root/libstdc++_12': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_13
cp: can't create '/root/libstdc++_13': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_14
cp: can't create '/root/libstdc++_14': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_15
cp: can't create '/root/libstdc++_15': Read-only file systUBIFS error (pid =
159):
 make_reservation: cannot reserve 2348 bytes in jhead 2, error -30
em
cp /lib/libsUBIFS error (pid 159): do_writepage: cannot write page 3 of ino=
de 33
5, error -30
tdc++.so.6.0.13 UBIFS error (pid 159): make_reservation: cannot reserve 234=
8 byt
es in jhead 2, error -30
/root/libstdc++_UBIFS error (pid 159): do_writepage: cannot write page 3 of=
 inod
e 336, error -30
16
cp: can't crUBIFS error (pid 159): make_reservation: cannot reserve 2953 by=
tes i
n jhead 2, error -30
eate '/root/libsUBIFS error (pid 159): do_writepage: cannot write page 13 o=
f ino
de 333, error -30
tdc++_16': Read-UBIFS error (pid 159): make_reservation: cannot reserve 288=
0 byt
es in jhead 2, error -30
only file systemUBIFS error (pid 159): do_writepage: cannot write page 4 of=
 inod
e 334, error -30

cp /lib/libstdUBIFS error (pid 159): make_reservation: cannot reserve 2880 =
bytes
 in jhead 2, error -30
c++.so.6.0.13 /rUBIFS error (pid 159): do_writepage: cannot write page 4 of=
 inod
e 335, error -30
oot/libstdc++_17UBIFS error (pid 159): make_reservation: cannot reserve 288=
0 byt
es in jhead 2, error -30

cp: can't creaUBIFS error (pid 159): do_writepage: cannot write page 4 of i=
node
336, error -30
te '/root/libstdc++_17': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_18
cp: can't create '/root/libstdc++_18': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_19
cp: can't create '/root/libstdc++_19': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_20
cp: can't create '/root/libstdc++_20': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_21
cp: can't create '/root/libstdc++_21': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_22
cp: can't create '/root/libstdc++_22': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_23
cp: can't create '/root/libstdc++_23': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_24
cp: can't create '/root/libstdc++_24': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_25
cp: can't create '/root/libstdc++_25': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_26
cp: can't create '/root/libstdc++_26': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_27
cp: can't create '/root/libstdc++_27': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_28
cp: can't create '/root/libstdc++_28': Read-only file system
cp /lib/libstdc++.so.6.0.13 /root/libstdc++_29
cp: can't create '/root/libstdc++_29': Read-only file system


Marco



________________________________________
From: Artem Bityutskiy [dedekind1@gmail.com]
Sent: Tuesday, February 22, 2011 8:32 PM
To: Marco Cesarano
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI power cut

On Tue, 2011-02-22 at 14:21 -0800, Marco Cesarano wrote:
> Hi,
>
> I tested UBI/UBIFS on Linux 2.6.31 and I experienced some issues in
> case of power cut. I've pasted some logs below. You can see that the
> driver returns a code that means that a page is partially written on
> the flash, and at the boot phase the driver detects corrupted data.

Do you still have this corrupted media? Could you please enable UBIFS
debugging and reproduce the issue and send the UBIFS logs? This may
help: http://linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

--
Best Regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
