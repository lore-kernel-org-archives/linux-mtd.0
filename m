Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGqt3-00019x-Jn
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 12:38:46 +0000
Received: by ieje14 with SMTP id e14so1292891iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 05:38:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348658003.24309.70.camel@sauron.fi.intel.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
 <1348658003.24309.70.camel@sauron.fi.intel.com>
Date: Wed, 26 Sep 2012 20:38:44 +0800
Message-ID: <CADqH6VxNTns60J6tc5a6SwdoGcetSK5sYF=a5Sf2HxDR+igCLg@mail.gmail.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 26, 2012 at 7:13 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From df2a498002498e52025acf51e0b43064d766aa0a Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 26 Sep 2012 14:12:28 +0300
> Subject: [PATCH] UBI: allow for delayed rename
>
> Just an experimental patch.

Thanks Artem. I gave it a quick try.

I applied the patch, flashed new kernel and then attempted to rename
the rootfs-reserve volume to rootfs while running from the rootfs
volume.

root@localhost:/# ubirename /dev/ubi0 rootfs-reserve rootfs
UBI error: ubi_open_volume: cannot open device 0, volume 1, error -16
UBI error: rename_volumes: cannot open volume "rootfs", error -16
ubirename: error!: cannot rename volumes
           error 16 (Device or resource busy)

UBI DBG (pid 1786): ubi_cdev_ioctl: re-name volumes
UBI DBG (pid 1786): rename_volumes: will rename volume 0 from
"rootfs-reserve" to "rootfs"
UBI error: ubi_open_volume: cannot open device 0, volume 1, error -16
UBI error: rename_volumes: cannot open volume "rootfs", error -16

I also tried the reverse, renaming the running rootfs volume to something else.

root@localhost:/# ubirename /dev/ubi0 rootfs rootfsold
UBI error: ubi_open_volume: cannot open device 0, volume 1, error -16
UBI error: rename_volumes: cannot open volume 1, error -16
ubirename: error!: cannot rename volumes
           error 16 (Device or resource busy)
UBI DBG (pid 2600): ubi_cdev_ioctl: re-name volumes
UBI error: ubi_open_volume: cannot open device 0, volume 1, error -16
UBI error: rename_volumes: cannot open volume 1, error -16

I'm guessing I also need to hack the following in rename_volumes:
desc = ubi_open_volume_nm(ubi->ubi_num, re->new_name, UBI_EXCLUSIVE);

I'll try looking at it further tomorrow.

Thanks,
jayakumar
