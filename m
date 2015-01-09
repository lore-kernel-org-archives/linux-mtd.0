Received: from mx0a-00116901.pphosted.com ([67.231.145.58])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9ZdT-0006Qj-M2
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 13:29:57 +0000
Message-Id: <201501091329.t09DKkgU027495@mx0a-00116901.pphosted.com>
From: "Winchenbach, Samuel" <Samuel-Winchenbach@idexx.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: RE: One bad PEB causes WL to run of PEBs
Date: Fri, 9 Jan 2015 13:29:24 +0000
References: <201501081633.t08GV0oF013734@mx0a-00116901.pphosted.com>,
 <CAFLxGvyGv8zZYdUgU26LT7t7LGVd9c-bkykVy4JS8cPpdzOqfw@mail.gmail.com>
In-Reply-To: <CAFLxGvyGv8zZYdUgU26LT7t7LGVd9c-bkykVy4JS8cPpdzOqfw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think we figured it out.=0A=
=0A=
In attach_by_scanning in build.c ubi_eba_init_scan is called before ubi_wl_=
init_scan.   eba_init_scan grabs all remaining (up to some limit) of availa=
ble PEBs for bad PEB recovery.   We simply moved ubi_wl_init_scan before th=
e eba scan so wear leveling has a chance to grab one of good PEBs before eb=
a gobbles them up.=0A=
=0A=
We also noticed that this change has been made in newer version of uboot/ub=
i.=0A=
=0A=
Sam=0A=
=0A=
________________________________________=0A=
From: Richard Weinberger [richard.weinberger@gmail.com]=0A=
Sent: Thursday, January 08, 2015 4:53 PM=0A=
To: Winchenbach, Samuel=0A=
Cc: linux-mtd@lists.infradead.org=0A=
Subject: Re: One bad PEB causes WL to run of PEBs=0A=
=0A=
On Thu, Jan 8, 2015 at 5:33 PM, Winchenbach, Samuel=0A=
<Samuel-Winchenbach@idexx.com> wrote:=0A=
> Hi All,=0A=
>=0A=
> I am working on an instrument with uboot v2013.01.  This instrument exper=
ienced a nand corruption on one of the blocks (incrementing the bad PEB cou=
nt to 1) when someone pulled the power plug.  When the instrument booted ub=
i_wl_init_scan had an error because avail_pebs was 0 and 1 was needed.   We=
 added a bunch of debug prints and this is what it looks like (good and bad=
):=0A=
>=0A=
> =3D=3D=3D=3D=3D GOOD (BEFORE GETTING A BAD PEB) =3D=3D=3D=3D=3D=0A=
> idexx> ubi part nand-rootfs=0A=
> UBI: mtd1 is detached from ubi0=0A=
> Creating 1 MTD partitions on "nand0":=0A=
> 0x000001500000-0x000020000000 : "mtd=3D5"=0A=
> UBI: attaching mtd1 to ubi0=0A=
> UBI: physical eraseblock size:   131072 bytes (128 KiB)=0A=
> UBI: logical eraseblock size:    129024 bytes=0A=
> UBI: smallest flash I/O unit:    2048=0A=
> UBI: sub-page size:              512=0A=
> UBI: VID header offset:          512 (aligned 512)=0A=
> UBI: data offset:                2048=0A=
> UBI error: process_eb: DEBUG! found volume table at peb: 3926=0A=
>=0A=
> UBI error: process_eb: DEBUG! found volume table at peb: 3927=0A=
>=0A=
> UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 0=0A=
>=0A=
> UBI error: ubi_read_volume_table: DEBUG!=0A=
>         reserved_pebs: 755957760=0A=
=0A=
huh?=0A=
=0A=
>         alignment: 16777216=0A=
>         data_pad: 0=0A=
>         vol_type: 1=0A=
>         upd_marker: 0=0A=
>         name_len: 2816=0A=
>         name: nand-rootfs=0A=
>         flags: 0=0A=
>=0A=
> UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3928=0A=
> UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 41=
=0A=
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now =
40=0A=
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now=
 1=0A=
> UBI error: ubi_wl_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now 0=
=0A=
> UBI: attached mtd1 to ubi0=0A=
> UBI: MTD device name:            "mtd=3D5"=0A=
> UBI: MTD device size:            491 MiB=0A=
> UBI: number of good PEBs:        3928=0A=
> UBI: number of bad PEBs:         0=0A=
> UBI: max. allowed volumes:       128=0A=
> UBI: wear-leveling threshold:    4096=0A=
> UBI: number of internal volumes: 1=0A=
> UBI: number of user volumes:     1=0A=
> UBI: available PEBs:             0=0A=
> UBI: total number of reserved PEBs: 3928=0A=
> UBI: number of PEBs reserved for bad PEB handling: 39=0A=
> UBI: max/mean erase counter: 21/10=0A=
>=0A=
>=0A=
>=0A=
> =3D=3D=3D=3D=3D BAD (AFTER GETTING A BAD PEB) =3D=3D=3D=3D=3D=0A=
> idexx> ubi part nand-rootfs=0A=
> Creating 1 MTD partitions on "nand0":=0A=
> 0x000001500000-0x000020000000 : "mtd=3D5"=0A=
> UBI: attaching mtd1 to ubi0=0A=
> UBI: physical eraseblock size:   131072 bytes (128 KiB)=0A=
> UBI: logical eraseblock size:    129024 bytes=0A=
> UBI: smallest flash I/O unit:    2048=0A=
> UBI: sub-page size:              512=0A=
> UBI: VID header offset:          512 (aligned 512)=0A=
> UBI: data offset:                2048=0A=
> UBI error: process_eb: DEBUG! found volume table at peb: 3926=0A=
>=0A=
> UBI error: process_eb: DEBUG! found volume table at peb: 3927=0A=
>=0A=
> UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 1=0A=
>=0A=
> UBI error: ubi_read_volume_table: DEBUG!=0A=
>         reserved_pebs: 755957760=0A=
>         alignment: 16777216=0A=
>         data_pad: 0=0A=
>         vol_type: 1=0A=
>         upd_marker: 0=0A=
>         name_len: 2816=0A=
>         name: nand-rootfs=0A=
>         flags: 0=0A=
>=0A=
> UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3927=0A=
> UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 40=
=0A=
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now =
39=0A=
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now=
 0=0A=
> UBI error: ubi_wl_init_scan: no enough physical eraseblocks (0, need 1)=
=0A=
> UBI error: ubi_init: cannot attach mtd1=0A=
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -12=0A=
> UBI init error 12=0A=
> idexx> nand bad=0A=
>=0A=
> Device 0 bad blocks:=0A=
>   05f40000=0A=
>   2c120000=0A=
>   3ff80000=0A=
>   3ffa0000=0A=
>   3ffc0000=0A=
>   3ffe0000=0A=
> idexx>=0A=
>=0A=
>=0A=
>=0A=
> Why (seeing there is a bad PEB does eba_init_scan still allocate 39 PEBs =
for bad blocks?   Shouldn't one of those be consumed by the bad PEB?    Do =
you see anything else that might point to this being a bug vs. incorrect us=
age?=0A=
=0A=
I'd like to know how many PEBs are reserved for bad block handling.=0A=
On Linux you can query this using /sys/class/ubi/ubiX/reserved_for_bad=0A=
=0A=
To me this looks like you've reserved too few PEBs.=0A=
=0A=
--=0A=
Thanks,=0A=
//richard=0A=
