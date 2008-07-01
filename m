Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDeyK-0002Jl-Vi
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 12:28:37 +0000
Subject: Re: Bootloader support for UBI images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <486A184B.3080708@logitech.com>
References: <486A184B.3080708@logitech.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 01 Jul 2008 15:26:04 +0300
Message-Id: <1214915164.6573.75.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2008-07-01 at 12:43 +0100, Richard Titmuss wrote:
> Before I proceed any further I have some questions. To upgrade the=20
> system I would like to do something like:
>=20
> # Remove backup volumes
> ubirmvol /dev/ubi0 -N kernel.old
> ubirmvol /dev/ubi0 -N rootfs.old
> # Create new volumes
> ubimkvol /dev/ubi0 -N kernel.new -s ...
> ubimkvol /dev/ubi0 -N rootfs.old -s ...
> # Write new volume contents
> ubiupdatevol /dev/ubi0 -N kernel.new zImage
> ubiupdatevol /dev/ubi0 -N rootfs.new rootfs
> # Atomically rename volumes, switch to the new images
> ubirenamevol /dev/ubi0 kernel kernel.old kernel.new kernel rootfs=20
> rootfs.old rootfs.new rootfs
>=20
> This would require adding support for -N to ubiupdatevol to allow the=20
> volume name to be used (just syntactic sugar).
Sounds fine and useful.

>  Also I need support for=20
> renaming multiple volumes atomically when switching images after the=20
> upgrade. If these sound sensible and useful changes I can look at=20
> creating patches to add these features.
Also sounds as a good and useful idea. And implementation should not
difficult - it is just about changing the volume table. You may count on
my assistance.

I'm just not sure about the interface. Renaming one volume is fine. But
you need to rename 2, so the interface should be more complex. And if 2,
why not 3, or 5? Or 16? Or any amount from 1 to UBI_MAX_VOLUMES?

> The initial scanning of the flash in the bootloader seems to be taking a=20
> long time (longer than mounting the volume from linux). I need to look=20
> at why this is taking longer, but it would be great to avoid doing two=20
> full table scans.

So you use the sub-page read patch BTW?

>  Passing the scan information from the bootloader to=20
> the kernel seems tricky, especially as the kernel builds multiple trees=20
> and lists during the scan.
>  Bootloader support for UBI imagesA possible=20
> alternative approach would be to include an LER to PER index table for=20
> static volumes only. This table would only need updating when the static=20
> volume was rewritten or a PER moved due to a bit error or wear leveling.=20
> If the index table and the volume table were always located near the=20
> start or end of the flash then a full volume scan could be avoided in=20
> the bootloader. Does this sound like a reasonable optimization, or is=20
> another solution preferred?

Well, surely the boot-loader may create a per-PEB (physical eraseblock)
array and put all information about each PEB there (mapped/unmapped, LEB
number, erase-counter, etc)? Then in UBI it will be easy to scan this
array instead of the flash media. I am just not aware how such kind of
bootloader->kernel data passing is done in Linux. Can you come up with a
nice and mainline-acceptible way?

I did not actually catch the second part (LER and PER) tables - this is
something I am not aware of. UBI has only volume table on flash, the
other things are in-memory and build by scanning.

But in general, the idea not to do double scan but pass the scanning
information from boot-loader to the kernel sounds good. We just need to
figure out how to do this nicely.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
