Received: from mx0a-00116901.pphosted.com ([67.231.145.58])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9G1q-0000uk-VP
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 16:33:48 +0000
Received: from pps.filterd (m0046982.ppops.net [127.0.0.1])
 by mx0a-00116901.pphosted.com (8.14.5/8.14.5) with SMTP id t08GV0oF013734
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jan 2015 08:33:24 -0800
Message-Id: <201501081633.t08GV0oF013734@mx0a-00116901.pphosted.com>
From: "Winchenbach, Samuel" <Samuel-Winchenbach@idexx.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: One bad PEB causes WL to run of PEBs
Date: Thu, 8 Jan 2015 16:33:19 +0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,=0A=
=0A=
I am working on an instrument with uboot v2013.01.  This instrument experie=
nced a nand corruption on one of the blocks (incrementing the bad PEB count=
 to 1) when someone pulled the power plug.  When the instrument booted ubi_=
wl_init_scan had an error because avail_pebs was 0 and 1 was needed.   We a=
dded a bunch of debug prints and this is what it looks like (good and bad):=
=0A=
=0A=
=3D=3D=3D=3D=3D GOOD (BEFORE GETTING A BAD PEB) =3D=3D=3D=3D=3D=0A=
idexx> ubi part nand-rootfs=0A=
UBI: mtd1 is detached from ubi0=0A=
Creating 1 MTD partitions on "nand0":=0A=
0x000001500000-0x000020000000 : "mtd=3D5"=0A=
UBI: attaching mtd1 to ubi0=0A=
UBI: physical eraseblock size:   131072 bytes (128 KiB)=0A=
UBI: logical eraseblock size:    129024 bytes=0A=
UBI: smallest flash I/O unit:    2048=0A=
UBI: sub-page size:              512=0A=
UBI: VID header offset:          512 (aligned 512)=0A=
UBI: data offset:                2048=0A=
UBI error: process_eb: DEBUG! found volume table at peb: 3926=0A=
=0A=
UBI error: process_eb: DEBUG! found volume table at peb: 3927=0A=
=0A=
UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 0=0A=
=0A=
UBI error: ubi_read_volume_table: DEBUG!=0A=
        reserved_pebs: 755957760=0A=
        alignment: 16777216=0A=
        data_pad: 0=0A=
        vol_type: 1=0A=
        upd_marker: 0=0A=
        name_len: 2816=0A=
        name: nand-rootfs=0A=
        flags: 0=0A=
=0A=
UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3928=0A=
UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 41=
=0A=
UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now 40=
=0A=
UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now 1=
=0A=
UBI error: ubi_wl_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now 0=
=0A=
UBI: attached mtd1 to ubi0=0A=
UBI: MTD device name:            "mtd=3D5"=0A=
UBI: MTD device size:            491 MiB=0A=
UBI: number of good PEBs:        3928=0A=
UBI: number of bad PEBs:         0=0A=
UBI: max. allowed volumes:       128=0A=
UBI: wear-leveling threshold:    4096=0A=
UBI: number of internal volumes: 1=0A=
UBI: number of user volumes:     1=0A=
UBI: available PEBs:             0=0A=
UBI: total number of reserved PEBs: 3928=0A=
UBI: number of PEBs reserved for bad PEB handling: 39=0A=
UBI: max/mean erase counter: 21/10=0A=
=0A=
=0A=
=0A=
=3D=3D=3D=3D=3D BAD (AFTER GETTING A BAD PEB) =3D=3D=3D=3D=3D=0A=
idexx> ubi part nand-rootfs=0A=
Creating 1 MTD partitions on "nand0":=0A=
0x000001500000-0x000020000000 : "mtd=3D5"=0A=
UBI: attaching mtd1 to ubi0=0A=
UBI: physical eraseblock size:   131072 bytes (128 KiB)=0A=
UBI: logical eraseblock size:    129024 bytes=0A=
UBI: smallest flash I/O unit:    2048=0A=
UBI: sub-page size:              512=0A=
UBI: VID header offset:          512 (aligned 512)=0A=
UBI: data offset:                2048=0A=
UBI error: process_eb: DEBUG! found volume table at peb: 3926=0A=
=0A=
UBI error: process_eb: DEBUG! found volume table at peb: 3927=0A=
=0A=
UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 1=0A=
=0A=
UBI error: ubi_read_volume_table: DEBUG!=0A=
        reserved_pebs: 755957760=0A=
        alignment: 16777216=0A=
        data_pad: 0=0A=
        vol_type: 1=0A=
        upd_marker: 0=0A=
        name_len: 2816=0A=
        name: nand-rootfs=0A=
        flags: 0=0A=
=0A=
UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3927=0A=
UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 40=
=0A=
UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now 39=
=0A=
UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now 0=
=0A=
UBI error: ubi_wl_init_scan: no enough physical eraseblocks (0, need 1)=0A=
UBI error: ubi_init: cannot attach mtd1=0A=
UBI error: ubi_init: UBI error: cannot initialize UBI, error -12=0A=
UBI init error 12=0A=
idexx> nand bad=0A=
=0A=
Device 0 bad blocks:=0A=
  05f40000=0A=
  2c120000=0A=
  3ff80000=0A=
  3ffa0000=0A=
  3ffc0000=0A=
  3ffe0000=0A=
idexx> =0A=
=0A=
=0A=
=0A=
Why (seeing there is a bad PEB does eba_init_scan still allocate 39 PEBs fo=
r bad blocks?   Shouldn't one of those be consumed by the bad PEB?    Do yo=
u see anything else that might point to this being a bug vs. incorrect usag=
e?=0A=
=0A=
Thanks for your help,=0A=
Sam=
