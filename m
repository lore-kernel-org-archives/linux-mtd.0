Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPdzg-0008OD-Tq
	for linux-mtd@lists.infradead.org; Sat, 11 Jul 2009 14:56:11 +0000
Subject: Re: UBIFS Question
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Laurent ." <sid6582@msn.com>
In-Reply-To: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
References: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 11 Jul 2009 17:55:58 +0300
Message-Id: <1247324158.20721.629.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Fixing loooooooong lines. Normal mailing list etiquette recommends
 people to make sure their e-mails have 78 characters line wrapping.
 And indeed, it is rather difficult to deal with non-wrapped e-mails]

Hi Laurent,

On Fri, 2009-07-10 at 11:43 -0700, Laurent . wrote:
> I am currently working on an embedded Linux project which has an ARM9 
> chip (NXP’s 180MHz LPC3131) with a NAND Flash controller which supports
> 5bits or 8bits HW ECC.
> I have a 256MB SLC NAND and run Linux 2.6.28.2

Sounds good, UBIFS should be appropriate for this, I think. However,
please, make sure you have fetched the latest UBI/UBIFS patches from
corresponding UBIFS back-port tree. There were many important bug-fixes.
See here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

> It is important to know the way my product is used, the user will
> always brutally power it off. It’s not like I can nicely do this,
> do a sync etc etc…

OK, should be fine for UBIFS. At least we tested this extensively on
NAND: http://www.linux-mtd.infradead.org/faq/ubifs.html#L_powercut

> I would have a few questions, hopefully you can answer them.

Will try.

> 1) The LPC3131 supports a USB DFU mode which basically allows an 
> end-user to upload a binary file into the chip's internal RAM and
> execute it.

Sounds like a very useful feature! :-)

> I have coded a small USB application that I upload via DFU which
> allows me to completely control the NAND flash from the PC.

Nice.

> My goal was to create an application used in the factory that programs
> a blank NAND Flash.

OK. BTW, I've written a small article which should help people
understand how UBI flashers should work, roughly:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_format

> It works :
> with respect of bad blocks, I burn the LPC313x boot-block, my own small
> uimage bootloader, the nand-bbt located at the end of the flash, the
> linux uimage, and a ubi image that I generated doing
> 
> mkfs.ubifs -x none -r lolo -m 2048 -e 129024 -c 2047 -o ubifs.img
> 
> ubinize.cfg is:
> 
> [ubifs]
> mode=ubi
> image=ubifs.img
> vol_id=0
> vol_size=200MiB
> vol_type=dynamic
> vol_name=rootfs
> vol_alignment=1
> vol_flags=autoresize
> 
> ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubinize.cfg

Ok.

> I am not using LZO compression because I have seen that mount time is
> faster without,

Take into account that if you have a power cut, then next mount will be
slower than normal, because UBIFS will have to replay the journal and
do recovery. So if mount time is critical, you may want to test it in
power-cut conditions.

VS compression. You could try to test this. The pages (4K pieces of
files) which do not compress well will anyway be left uncompressed.

> and since my file system contents are already compressed file, this
> does not buy me must room.
> But maybe I am missing something and LZO compression is really advised ?

No, if you mostly store mp3's, then no. The only thing is that you may
optimize UBIFS. ATM reading works like this: we allocate a buffer, we
read into it, then we uncompress data from this buffer into the final
buffer. If compression is not used, we copy data. You could get rid of
this unneeded copying.

> 2) I boot my embedded system ( I use OpenWrt )

To be frank I'm not aware of OpenWrt, but anyway :-)

> root@OpenWrt:/# ubiattach /dev/ubi_ctrl -m 5
> 
> UBI: attaching mtd5 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI: volume 0 ("rootfs") re-sized from 1626 to 1854 LEBs
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "lpc313x-rootfs"
> UBI: MTD device size:            235 MiB
> UBI: number of good PEBs:        1876
> UBI: number of bad PEBs:         6
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 1876
> UBI: number of PEBs reserved for bad PEB handling: 18
> UBI: max/mean erase counter: 1/0
> UBI: background thread "ubi_bgt0d" started, PID 2059
> UBI device number 0, total 1876 LEBs (242049024 bytes, 230.8 MiB), available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
> 
> root@OpenWrt:/# mount -t ubifs ubi0 /mnt
> 
> UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> UBIFS: file system size:   237791232 bytes (232218 KiB, 226 MiB, 1843 LEBs)
> UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: no compression
> UBIFS: reserved for root:  0 bytes (0 KiB)

Hmm, which version of mkfs.ubifs you use? I though the latest version
would create an image with a reserve for the root. Try
"mkfs.ubifs --version" please.

> root@OpenWrt:/# find /mnt
> 
> /mnt
> /mnt/img
> /mnt/img/00783_hongkongbynight_1920x1200.jpg
> /mnt/img/00678_vancouverdusk_1920x1200.jpg
... snip ...

> In /mnt/alphaflight I generate a small new.txt file with vi, which
> contains a few lines of characters.
> After saving, I immediately power-off brutally.
> I power-on again, mount, and the new.txt file is not there...

Right, because when you create the file, UBIFS will write to its write
buffer. The write-buffer is synchronized by timer after 5 sec. So when
the power is cut, you loos the file. But UBIFS guarantees you that the
other data will not be corrupted, and that you will be able to mount
and use the FS normally.

I think your vi calls 'sync()' when you exit? If not, you may amend it.
In this case, you should not loose anything.

> I recreate the file, I wait 20 seconds or so and power-off brutally.

OK. Below you'll see many URL. I'd recommend to read them if you
want to understand write-back behavior.

> I power-on again, mount and now I have:
> 
> -rw-r--r--    1 1000     1000          397 Dec 31  2002 indexOnline.html
> -rw-r--r--    1 root     root            0 Jan  1 00:00 new.txt
> -rw-r--r--    1 1000     1000          104 Dec 31  2002 obfuscAFL.bat
> 
> Size 0 ... I can understand that since I did not have time to sync.
> 
> It’s funny though that the file is present in the directory but the
> contents are not there ?

Yup. As Corenting said, this effect is explained here:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file

And I've just updated this FAQ section.

> If I do this programmatically, I presume I can force a sync
> after I close the file ?
> Is it safe to do so ? Would you know the C API to use to
> do a sync programmatically ?

This all is described here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback


> I generate a new2.txt wait one minute...  Reboot, the file
> new2.txt is still 0

This means the write-buffer reached the media, but the data
did not. You may read here about what UBIFS write-buffer is:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer

(I've just created that documentation section for you)

But one minute seems to be a lot. The default write-back interval
is usually 30 sec. Embedded systems tend to make is smaller. Glance
at /proc/sys/vm/dirty_expire_centisecs

See this section for some more information about this knob:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_wb_knobs

(I've also just created that documentation section for you)

> I generate a new3.txt wait two minutes... Reboot, now the
> file new3.txt has correct size !

Right. The dirty data were written back.

> So, I am wondering, is this background thread "ubi_bgt0d"
> responsible for automatically synching periodically ?

No. First of all "ubi_bgt0d" is UBI thread, not UBIFS. UBIFS thread
is "ubifs_bgt0_0" in your case. Probably you do not fully realize
that UBI and UBIFS are 2 different beasts. You may want to read
the introduction section for both:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_overview
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_overview

Anyway, I've also just created these 2 FAQ entries for you. They
shortly explain what UBI/UBIFS background threads do:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_bgt_thread
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_bgt_thread

> Is this interval adjustable  ?

The dirty timeout is adjustable via the
/proc/sys/vm/dirty_expire_centisecs file.

>  Do you recommend it ? Like every 10 seconds, isn’t it too much ?

Depends of the system. I'd recommend something like 5 seconds
for embedded systems.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
