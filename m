Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZy1t-0003v3-4z
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 08:15:57 +0000
Received: by mail-vc0-f172.google.com with SMTP id lf12so359215vcb.17
 for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2014 01:15:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <542D8AD5.5030704@gmail.com>
References: <542D18B6.3020906@gmail.com>
	<542D8AD5.5030704@gmail.com>
Date: Fri, 3 Oct 2014 10:15:35 +0200
Message-ID: <CAFLxGvy7RkB8cz66rTkKh9t-03TAJhaSdc+=8abLDyz5E-7AqA@mail.gmail.com>
Subject: Re: UBI ECC errors on kernel 3.16.2
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Angelo Dureghello <angelo70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 2, 2014 at 7:26 PM, Angelo Dureghello <angelo70@gmail.com> wrote:
> Hi all,
>
> still some updated on these -74 EBADMSG i am receiving.
>
> well, seems the first ecc error is detected as soon as the kernel driver
> starts to
> read the ubifs (so file system) data part of the rootfs.ubi image.
>
> Before reading the file system data, so attaching, there is no ecc error
> detected at all.
> I added traces on some kernel file as nand_base.c.
>
>
> Ubi scanning / attaching  ...
>
> nand_read_page_hwecc_oob_first page    :3659
> nand_read_page_hwecc_oob_first correct p:c883d800 p[0]:p[1] 00:00 i:0
> eccpos[i]:06 ecc_code[i]:0b;
> nand_read_page_hwecc_oob_first correct p:c883da00 p[0]:p[1] 00:00 i:10
> eccpos[i]:16 ecc_code[i]:58;
> nand_read_page_hwecc_oob_first correct p:c883dc00 p[0]:p[1] 00:00 i:20
> eccpos[i]:26 ecc_code[i]:cf;
> nand_read_page_hwecc_oob_first correct p:c883de00 p[0]:p[1] 00:00 i:30
> eccpos[i]:36 ecc_code[i]:8b;
> nand_read_page_hwecc_oob_first page    :3660
> nand_read_page_hwecc_oob_first correct p:c883e000 p[0]:p[1] 00:00 i:0
> eccpos[i]:06 ecc_code[i]:9b;
> nand_read_page_hwecc_oob_first correct p:c883e200 p[0]:p[1] 00:00 i:10
> eccpos[i]:16 ecc_code[i]:f1;
> nand_read_page_hwecc_oob_first correct p:c883e400 p[0]:p[1] 00:00 i:20
> eccpos[i]:26 ecc_code[i]:26;
> nand_read_page_hwecc_oob_first correct p:c883e600 p[0]:p[1] ff:ff i:30
> eccpos[i]:36 ecc_code[i]:3f;
> UBI: volume 0 ("rootfs") re-sized from 205 to 456 LEBs
> UBI: attached mtd6 (name "rootfs", size 60 MiB) to ubi0
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number:
> 272604537
> UBI: available PEBs: 0, total reserved PEBs: 480, PEBs reserved for bad PEB
> handling: 20
> UBI: background thread "ubi_bgt0d" started, PID 995
> gpio-keys gpio-keys.0: Failed to request GPIO 126, error -517
> platform gpio-keys.0: Driver gpio-keys requests probe deferral
> omap_rtc da830-rtc: setting system clock to 2014-10-02 15:59:28 UTC
> (1412265568)
> ALSA device list:
>   No soundcards found.
>
> *** reading the file system here ***
>
> At page 3712 there is the first of the file system blocks
> 3712        3713           3714         3715
> EC HEADER  |  VID HEADER  |  fs data   |   fs data   etc
>                            ^
>                            ^
>
> nand_read_page_hwecc_oob_first page    :3714
> nand_read_page_hwecc_oob_first error   p:c7906000 p[0]:p[1] 31:18 i:0
> eccpos[i]:06 ecc_code[i]:1f;    <<< ERROR
> nand_read_page_hwecc_oob_first correct p:c7906200 p[0]:p[1] 00:00 i:10
> eccpos[i]:16 ecc_code[i]:00;
> nand_read_page_hwecc_oob_first correct p:c7906400 p[0]:p[1] 00:00 i:20
> eccpos[i]:26 ecc_code[i]:00;
> nand_read_page_hwecc_oob_first correct p:c7906600 p[0]:p[1] 00:00 i:30
> eccpos[i]:36 ecc_code[i]:00;
> ecc_failed !!
> nand_read_page_hwecc_oob_first page    :3715
> nand_read_page_hwecc_oob_first correct p:c7906800 p[0]:p[1] 00:00 i:0
> eccpos[i]:06 ecc_code[i]:00;
> nand_read_page_hwecc_oob_first correct p:c7906a00 p[0]:p[1] 00:00 i:10
> eccpos[i]:16 ecc_code[i]:00;
> nand_read_page_hwecc_oob_first correct p:c7906c00 p[0]:p[1] 00:00 i:20
> eccpos[i]:26 ecc_code[i]:00;
> nand_read_page_hwecc_oob_first correct p:c7906e00 p[0]:p[1] 00:00 i:30
> eccpos[i]:36 ecc_code[i]:00;
> UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes
> from PEB 2:4096, read only 4096 bytes, retry
>
>
> I am tracing the first 2 bytes only of each 512B eccblock.
> I verified, first 2 bytes with errors (0x31, 0x18) are sane, as in the
> rootfs.ubi file.
>
> So, i am supposing these errors are caused from a misalignment from u-boot
> and kernel davinci / nand drivers
> that calculate the ecc values.
>
> U-Boot 2014.07-03397-gab92542 (Oct 02 2014 - 16:14:43)
> Kernel is 3.16.2
>
> What do you think ?

Please boot the board via NFS/whatever to run mtd tests.
Before we search issues in UBI we need to make sure that you mtd did not break.

-- 
Thanks,
//richard
