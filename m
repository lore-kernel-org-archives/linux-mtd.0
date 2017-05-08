Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7ifc-0007pg-8u
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 13:25:49 +0000
Received: by mail-qk0-x236.google.com with SMTP id a72so35218915qkj.2
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 06:25:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzgy4H2kE=MJux+axZs=grZa3bE=uRM7NbZrHWTGTqwxA@mail.gmail.com>
References: <CAHwR_AXDx=Ypeo7mFCv=S0o7D8PVWr3P8EeYqd2x7FQT0cCRXQ@mail.gmail.com>
 <CAFLxGvzgy4H2kE=MJux+axZs=grZa3bE=uRM7NbZrHWTGTqwxA@mail.gmail.com>
From: Jonas Rydow <jrydow@gmail.com>
Date: Mon, 8 May 2017 15:25:25 +0200
Message-ID: <CAHwR_AWCQtjh88V-fXKLUA2sPG-y3jKM7PwbvEszG2xjAuBhXw@mail.gmail.com>
Subject: Re: Ubinize squashfs in ubiblock.
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,
thanks for the prompt response. You were right, there was a flaw in my
flashing. I had not detached properly from the mtd device.
running
# ubidetach -d 0
before staring flashing was the key. The attach was done on booting
for some reason even though the mtd10 was empty.

Regarding the nandwrite -p, you are right it is not needed.

Thanks again
Jonas

On Mon, May 8, 2017 at 2:26 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Jonas,
>
> On Mon, May 8, 2017 at 2:03 PM, Jonas Rydow <jrydow@gmail.com> wrote:
>> I then tried to make a ubi image of the above with the following ini file:
>> *****************************************
>> [rootfs-volume]
>> mode=ubi
>> image=rootfs.sqfs
>> vol_id=0
>> vol_size=80MiB
>> vol_type=dynamic
>> vol_name=rootfs
>>
>> [rootfs-backup-volume]
>> mode=ubi
>> image=rootfs.sqfs
>> vol_id=1
>> vol_size=80MiB
>> vol_type=dynamic
>> vol_name=rootfs-backup
>> *****************************************
>
> ubinize does not care what volume data you flash. So, it should just work.
> BTW: You can also use static volumes for read-only data.
>
>> This is then ubinized with the following command:
>>
>> # ubinize -o rootfs.ubi -m 2048 -p 128KiB -s 512 -O 2048 ubinize.ini
>>
>> I previously used ubifs instead of squashfs and that worked correctly,
>> which means that should have working parameters for the flash layout
>> for in the ubinize command.
>>
>> I flash this to target:
>> # flash_erase /dev/mtd10 0 0
>> # nandwrite -p /dev/mtd10 rootfs.ubi
>
> Why -p?
>
>> When I try to attach:
>> # ubiattach -p /dev/mtd10 -O 2048
>> I get the following from the kernel:
>> *****************************************
>> [  241.198465] ubi0: default fastmap pool size: 95
>> [  241.203056] ubi0: default fastmap WL pool size: 47
>> [  241.208834] ubi0: attaching mtd10
>> [  241.213988] omap2-nand 8000000.nand: uncorrectable bit-flips found
>> [  241.220805] ubi0 warning: ubi_io_read: error -74 (ECC error) while
>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>
> This error is long before squashfs and mounting. UBI is unable to read the
> very first page. Can it be that the process of writing the image is broken?
> Please double check.
>
> --
> Thanks,
> //richard
