Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsOjg-0006Z7-2B
	for linux-mtd@lists.infradead.org; Sun, 05 Sep 2010 23:35:02 +0000
Received: by vws11 with SMTP id 11so3122809vws.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 05 Sep 2010 16:34:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
Date: Sun, 5 Sep 2010 16:34:54 -0700
Message-ID: <AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module ref-counting
	back to open/release
From: Kevin Cernekee <cernekee@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 22, 2010 at 10:44 AM, Ben Hutchings
<bhutchings@solarflare.com> wrote:
> commit 048d87199566663e4edc4880df3703c04bcf41d9 "mtd: blktrans: Hotplug
> fixes" causes the MTD and the MTD driver module's ref-counts to be
> bumped for each block device that is created, whether or not it's
> actually in use.
>
> This means that before removing an MTD or driver module one must first
> remove all the associated block devices. =C2=A0But the block devices will
> be removed only when the MTDs themselves are removed, which is no
> longer possible.

Just updated to 2.6.36-rc3 and noticed a related issue.  Configuration is:

CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_UBI_GLUEBI=3Dy

When I "ubiattach" a physical MTD device, a gluebi MTD device is
automatically created for each UBI volume.  The notifiers cause
add_mtd_blktrans_dev() to get called for each new gluebi device.  But
add_mtd_blktrans_dev() now calls __get_mtd_device(), locking up the
gluebi device and preventing it from being used:

# ubiattach -m3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    130944 bytes
UBI: smallest flash I/O unit:    1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI: max. sequence number:       14
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            16 MiB
UBI: number of good PEBs:        128
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 128
UBI: number of PEBs reserved for bad PEB handling: 0
UBI: max/mean erase counter: 1/0
UBI: image sequence number:  0
UBI: background thread "ubi_bgt0d" started, PID 448
UBI device number 0, total 128 LEBs (16760832 bytes, 16.0 MiB),
available 0 LEBs (0 bytes), LEB size 130944 bytes (127.9 KiB)
# mount -t ubifs ubi0:rootfs /mnt
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -16
mount: mounting ubi0:rootfs on /mnt failed: Device or resource busy
# ubidetach -m3
ubidetach: error!: cannot detach mtd3
           error 16 (Device or resource busy)

My short-term workaround is to disable CONFIG_MTD_BLOCK and
CONFIG_MTD_BLKDEVS.  It would be nice to fix the code for 2.6.36
though.
