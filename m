Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PrY6Z-0001gC-Av
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2011 15:55:58 +0000
Date: Mon, 21 Feb 2011 16:55:17 +0100
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: UBIFS recovery stops
Message-ID: <20110221165517.15e897ea@wker>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/TnJUy1tl1F0XOwQK8FkOM3."
Cc: Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--MP_/TnJUy1tl1F0XOwQK8FkOM3.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

When running power cut test on our NOR flash we are seeing
UBIFS recovery process stopping due to CRC errors in one
data node. A few data bytes starting after common header
node are corrupted. Previous data node and also subsequent
data nodes in the affected LEB seems to be correct, they
do not have corrupted bytes, CRC checksum is okay there.
My understanding is that UBI/UBIFS writes sequentially to
the LEB and this observed corruption cannot be a result
of interrupted last write operation before power cut. I've
attached a file with the full kernel log with UBI/UBIFS
debug messages enabled (since it is quite big). The issue
is quite hard to reproduce, it appears after running the
test several hours or even days.

The small corrupted data area in the flash seems to result
from an uncompleted write operation: repeated reading from
this area shows, that the bit values flip.

Mounting the file system with "no_chk_data_crc" option
doesn't work also, since during recovery the CRC checking
of data nodes is enforced. Thus, we end up with an unusable
device. Shouldn't it be possible to mount the file system
even if there are some corrupted data bytes?

Thanks,
Anatolij

--MP_/TnJUy1tl1F0XOwQK8FkOM3.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ubifs-cfi-nor-failed-recovery.txt

UBI DBG (pid 1392): ctrl_cdev_ioctl: attach MTD device
UBI: attaching mtd8 to ubi1
UBI DBG (pid 1392): io_init: min_io_size      64
UBI DBG (pid 1392): io_init: hdrs_min_io_size 1
UBI DBG (pid 1392): io_init: ec_hdr_alsize    64
UBI DBG (pid 1392): io_init: vid_hdr_alsize   64
UBI DBG (pid 1392): io_init: vid_hdr_offset   64
UBI DBG (pid 1392): io_init: vid_hdr_aloffset 64
UBI DBG (pid 1392): io_init: vid_hdr_shift    0
UBI DBG (pid 1392): io_init: leb_start        128
UBI DBG (pid 1392): io_init: max_erroneous    20
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    64
UBI: sub-page size:              1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI DBG (pid 1392): ubi_scan: process PEB 0
UBI DBG (pid 1392): process_eb: scan PEB 0
UBI DBG (pid 1392): ubi_scan_add_used: PEB 0, LEB 0:44, EC 265, sqnum 77087, bitflips 0
UBI DBG (pid 1392): add_volume: added volume 0
UBI DBG (pid 1392): ubi_scan: process PEB 1
UBI DBG (pid 1392): process_eb: scan PEB 1
UBI DBG (pid 1392): ubi_scan_add_used: PEB 1, LEB 0:11, EC 196, sqnum 59997, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 2
UBI DBG (pid 1392): process_eb: scan PEB 2
UBI DBG (pid 1392): ubi_scan_add_used: PEB 2, LEB 0:28, EC 195, sqnum 77081, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 3
UBI DBG (pid 1392): process_eb: scan PEB 3
UBI DBG (pid 1392): ubi_scan_add_used: PEB 3, LEB 0:29, EC 172, sqnum 77065, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 4
UBI DBG (pid 1392): process_eb: scan PEB 4
UBI DBG (pid 1392): ubi_scan_add_used: PEB 4, LEB 0:27, EC 182, sqnum 77085, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 5
UBI DBG (pid 1392): process_eb: scan PEB 5
UBI DBG (pid 1392): ubi_scan_add_used: PEB 5, LEB 0:1, EC 177, sqnum 76553, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 6
UBI DBG (pid 1392): process_eb: scan PEB 6
UBI DBG (pid 1392): ubi_scan_add_used: PEB 6, LEB 0:34, EC 192, sqnum 77100, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 7
UBI DBG (pid 1392): process_eb: scan PEB 7
UBI DBG (pid 1392): ubi_io_read_vid_hdr: no VID header found at PEB 7, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to free: PEB 7, EC 169
UBI DBG (pid 1392): ubi_scan: process PEB 8
UBI DBG (pid 1392): process_eb: scan PEB 8
UBI DBG (pid 1392): ubi_scan_add_used: PEB 8, LEB 0:8, EC 184, sqnum 64800, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 9
UBI DBG (pid 1392): process_eb: scan PEB 9
UBI DBG (pid 1392): ubi_scan_add_used: PEB 9, LEB 0:39, EC 201, sqnum 77069, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 10
UBI DBG (pid 1392): process_eb: scan PEB 10
UBI DBG (pid 1392): ubi_scan_add_used: PEB 10, LEB 0:21, EC 172, sqnum 77092, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 11
UBI DBG (pid 1392): process_eb: scan PEB 11
UBI DBG (pid 1392): ubi_scan_add_used: PEB 11, LEB 0:9, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 12
UBI DBG (pid 1392): process_eb: scan PEB 12
UBI DBG (pid 1392): ubi_scan_add_used: PEB 12, LEB 0:10, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 13
UBI DBG (pid 1392): process_eb: scan PEB 13
UBI DBG (pid 1392): ubi_scan_add_used: PEB 13, LEB 0:25, EC 173, sqnum 71128, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 14
UBI DBG (pid 1392): process_eb: scan PEB 14
UBI DBG (pid 1392): ubi_scan_add_used: PEB 14, LEB 0:12, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 15
UBI DBG (pid 1392): process_eb: scan PEB 15
UBI DBG (pid 1392): ubi_scan_add_used: PEB 15, LEB 2147479551:0, EC 1, sqnum 1, bitflips 0
UBI DBG (pid 1392): add_volume: added volume 2147479551
UBI DBG (pid 1392): ubi_scan: process PEB 16
UBI DBG (pid 1392): process_eb: scan PEB 16
UBI DBG (pid 1392): ubi_scan_add_used: PEB 16, LEB 2147479551:1, EC 1, sqnum 2, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 17
UBI DBG (pid 1392): process_eb: scan PEB 17
UBI DBG (pid 1392): ubi_scan_add_used: PEB 17, LEB 0:30, EC 198, sqnum 77068, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 18
UBI DBG (pid 1392): process_eb: scan PEB 18
UBI DBG (pid 1392): ubi_scan_add_used: PEB 18, LEB 0:26, EC 192, sqnum 77080, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 19
UBI DBG (pid 1392): process_eb: scan PEB 19
UBI DBG (pid 1392): ubi_scan_add_used: PEB 19, LEB 0:0, EC 1, sqnum 3, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 20
UBI DBG (pid 1392): process_eb: scan PEB 20
UBI DBG (pid 1392): ubi_scan_add_used: PEB 20, LEB 0:41, EC 202, sqnum 76941, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 21
UBI DBG (pid 1392): process_eb: scan PEB 21
UBI DBG (pid 1392): ubi_scan_add_used: PEB 21, LEB 0:7, EC 157, sqnum 51982, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 22
UBI DBG (pid 1392): process_eb: scan PEB 22
UBI DBG (pid 1392): ubi_io_read_vid_hdr: no VID header found at PEB 22, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to free: PEB 22, EC 242
UBI DBG (pid 1392): ubi_scan: process PEB 23
UBI DBG (pid 1392): process_eb: scan PEB 23
UBI DBG (pid 1392): ubi_scan_add_used: PEB 23, LEB 0:13, EC 217, sqnum 59978, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 24
UBI DBG (pid 1392): process_eb: scan PEB 24
UBI DBG (pid 1392): ubi_scan_add_used: PEB 24, LEB 0:2, EC 178, sqnum 76554, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 25
UBI DBG (pid 1392): process_eb: scan PEB 25
UBI DBG (pid 1392): ubi_scan_add_used: PEB 25, LEB 0:33, EC 177, sqnum 77079, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 26
UBI DBG (pid 1392): process_eb: scan PEB 26
UBI DBG (pid 1392): ubi_scan_add_used: PEB 26, LEB 0:39, EC 221, sqnum 77094, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 9, sqnum 77069, EC 201
UBI DBG (pid 1392): compare_lebs: second PEB 26 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 9, EC 201
UBI DBG (pid 1392): ubi_scan: process PEB 27
UBI DBG (pid 1392): process_eb: scan PEB 27
UBI DBG (pid 1392): ubi_scan_add_used: PEB 27, LEB 0:18, EC 223, sqnum 77082, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 28
UBI DBG (pid 1392): process_eb: scan PEB 28
UBI DBG (pid 1392): ubi_scan_add_used: PEB 28, LEB 0:30, EC 196, sqnum 77093, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 77068, EC 198
UBI DBG (pid 1392): compare_lebs: second PEB 28 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 17, EC 198
UBI DBG (pid 1392): ubi_scan: process PEB 29
UBI DBG (pid 1392): process_eb: scan PEB 29
UBI DBG (pid 1392): ubi_scan_add_used: PEB 29, LEB 0:16, EC 170, sqnum 77070, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 30
UBI DBG (pid 1392): process_eb: scan PEB 30
UBI DBG (pid 1392): ubi_scan_add_used: PEB 30, LEB 0:24, EC 167, sqnum 71126, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 31
UBI DBG (pid 1392): process_eb: scan PEB 31
UBI DBG (pid 1392): ubi_scan_add_used: PEB 31, LEB 0:15, EC 170, sqnum 77071, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 32
UBI DBG (pid 1392): process_eb: scan PEB 32
UBI DBG (pid 1392): ubi_scan_add_used: PEB 32, LEB 0:15, EC 179, sqnum 77096, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 31, sqnum 77071, EC 170
UBI DBG (pid 1392): compare_lebs: second PEB 32 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 31, EC 170
UBI DBG (pid 1392): ubi_scan: process PEB 33
UBI DBG (pid 1392): process_eb: scan PEB 33
UBI DBG (pid 1392): ubi_scan_add_used: PEB 33, LEB 0:19, EC 174, sqnum 77074, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 34
UBI DBG (pid 1392): process_eb: scan PEB 34
UBI DBG (pid 1392): ubi_scan_add_used: PEB 34, LEB 0:5, EC 200, sqnum 77090, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 35
UBI DBG (pid 1392): process_eb: scan PEB 35
UBI DBG (pid 1392): ubi_scan_add_used: PEB 35, LEB 0:16, EC 177, sqnum 77095, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 29, sqnum 77070, EC 170
UBI DBG (pid 1392): compare_lebs: second PEB 35 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 29, EC 170
UBI DBG (pid 1392): ubi_scan: process PEB 36
UBI DBG (pid 1392): process_eb: scan PEB 36
UBI DBG (pid 1392): ubi_scan_add_used: PEB 36, LEB 0:37, EC 179, sqnum 77049, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 37
UBI DBG (pid 1392): process_eb: scan PEB 37
UBI DBG (pid 1392): ubi_scan_add_used: PEB 37, LEB 0:14, EC 182, sqnum 77050, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 38
UBI DBG (pid 1392): process_eb: scan PEB 38
UBI DBG (pid 1392): ubi_scan_add_used: PEB 38, LEB 0:38, EC 216, sqnum 77073, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 39
UBI DBG (pid 1392): process_eb: scan PEB 39
UBI DBG (pid 1392): ubi_scan_add_used: PEB 39, LEB 0:23, EC 199, sqnum 71125, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 40
UBI DBG (pid 1392): process_eb: scan PEB 40
UBI DBG (pid 1392): ubi_scan_add_used: PEB 40, LEB 0:17, EC 172, sqnum 77072, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 41
UBI DBG (pid 1392): process_eb: scan PEB 41
UBI DBG (pid 1392): ubi_scan_add_used: PEB 41, LEB 0:17, EC 206, sqnum 77097, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 77072, EC 172
UBI DBG (pid 1392): compare_lebs: second PEB 41 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 40, EC 172
UBI DBG (pid 1392): ubi_scan: process PEB 42
UBI DBG (pid 1392): process_eb: scan PEB 42
UBI DBG (pid 1392): ubi_scan_add_used: PEB 42, LEB 0:45, EC 194, sqnum 77086, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 43
UBI DBG (pid 1392): process_eb: scan PEB 43
UBI DBG (pid 1392): ubi_scan_add_used: PEB 43, LEB 0:5, EC 185, sqnum 77040, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 77090, EC 200
UBI DBG (pid 1392): compare_lebs: first PEB 43 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 43, EC 185
UBI DBG (pid 1392): ubi_scan: process PEB 44
UBI DBG (pid 1392): process_eb: scan PEB 44
UBI DBG (pid 1392): ubi_scan_add_used: PEB 44, LEB 0:36, EC 179, sqnum 77002, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 45
UBI DBG (pid 1392): process_eb: scan PEB 45
UBI DBG (pid 1392): ubi_scan_add_used: PEB 45, LEB 0:38, EC 227, sqnum 77098, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 77073, EC 216
UBI DBG (pid 1392): compare_lebs: second PEB 45 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 38, EC 216
UBI DBG (pid 1392): ubi_scan: process PEB 46
UBI DBG (pid 1392): process_eb: scan PEB 46
UBI DBG (pid 1392): ubi_io_read_vid_hdr: no VID header found at PEB 46, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to free: PEB 46, EC 207
UBI DBG (pid 1392): ubi_scan: process PEB 47
UBI DBG (pid 1392): process_eb: scan PEB 47
UBI DBG (pid 1392): ubi_scan_add_used: PEB 47, LEB 0:31, EC 171, sqnum 77084, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 48
UBI DBG (pid 1392): process_eb: scan PEB 48
UBI DBG (pid 1392): ubi_scan_add_used: PEB 48, LEB 0:22, EC 176, sqnum 71066, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 49
UBI DBG (pid 1392): process_eb: scan PEB 49
UBI DBG (pid 1392): ubi_scan_add_used: PEB 49, LEB 0:4, EC 170, sqnum 77028, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 50
UBI DBG (pid 1392): process_eb: scan PEB 50
UBI DBG (pid 1392): ubi_scan_add_used: PEB 50, LEB 0:32, EC 170, sqnum 77083, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 51
UBI DBG (pid 1392): process_eb: scan PEB 51
UBI DBG (pid 1392): ubi_scan_add_used: PEB 51, LEB 0:3, EC 176, sqnum 77066, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 52
UBI DBG (pid 1392): process_eb: scan PEB 52
UBI DBG (pid 1392): ubi_scan_add_used: PEB 52, LEB 0:43, EC 186, sqnum 77077, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 53
UBI DBG (pid 1392): process_eb: scan PEB 53
UBI DBG (pid 1392): ubi_scan_add_used: PEB 53, LEB 0:40, EC 172, sqnum 77001, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 54
UBI DBG (pid 1392): process_eb: scan PEB 54
UBI DBG (pid 1392): ubi_scan_add_used: PEB 54, LEB 0:19, EC 178, sqnum 77099, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 33, sqnum 77074, EC 174
UBI DBG (pid 1392): compare_lebs: second PEB 54 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 33, EC 174
UBI DBG (pid 1392): ubi_scan: process PEB 55
UBI DBG (pid 1392): process_eb: scan PEB 55
UBI DBG (pid 1392): ubi_scan_add_used: PEB 55, LEB 0:35, EC 170, sqnum 77088, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 56
UBI DBG (pid 1392): process_eb: scan PEB 56
UBI DBG (pid 1392): ubi_scan_add_used: PEB 56, LEB 0:29, EC 169, sqnum 77091, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 77065, EC 172
UBI DBG (pid 1392): compare_lebs: second PEB 56 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 3, EC 172
UBI DBG (pid 1392): ubi_scan: process PEB 57
UBI DBG (pid 1392): process_eb: scan PEB 57
UBI DBG (pid 1392): ubi_scan_add_used: PEB 57, LEB 0:34, EC 175, sqnum 77075, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 77100, EC 192
UBI DBG (pid 1392): compare_lebs: first PEB 57 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 57, EC 175
UBI DBG (pid 1392): ubi_scan: process PEB 58
UBI DBG (pid 1392): process_eb: scan PEB 58
UBI DBG (pid 1392): ubi_scan_add_used: PEB 58, LEB 0:6, EC 169, sqnum 77053, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 59
UBI DBG (pid 1392): process_eb: scan PEB 59
UBI DBG (pid 1392): ubi_scan_add_used: PEB 59, LEB 0:4, EC 169, sqnum 77078, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 49, sqnum 77028, EC 170
UBI DBG (pid 1392): compare_lebs: second PEB 59 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 49, EC 170
UBI DBG (pid 1392): ubi_scan: process PEB 60
UBI DBG (pid 1392): process_eb: scan PEB 60
UBI DBG (pid 1392): ubi_scan_add_used: PEB 60, LEB 0:42, EC 171, sqnum 77089, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 61
UBI DBG (pid 1392): process_eb: scan PEB 61
UBI DBG (pid 1392): ubi_scan_add_used: PEB 61, LEB 0:20, EC 168, sqnum 76964, bitflips 0
UBI DBG (pid 1392): ubi_scan: process PEB 62
UBI DBG (pid 1392): process_eb: scan PEB 62
UBI DBG (pid 1392): ubi_scan_add_used: PEB 62, LEB 0:42, EC 169, sqnum 77063, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 60, sqnum 77089, EC 171
UBI DBG (pid 1392): compare_lebs: first PEB 62 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 62, EC 169
UBI DBG (pid 1392): ubi_scan: process PEB 63
UBI DBG (pid 1392): process_eb: scan PEB 63
UBI DBG (pid 1392): ubi_scan_add_used: PEB 63, LEB 0:21, EC 169, sqnum 77067, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 10, sqnum 77092, EC 172
UBI DBG (pid 1392): compare_lebs: first PEB 63 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 63, EC 169
UBI DBG (pid 1392): ubi_scan: process PEB 64
UBI DBG (pid 1392): process_eb: scan PEB 64
UBI DBG (pid 1392): ubi_scan_add_used: PEB 64, LEB 0:32, EC 168, sqnum 76981, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 50, sqnum 77083, EC 170
UBI DBG (pid 1392): compare_lebs: first PEB 64 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 64, EC 168
UBI DBG (pid 1392): ubi_scan: process PEB 65
UBI DBG (pid 1392): process_eb: scan PEB 65
UBI DBG (pid 1392): ubi_scan_add_used: PEB 65, LEB 0:37, EC 167, sqnum 76771, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 77049, EC 179
UBI DBG (pid 1392): compare_lebs: first PEB 65 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 65, EC 167
UBI DBG (pid 1392): ubi_scan: process PEB 66
UBI DBG (pid 1392): process_eb: scan PEB 66
UBI DBG (pid 1392): ubi_scan_add_used: PEB 66, LEB 0:14, EC 135, sqnum 38338, bitflips 0
UBI DBG (pid 1392): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 77050, EC 182
UBI DBG (pid 1392): compare_lebs: first PEB 66 is newer, copy_flag is unset
UBI DBG (pid 1392): add_to_list: add to erase: PEB 66, EC 135
UBI DBG (pid 1392): ubi_scan: process PEB 67
UBI DBG (pid 1392): process_eb: scan PEB 67
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 67, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 67, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 68
UBI DBG (pid 1392): process_eb: scan PEB 68
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 68, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 68, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 69
UBI DBG (pid 1392): process_eb: scan PEB 69
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 69, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 69, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 70
UBI DBG (pid 1392): process_eb: scan PEB 70
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 70, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 70, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 71
UBI DBG (pid 1392): process_eb: scan PEB 71
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 71, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 71, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 72
UBI DBG (pid 1392): process_eb: scan PEB 72
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 72, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 72, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 73
UBI DBG (pid 1392): process_eb: scan PEB 73
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 73, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 73, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 74
UBI DBG (pid 1392): process_eb: scan PEB 74
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 74, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 74, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 75
UBI DBG (pid 1392): process_eb: scan PEB 75
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 75, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 75, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 76
UBI DBG (pid 1392): process_eb: scan PEB 76
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 76, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 76, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 77
UBI DBG (pid 1392): process_eb: scan PEB 77
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 77, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 77, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 78
UBI DBG (pid 1392): process_eb: scan PEB 78
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 78, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 78, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 79
UBI DBG (pid 1392): process_eb: scan PEB 79
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 79, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 79, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 80
UBI DBG (pid 1392): process_eb: scan PEB 80
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 80, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 80, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 81
UBI DBG (pid 1392): process_eb: scan PEB 81
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 81, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 81, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 82
UBI DBG (pid 1392): process_eb: scan PEB 82
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 82, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 82, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 83
UBI DBG (pid 1392): process_eb: scan PEB 83
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 83, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 83, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 84
UBI DBG (pid 1392): process_eb: scan PEB 84
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 84, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 84, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 85
UBI DBG (pid 1392): process_eb: scan PEB 85
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 85, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 85, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 86
UBI DBG (pid 1392): process_eb: scan PEB 86
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 86, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 86, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 87
UBI DBG (pid 1392): process_eb: scan PEB 87
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 87, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 87, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 88
UBI DBG (pid 1392): process_eb: scan PEB 88
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 88, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 88, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 89
UBI DBG (pid 1392): process_eb: scan PEB 89
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 89, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 89, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 90
UBI DBG (pid 1392): process_eb: scan PEB 90
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 90, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 90, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 91
UBI DBG (pid 1392): process_eb: scan PEB 91
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 91, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 91, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 92
UBI DBG (pid 1392): process_eb: scan PEB 92
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 92, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 92, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 93
UBI DBG (pid 1392): process_eb: scan PEB 93
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 93, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 93, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 94
UBI DBG (pid 1392): process_eb: scan PEB 94
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 94, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 94, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 95
UBI DBG (pid 1392): process_eb: scan PEB 95
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 95, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 95, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 96
UBI DBG (pid 1392): process_eb: scan PEB 96
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 96, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 96, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 97
UBI DBG (pid 1392): process_eb: scan PEB 97
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 97, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 97, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 98
UBI DBG (pid 1392): process_eb: scan PEB 98
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 98, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 98, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 99
UBI DBG (pid 1392): process_eb: scan PEB 99
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 99, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 99, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 100
UBI DBG (pid 1392): process_eb: scan PEB 100
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 100, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 100, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 101
UBI DBG (pid 1392): process_eb: scan PEB 101
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 101, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 101, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 102
UBI DBG (pid 1392): process_eb: scan PEB 102
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 102, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 102, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 103
UBI DBG (pid 1392): process_eb: scan PEB 103
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 103, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 103, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 104
UBI DBG (pid 1392): process_eb: scan PEB 104
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 104, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 104, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 105
UBI DBG (pid 1392): process_eb: scan PEB 105
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 105, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 105, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 106
UBI DBG (pid 1392): process_eb: scan PEB 106
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 106, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 106, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 107
UBI DBG (pid 1392): process_eb: scan PEB 107
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 107, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 107, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 108
UBI DBG (pid 1392): process_eb: scan PEB 108
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 108, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 108, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 109
UBI DBG (pid 1392): process_eb: scan PEB 109
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 109, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 109, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 110
UBI DBG (pid 1392): process_eb: scan PEB 110
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 110, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 110, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 111
UBI DBG (pid 1392): process_eb: scan PEB 111
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 111, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 111, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 112
UBI DBG (pid 1392): process_eb: scan PEB 112
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 112, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 112, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 113
UBI DBG (pid 1392): process_eb: scan PEB 113
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 113, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 113, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 114
UBI DBG (pid 1392): process_eb: scan PEB 114
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 114, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 114, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 115
UBI DBG (pid 1392): process_eb: scan PEB 115
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 115, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 115, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 116
UBI DBG (pid 1392): process_eb: scan PEB 116
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 116, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 116, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 117
UBI DBG (pid 1392): process_eb: scan PEB 117
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 117, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 117, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 118
UBI DBG (pid 1392): process_eb: scan PEB 118
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 118, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 118, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 119
UBI DBG (pid 1392): process_eb: scan PEB 119
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 119, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 119, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 120
UBI DBG (pid 1392): process_eb: scan PEB 120
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 120, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 120, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 121
UBI DBG (pid 1392): process_eb: scan PEB 121
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 121, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 121, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 122
UBI DBG (pid 1392): process_eb: scan PEB 122
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 122, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 122, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 123
UBI DBG (pid 1392): process_eb: scan PEB 123
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 123, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 123, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 124
UBI DBG (pid 1392): process_eb: scan PEB 124
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 124, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 124, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 125
UBI DBG (pid 1392): process_eb: scan PEB 125
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 125, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 125, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 126
UBI DBG (pid 1392): process_eb: scan PEB 126
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 126, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 126, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 127
UBI DBG (pid 1392): process_eb: scan PEB 127
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 127, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 127, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 128
UBI DBG (pid 1392): process_eb: scan PEB 128
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 128, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 128, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 129
UBI DBG (pid 1392): process_eb: scan PEB 129
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 129, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 129, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 130
UBI DBG (pid 1392): process_eb: scan PEB 130
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 130, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 130, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 131
UBI DBG (pid 1392): process_eb: scan PEB 131
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 131, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 131, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 132
UBI DBG (pid 1392): process_eb: scan PEB 132
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 132, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 132, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 133
UBI DBG (pid 1392): process_eb: scan PEB 133
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 133, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 133, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 134
UBI DBG (pid 1392): process_eb: scan PEB 134
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 134, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 134, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 135
UBI DBG (pid 1392): process_eb: scan PEB 135
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 135, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 135, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 136
UBI DBG (pid 1392): process_eb: scan PEB 136
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 136, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 136, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 137
UBI DBG (pid 1392): process_eb: scan PEB 137
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 137, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 137, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 138
UBI DBG (pid 1392): process_eb: scan PEB 138
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 138, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 138, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 139
UBI DBG (pid 1392): process_eb: scan PEB 139
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 139, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 139, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 140
UBI DBG (pid 1392): process_eb: scan PEB 140
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 140, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 140, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 141
UBI DBG (pid 1392): process_eb: scan PEB 141
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 141, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 141, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 142
UBI DBG (pid 1392): process_eb: scan PEB 142
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 142, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 142, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 143
UBI DBG (pid 1392): process_eb: scan PEB 143
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 143, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 143, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 144
UBI DBG (pid 1392): process_eb: scan PEB 144
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 144, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 144, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 145
UBI DBG (pid 1392): process_eb: scan PEB 145
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 145, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 145, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 146
UBI DBG (pid 1392): process_eb: scan PEB 146
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 146, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 146, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 147
UBI DBG (pid 1392): process_eb: scan PEB 147
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 147, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 147, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 148
UBI DBG (pid 1392): process_eb: scan PEB 148
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 148, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 148, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 149
UBI DBG (pid 1392): process_eb: scan PEB 149
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 149, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 149, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 150
UBI DBG (pid 1392): process_eb: scan PEB 150
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 150, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 150, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 151
UBI DBG (pid 1392): process_eb: scan PEB 151
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 151, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 151, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 152
UBI DBG (pid 1392): process_eb: scan PEB 152
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 152, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 152, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 153
UBI DBG (pid 1392): process_eb: scan PEB 153
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 153, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 153, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 154
UBI DBG (pid 1392): process_eb: scan PEB 154
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 154, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 154, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 155
UBI DBG (pid 1392): process_eb: scan PEB 155
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 155, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 155, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 156
UBI DBG (pid 1392): process_eb: scan PEB 156
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 156, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 156, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 157
UBI DBG (pid 1392): process_eb: scan PEB 157
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 157, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 157, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 158
UBI DBG (pid 1392): process_eb: scan PEB 158
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 158, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 158, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 159
UBI DBG (pid 1392): process_eb: scan PEB 159
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 159, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 159, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 160
UBI DBG (pid 1392): process_eb: scan PEB 160
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 160, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 160, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 161
UBI DBG (pid 1392): process_eb: scan PEB 161
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 161, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 161, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 162
UBI DBG (pid 1392): process_eb: scan PEB 162
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 162, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 162, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 163
UBI DBG (pid 1392): process_eb: scan PEB 163
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 163, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 163, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 164
UBI DBG (pid 1392): process_eb: scan PEB 164
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 164, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 164, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 165
UBI DBG (pid 1392): process_eb: scan PEB 165
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 165, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 165, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 166
UBI DBG (pid 1392): process_eb: scan PEB 166
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 166, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 166, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 167
UBI DBG (pid 1392): process_eb: scan PEB 167
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 167, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 167, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 168
UBI DBG (pid 1392): process_eb: scan PEB 168
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 168, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 168, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 169
UBI DBG (pid 1392): process_eb: scan PEB 169
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 169, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 169, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 170
UBI DBG (pid 1392): process_eb: scan PEB 170
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 170, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 170, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 171
UBI DBG (pid 1392): process_eb: scan PEB 171
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 171, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 171, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 172
UBI DBG (pid 1392): process_eb: scan PEB 172
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 172, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 172, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 173
UBI DBG (pid 1392): process_eb: scan PEB 173
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 173, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 173, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 174
UBI DBG (pid 1392): process_eb: scan PEB 174
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 174, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 174, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 175
UBI DBG (pid 1392): process_eb: scan PEB 175
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 175, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 175, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 176
UBI DBG (pid 1392): process_eb: scan PEB 176
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 176, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 176, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 177
UBI DBG (pid 1392): process_eb: scan PEB 177
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 177, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 177, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 178
UBI DBG (pid 1392): process_eb: scan PEB 178
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 178, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 178, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 179
UBI DBG (pid 1392): process_eb: scan PEB 179
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 179, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 179, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 180
UBI DBG (pid 1392): process_eb: scan PEB 180
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 180, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 180, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 181
UBI DBG (pid 1392): process_eb: scan PEB 181
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 181, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 181, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 182
UBI DBG (pid 1392): process_eb: scan PEB 182
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 182, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 182, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 183
UBI DBG (pid 1392): process_eb: scan PEB 183
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 183, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 183, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 184
UBI DBG (pid 1392): process_eb: scan PEB 184
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 184, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 184, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 185
UBI DBG (pid 1392): process_eb: scan PEB 185
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 185, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 185, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 186
UBI DBG (pid 1392): process_eb: scan PEB 186
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 186, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 186, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 187
UBI DBG (pid 1392): process_eb: scan PEB 187
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 187, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 187, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 188
UBI DBG (pid 1392): process_eb: scan PEB 188
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 188, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 188, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 189
UBI DBG (pid 1392): process_eb: scan PEB 189
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 189, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 189, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 190
UBI DBG (pid 1392): process_eb: scan PEB 190
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 190, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 190, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 191
UBI DBG (pid 1392): process_eb: scan PEB 191
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 191, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 191, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 192
UBI DBG (pid 1392): process_eb: scan PEB 192
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 192, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 192, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 193
UBI DBG (pid 1392): process_eb: scan PEB 193
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 193, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 193, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 194
UBI DBG (pid 1392): process_eb: scan PEB 194
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 194, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 194, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 195
UBI DBG (pid 1392): process_eb: scan PEB 195
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 195, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 195, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 196
UBI DBG (pid 1392): process_eb: scan PEB 196
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 196, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 196, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 197
UBI DBG (pid 1392): process_eb: scan PEB 197
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 197, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 197, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 198
UBI DBG (pid 1392): process_eb: scan PEB 198
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 198, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 198, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 199
UBI DBG (pid 1392): process_eb: scan PEB 199
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 199, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 199, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 200
UBI DBG (pid 1392): process_eb: scan PEB 200
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 200, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 200, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 201
UBI DBG (pid 1392): process_eb: scan PEB 201
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 201, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 201, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 202
UBI DBG (pid 1392): process_eb: scan PEB 202
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 202, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 202, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 203
UBI DBG (pid 1392): process_eb: scan PEB 203
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 203, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 203, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 204
UBI DBG (pid 1392): process_eb: scan PEB 204
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 204, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 204, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 205
UBI DBG (pid 1392): process_eb: scan PEB 205
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 205, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 205, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 206
UBI DBG (pid 1392): process_eb: scan PEB 206
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 206, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 206, EC -1
UBI DBG (pid 1392): ubi_scan: process PEB 207
UBI DBG (pid 1392): process_eb: scan PEB 207
UBI DBG (pid 1392): ubi_io_read_ec_hdr: no EC header found at PEB 207, only 0xFF bytes
UBI DBG (pid 1392): add_to_list: add to erase: PEB 207, EC -1
UBI DBG (pid 1392): ubi_scan: scanning is finished
UBI: max. sequence number:       77100
UBI DBG (pid 1392): process_lvol: check layout volume
UBI DBG (pid 1392): ubi_eba_init_scan: initialize EBA sub-system
UBI DBG (pid 1392): ubi_eba_init_scan: EBA sub-system is initialized
UBI DBG (pid 1392): uif_init: ubi1 major is 253
UBI DBG (pid 1392): ubi_add_volume: add volume 0
UBI: attached mtd8 to ubi1
UBI: MTD device name:            "mtdram test device"
UBI: MTD device size:            52 MiB
UBI: number of good PEBs:        208
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 208
UBI: number of PEBs reserved for bad PEB handling: 0
UBI: max/mean erase counter: 265/168
UBI: image sequence number:  1464313228
UBI: background thread "ubi_bgt1d" started, PID 1395
UBIFS DBG (pid 1396): ubifs_get_sb: name ubi1:homefs, flags 0x0
UBI DBG (pid 1396): ubi_open_volume_path: open volume ubi1:homefs, mode 1
UBI DBG (pid 1396): ubi_open_volume_nm: open device 1, volume homefs, mode 1
UBI DBG (pid 1396): ubi_open_volume: open device 1, volume 0, mode 1
UBIFS DBG (pid 1396): ubifs_get_sb: opened ubi1_0
UBI DBG (pid 1396): ubi_open_volume: open device 1, volume 0, mode 2
UBI DBG (pid 1396): ubi_is_mapped: test LEB 0:0
UBIFS DBG (pid 1396): ubifs_read_node: LEB 0:0, superblock node, length 4096
UBI DBG (pid 1396): ubi_leb_read: read 4096 bytes from LEB 0:0:0
UBI DBG (pid 1396): ubi_eba_read_leb: read 4096 bytes from offset 0 of LEB 0:0, PEB 19
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 1:0
UBI DBG (pid 1396): ubi_leb_read: read 262016 bytes from LEB 0:1:0
UBI DBG (pid 1396): ubi_eba_read_leb: read 262016 bytes from offset 0 of LEB 0:1, PEB 5
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:0 (262016 bytes left)
UBIFS DBG (pid 1398): ubifs_bg_thread: background thread "ubifs_bgt1_0" started, PID 1398
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:512 (261504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:1024 (260992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:1536 (260480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:2048 (259968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:2560 (259456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:3072 (258944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:3584 (258432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:4096 (257920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:4608 (257408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:5120 (256896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:5632 (256384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:6144 (255872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:6656 (255360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:7168 (254848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:7680 (254336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:8192 (253824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:8704 (253312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:9216 (252800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:9728 (252288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:10240 (251776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:10752 (251264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:11264 (250752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:11776 (250240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:12288 (249728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:12800 (249216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:13312 (248704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:13824 (248192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:14336 (247680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:14848 (247168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:15360 (246656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:15872 (246144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:16384 (245632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:16896 (245120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:17408 (244608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:17920 (244096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:18432 (243584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:18944 (243072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:19456 (242560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:19968 (242048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:20480 (241536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:20992 (241024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:21504 (240512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:22016 (240000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 1:22528 (239488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1396): ubifs_end_scan: stop scanning LEB 1 at offset 22528
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 2:0
UBI DBG (pid 1396): ubi_leb_read: read 262016 bytes from LEB 0:2:0
UBI DBG (pid 1396): ubi_eba_read_leb: read 262016 bytes from offset 0 of LEB 0:2, PEB 24
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:0 (262016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:512 (261504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:1024 (260992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:1536 (260480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:2048 (259968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:2560 (259456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:3072 (258944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:3584 (258432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:4096 (257920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:4608 (257408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:5120 (256896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:5632 (256384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:6144 (255872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:6656 (255360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:7168 (254848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:7680 (254336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:8192 (253824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:8704 (253312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:9216 (252800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:9728 (252288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:10240 (251776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:10752 (251264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:11264 (250752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:11776 (250240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:12288 (249728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:12800 (249216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:13312 (248704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:13824 (248192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:14336 (247680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:14848 (247168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:15360 (246656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:15872 (246144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:16384 (245632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:16896 (245120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:17408 (244608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:17920 (244096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:18432 (243584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:18944 (243072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:19456 (242560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:19968 (242048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:20480 (241536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:20992 (241024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:21504 (240512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:22016 (240000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning master node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 2:22528 (239488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1396): ubifs_end_scan: stop scanning LEB 2 at offset 22528
UBIFS DBG (pid 1396): ubifs_read_node: LEB 41:229224, indexing node, length 68
UBI DBG (pid 1396): ubi_leb_read: read 68 bytes from LEB 0:41:229224
UBI DBG (pid 1396): ubi_eba_read_leb: read 68 bytes from offset 229224 of LEB 0:41, PEB 20
UBIFS: recovery needed
UBIFS DBG (pid 1396): ubifs_recover_inl_heads: checking index head at 41:229312
UBI DBG (pid 1396): ubi_leb_read: read 64 bytes from LEB 0:41:229312
UBI DBG (pid 1396): ubi_eba_read_leb: read 64 bytes from offset 229312 of LEB 0:41, PEB 20
UBIFS DBG (pid 1396): ubifs_recover_inl_heads: checking LPT head at 8:251456
UBI DBG (pid 1396): ubi_leb_read: read 64 bytes from LEB 0:8:251456
UBI DBG (pid 1396): ubi_eba_read_leb: read 64 bytes from offset 251456 of LEB 0:8, PEB 8
UBI DBG (pid 1396): ubi_leb_read: read 12 bytes from LEB 0:8:251200
UBI DBG (pid 1396): ubi_eba_read_leb: read 12 bytes from offset 251200 of LEB 0:8, PEB 8
UBIFS DBG (pid 1396): lpt_init_rd: space_bits 15
UBIFS DBG (pid 1396): lpt_init_rd: lpt_lnum_bits 2
UBIFS DBG (pid 1396): lpt_init_rd: lpt_offs_bits 18
UBIFS DBG (pid 1396): lpt_init_rd: lpt_spc_bits 18
UBIFS DBG (pid 1396): lpt_init_rd: pcnt_bits 6
UBIFS DBG (pid 1396): lpt_init_rd: lnum_bits 8
UBIFS DBG (pid 1396): lpt_init_rd: pnode_sz 18
UBIFS DBG (pid 1396): lpt_init_rd: nnode_sz 13
UBIFS DBG (pid 1396): lpt_init_rd: ltab_sz 12
UBIFS DBG (pid 1396): lpt_init_rd: lsave_sz 259
UBIFS DBG (pid 1396): lpt_init_rd: lsave_cnt 256
UBIFS DBG (pid 1396): lpt_init_rd: lpt_hght 3
UBIFS DBG (pid 1396): lpt_init_rd: big_lpt 0
UBIFS DBG (pid 1396): lpt_init_rd: LPT root is at 8:251390
UBIFS DBG (pid 1396): lpt_init_rd: LPT head is at 8:251456
UBIFS DBG (pid 1396): lpt_init_rd: LPT ltab is at 8:251200
UBI DBG (pid 1396): ubi_leb_read: read 13 bytes from LEB 0:8:251390
UBI DBG (pid 1396): ubi_eba_read_leb: read 13 bytes from offset 251390 of LEB 0:8, PEB 8
UBIFS DBG (pid 1396): ubifs_add_lpt_dirt: LEB 8 add 13 to 251235
UBIFS DBG (pid 1396): ubifs_add_lpt_dirt: LEB 8 add 12 to 251248
UBI DBG (pid 1396): ubi_leb_read: read 13 bytes from LEB 0:8:251377
UBI DBG (pid 1396): ubi_eba_read_leb: read 13 bytes from offset 251377 of LEB 0:8, PEB 8
UBIFS DBG (pid 1396): ubifs_add_lpt_dirt: LEB 8 add 13 to 251260
UBI DBG (pid 1396): ubi_leb_read: read 13 bytes from LEB 0:8:251333
UBI DBG (pid 1396): ubi_eba_read_leb: read 13 bytes from offset 251333 of LEB 0:8, PEB 8
UBIFS DBG (pid 1396): ubifs_add_lpt_dirt: LEB 8 add 13 to 251273
UBI DBG (pid 1396): ubi_leb_read: read 18 bytes from LEB 0:8:251315
UBI DBG (pid 1396): ubi_eba_read_leb: read 18 bytes from offset 251315 of LEB 0:8, PEB 8
UBIFS DBG (pid 1396): ubifs_add_lpt_dirt: LEB 8 add 18 to 251286
UBIFS DBG (pid 1396): ubifs_lpt_lookup_dirty: LEB 41, free 32704, dirty 212432, flags 34
UBIFS DBG (pid 1396): ubifs_change_lp: LEB 41, free -2147483647, dirty -2147483647, flags 50
UBIFS DBG (pid 1396): ubifs_lpt_lookup_dirty: LEB 41, free 32704, dirty 212432, flags 34
UBIFS DBG (pid 1396): ubifs_replay_journal: start replaying the journal
UBIFS DBG (pid 1396): replay_log_leb: replay log LEB 5:0
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 5:0
UBI DBG (pid 1396): ubi_leb_read: read 262016 bytes from LEB 0:5:0
UBI DBG (pid 1396): ubi_eba_read_leb: read 262016 bytes from offset 0 of LEB 0:5, PEB 34
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:0 (262016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning commit start node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:32 (261984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:96 (261920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:160 (261856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:192 (261824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:256 (261760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:320 (261696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:384 (261632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:448 (261568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:512 (261504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:576 (261440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:640 (261376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:704 (261312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:768 (261248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 5:832 (261184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1396): ubifs_end_scan: stop scanning LEB 5 at offset 832
UBIFS DBG (pid 1396): replay_log_leb: commit start sqnum 8564191
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 33:115008, head 1
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 33:115008, jhead 1 (base), bud_bytes 147008
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 42:74880, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 42:74880, jhead 2 (data), bud_bytes 334144
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 29:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 29:0, jhead 2 (data), bud_bytes 596160
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 21:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 21:0, jhead 2 (data), bud_bytes 858176
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 30:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 30:0, jhead 2 (data), bud_bytes 1120192
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 39:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 39:0, jhead 2 (data), bud_bytes 1382208
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 16:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 16:0, jhead 2 (data), bud_bytes 1644224
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 15:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 15:0, jhead 2 (data), bud_bytes 1906240
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 17:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 17:0, jhead 2 (data), bud_bytes 2168256
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 38:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 38:0, jhead 2 (data), bud_bytes 2430272
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 19:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 19:0, jhead 2 (data), bud_bytes 2692288
UBIFS DBG (pid 1396): add_replay_bud: add replay bud LEB 34:0, head 2
UBIFS DBG (pid 1396): ubifs_add_bud: LEB 34:0, jhead 2 (data), bud_bytes 2954304
UBIFS DBG (pid 1396): replay_log_leb: replay log LEB 6:0
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 6:0
UBI DBG (pid 1396): ubi_leb_read: read 262016 bytes from LEB 0:6:0
UBI DBG (pid 1396): ubi_eba_read_leb: read 262016 bytes from offset 0 of LEB 0:6, PEB 58
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:0 (262016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning commit start node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:32 (261984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:96 (261920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:160 (261856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:192 (261824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:256 (261760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:320 (261696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:384 (261632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:448 (261568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:512 (261504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:576 (261440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:640 (261376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:704 (261312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:768 (261248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:832 (261184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning reference node
UBIFS DBG (pid 1396): ubifs_scan: look at LEB 6:896 (261120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1396): ubifs_end_scan: stop scanning LEB 6 at offset 896
UBIFS DBG (pid 1396): replay_bud: replay bud LEB 33, head 1
UBIFS DBG (pid 1396): ubifs_recover_leb: 33:115008
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 33:115008
UBI DBG (pid 1396): ubi_leb_read: read 147008 bytes from LEB 0:33:115008
UBI DBG (pid 1396): ubi_eba_read_leb: read 147008 bytes from offset 115008 of LEB 0:33, PEB 25
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115008 (147008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115168 (146848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning truncate node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115224 (146792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 12 bytes padded, offset now 115264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115264 (146752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115424 (146592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 115456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115456 (146560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115616 (146400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 115648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115648 (146368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115808 (146208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 115840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:115840 (146176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116000 (146016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116032 (145984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116192 (145824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116224 (145792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116384 (145632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116416
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116416 (145600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116576 (145440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116608
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116608 (145408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116768 (145248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116800
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116800 (145216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116960 (145056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 116992
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:116992 (145024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117152 (144864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 117184
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117184 (144832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117344 (144672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 117376
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117376 (144640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117536 (144480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 117568
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117568 (144448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117728 (144288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 117760
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117760 (144256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117920 (144096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 117952
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:117952 (144064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118112 (143904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 118144
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118144 (143872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118304 (143712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 118336
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118336 (143680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118496 (143520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 118528
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118528 (143488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118688 (143328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 118720
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118720 (143296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118880 (143136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 118912
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:118912 (143104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119072 (142944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 119104
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119104 (142912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119264 (142752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 119296
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119296 (142720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119456 (142560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 119488
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119488 (142528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119648 (142368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 119680
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119680 (142336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119840 (142176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 119872
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:119872 (142144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120032 (141984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 120064
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120064 (141952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120224 (141792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 120256
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120256 (141760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120416 (141600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 120448
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120448 (141568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120608 (141408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 120640
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120640 (141376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120800 (141216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 120832
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120832 (141184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:120992 (141024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121024
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121024 (140992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121184 (140832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121216
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121216 (140800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121376 (140640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121408
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121408 (140608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121568 (140448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121600
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121600 (140416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121760 (140256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121792
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121792 (140224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121952 (140064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 121984
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:121984 (140032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122144 (139872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 122176
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122176 (139840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122336 (139680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 122368
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122368 (139648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122528 (139488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 122560
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122560 (139456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122720 (139296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 122752
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122752 (139264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122912 (139104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 122944
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:122944 (139072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123104 (138912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 123136
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123136 (138880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123296 (138720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 123328
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123328 (138688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123488 (138528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 123520
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123520 (138496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123680 (138336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 123712
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123712 (138304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123872 (138144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 123904
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:123904 (138112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124064 (137952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 124096
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124096 (137920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124256 (137760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 124288
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124288 (137728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124448 (137568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 124480
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124480 (137536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124640 (137376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 124672
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124672 (137344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124832 (137184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 124864
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:124864 (137152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125024 (136992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 125056
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125056 (136960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125216 (136800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 125248
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125248 (136768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125408 (136608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 125440
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125440 (136576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125600 (136416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 125632
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125632 (136384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125792 (136224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 125824
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125824 (136192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:125984 (136032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126016
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126016 (136000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126176 (135840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126208
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126208 (135808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126368 (135648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126400
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126400 (135616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126560 (135456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126592
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126592 (135424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126752 (135264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126784
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126784 (135232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126944 (135072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 126976
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:126976 (135040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127136 (134880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 127168
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127168 (134848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127328 (134688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 127360
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127360 (134656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127520 (134496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 127552
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127552 (134464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127712 (134304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 127744
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127744 (134272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127904 (134112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 127936
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:127936 (134080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128096 (133920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 128128
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128128 (133888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128288 (133728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 128320
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128320 (133696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128480 (133536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 128512
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128512 (133504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128672 (133344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 128704
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128704 (133312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128864 (133152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 128896
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:128896 (133120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129056 (132960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 129088
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129088 (132928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129248 (132768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 129280
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129280 (132736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129440 (132576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 129472
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129472 (132544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129632 (132384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 129664
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129664 (132352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129824 (132192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 129856
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:129856 (132160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130016 (132000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 130048
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130048 (131968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130208 (131808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 130240
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130240 (131776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130400 (131616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 130432
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130432 (131584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130592 (131424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 130624
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130624 (131392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130784 (131232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 130816
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130816 (131200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:130976 (131040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131008
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131008 (131008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131168 (130848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131200
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131200 (130816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131360 (130656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131392
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131392 (130624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131552 (130464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131584
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131584 (130432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131744 (130272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131776
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131776 (130240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131936 (130080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 131968
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:131968 (130048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132128 (129888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 132160
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132160 (129856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132320 (129696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 132352
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132352 (129664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132512 (129504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 132544
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132544 (129472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132704 (129312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 132736
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132736 (129280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132896 (129120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 132928
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:132928 (129088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133088 (128928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 133120
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133120 (128896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133280 (128736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 133312
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133312 (128704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133472 (128544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 133504
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133504 (128512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133664 (128352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 133696
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133696 (128320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133856 (128160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 133888
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:133888 (128128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134048 (127968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 134080
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134080 (127936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134240 (127776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 134272
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134272 (127744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134432 (127584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 134464
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134464 (127552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134624 (127392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 134656
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134656 (127360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134816 (127200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 134848
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:134848 (127168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135008 (127008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 135040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135040 (126976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135200 (126816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 135232
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135232 (126784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135392 (126624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 135424
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135424 (126592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135584 (126432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 135616
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135616 (126400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135776 (126240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 135808
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135808 (126208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:135968 (126048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136000
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136000 (126016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136160 (125856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136192
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136192 (125824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136352 (125664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136384
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136384 (125632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136544 (125472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136576
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136576 (125440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136736 (125280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136768
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136768 (125248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136928 (125088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 136960
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:136960 (125056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137120 (124896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 137152
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137152 (124864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137312 (124704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 137344
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137344 (124672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137504 (124512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 137536
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137536 (124480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137696 (124320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 137728
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137728 (124288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137888 (124128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 137920
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:137920 (124096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138080 (123936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 138112
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138112 (123904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138272 (123744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 138304
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138304 (123712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138464 (123552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 138496
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138496 (123520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138656 (123360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 138688
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138688 (123328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138848 (123168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 138880
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:138880 (123136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139040 (122976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 139072
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139072 (122944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139232 (122784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 139264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139264 (122752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139424 (122592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 139456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139456 (122560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139616 (122400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 139648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139648 (122368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139808 (122208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 139840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:139840 (122176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140000 (122016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140032 (121984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140192 (121824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140224 (121792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140384 (121632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140416
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140416 (121600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140576 (121440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140608
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140608 (121408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140768 (121248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140800
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140800 (121216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140960 (121056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 140992
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:140992 (121024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141152 (120864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 141184
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141184 (120832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141344 (120672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 141376
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141376 (120640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141536 (120480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 141568
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141568 (120448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141728 (120288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 141760
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141760 (120256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141920 (120096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 141952
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:141952 (120064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142112 (119904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 142144
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142144 (119872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142304 (119712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 142336
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142336 (119680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142496 (119520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 142528
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142528 (119488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142688 (119328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 142720
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142720 (119296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142880 (119136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 142912
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:142912 (119104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143072 (118944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 143104
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143104 (118912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143264 (118752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 143296
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143296 (118720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143456 (118560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 143488
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143488 (118528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143648 (118368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 143680
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143680 (118336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143840 (118176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 143872
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:143872 (118144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144032 (117984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 144064
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144064 (117952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144224 (117792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 144256
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144256 (117760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144416 (117600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 144448
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144448 (117568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144608 (117408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 144640
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144640 (117376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144800 (117216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 144832
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144832 (117184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:144992 (117024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145024
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145024 (116992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145184 (116832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145216
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145216 (116800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145376 (116640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145408
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145408 (116608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145568 (116448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145600
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145600 (116416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145760 (116256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145792
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145792 (116224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145952 (116064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 145984
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:145984 (116032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146144 (115872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 146176
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146176 (115840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146336 (115680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 146368
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146368 (115648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146528 (115488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 146560
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146560 (115456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146720 (115296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 146752
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146752 (115264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146912 (115104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 146944
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:146944 (115072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147104 (114912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 147136
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147136 (114880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147296 (114720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 147328
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147328 (114688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147488 (114528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 147520
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147520 (114496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147680 (114336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 147712
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147712 (114304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147872 (114144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 147904
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:147904 (114112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148064 (113952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 148096
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148096 (113920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148256 (113760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 148288
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148288 (113728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148448 (113568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 148480
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148480 (113536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148640 (113376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 148672
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148672 (113344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148832 (113184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 148864
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:148864 (113152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149024 (112992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 149056
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149056 (112960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149216 (112800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 149248
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149248 (112768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149408 (112608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 149440
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149440 (112576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149600 (112416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 149632
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149632 (112384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149792 (112224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 149824
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149824 (112192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:149984 (112032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150016
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150016 (112000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150176 (111840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150208
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150208 (111808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150368 (111648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150400
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150400 (111616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150560 (111456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150592
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150592 (111424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150752 (111264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150784
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150784 (111232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150944 (111072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 150976
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:150976 (111040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151136 (110880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 151168
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151168 (110848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151328 (110688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 151360
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151360 (110656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151520 (110496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 151552
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151552 (110464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151712 (110304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 151744
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151744 (110272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151904 (110112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 151936
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:151936 (110080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152096 (109920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 152128
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152128 (109888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152288 (109728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 152320
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152320 (109696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152480 (109536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 152512
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152512 (109504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152672 (109344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 152704
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152704 (109312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152864 (109152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 152896
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:152896 (109120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153056 (108960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 153088
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153088 (108928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153248 (108768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 153280
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153280 (108736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153440 (108576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 153472
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153472 (108544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153632 (108384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 153664
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153664 (108352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153824 (108192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 153856
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:153856 (108160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154016 (108000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 154048
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154048 (107968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154208 (107808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 154240
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154240 (107776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154400 (107616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 154432
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154432 (107584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154592 (107424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 154624
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154624 (107392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154784 (107232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 154816
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154816 (107200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:154976 (107040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155008
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155008 (107008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155168 (106848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155200
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155200 (106816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155360 (106656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155392
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155392 (106624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155552 (106464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155584
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155584 (106432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155744 (106272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155776
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155776 (106240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155936 (106080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 155968
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:155968 (106048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156128 (105888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 156160
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156160 (105856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156320 (105696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 156352
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156352 (105664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156512 (105504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 156544
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156544 (105472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156704 (105312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 156736
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156736 (105280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156896 (105120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 156928
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:156928 (105088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157088 (104928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 157120
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157120 (104896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157280 (104736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 157312
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157312 (104704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157472 (104544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 157504
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157504 (104512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157664 (104352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 157696
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157696 (104320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157856 (104160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 157888
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:157888 (104128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158048 (103968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 158080
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158080 (103936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158240 (103776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 158272
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158272 (103744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158432 (103584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 158464
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158464 (103552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158624 (103392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 158656
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158656 (103360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158816 (103200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 158848
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:158848 (103168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159008 (103008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 159040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159040 (102976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159200 (102816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 159232
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159232 (102784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159392 (102624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 159424
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159424 (102592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159584 (102432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 159616
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159616 (102400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159776 (102240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 159808
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159808 (102208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:159968 (102048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160000
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160000 (102016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160160 (101856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160192
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160192 (101824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160352 (101664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160384
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160384 (101632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160544 (101472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160576
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160576 (101440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160736 (101280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160768
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160768 (101248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160928 (101088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 160960
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:160960 (101056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161120 (100896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 161152
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161152 (100864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161312 (100704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 161344
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161344 (100672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161504 (100512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 161536
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161536 (100480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161696 (100320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 161728
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161728 (100288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161888 (100128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 161920
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:161920 (100096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162080 (99936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 162112
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162112 (99904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162272 (99744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 162304
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162304 (99712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162464 (99552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 162496
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162496 (99520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162656 (99360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 162688
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162688 (99328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162848 (99168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 162880
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:162880 (99136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163040 (98976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 163072
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163072 (98944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163232 (98784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 163264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163264 (98752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163424 (98592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 163456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163456 (98560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163616 (98400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 163648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163648 (98368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163808 (98208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 163840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:163840 (98176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164000 (98016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164032 (97984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164192 (97824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164224 (97792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164384 (97632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164416
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164416 (97600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164576 (97440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164608
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164608 (97408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164768 (97248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164800
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164800 (97216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164960 (97056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 164992
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:164992 (97024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165152 (96864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 165184
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165184 (96832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165344 (96672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 165376
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165376 (96640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165536 (96480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 165568
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165568 (96448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165728 (96288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 165760
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165760 (96256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165920 (96096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 165952
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:165952 (96064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166112 (95904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 166144
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166144 (95872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166304 (95712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 166336
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166336 (95680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166496 (95520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 166528
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166528 (95488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166688 (95328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 166720
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166720 (95296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166880 (95136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 166912
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:166912 (95104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167072 (94944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 167104
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167104 (94912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167264 (94752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 167296
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167296 (94720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167456 (94560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 167488
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167488 (94528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167648 (94368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 167680
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167680 (94336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167840 (94176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 167872
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:167872 (94144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168032 (93984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 168064
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168064 (93952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168224 (93792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 168256
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168256 (93760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168416 (93600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 168448
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168448 (93568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168608 (93408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 168640
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168640 (93376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168800 (93216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 168832
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168832 (93184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:168992 (93024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169024
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169024 (92992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169184 (92832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169216
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169216 (92800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169376 (92640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169408
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169408 (92608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169568 (92448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169600
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169600 (92416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169760 (92256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169792
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169792 (92224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169952 (92064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 169984
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:169984 (92032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170144 (91872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 170176
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170176 (91840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170336 (91680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 170368
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170368 (91648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170528 (91488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 170560
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170560 (91456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170720 (91296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 170752
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170752 (91264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170912 (91104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 170944
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:170944 (91072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171104 (90912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 171136
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171136 (90880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171296 (90720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 171328
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171328 (90688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171488 (90528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 171520
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171520 (90496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171680 (90336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 171712
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171712 (90304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171872 (90144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 171904
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:171904 (90112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172064 (89952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 172096
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172096 (89920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172256 (89760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 172288
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172288 (89728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172448 (89568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 172480
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172480 (89536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172640 (89376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 172672
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172672 (89344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172832 (89184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 172864
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:172864 (89152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173024 (88992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 173056
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173056 (88960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173216 (88800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 173248
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173248 (88768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173408 (88608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 173440
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173440 (88576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173600 (88416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 173632
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173632 (88384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173792 (88224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 173824
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173824 (88192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:173984 (88032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174016
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174016 (88000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174176 (87840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174208
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174208 (87808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174368 (87648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174400
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174400 (87616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174560 (87456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174592
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174592 (87424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174752 (87264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174784
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174784 (87232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174944 (87072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 174976
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:174976 (87040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175136 (86880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 175168
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175168 (86848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175328 (86688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 175360
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175360 (86656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175520 (86496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 175552
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175552 (86464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175712 (86304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 175744
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175744 (86272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175904 (86112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 175936
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:175936 (86080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176096 (85920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 176128
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176128 (85888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176288 (85728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 176320
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176320 (85696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176480 (85536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 176512
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176512 (85504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176672 (85344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 176704
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176704 (85312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176864 (85152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 176896
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:176896 (85120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177056 (84960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 177088
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177088 (84928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177248 (84768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 177280
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177280 (84736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177440 (84576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 177472
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177472 (84544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177632 (84384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 177664
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177664 (84352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177824 (84192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 177856
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:177856 (84160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178016 (84000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 178048
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178048 (83968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178208 (83808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 178240
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178240 (83776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178400 (83616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 178432
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178432 (83584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178592 (83424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 178624
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178624 (83392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178784 (83232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 178816
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178816 (83200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:178976 (83040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179008
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179008 (83008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179168 (82848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179200
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179200 (82816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179360 (82656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179392
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179392 (82624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179552 (82464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179584
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179584 (82432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179744 (82272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179776
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179776 (82240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179936 (82080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 179968
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:179968 (82048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180128 (81888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 180160
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180160 (81856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180320 (81696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 180352
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180352 (81664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180512 (81504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 180544
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180544 (81472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180704 (81312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 180736
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180736 (81280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180896 (81120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 180928
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:180928 (81088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181088 (80928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 181120
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181120 (80896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181280 (80736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 181312
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181312 (80704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181472 (80544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 181504
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181504 (80512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181664 (80352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 181696
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181696 (80320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181856 (80160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 181888
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:181888 (80128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182048 (79968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 182080
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182080 (79936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182240 (79776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 182272
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182272 (79744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182432 (79584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 182464
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182464 (79552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182624 (79392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 182656
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182656 (79360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182816 (79200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 182848
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:182848 (79168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183008 (79008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 183040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183040 (78976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183200 (78816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 183232
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183232 (78784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183392 (78624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 183424
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183424 (78592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183584 (78432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 183616
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183616 (78400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183776 (78240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 183808
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183808 (78208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:183968 (78048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184000
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184000 (78016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184160 (77856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184192
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184192 (77824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184352 (77664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184384
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184384 (77632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184544 (77472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184576
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184576 (77440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184736 (77280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184768
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184768 (77248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184928 (77088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 184960
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:184960 (77056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185120 (76896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 185152
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185152 (76864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185312 (76704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 185344
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185344 (76672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185504 (76512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 185536
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185536 (76480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185696 (76320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 185728
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185728 (76288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185888 (76128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 185920
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:185920 (76096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186080 (75936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 186112
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186112 (75904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186272 (75744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 186304
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186304 (75712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186464 (75552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 186496
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186496 (75520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186656 (75360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 186688
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186688 (75328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186848 (75168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 186880
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:186880 (75136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187040 (74976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 187072
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187072 (74944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187232 (74784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 187264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187264 (74752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187424 (74592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 187456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187456 (74560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187616 (74400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 187648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187648 (74368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187808 (74208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 187840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:187840 (74176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188000 (74016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188032 (73984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188192 (73824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188224 (73792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188384 (73632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188416
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188416 (73600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188576 (73440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188608
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188608 (73408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188768 (73248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188800
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188800 (73216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188960 (73056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 188992
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:188992 (73024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189152 (72864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 189184
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189184 (72832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189344 (72672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 189376
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189376 (72640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189536 (72480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 189568
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189568 (72448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189728 (72288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 189760
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189760 (72256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189920 (72096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 189952
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:189952 (72064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190112 (71904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 190144
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190144 (71872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190304 (71712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 190336
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190336 (71680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190496 (71520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 190528
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190528 (71488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190688 (71328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 190720
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190720 (71296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190880 (71136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 190912
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:190912 (71104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191072 (70944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 191104
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191104 (70912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191264 (70752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 191296
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191296 (70720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191456 (70560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 191488
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191488 (70528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191648 (70368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 191680
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191680 (70336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191840 (70176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 191872
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:191872 (70144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192032 (69984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192064
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192064 (69952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192224 (69792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192256
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192256 (69760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192416 (69600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192448
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192448 (69568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192608 (69408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192640
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192640 (69376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192800 (69216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 192832
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192832 (69184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:192992 (69024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193024
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193024 (68992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193184 (68832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193216
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193216 (68800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193376 (68640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193408
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193408 (68608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193568 (68448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193600
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193600 (68416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193760 (68256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193792
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193792 (68224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193952 (68064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 193984
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:193984 (68032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194144 (67872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 194176
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194176 (67840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194336 (67680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 194368
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194368 (67648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194528 (67488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 194560
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194560 (67456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194720 (67296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 194752
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194752 (67264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194912 (67104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 194944
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:194944 (67072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195104 (66912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 195136
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195136 (66880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195296 (66720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 195328
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195328 (66688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195488 (66528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 195520
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195520 (66496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195680 (66336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 195712
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195712 (66304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195872 (66144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 195904
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:195904 (66112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196064 (65952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 196096
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196096 (65920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196256 (65760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 196288
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196288 (65728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196448 (65568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 196480
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196480 (65536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196640 (65376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 196672
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196672 (65344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196832 (65184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 196864
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:196864 (65152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197024 (64992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 197056
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197056 (64960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197216 (64800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 197248
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197248 (64768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197408 (64608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 197440
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197440 (64576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197600 (64416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 197632
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197632 (64384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197792 (64224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 197824
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197824 (64192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:197984 (64032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198016
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198016 (64000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198176 (63840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198208
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198208 (63808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198368 (63648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198400
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198400 (63616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198560 (63456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198592
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198592 (63424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198752 (63264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198784
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198784 (63232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198944 (63072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 198976
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:198976 (63040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199136 (62880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 199168
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199168 (62848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199328 (62688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 199360
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199360 (62656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199520 (62496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 199552
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199552 (62464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199712 (62304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 199744
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199744 (62272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199904 (62112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 199936
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:199936 (62080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200096 (61920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 200128
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200128 (61888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200288 (61728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 200320
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200320 (61696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200480 (61536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 200512
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200512 (61504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200672 (61344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 200704
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200704 (61312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200864 (61152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 200896
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:200896 (61120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201056 (60960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 201088
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201088 (60928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201248 (60768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 201280
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201280 (60736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201440 (60576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 201472
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201472 (60544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201632 (60384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 201664
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201664 (60352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201824 (60192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 201856
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:201856 (60160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202016 (60000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 202048
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202048 (59968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202208 (59808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 202240
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202240 (59776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202400 (59616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 202432
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202432 (59584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202592 (59424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 202624
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202624 (59392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202784 (59232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 202816
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202816 (59200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:202976 (59040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203008
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203008 (59008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203168 (58848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203200
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203200 (58816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203360 (58656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203392
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203392 (58624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203552 (58464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203584
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203584 (58432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203744 (58272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203776
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203776 (58240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203936 (58080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 203968
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:203968 (58048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204128 (57888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 204160
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204160 (57856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204320 (57696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 204352
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204352 (57664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204512 (57504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 204544
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204544 (57472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204704 (57312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 204736
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204736 (57280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204896 (57120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 204928
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:204928 (57088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205088 (56928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 205120
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205120 (56896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205280 (56736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 205312
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205312 (56704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205472 (56544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 205504
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205504 (56512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205664 (56352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 205696
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205696 (56320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205856 (56160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 205888
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:205888 (56128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206048 (55968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 206080
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206080 (55936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206240 (55776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 206272
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206272 (55744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206432 (55584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 206464
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206464 (55552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206624 (55392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 206656
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206656 (55360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206816 (55200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 206848
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:206848 (55168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207008 (55008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 207040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207040 (54976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207200 (54816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 207232
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207232 (54784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207392 (54624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 207424
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207424 (54592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207584 (54432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 207616
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207616 (54400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207776 (54240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 207808
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207808 (54208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:207968 (54048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208000
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208000 (54016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208160 (53856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208192
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208192 (53824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208352 (53664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208384
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208384 (53632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208544 (53472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208576
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208576 (53440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208736 (53280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208768
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208768 (53248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208928 (53088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 208960
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:208960 (53056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209120 (52896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 209152
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209152 (52864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209312 (52704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 209344
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209344 (52672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209504 (52512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 209536
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209536 (52480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209696 (52320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 209728
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209728 (52288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209888 (52128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 209920
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:209920 (52096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210080 (51936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 210112
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210112 (51904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210272 (51744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 210304
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210304 (51712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210464 (51552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 210496
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210496 (51520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210656 (51360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 210688
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210688 (51328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210848 (51168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 210880
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:210880 (51136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211040 (50976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 211072
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211072 (50944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211232 (50784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 211264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211264 (50752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211424 (50592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 211456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211456 (50560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211616 (50400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 211648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211648 (50368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211808 (50208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 211840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:211840 (50176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212000 (50016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212032 (49984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212192 (49824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212224 (49792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212384 (49632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212416
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212416 (49600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212576 (49440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212608
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212608 (49408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212768 (49248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212800
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212800 (49216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212960 (49056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 212992
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:212992 (49024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213152 (48864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 213184
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213184 (48832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213344 (48672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 213376
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213376 (48640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213536 (48480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 213568
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213568 (48448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213728 (48288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 213760
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213760 (48256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213920 (48096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 213952
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:213952 (48064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214112 (47904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 214144
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214144 (47872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214304 (47712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 214336
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214336 (47680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214496 (47520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 214528
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214528 (47488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214688 (47328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 214720
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214720 (47296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214880 (47136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 214912
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:214912 (47104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215072 (46944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 215104
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215104 (46912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215264 (46752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 215296
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215296 (46720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215456 (46560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 215488
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215488 (46528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215648 (46368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 215680
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215680 (46336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215840 (46176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 215872
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:215872 (46144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216032 (45984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 216064
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216064 (45952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216224 (45792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 216256
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216256 (45760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216416 (45600 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 216448
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216448 (45568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216608 (45408 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 216640
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216640 (45376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216800 (45216 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 216832
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216832 (45184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:216992 (45024 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217024
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217024 (44992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217184 (44832 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217216
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217216 (44800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217376 (44640 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217408
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217408 (44608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217568 (44448 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217600
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217600 (44416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217760 (44256 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217792
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217792 (44224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217952 (44064 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 217984
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:217984 (44032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218144 (43872 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 218176
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218176 (43840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218336 (43680 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 218368
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218368 (43648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218528 (43488 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 218560
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218560 (43456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218720 (43296 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 218752
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218752 (43264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218912 (43104 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 218944
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:218944 (43072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219104 (42912 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 219136
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219136 (42880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219296 (42720 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 219328
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219328 (42688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219488 (42528 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 219520
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219520 (42496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219680 (42336 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 219712
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219712 (42304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219872 (42144 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 219904
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:219904 (42112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220064 (41952 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 220096
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220096 (41920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220256 (41760 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 220288
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220288 (41728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220448 (41568 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 220480
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220480 (41536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220640 (41376 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 220672
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220672 (41344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220832 (41184 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 220864
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:220864 (41152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221024 (40992 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 221056
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221056 (40960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221216 (40800 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 221248
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221248 (40768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221408 (40608 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 221440
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221440 (40576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221600 (40416 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 221632
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221632 (40384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221792 (40224 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 221824
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221824 (40192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:221984 (40032 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222016
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222016 (40000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222176 (39840 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222208
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222208 (39808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222368 (39648 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222400
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222400 (39616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222560 (39456 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222592
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222592 (39424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222752 (39264 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222784
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222784 (39232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222944 (39072 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 222976
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:222976 (39040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223136 (38880 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 223168
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223168 (38848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223328 (38688 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 223360
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223360 (38656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223520 (38496 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 223552
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223552 (38464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223712 (38304 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 223744
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223744 (38272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223904 (38112 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 223936
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:223936 (38080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224096 (37920 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 224128
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224128 (37888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224288 (37728 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 224320
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224320 (37696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224480 (37536 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 224512
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224512 (37504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224672 (37344 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 224704
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224704 (37312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224864 (37152 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 224896
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:224896 (37120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225056 (36960 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 225088
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225088 (36928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225248 (36768 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 225280
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225280 (36736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225440 (36576 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 225472
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225472 (36544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225632 (36384 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 225664
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225664 (36352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225824 (36192 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 225856
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:225856 (36160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226016 (36000 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 226048
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226048 (35968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226208 (35808 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 226240
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226240 (35776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226400 (35616 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 226432
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226432 (35584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226592 (35424 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 226624
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226624 (35392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226784 (35232 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 226816
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226816 (35200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:226976 (35040 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227008
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227008 (35008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227168 (34848 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227200
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227200 (34816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227360 (34656 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227392
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227392 (34624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227552 (34464 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227584
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227584 (34432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227744 (34272 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227776
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227776 (34240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227936 (34080 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 227968
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:227968 (34048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228128 (33888 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 228160
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228160 (33856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228320 (33696 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 228352
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228352 (33664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228512 (33504 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 228544
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228544 (33472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228704 (33312 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 228736
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228736 (33280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228896 (33120 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 228928
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:228928 (33088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229088 (32928 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 229120
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229120 (32896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229280 (32736 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 229312
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229312 (32704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229472 (32544 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 229504
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229504 (32512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229664 (32352 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 229696
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229696 (32320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229856 (32160 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 229888
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:229888 (32128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230048 (31968 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 230080
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230080 (31936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230240 (31776 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 230272
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230272 (31744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230432 (31584 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 230464
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230464 (31552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230624 (31392 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 230656
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230656 (31360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230816 (31200 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 230848
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:230848 (31168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231008 (31008 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 231040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231040 (30976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231200 (30816 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 231232
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231232 (30784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231392 (30624 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 231424
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231424 (30592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231584 (30432 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 231616
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231616 (30400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231776 (30240 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 231808
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231808 (30208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:231968 (30048 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232000
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232000 (30016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232160 (29856 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232192
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232192 (29824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232352 (29664 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232384
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232384 (29632 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232544 (29472 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232576
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232576 (29440 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232736 (29280 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232768
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232768 (29248 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232928 (29088 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 232960
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:232960 (29056 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233120 (28896 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 233152
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233152 (28864 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233312 (28704 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 233344
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233344 (28672 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233504 (28512 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 233536
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233536 (28480 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233696 (28320 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 233728
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233728 (28288 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233888 (28128 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 233920
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:233920 (28096 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234080 (27936 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 234112
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234112 (27904 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234272 (27744 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 234304
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234304 (27712 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234464 (27552 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 234496
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234496 (27520 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234656 (27360 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 234688
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234688 (27328 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234848 (27168 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 234880
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:234880 (27136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235040 (26976 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 235072
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235072 (26944 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235232 (26784 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 235264
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235264 (26752 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235424 (26592 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 235456
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235456 (26560 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235616 (26400 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 235648
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235648 (26368 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235808 (26208 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 235840
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:235840 (26176 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:236000 (26016 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 236032
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:236032 (25984 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning inode node
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:236192 (25824 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning padding node
UBIFS DBG (pid 1396): ubifs_scan_a_node: 4 bytes padded, offset now 236224
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 33:236224 (25792 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1396): ubifs_end_scan: stop scanning LEB 33 at offset 236224
UBIFS DBG (pid 1396): insert_node: add LEB 33:115008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:115168, key (120, truncate)
UBIFS DBG (pid 1396): insert_node: add LEB 33:115264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:115456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:115648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:115840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116032, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116224, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116416, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116608, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116800, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:116992, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:117184, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:117376, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:117568, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:117760, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:117952, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:118144, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:118336, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:118528, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:118720, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:118912, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:119104, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:119296, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:119488, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:119680, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:119872, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:120064, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:120256, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:120448, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:120640, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:120832, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121024, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121216, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121408, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121600, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121792, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:121984, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:122176, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:122368, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:122560, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:122752, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:122944, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:123136, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:123328, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:123520, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:123712, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:123904, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:124096, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:124288, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:124480, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:124672, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:124864, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:125056, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:125248, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:125440, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:125632, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:125824, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126016, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126208, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126400, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126592, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126784, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:126976, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:127168, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:127360, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:127552, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:127744, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:127936, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:128128, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:128320, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:128512, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:128704, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:128896, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:129088, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:129280, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:129472, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:129664, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:129856, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:130048, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:130240, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:130432, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:130624, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:130816, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131200, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131392, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131584, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131776, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:131968, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:132160, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:132352, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:132544, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:132736, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:132928, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:133120, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:133312, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:133504, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:133696, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:133888, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:134080, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:134272, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:134464, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:134656, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:134848, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:135040, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:135232, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:135424, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:135616, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:135808, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136000, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136192, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136384, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136576, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136768, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:136960, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:137152, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:137344, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:137536, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:137728, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:137920, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:138112, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:138304, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:138496, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:138688, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:138880, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:139072, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:139264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:139456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:139648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:139840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140032, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140224, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140416, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140608, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140800, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:140992, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:141184, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:141376, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:141568, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:141760, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:141952, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:142144, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:142336, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:142528, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:142720, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:142912, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:143104, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:143296, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:143488, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:143680, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:143872, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:144064, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:144256, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:144448, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:144640, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:144832, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145024, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145216, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145408, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145600, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145792, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:145984, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:146176, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:146368, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:146560, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:146752, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:146944, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:147136, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:147328, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:147520, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:147712, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:147904, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:148096, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:148288, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:148480, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:148672, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:148864, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:149056, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:149248, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:149440, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:149632, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:149824, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150016, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150208, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150400, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150592, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150784, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:150976, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:151168, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:151360, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:151552, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:151744, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:151936, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:152128, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:152320, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:152512, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:152704, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:152896, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:153088, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:153280, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:153472, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:153664, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:153856, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:154048, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:154240, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:154432, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:154624, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:154816, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155200, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155392, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155584, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155776, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:155968, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:156160, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:156352, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:156544, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:156736, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:156928, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:157120, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:157312, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:157504, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:157696, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:157888, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:158080, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:158272, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:158464, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:158656, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:158848, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:159040, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:159232, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:159424, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:159616, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:159808, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160000, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160192, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160384, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160576, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160768, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:160960, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:161152, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:161344, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:161536, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:161728, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:161920, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:162112, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:162304, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:162496, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:162688, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:162880, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:163072, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:163264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:163456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:163648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:163840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164032, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164224, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164416, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164608, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164800, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:164992, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:165184, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:165376, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:165568, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:165760, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:165952, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:166144, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:166336, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:166528, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:166720, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:166912, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:167104, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:167296, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:167488, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:167680, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:167872, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:168064, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:168256, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:168448, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:168640, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:168832, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169024, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169216, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169408, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169600, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169792, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:169984, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:170176, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:170368, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:170560, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:170752, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:170944, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:171136, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:171328, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:171520, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:171712, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:171904, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:172096, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:172288, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:172480, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:172672, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:172864, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:173056, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:173248, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:173440, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:173632, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:173824, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174016, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174208, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174400, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174592, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174784, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:174976, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:175168, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:175360, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:175552, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:175744, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:175936, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:176128, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:176320, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:176512, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:176704, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:176896, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:177088, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:177280, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:177472, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:177664, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:177856, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:178048, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:178240, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:178432, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:178624, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:178816, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179200, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179392, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179584, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179776, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:179968, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:180160, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:180352, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:180544, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:180736, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:180928, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:181120, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:181312, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:181504, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:181696, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:181888, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:182080, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:182272, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:182464, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:182656, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:182848, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:183040, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:183232, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:183424, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:183616, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:183808, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184000, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184192, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184384, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184576, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184768, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:184960, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:185152, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:185344, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:185536, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:185728, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:185920, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:186112, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:186304, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:186496, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:186688, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:186880, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:187072, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:187264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:187456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:187648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:187840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188032, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188224, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188416, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188608, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188800, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:188992, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:189184, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:189376, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:189568, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:189760, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:189952, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:190144, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:190336, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:190528, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:190720, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:190912, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:191104, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:191296, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:191488, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:191680, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:191872, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:192064, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:192256, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:192448, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:192640, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:192832, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193024, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193216, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193408, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193600, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193792, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:193984, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:194176, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:194368, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:194560, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:194752, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:194944, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:195136, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:195328, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:195520, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:195712, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:195904, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:196096, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:196288, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:196480, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:196672, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:196864, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:197056, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:197248, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:197440, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:197632, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:197824, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198016, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198208, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198400, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198592, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198784, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:198976, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:199168, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:199360, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:199552, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:199744, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:199936, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:200128, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:200320, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:200512, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:200704, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:200896, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:201088, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:201280, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:201472, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:201664, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:201856, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:202048, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:202240, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:202432, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:202624, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:202816, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203200, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203392, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203584, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203776, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:203968, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:204160, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:204352, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:204544, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:204736, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:204928, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:205120, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:205312, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:205504, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:205696, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:205888, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:206080, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:206272, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:206464, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:206656, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:206848, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:207040, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:207232, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:207424, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:207616, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:207808, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208000, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208192, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208384, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208576, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208768, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:208960, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:209152, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:209344, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:209536, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:209728, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:209920, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:210112, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:210304, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:210496, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:210688, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:210880, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:211072, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:211264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:211456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:211648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:211840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212032, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212224, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212416, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212608, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212800, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:212992, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:213184, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:213376, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:213568, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:213760, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:213952, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:214144, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:214336, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:214528, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:214720, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:214912, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:215104, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:215296, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:215488, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:215680, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:215872, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:216064, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:216256, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:216448, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:216640, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:216832, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217024, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217216, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217408, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217600, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217792, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:217984, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:218176, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:218368, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:218560, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:218752, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:218944, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:219136, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:219328, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:219520, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:219712, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:219904, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:220096, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:220288, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:220480, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:220672, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:220864, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:221056, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:221248, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:221440, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:221632, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:221824, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222016, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222208, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222400, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222592, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222784, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:222976, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:223168, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:223360, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:223552, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:223744, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:223936, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:224128, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:224320, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:224512, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:224704, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:224896, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:225088, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:225280, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:225472, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:225664, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:225856, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:226048, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:226240, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:226432, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:226624, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:226816, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227008, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227200, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227392, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227584, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227776, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:227968, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:228160, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:228352, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:228544, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:228736, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:228928, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:229120, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:229312, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:229504, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:229696, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:229888, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:230080, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:230272, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:230464, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:230656, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:230848, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:231040, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:231232, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:231424, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:231616, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:231808, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232000, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232192, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232384, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232576, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232768, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:232960, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:233152, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:233344, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:233536, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:233728, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:233920, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:234112, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:234304, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:234496, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:234688, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:234880, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:235072, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:235264, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:235456, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:235648, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:235840, key (120, inode)
UBIFS DBG (pid 1396): insert_node: add LEB 33:236032, key (120, inode)
UBIFS DBG (pid 1396): ubifs_wbuf_seek_nolock: LEB 33:236224, jhead 1 (base)
UBIFS DBG (pid 1396): insert_ref_node: add ref LEB 33:115008
UBIFS DBG (pid 1396): replay_bud: replay bud LEB 42, head 2
UBIFS DBG (pid 1396): ubifs_recover_leb: 42:74880
UBIFS DBG (pid 1396): ubifs_start_scan: scan LEB 42:74880
UBI DBG (pid 1396): ubi_leb_read: read 187136 bytes from LEB 0:42:74880
UBI DBG (pid 1396): ubi_eba_read_leb: read 187136 bytes from offset 74880 of LEB 0:42, PEB 60
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 42:74880 (187136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1396): no_more_nodes: unexpected data at 42:79040
UBIFS DBG (pid 1396): ubifs_recover_leb: look at LEB 42:74880 (187136 bytes left)
UBIFS DBG (pid 1396): ubifs_scan_a_node: scanning data node
UBIFS error (pid 1396): ubifs_check_node: bad CRC: calculated 0xb25a3552, read 0xe088993d
UBIFS error (pid 1396): ubifs_check_node: bad node at LEB 42:74880
	magic          0x6101831
	crc            0xe088993d
	node_type      1 (data node)
	group_type     0 (no node group)
	sqnum          8564288
	len            4144
	key            (120, data, 0)
	size           4096
	compr_typ      0
	data size      4096
	data:
	00000000: 41 42 43 31 02 33 41 42 43 31 32 33 41 42 43 21 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000020: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000040: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000060: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000080: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000000a0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000000c0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000000e0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000100: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000120: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000140: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000160: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000180: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000001a0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000001c0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000001e0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000200: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000220: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000240: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000260: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000280: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000002a0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000002c0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000002e0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000300: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000320: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000340: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000360: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000380: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000003a0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000003c0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000003e0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000400: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000420: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000440: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000460: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000480: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000004a0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000004c0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000004e0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000500: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000520: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000540: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000560: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000580: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000005a0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000005c0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000005e0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000600: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000620: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000640: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000660: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000680: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000006a0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000006c0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000006e0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000700: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000720: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000740: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000760: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000780: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000007a0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000007c0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000007e0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000800: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000820: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000840: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000860: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000880: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000008a0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000008c0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000008e0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000900: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000920: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000940: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000960: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000980: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	000009a0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	000009c0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	000009e0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000a00: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000a20: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000a40: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000a60: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000a80: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000aa0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000ac0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000ae0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000b00: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000b20: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000b40: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000b60: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000b80: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000ba0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000bc0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000be0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000c00: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000c20: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000c40: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000c60: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000c80: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000ca0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000cc0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000ce0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000d00: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000d20: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000d40: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000d60: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000d80: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000da0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000dc0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000de0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000e00: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000e20: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000e40: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000e60: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000e80: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000ea0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000ec0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000ee0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000f00: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000f20: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000f40: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000f60: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000f80: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
	00000fa0: 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33
	00000fc0: 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
	00000fe0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
Call Trace:
[c3f95b20] [c0009220] show_stack+0xac/0x1d8 (unreliable)
[c3f95b70] [c0009378] dump_stack+0x2c/0x44
[c3f95b80] [c0189338] ubifs_check_node+0x164/0x308
[c3f95bb0] [c0192c60] ubifs_scan_a_node+0x158/0x2ec
[c3f95be0] [c01a95e0] ubifs_recover_leb+0x3dc/0x9b0
[c3f95c50] [c019361c] replay_buds+0xb0/0xc64
[c3f95cf0] [c01948f0] ubifs_replay_journal+0x720/0x1040
[c3f95d80] [c0185890] ubifs_fill_super+0xda0/0x16c8
[c3f95de0] [c0187458] ubifs_get_sb+0x108/0x348
[c3f95e60] [c00b3e8c] vfs_kern_mount+0x70/0x140
[c3f95e80] [c00b3ff4] do_kern_mount+0x50/0x118
[c3f95eb0] [c00cdeac] do_mount+0x404/0x73c
[c3f95f10] [c00ce284] sys_mount+0xa0/0xec
[c3f95f40] [c0013564] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1396): no_more_nodes: unexpected data at 42:79040
UBIFS error (pid 1396): ubifs_recover_leb: bad node
UBIFS error (pid 1396): ubifs_scanned_corruption: corruption at LEB 42:74880
UBIFS error (pid 1396): ubifs_scanned_corruption: first 8192 bytes from LEB 42:74880
00000000: 31181006 3d9988e0 40ae8200 00000000 30100000 01000000 78000000 00000020  1...=...@.......0.......x...... 
00000020: 00000000 00000000 00100000 00000000 41424331 02334142 43313233 41424321  ................ABC1.3ABC123ABC!
00000040: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000060: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000080: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000000a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000000c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000000e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000100: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000120: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000140: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000160: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000180: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000001a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000001c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000001e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000200: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000220: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000240: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000260: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000280: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000002a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000002c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000002e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000300: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000320: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000340: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000360: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000380: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000003a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000003c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000003e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000400: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000420: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000440: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000460: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000480: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000004a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000004c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000004e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000500: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000520: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000540: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000560: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000580: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000005a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000005c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000005e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000600: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000620: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000640: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000660: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000680: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000006a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000006c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000006e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000700: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000720: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000740: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000760: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000780: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000007a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000007c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000007e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000800: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000820: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000840: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000860: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000880: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000008a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000008c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000008e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000900: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000920: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000940: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000960: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000980: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000009a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000009c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000009e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000a00: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000a20: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000a40: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000a60: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000a80: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000aa0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000ac0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000ae0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000b00: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000b20: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000b40: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000b60: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000b80: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000ba0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000bc0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000be0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000c00: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000c20: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000c40: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000c60: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000c80: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000ca0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000cc0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000ce0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000d00: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000d20: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000d40: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000d60: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000d80: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000da0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000dc0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000de0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000e00: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000e20: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000e40: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000e60: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000e80: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000ea0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000ec0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000ee0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000f00: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000f20: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000f40: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000f60: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000f80: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000fa0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000fc0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00000fe0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001000: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001020: 41424331 32334142 43313233 41424331 cececece cececece cececece cececece  ABC123ABC123ABC1................
00001040: 31181006 608051d6 42ae8200 00000000 30100000 01000000 78000000 01000020  1...`.Q.B.......0.......x...... 
00001060: 00000000 00000000 00100000 00000000 32334142 43313233 41424331 32334142  ................23ABC123ABC123AB
00001080: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000010a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000010c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000010e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001100: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001120: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001140: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001160: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001180: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000011a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000011c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000011e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001200: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001220: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001240: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001260: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001280: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000012a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000012c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000012e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001300: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001320: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001340: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001360: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001380: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000013a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000013c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000013e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001400: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001420: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001440: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001460: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001480: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000014a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000014c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000014e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001500: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001520: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001540: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001560: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001580: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000015a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000015c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000015e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001600: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001620: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001640: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001660: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001680: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000016a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000016c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000016e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001700: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001720: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001740: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001760: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001780: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000017a0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000017c0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000017e0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001800: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001820: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001840: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001860: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001880: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000018a0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000018c0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000018e0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001900: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001920: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001940: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001960: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001980: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
000019a0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
000019c0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
000019e0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001a00: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001a20: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001a40: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001a60: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001a80: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001aa0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001ac0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001ae0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001b00: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001b20: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001b40: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001b60: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001b80: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001ba0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001bc0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001be0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001c00: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001c20: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001c40: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001c60: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001c80: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001ca0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001cc0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001ce0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001d00: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001d20: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001d40: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001d60: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001d80: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001da0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001dc0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001de0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001e00: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001e20: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001e40: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001e60: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001e80: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001ea0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001ec0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001ee0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001f00: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001f20: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001f40: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001f60: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001f80: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00001fa0: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00001fc0: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
00001fe0: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
UBIFS error (pid 1396): ubifs_recover_leb: LEB 42 scanning failed
UBIFS DBG (pid 1398): ubifs_bg_thread: background thread "ubifs_bgt1_0" stops
UBI DBG (pid 1396): ubi_close_volume: close device 1, volume 0, mode 2
UBI DBG (pid 1396): ubi_close_volume: close device 1, volume 0, mode 1

--MP_/TnJUy1tl1F0XOwQK8FkOM3.--
