MIME-Version: 1.0
Date: Tue, 23 Mar 2010 17:26:02 +0800
Message-ID: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
Subject: ubiattach error!
From: jerry <jerrydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,
I am trying to use ubi to attach mtd3(3.9G),but there are some
question.the mlc is SAMSUNG K9LBG080D,the kernel version is 2.6.28
# flash_erase =A0/dev/mtd3;

# ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size: =A0 524288 bytes (512 KiB)
UBI: logical eraseblock size: =A0 =A0516096 bytes
UBI: smallest flash I/O unit: =A0 =A04096
UBI: VID header offset: =A0 =A0 =A0 =A0 =A04096 (aligned 4096)
UBI: data offset: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08192
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: attached mtd3 to ubi0
UBI: MTD device name: =A0 =A0 =A0 =A0 =A0 =A0"Filesys partition"
UBI: MTD device size: =A0 =A0 =A0 =A0 =A0 =A04078 MiB
UBI: number of good PEBs: =A0 =A0 =A0 =A08156
UBI: number of bad PEBs: =A0 =A0 =A0 =A0 0
UBI: max. allowed volumes: =A0 =A0 =A0 128
UBI: wear-leveling threshold: =A0 =A04096
UBI: number of internal volumes: 1
UBI: number of user volumes: =A0 =A0 0
UBI: available PEBs: =A0 =A0 =A0 =A0 =A0 =A0 8071
UBI: total number of reserved PEBs: 85
UBI: number of PEBs reserved for bad PEB handling: 81
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt0d" started, PID 452
UBI device number 0, total 8156 LEBs (fae48000 bytes, 3.9 GiB),
available 8071 LEBs (f8472000 bytes, 3.9 GiB), LEB size 7e000 bytes
(504.0 KiB)

# ubimkvol /dev/ubi0 -n 0 -N uu -s 100MiB;
Volume ID 0, size 204 LEBs (105283584 bytes, 100.4 MiB), LEB size
516096 bytes (504.0 KiB), dynamic, name "uu", alignment 1

# ubidetach /dev/ubi_ctrl -m 3
UBI: mtd3 is detached from ubi0

# ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size: =A0 524288 bytes (512 KiB)
UBI: logical eraseblock size: =A0 =A0516096 bytes
UBI: smallest flash I/O unit: =A0 =A04096
UBI: VID header offset: =A0 =A0 =A0 =A0 =A04096 (aligned 4096)
UBI: data offset: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08192
UBI error: ubi_scan_add_used: two LEBs with same sequence number 4
ubiattach: error!: cannot attach mtd3
=A0 =A0 =A0 =A0 =A0 error 22 (Invalid argument)

Thanks.

Best Regards,
Jerry
