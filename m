Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOzfk-0008GZ-A7
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 23:06:25 +0000
Received: by qcsu28 with SMTP id u28so2014831qcs.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 16:06:21 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 30 Apr 2012 19:06:20 -0400
Message-ID: <CAGiDA6KPcxT0JaPkXHywTojcnj1gxXHZJgjJH1-CYrC2d3JePg@mail.gmail.com>
Subject: 
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having trouble attaching an ubi device after creating a volume on
it. My procedure is as follows (a full console log is at the end of
this e-mail):

ubiformat /dev/mtd6
ubiattach -m 6
ubimkvol /dev/ubi0 -N root0 -s 11MiB
ubidetach -m 6
ubiattach -m 6

When I try to re-attach, the UBI module produces messages:

[ 2558.700000] UBI error: vtbl_check: bad CRC at record 0: 0x2863aedc,
not 0xcd06c54d
[ 2558.710000] UBI error: vtbl_check: bad CRC at record 0: 0x2863aedc,
not 0xcd06c54d
[ 2558.717500] UBI error: process_lvol: both volume tables are corrupted
[ 2558.725000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22

If I don't make a volume, but just format the mtd device, then I can
attach and detach just fine; it's only after making a volume that it
gives this problem. I've tried making the volume both static and
dynamic, and I've tried writing a filesystem with ubiupdatevol; it
always has this issue. The mtd device itself works fine. I can write
and read data from it, I can run mtd_speedtest and mtd_stresstest with
no problems.

I'm using kernel 2.6.39.4 and mtd_utils 1.4.9.

below is the console output from the sequence described above:

#
# ubiformat /dev/mtd6
ubiformat: mtd6 (nor), size 14417920 bytes (13.8 MiB), 220 eraseblocks
of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 219 -- 100 % complete
ubiformat: 220 eraseblocks have valid erase counter, mean value is 20
ubiformat: formatting eraseblock 219 -- 100 % complete
# ubiattach -m 6
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI:
attaching mtd6 to ubi0
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): ubi_attach_mtd_dev: sizeof(struct ubi_scan_leb) 40
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: min_io_size      1
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: max_write_size   256
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: hdrs_min_io_size 1
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: ec_hdr_alsize    64
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: vid_hdr_alsize   64
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: vid_hdr_offset   64
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: vid_hdr_aloffset 64
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: vid_hdr_shift    0
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: leb_start        128
Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.032500] UBI DBG (pid
417): io_init: max_erroneous    22
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI:
physical eraseblock size:   65536 bytes (64 KiB)
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI:
logical eraseblock size:    65408 bytes
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI:
smallest flash I/O unit:    1
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI: VID
header offset:          64 (aligned 64)
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.032500] UBI: data
offset:                128
UBI device number 0, total 220 LEBs (14389760 bytes, 13.7 MiB),
available 216 LEBs (14128128 bytes, 13.5 MiB), LEB size 65408 bytes
(63.9 KiB)
# Dec 31 17:01:59 nbfx100 kern.debug kernel: [  119.272500] UBI DBG
(pid 417): ubi_scan: scanning is finished
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.272500] UBI: max.
sequence number:       0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI:
attached mtd6 to ubi0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: MTD
device name:            "play"
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: MTD
device size:            13 MiB
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of good PEBs:        220
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of bad PEBs:         0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of corrupted PEBs:   0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: max.
allowed volumes:       128
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI:
wear-leveling threshold:    4096
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of internal volumes: 1
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of user volumes:     0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI:
available PEBs:             216
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: total
number of reserved PEBs: 4
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: number
of PEBs reserved for bad PEB handling: 0
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI:
max/mean erase counter: 45/21
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.392500] UBI: image
sequence number:  557305100
Dec 31 17:01:59 nbfx100 kern.notice kernel: [  119.395000] UBI:
background thread "ubi_bgt0d" started, PID 418

#
# ubimkvol /dev/ubi0 -N root0 -s 11MiB
Volume ID 0, size 177 LEBs (11577216 bytes, 11.0 MiB), LEB size 65408
bytes (63.9 KiB), dynamic, name "root0", alignment 1
# ubidetach -m 6
Dec 31 17:02:25 nbfx100 kern.debug kernel: [  145.442500] UBI DBG (pid
420): ubi_detach_mtd_dev: detaching mtd6 from ubi0
# Dec 31 17:02:25 nbfx100 kern.notice kernel: [  145.445000] UBI: mtd6
is detached from ubi0
# ubiattach -m 6
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.087500] UBI:
attaching mtd6 to ubi0
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): ubi_attach_mtd_dev: sizeof(struct ubi_scan_leb) 40
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): ubi_attach_mtd_dev: sizeof(struct ubi_wl_entry) 20
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: min_io_size      1
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: max_write_size   256
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: hdrs_min_io_size 1
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: ec_hdr_alsize    64
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: vid_hdr_alsize   64
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: vid_hdr_offset   64
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: vid_hdr_aloffset 64
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: vid_hdr_shift    0
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: leb_start        128
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.087500] UBI DBG (pid
421): io_init: max_erroneous    22
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.087500] UBI:
physical eraseblock size:   65536 bytes (64 KiB)
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.087500] UBI:
logical eraseblock size:    65408 bytes
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.087500] UBI:
smallest flash I/O unit:    1
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.090000] UBI: VID
header offset:          64 (aligned 64)
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.090000] UBI: data
offset:                128
ubiattach: error!: cannot attach mtd6
          error 22 (Invalid argument)
# Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.330000] UBI DBG
(pid 421): ubi_scan: scanning is finished
Dec 31 17:02:29 nbfx100 kern.notice kernel: [  149.330000] UBI: max.
sequence number:       2
Dec 31 17:02:29 nbfx100 kern.err kernel: [  149.435000] UBI error:
vtbl_check: bad CRC at record 0: 0xd6f5f63b, not 0xb44a0675
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000] Volume table
record 0 dump:
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
reserved_pebs   -339165880
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
alignment       643582077
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
data_pad        386227461
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
vol_type        8
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
upd_marker      205
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
name_len        19589
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]       1st 5
characters of name: \'=EF=BF=BD^B=EF=BF=BD
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]       crc
        0xb44a0675
Dec 31 17:02:29 nbfx100 kern.err kernel: [  149.435000] UBI error:
vtbl_check: bad CRC at record 0: 0xd6f5f63b, not 0xb44a0675
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000] Volume table
record 0 dump:
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
reserved_pebs   -339165880
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
alignment       643582077
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
data_pad        386227461
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
vol_type        8
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
upd_marker      205
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]
name_len        19589
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]       1st 5
characters of name: \'=EF=BF=BD^B=EF=BF=BD
Dec 31 17:02:29 nbfx100 kern.debug kernel: [  149.435000]       crc
        0xb44a0675
Dec 31 17:02:29 nbfx100 kern.err kernel: [  149.435000] UBI error:
process_lvol: both volume tables are corrupted
Dec 31 17:02:29 nbfx100 kern.err kernel: [  149.435000] UBI error:
ubi_attach_mtd_dev: failed to attach by scanning, error -22


Thanks,
Shawn J. Goff
