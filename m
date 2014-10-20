Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgKjT-0000ne-EJ
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 21:43:16 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so152560igb.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2014 14:42:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413812506.7906.286.camel@sauron.fi.intel.com>
References: <CACna6rxV9UbXOtq7w+HGYZQVi8-4v+pZOtK98cGJaCwA+njUVg@mail.gmail.com>
 <1413812506.7906.286.camel@sauron.fi.intel.com>
Date: Mon, 20 Oct 2014 23:42:53 +0200
Message-ID: <CACna6rz_cJQx4fQR-nV4tV-CqCAwJxxXK5za5LAGRAq5VQYhqQ@mail.gmail.com>
Subject: Re: UBIFS: Does init_constants_early ignore LEBs being erased?
 Complains about amount.
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
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

On 20 October 2014 15:41, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2014-10-17 at 08:29 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> UBI: available PEBs: 0, total reserved PEBs: 986, PEBs reserved for
>> bad PEB handling: 20
>> UBI: background thread "ubi_bgt0d" started, PID 257
>> UBI: ubiblock0_0 created from ubi0:0(rootfs)
>> UBIFS error (pid 1): init_constants_early: too few LEBs (15), min. is 17
>
> UBIFS wants more LEBs in the volume.
>
>> *** 5 seconds later ***
>> UBIFS: default file-system created
>> UBIFS: background thread "ubifs_bgt0_1" started, PID 302
>> UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
>> UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:
>> 2048 bytes/2048 bytes
>> UBIFS: FS size: 118849536 bytes (113 MiB, 936 LEBs), journal size
>> 5967872 bytes (5 MiB, 47 LEBs)
>
> This is a different volume mounted, it seems, it has 47 LEBs.

This is weird. I don't think my ubinized image contains 2 UBIFS volumes :|

[rootfs]
# Volume mode (other option is static)
mode=3Dubi
# Source image
image=3Droot.squashfs
# Volume ID in UBI image
vol_id=3D0
# Allow for dynamic resize
vol_type=3Ddynamic
# Volume name
vol_name=3Drootfs

[rootfs_data]
# Volume mode (other option is static)
mode=3Dubi
# Volume ID in UBI image
vol_id=3D1
# Allow for dynamic resize
vol_type=3Ddynamic
# Volume name
vol_name=3Drootfs_data
# Autoresize volume at first mount
vol_flags=3Dautoresize
vol_size=3D1MiB

I'll try to pick Tanya's patch and try again.
