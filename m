Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd1uU-0000n1-8Z
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 20:05:32 +0000
Received: by obbmp4 with SMTP id mp4so11275780obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 13:05:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55FC6BCB.1030901@nod.at>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
Date: Fri, 18 Sep 2015 16:05:09 -0400
Message-ID: <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Richard Weinberger <richard@nod.at>
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

Its not mainline. I am using this driver from Freescale, which has
support for Quad/DDR read and support for IMX6 SoloX.

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c?h=imx_3.14.28_1.0.0_ga

Mainline driver excludes the above support.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c

Also, even though the Freescale driver supports Quad / DDR read, I am
not using that for this test. My device tree just uses regular read.

Thanks,
Roshni



On Fri, Sep 18, 2015 at 3:53 PM, Richard Weinberger <richard@nod.at> wrote:
> Hi!
>
> Am 18.09.2015 um 21:45 schrieb Roshni Shah:
>> Yes, please find below results of both tests. I see errors in the UBI
>> tests. I appreciate your help with this issue. Thanks.
>
> [...]
>
>> Running rsvol /dev/ubi0
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xd1d39d36, must
>> be 0x31a3fc87
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xec2bae26, must
>> be 0xcd7268d3
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x302443de, must
>> be 0x52d05ec4
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc0173e12, must
>> be 0x29094548
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xdd0a1909, must
>> be 0xa462eb86
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x61a989ef, must
>> be 0x5c6591d9
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc923d217, must
>> be 0x8307ed4b
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x5a778138, must
>> be 0x9e4a9c63
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xe39cb667, must
>> be 0xa56e4089
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x59b5db22, must
>> be 0xb3537437
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xb23b0107, must
>> be 0x2290cddf
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x975422eb, must
>> be 0xfa2dadae
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf01ef932, must
>> be 0x44fe00de
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xdab5d980, must
>> be 0x3042bfee
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x4cab2221, must
>> be 0xbdcdff05
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x347a7d61, must
>> be 0x64f5e25c
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc60fa1bd, must
>> be 0x4fe59aed
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x24bfff41, must
>> be 0xe2e4869b
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xaf6418d, must
>> be 0xf6bba92c
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x4448013e, must
>> be 0xf740079b
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xede3647d, must
>> be 0xbdcdff05
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xe39cb667, must
>> be 0xa56e4089
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xcb351910, must
>> be 0x43d56a5b
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x405fc182, must
>> be 0xbeaba9d7
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x7e31330e, must
>> be 0xc81f265f
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x37fa9109, must
>> be 0x6f3ddd30
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf6406cf, must
>> be 0x2250c6e7
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x9b197c62, must
>> be 0xbdcdff05
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xd88b70a, must
>> be 0x289607db
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xfe89b916, must
>> be 0x1a52b9c5
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xabc02db, must
>> be 0xe97f372f
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xde60d71f, must
>> be 0x8cbc412e
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xbb9e7953, must
>> be 0x700d1987
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x3e056f37, must
>> be 0xbdcdff05
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x1f8a1532, must
>> be 0x9e4a9c63
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x6e278dbe, must
>> be 0xa56e4089
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x17d13a63, must
>> be 0xc450e944
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf28b00bb, must
>> be 0xb1cfb9cd
>> UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> Running io_basic /dev/ubi0
>> [io_basic] test_basic():73: byte at 65288 is not 0xa5 but 0
>
> Maybe UBI triggers an issue in your MTD driver.
> Is that driver mainline?
>
> Thanks,
> //richard
