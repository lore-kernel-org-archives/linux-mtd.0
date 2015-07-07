Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCQSG-0007KZ-Dn
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 10:50:25 +0000
Received: by obdbs4 with SMTP id bs4so125945504obd.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 03:50:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
References: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
Date: Tue, 7 Jul 2015 12:50:01 +0200
Message-ID: <CAFLxGvwLZ0YKX9f=QzAt-+AfgPgUiJMT2WfUBx3UMbX0z+mnGA@mail.gmail.com>
Subject: Re: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Egli, Samuel" <samuel.egli@siemens.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samuel,

On Mon, Jul 6, 2015 at 1:04 PM, Egli, Samuel <samuel.egli@siemens.com> wrote:
> Hi all,
>
> I have difficulties to understand why I get the following warning message
> at linux start up:
>
> ...
> [    4.777488] UBI warning: print_rsvd_warning: cannot reserve enough PEBs \
> for bad PEB handling, reserved 40, need 80
> ...
>
> My assumption is that if I don't specify the size of one volume
> UBI will choose the right size for the volume and reserve the
> right amount of PEBs for bad block handling. With 20/1024 set,vi I
> expect indeed to have 80 blocks reserved. But somehow this
> does not work. I observed that I get this warning when vol_flags
> is set to autoresize. In this case only 40 blocks get reserved.
> Using for all volumes the vol_size parameter and omitting
> autoresize, I can avoid this situation and I get my 80 blocks reserved.
>
> However, I don't understand why and it seems odd to me that
> autoresize would work this way.
>
> Can somebody confirm this observations or explain why this
> works like this. Maybe I'm also doing something wrong.
>
> See below how I generate the ubi image.
>
> General setup
> =============
> flash size: 4096 PEBs
> mtd partition size: 4065 PEBs
> number of volumes: 3
>
> Linux version:
> Linux dxr2 3.14.36-r2 #1 PREEMPT Tue Jun 30 10:26:05 CEST 2015 armv7l GNU/Linux
>
>
> Config 1
> ========
> 2 volumes with fixed size
> 1 volume has vol_flags=autoresize and vol_size not defined
>
> mkfs.ubifs -r ../rootfs/path -o rootfs.ubifs -F -m 2048 -e 126976 -c 4065
> mkfs.ubifs -r ../conf/path -o conf.ubifs -F -m 2048 -e 126976 -c 4065
> ubinize -o rootfs.ubi -m 2048 -p 131072 -O 2048 ubinize.cfg
>
> ubinize.cfg:
>  [rootfs_a]
>  mode=ubi
>  image=rootfs.ubifs
>  vol_id=0
>  vol_type=dynamic
>  vol_name=rootfs_a
>  vol_size=140MiB
>  [rootfs_b]
>  mode=ubi
>  vol_id=1
>  vol_type=dynamic
>  vol_name=rootfs_b
>  vol_size=140MiB
>  [configuration]
>  mode=ubi
>  image=configuration.ubifs
>  vol_id=2
>  vol_type=dynamic
>  vol_name=configuration
>  vol_flags=autoresize
>
> --> only 40 blocks get reserved vor bad PEB handling
>
> Config 2
> ========
> All 3 volumes with fixed size
>
> mkfs.ubifs -r ../rootfs/path -o rootfs.ubifs -F -m 2048 -e 126976 -c 4065
> mkfs.ubifs -r ../conf/path -o conf.ubifs -F -m 2048 -e 126976 -c 4065
>
> ubinize.cfg:
>  [rootfs_a]
>  mode=ubi
>  image=rootfs.ubifs
>  vol_id=0
>  vol_type=dynamic
>  vol_name=rootfs_a
>  vol_size=140MiB
>  [rootfs_b]
>  mode=ubi
>  vol_id=1
>  vol_type=dynamic
>  vol_name=rootfs_b
>  vol_size=140MiB
>  [configuration]
>  mode=ubi
>  image=configuration.ubifs
>  vol_id=2
>  vol_type=dynamic
>  vol_name=configuration
>  vol_size=341MiB

Something I did not notice yesternight, 140+140+341 is 621.
According to your logs the MTD partition is only 508MiB large.

-- 
Thanks,
//richard
