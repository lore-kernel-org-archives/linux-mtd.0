Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7hkY-00086V-4p
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 12:26:51 +0000
Received: by mail-oi0-x231.google.com with SMTP id h4so47988133oib.3
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 05:26:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHwR_AXDx=Ypeo7mFCv=S0o7D8PVWr3P8EeYqd2x7FQT0cCRXQ@mail.gmail.com>
References: <CAHwR_AXDx=Ypeo7mFCv=S0o7D8PVWr3P8EeYqd2x7FQT0cCRXQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 8 May 2017 14:26:28 +0200
Message-ID: <CAFLxGvzgy4H2kE=MJux+axZs=grZa3bE=uRM7NbZrHWTGTqwxA@mail.gmail.com>
Subject: Re: Ubinize squashfs in ubiblock.
To: Jonas Rydow <jrydow@gmail.com>
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

Jonas,

On Mon, May 8, 2017 at 2:03 PM, Jonas Rydow <jrydow@gmail.com> wrote:
> I then tried to make a ubi image of the above with the following ini file:
> *****************************************
> [rootfs-volume]
> mode=ubi
> image=rootfs.sqfs
> vol_id=0
> vol_size=80MiB
> vol_type=dynamic
> vol_name=rootfs
>
> [rootfs-backup-volume]
> mode=ubi
> image=rootfs.sqfs
> vol_id=1
> vol_size=80MiB
> vol_type=dynamic
> vol_name=rootfs-backup
> *****************************************

ubinize does not care what volume data you flash. So, it should just work.
BTW: You can also use static volumes for read-only data.

> This is then ubinized with the following command:
>
> # ubinize -o rootfs.ubi -m 2048 -p 128KiB -s 512 -O 2048 ubinize.ini
>
> I previously used ubifs instead of squashfs and that worked correctly,
> which means that should have working parameters for the flash layout
> for in the ubinize command.
>
> I flash this to target:
> # flash_erase /dev/mtd10 0 0
> # nandwrite -p /dev/mtd10 rootfs.ubi

Why -p?

> When I try to attach:
> # ubiattach -p /dev/mtd10 -O 2048
> I get the following from the kernel:
> *****************************************
> [  241.198465] ubi0: default fastmap pool size: 95
> [  241.203056] ubi0: default fastmap WL pool size: 47
> [  241.208834] ubi0: attaching mtd10
> [  241.213988] omap2-nand 8000000.nand: uncorrectable bit-flips found
> [  241.220805] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 64 bytes from PEB 0:0, read only 64 bytes, retry

This error is long before squashfs and mounting. UBI is unable to read the
very first page. Can it be that the process of writing the image is broken?
Please double check.

-- 
Thanks,
//richard
