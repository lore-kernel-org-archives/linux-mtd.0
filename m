Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb4Is-0004EO-Vq
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 09:10:04 +0000
Received: by mail-wg0-f42.google.com with SMTP id z12so5925406wgg.1
 for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2014 02:09:40 -0700 (PDT)
Message-ID: <54325A9D.5060604@gmail.com>
Date: Mon, 06 Oct 2014 11:02:21 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI ECC errors on kernel 3.16.2
References: <542D18B6.3020906@gmail.com> <542D8AD5.5030704@gmail.com>
 <61e344ea352a9e20fef952b44b18ea74@pek-sem.com>
In-Reply-To: <61e344ea352a9e20fef952b44b18ea74@pek-sem.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: richard.weinberger@gmail.com, pekon@pek-sem.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear,

many thakns for your support. Hope i can contribute to help you also in the
future, i will try to post some useful patch someday.

I tried to run mtd tests, but for some other issues encoutered on 
running this
kernel version (PHY link not detected) i couldn't mount the NFS for 
testing,
and couldn't execute them.So i had to fight inside the mtd and mtd/nand
folders to find out the reason of this.


The following temporary fix into nand_base.c seems to solve my issue.

          if (!ecc->write_oob)
              ecc->write_oob = nand_write_oob_std;
          /* Angelo
           * temporary patch, no subpage wrote allowed for ipam390,
           * must comment them out, or ECC layout get broken.
           */
!        //if (!ecc->read_subpage)
!        //    ecc->read_subpage = nand_read_subpage;
!        //if (!ecc->write_subpage)
!        //    ecc->write_subpage = nand_write_subpage_hwecc;

It is connected to the fact that the driver want to use "subpage" write 
from
some kernel versions, since this binding was not there into 3.5.1.

Maybe you can now clarify some mistery i still cannot understand:
1) My flash does not support subpages write (page 2048, no subpages 
support from
the datasheet), so i set subpage and max/io size to 2048. But sill UBI 
attach
shows the 512 supbage as available. Upon this nand flash limit, is also the
davinci-nand (aemif HW) controller able to support subpages write ? If 
yes, is it
also the driver for it able to support subpages write ? From my 
understanding, it
was not, and now it should.

2) So how does it works this subpages-write support if the nand flash 
does not
supports subpages write ?

Thanks

Regards,
Angelo


On 06/10/2014 06:49, Pekon Gupta wrote:
> Hi Angelo,
>
>
> On 02-10-2014, Angelo Dureghello wrote:
>> Hi all,
>>
>> still some updated on these -74 EBADMSG i am receiving.
>>
>> well, seems the first ecc error is detected as soon as the kernel
>> driver starts to
>> read the ubifs (so file system) data part of the rootfs.ubi image.
>>
>> Before reading the file system data, so attaching, there is no ecc
>> error detected at all.
>> I added traces on some kernel file as nand_base.c.
>>
>>
>> Ubi scanning / attaching  ...
>>
>> nand_read_page_hwecc_oob_first page    :3659
>> nand_read_page_hwecc_oob_first correct p:c883d800 p[0]:p[1] 00:00 i:0
>> eccpos[i]:06 ecc_code[i]:0b;
>> nand_read_page_hwecc_oob_first correct p:c883da00 p[0]:p[1] 00:00
>> i:10 eccpos[i]:16 ecc_code[i]:58;
>> nand_read_page_hwecc_oob_first correct p:c883dc00 p[0]:p[1] 00:00
>> i:20 eccpos[i]:26 ecc_code[i]:cf;
>> nand_read_page_hwecc_oob_first correct p:c883de00 p[0]:p[1] 00:00
>> i:30 eccpos[i]:36 ecc_code[i]:8b;
>> nand_read_page_hwecc_oob_first page    :3660
>> nand_read_page_hwecc_oob_first correct p:c883e000 p[0]:p[1] 00:00 i:0
>> eccpos[i]:06 ecc_code[i]:9b;
>> nand_read_page_hwecc_oob_first correct p:c883e200 p[0]:p[1] 00:00
>> i:10 eccpos[i]:16 ecc_code[i]:f1;
>> nand_read_page_hwecc_oob_first correct p:c883e400 p[0]:p[1] 00:00
>> i:20 eccpos[i]:26 ecc_code[i]:26;
>> nand_read_page_hwecc_oob_first correct p:c883e600 p[0]:p[1] ff:ff
>> i:30 eccpos[i]:36 ecc_code[i]:3f;
>> UBI: volume 0 ("rootfs") re-sized from 205 to 456 LEBs
>> UBI: attached mtd6 (name "rootfs", size 60 MiB) to ubi0
>> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
>> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
>> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>> UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence
>> number: 272604537
>> UBI: available PEBs: 0, total reserved PEBs: 480, PEBs reserved for
>> bad PEB handling: 20
>> UBI: background thread "ubi_bgt0d" started, PID 995
>> gpio-keys gpio-keys.0: Failed to request GPIO 126, error -517
>> platform gpio-keys.0: Driver gpio-keys requests probe deferral
>> omap_rtc da830-rtc: setting system clock to 2014-10-02 15:59:28 UTC
>> (1412265568)
>> ALSA device list:
>>   No soundcards found.
>>
>> *** reading the file system here ***
>>
>> At page 3712 there is the first of the file system blocks
>> 3712        3713           3714         3715
>> EC HEADER  |  VID HEADER  |  fs data   |   fs data   etc
>>                            ^
>>                            ^
>>
>> nand_read_page_hwecc_oob_first page    :3714
>> nand_read_page_hwecc_oob_first error   p:c7906000 p[0]:p[1] 31:18 i:0
>> eccpos[i]:06 ecc_code[i]:1f;    <<< ERROR
>> nand_read_page_hwecc_oob_first correct p:c7906200 p[0]:p[1] 00:00
>> i:10 eccpos[i]:16 ecc_code[i]:00;
>> nand_read_page_hwecc_oob_first correct p:c7906400 p[0]:p[1] 00:00
>> i:20 eccpos[i]:26 ecc_code[i]:00;
>> nand_read_page_hwecc_oob_first correct p:c7906600 p[0]:p[1] 00:00
>> i:30 eccpos[i]:36 ecc_code[i]:00;
>> ecc_failed !!
>> nand_read_page_hwecc_oob_first page    :3715
>> nand_read_page_hwecc_oob_first correct p:c7906800 p[0]:p[1] 00:00 i:0
>> eccpos[i]:06 ecc_code[i]:00;
>> nand_read_page_hwecc_oob_first correct p:c7906a00 p[0]:p[1] 00:00
>> i:10 eccpos[i]:16 ecc_code[i]:00;
>> nand_read_page_hwecc_oob_first correct p:c7906c00 p[0]:p[1] 00:00
>> i:20 eccpos[i]:26 ecc_code[i]:00;
>> nand_read_page_hwecc_oob_first correct p:c7906e00 p[0]:p[1] 00:00
>> i:30 eccpos[i]:36 ecc_code[i]:00;
>> UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096
>> bytes from PEB 2:4096, read only 4096 bytes, retry
>>
>>
>> I am tracing the first 2 bytes only of each 512B eccblock.
>> I verified, first 2 bytes with errors (0x31, 0x18) are sane, as in
>> the rootfs.ubi file.
>>
>> So, i am supposing these errors are caused from a misalignment from
>> u-boot and kernel davinci / nand drivers
>> that calculate the ecc values.
>>
>> U-Boot 2014.07-03397-gab92542 (Oct 02 2014 - 16:14:43)
>> Kernel is 3.16.2
>>
>> What do you think ?
>>
>> Regards angelo
>>
> Yes, this seems to be mis-alignment in ecc-scheme (or layout)
>
> + rogerq@ti.com
>
> Also following User-Guides for *OMAP* processors (not davinci)
> may help you narrow down the cause.
>
>
> with regards, pekon
>
> [1] 
> http://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide#ECC_schemes_support
> [2] http://processors.wiki.ti.com/index.php/UBIFS_Support
>
>
> ------------------------
> Powered by BigRock.com
>
