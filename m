Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9L1z-0008Oz-NI
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 21:54:16 +0000
Received: by mail-vc0-f181.google.com with SMTP id le20so2073761vcb.12
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 13:53:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201501081633.t08GV0oF013734@mx0a-00116901.pphosted.com>
References: <201501081633.t08GV0oF013734@mx0a-00116901.pphosted.com>
Date: Thu, 8 Jan 2015 22:53:53 +0100
Message-ID: <CAFLxGvyGv8zZYdUgU26LT7t7LGVd9c-bkykVy4JS8cPpdzOqfw@mail.gmail.com>
Subject: Re: One bad PEB causes WL to run of PEBs
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Winchenbach, Samuel" <Samuel-Winchenbach@idexx.com>
Content-Type: text/plain; charset=UTF-8
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

On Thu, Jan 8, 2015 at 5:33 PM, Winchenbach, Samuel
<Samuel-Winchenbach@idexx.com> wrote:
> Hi All,
>
> I am working on an instrument with uboot v2013.01.  This instrument exper=
ienced a nand corruption on one of the blocks (incrementing the bad PEB cou=
nt to 1) when someone pulled the power plug.  When the instrument booted ub=
i_wl_init_scan had an error because avail_pebs was 0 and 1 was needed.   We=
 added a bunch of debug prints and this is what it looks like (good and bad=
):
>
> =3D=3D=3D=3D=3D GOOD (BEFORE GETTING A BAD PEB) =3D=3D=3D=3D=3D
> idexx> ubi part nand-rootfs
> UBI: mtd1 is detached from ubi0
> Creating 1 MTD partitions on "nand0":
> 0x000001500000-0x000020000000 : "mtd=3D5"
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI error: process_eb: DEBUG! found volume table at peb: 3926
>
> UBI error: process_eb: DEBUG! found volume table at peb: 3927
>
> UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 0
>
> UBI error: ubi_read_volume_table: DEBUG!
>         reserved_pebs: 755957760

huh?

>         alignment: 16777216
>         data_pad: 0
>         vol_type: 1
>         upd_marker: 0
>         name_len: 2816
>         name: nand-rootfs
>         flags: 0
>
> UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3928
> UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 41
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now =
40
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now=
 1
> UBI error: ubi_wl_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now 0
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=3D5"
> UBI: MTD device size:            491 MiB
> UBI: number of good PEBs:        3928
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 3928
> UBI: number of PEBs reserved for bad PEB handling: 39
> UBI: max/mean erase counter: 21/10
>
>
>
> =3D=3D=3D=3D=3D BAD (AFTER GETTING A BAD PEB) =3D=3D=3D=3D=3D
> idexx> ubi part nand-rootfs
> Creating 1 MTD partitions on "nand0":
> 0x000001500000-0x000020000000 : "mtd=3D5"
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI error: process_eb: DEBUG! found volume table at peb: 3926
>
> UBI error: process_eb: DEBUG! found volume table at peb: 3927
>
> UBI error: attach_by_scanning: DEBUG! peb_count: 3928 bad_peb_count: 1
>
> UBI error: ubi_read_volume_table: DEBUG!
>         reserved_pebs: 755957760
>         alignment: 16777216
>         data_pad: 0
>         vol_type: 1
>         upd_marker: 0
>         name_len: 2816
>         name: nand-rootfs
>         flags: 0
>
> UBI error: ubi_read_volume_table: DEBUG!: setting avail_pebs =3D 3927
> UBI error: init_volumes: DEBUG! subtracting 3887 from avail_pebs.  Now 40
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 1 from avail_pebs.  Now =
39
> UBI error: ubi_eba_init_scan: DEBUG! subtracting 39 from avail_pebs.  Now=
 0
> UBI error: ubi_wl_init_scan: no enough physical eraseblocks (0, need 1)
> UBI error: ubi_init: cannot attach mtd1
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -12
> UBI init error 12
> idexx> nand bad
>
> Device 0 bad blocks:
>   05f40000
>   2c120000
>   3ff80000
>   3ffa0000
>   3ffc0000
>   3ffe0000
> idexx>
>
>
>
> Why (seeing there is a bad PEB does eba_init_scan still allocate 39 PEBs =
for bad blocks?   Shouldn't one of those be consumed by the bad PEB?    Do =
you see anything else that might point to this being a bug vs. incorrect us=
age?

I'd like to know how many PEBs are reserved for bad block handling.
On Linux you can query this using /sys/class/ubi/ubiX/reserved_for_bad

To me this looks like you've reserved too few PEBs.

--=20
Thanks,
//richard
