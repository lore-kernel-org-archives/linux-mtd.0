Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjlcJ-0006L2-KJ
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 09:02:05 +0000
Date: Thu, 30 Oct 2014 10:01:33 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Karsten Jeppesen <kjp@skov.dk>
Subject: Re: libscan: warning!: inconsistent VID header offset
In-Reply-To: <ffdf47d689fb46dd8ca0d9ff1b3837a2@SERVER75.skov.com>
Message-ID: <alpine.DEB.2.02.1410300956160.14188@lnxricardw1.se.axis.com>
References: <ffdf47d689fb46dd8ca0d9ff1b3837a2@SERVER75.skov.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I don't know if I have a complete answer, but here are some comments.

On Thu, 30 Oct 2014, Karsten Jeppesen wrote:

> Can one of you set my head straight please?
> When using ubinize to create an image for ubiformat to flash, it goes south.
> Here is what I don't understand:
> - How come the LEB size is so small when using a simple ubiformat
> - Why does it differ from that calculated by ubinize? (ubiformat: 126976; ubinize: 130944)
> 
> Mtdinfo:
> mtd0
> Name:                           Rootfs1
> Type:                           nand
> Eraseblock size:                131072 bytes, 128.0 KiB
> Amount of eraseblocks:          4096 (536870912 bytes, 512.0 MiB)
> Minimum input/output unit size: 2048 bytes
> Sub-page size:                  2048 bytes
> OOB size:                       64 bytes
> Character device major/minor:   90:0
> Bad blocks are allowed:         true
> Device is writable:             true

>From this we can deduce that your flash has a page size of 2048, and that 
either the flash, the hardware i/f or the driver does not support subpage 
writes, since the 'Minimum input/output unit size' is also 2048 bytes.

This means that a LEB is PEB - 2*min_io_size = 131072-2*2048 = 126976 bytes.

> A non-image format says:
> # ubiformat /dev/mtd0
> ubiformat: mtd0 (nand), size 536870912 bytes (512.0 MiB), 4096 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 4095 -- 100 % complete
> ubiformat: 4092 eraseblocks have valid erase counter, mean value is 2
> ubiformat: 4 bad eraseblocks found, numbers: 4092, 4093, 4094, 4095
> ubiformat: formatting eraseblock 4095 -- 100 % complete
> 
> # ubiattach /dev/ubi_ctrl -m 0
> UBI: attaching mtd0 to ubi0
> UBI: scanning is finished
> UBI: attached mtd0 (name "Rootfs1", size 512 MiB) to ubi0
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096

This looks right. The data offset is two pages, and the LEB size is the 
PEB size minus two pages, as above.

> UBI: good PEBs: 4092, bad PEBs: 4, corrupted PEBs: 0
> UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 3/3, WL threshold: 4096, image sequence number: 1840488567
> UBI: available PEBs: 4012, total reserved PEBs: 80, PEBs reserved for bad PEB handling: 76
> UBI: background thread "ubi_bgt0d" started, PID 22714
> UBI device number 0, total 4092 LEBs (519585792 bytes, 495.5 MiB), available 4012 LEBs (509427712 bytes, 485.8 MiB), LEB size 126976 bytes (124.0 KiB)
> 
> 
> 
> Now with ubinize:
> The config file:
> ---
> # cat /tmp/test/ubinize.config
> [kjp]
> mode=ubi
> image=/tmp/test/ubifs.img
> vol_id=0
> vol_type=dynamic
> vol_size=25MiB
> vol_name=Rootfs1
> vol_flags=autoresize
> ---
> 
> Then we make the ubifs using the same low LEB size as the simple ubiformat chose.
> # mkfs.ubifs -v --root=/tmp/test/rfs --min-io-size=1 --leb-size=126976 --max-leb-cnt=243 -o /tmp/test/ubifs.img -x zlib
> mkfs.ubifs
>         root:         /tmp/test/rfs/
>         min_io_size:  8
>         leb_size:     126976
>         max_leb_cnt:  243
>         output:       /tmp/test/ubifs.img
>         jrn_size:     3682304
>         reserved:     0
>         compr:        zlib
>         keyhash:      r5
>         fanout:       8
>         orph_lebs:    1
>         super lebs:   1
>         master lebs:  2
>         log_lebs:     4
>         lpt_lebs:     2
>         orph_lebs:    1
>         main_lebs:    81
>         gc lebs:      1
>         index lebs:   2
>         leb_cnt:      91
>         UUID:         01A17D48-0594-4CF9-A456-7F3A6482ABAC
> Success!
> 
> So far so good. Now the ubinize:
> # ubinize -v -o /tmp/test/pack_rfs --min-io-size=1 --peb-size=131072 /tmp/test/ubinize.config

Why are you setting --min-io-size to 1 ? The result ios that ubinize 
assumes the minimum writable area is 1 byte, so it packs the 64 byte EC 
and VID headers together as 128 bytes, resulting in a LEB size of 
131072-128 = 130944 .

> ubinize: LEB size:                  130944
> ubinize: PEB size:                  131072
> ubinize: min. I/O size:             1
> ubinize: sub-page size:             1
> ubinize: VID offset:                64
> ubinize: data offset:               128
> ubinize: UBI image sequence number: 576492560
> ubinize: loaded the ini-file "/tmp/test/ubinize.config"
> ubinize: count of sections: 1
> 
> ubinize: parsing section "kjp"
> ubinize: mode=ubi, keep parsing
> ubinize: volume type: dynamic
> ubinize: volume ID: 0
> ubinize: volume size: 26214400 bytes
> ubinize: volume name: Rootfs1
> ubinize: volume alignment: 1
> ubinize: autoresize flags found
> ubinize: adding volume 0
> ubinize: writing volume 0
> ubinize: image file: /tmp/test/ubifs.img
> 
> ubinize: writing layout volume
> ubinize: done
> 
> 
> ***** Now how did the LEB change??????? Its back to the value I was actually suspecting, but not the one calculated by ubiformat.
> 
> The resulting image put on to the flash using ubiformat with option -f results in no errors, but attach fails miserably:
> # ubiattach /dev/ubi_ctrl -m 0
> UBI: attaching mtd0 to ubi0
> UBI error: validate_ec_hdr: bad VID header offset 64, expected 2048
> UBI error: validate_ec_hdr: bad EC header

I haven't looked at the code, but I can understand that UBI is confused, 
as the ubinized image min-io-size does not correspond to the actual flash.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
