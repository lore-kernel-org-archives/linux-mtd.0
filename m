Received: from mail-oi0-f52.google.com ([209.85.218.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfBuK-0001S9-7A
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 19:10:20 +0000
Received: by oibi136 with SMTP id i136so46992498oib.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 12:09:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+-FG62qXfW8nLqPbYrRMHNZmCJqiy36a_waKzRV=5=cYb7yTQ@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
 <CA+-FG62qXfW8nLqPbYrRMHNZmCJqiy36a_waKzRV=5=cYb7yTQ@mail.gmail.com>
Date: Thu, 24 Sep 2015 15:09:54 -0400
Message-ID: <CA+-FG63SsDXFDFe+6dZ9OwmFEx6LGwvmqb+2JN3rJggY1R-pbg@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Han,

I enabled CONFIG_CMA and also allocated 32MiB of contiguous memory. I
still see the UBIFS CRC errors. Please see below log. Is there need
for more contiguous memory?


Kernel Version
4.1.5

CMA memory allocation:

# dmesg |grep cma
[    0.000000] cma: dma_contiguous_reserve(limit ffffffff)
[    0.000000] cma: dma_contiguous_reserve: reserving 32 MiB for global area
[    0.000000] cma: cma_declare_contiguous(size 0x02000000, base
0x00000000, limit 0xffffffff alignment 0x00000000)
[    0.000000] cma: Reserved 32 MiB at 0x86000000
[    0.000000] Memory: 78992K/131072K available (5067K kernel code,
310K rwdata, 1632K rodata, 10788K init, 161K bss, 19312K reserved,
32768K)
[    0.165782] cma: cma_alloc(cma 81176874, count 64, align 6)
[    0.167256] cma: cma_alloc(): returned 85fa9000
[    2.120322] cma: cma_alloc(cma 81176874, count 96, align 7)
[    2.120632] cma: cma_alloc(): returned 85faa000
[    2.678134] cma: cma_alloc(cma 81176874, count 16, align 4)
[    2.678353] cma: cma_alloc(): returned 85fa9800
[    2.678731] cma: cma_alloc(cma 81176874, count 2, align 1)
[    2.678789] cma: cma_alloc(): returned 85fa9a00
[    2.892503] cma: cma_alloc(cma 81176874, count 16, align 4)
[    2.892690] cma: cma_alloc(): returned 85fa9c00
[    2.893066] cma: cma_alloc(cma 81176874, count 2, align 1)
[    2.893106] cma: cma_alloc(): returned 85fa9a40
[    3.140177] cma: cma_alloc(cma 81176874, count 1, align 0)
[    3.140348] cma: cma_alloc(): returned 85fa9a80
[    3.160821] cma: cma_alloc(cma 81176874, count 1, align 0)
[    3.160899] cma: cma_alloc(): returned 85fa9aa0
[    3.160949] cma: cma_alloc(cma 81176874, count 1, align 0)
[    3.160993] cma: cma_alloc(): returned 85fa9ac0
[    3.161043] cma: cma_alloc(cma 81176874, count 1, align 0)
[    3.161079] cma: cma_alloc(): returned 85fa9ae0
[    3.264187] cma: cma_alloc(cma 81176874, count 1, align 0)
[    3.265084] cma: cma_alloc(): returned 85fa9b00

# flash_erase /dev/mtd4 0 0
Erasing 64 Kibyte @ 0 --  0 % complete random: nonblocking pool is initialized
Erasing 64 Kibyte @ ff0000 -- 100 % complete
# ubiformat /dev/mtd4
ubiformat: mtd4 (nor), size 16777216 bytes (16.0 MiB), 256 eraseblocks
of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 255 -- 100 % complete
ubiformat: 256 eraseblocks are supposedly empty
ubiformat: formatting eraseblock 255 -- 100 % complete
# ls /dev/ubi*
/dev/ubi_ctrl
# ubiattach /dev/ubi_ctrl -m 4
ubi0: attaching mtd4
ubi0 error: check_corruption: PEB 1 contains corrupted VID header, and
the data does not contain all 0xFF
ubi0 error: check_corruption: this may be a non-UBI PEB or a severe
VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    5
        vol_id    2147479551
        lnum      1
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     0
        hdr_crc   00000000
Volume identifier header hexdump:
hexdump of PEB 1 offset 128, length 65408
ubi0: scanning is finished
ubi0 error: late_analysis: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 1
ubi0 warning: process_lvol: volume table copy #2 is corrupted
ubi0: volume table was restored
UBI assert failed in ubi_wl_init at 1593 (pid 1092)
CPU: 0 PID: 1092 Comm: ubiattach Not tainted 4.1.5-00005-gfbe5797-dirty #24
Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
Backtrace:
[<80013010>] (dump_backtrace) from [<8001328c>] (show_stack+0x20/0x24)
 r6:84379000 r5:81187944 r4:00000000 r3:00000000
[<8001326c>] (show_stack) from [<804f59c8>] (dump_stack+0x24/0x28)
[<804f59a4>] (dump_stack) from [<80341f3c>] (ubi_wl_init+0x474/0x500)
[<80341ac8>] (ubi_wl_init) from [<803439a0>] (ubi_attach+0x980/0x14cc)
 r10:00000000 r9:0000000c r8:839825e4 r7:81187948 r6:83982600 r5:84379000
 r4:00000000
[<80343020>] (ubi_attach) from [<803385fc>] (ubi_attach_mtd_dev+0x67c/0xc78)
 r10:00000000 r9:00000080 r8:83943c00 r7:84379000 r6:00000000 r5:83943c00
 r4:00010000
[<80337f80>] (ubi_attach_mtd_dev) from [<80339cbc>] (ctrl_cdev_ioctl+0xdc/0x1b0)
 r10:00000000 r9:83966000 r8:00000003 r7:40186f40 r6:83943c00 r5:7ec6ec18
 r4:40186f40
[<80339be0>] (ctrl_cdev_ioctl) from [<800f3d70>] (do_vfs_ioctl+0x3e8/0x598)
 r6:00000003 r5:80daa7e0 r4:7ec6ec18
[<800f3988>] (do_vfs_ioctl) from [<800f3f64>] (SyS_ioctl+0x44/0x6c)
 r9:83966000 r8:00000003 r7:40186f40 r6:841b6c00 r5:7ec6ec18 r4:841b6c00
[<800f3f20>] (SyS_ioctl) from [<8000f9e0>] (ret_fast_syscall+0x0/0x3c)
 r8:8000fb84 r7:00000036 r6:7ec6ef30 r5:00000003 r4:7ec6ec18 r3:00000000
ubi0: attached mtd4 (name "s25fl128s-1", size 16 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 1
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence
number: 56310929
ubi0: available PEBs: 251, total reserved PEBs: 4, PEBs reserved for
bad PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 1094
UBI device number 0, total 256 LEBs (16744448 bytes, 16.0 MiB),
available 251 LEBs (16417408 bytes, 15.7 MiB), LEB size 65408 bytes
(63.9 KiB)
# ./runtests.sh /dev/ubi0
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    -2
        alignment 1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    128
        alignment 1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 0
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment -1
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 65409
        bytes     16417408
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     -1
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     0
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: ubi_create_volume: not enough PEBs, only 251 available
ubi0 error: ubi_create_volume: 1 PEBs are corrupted and not used
ubi0 error: ubi_create_volume: cannot create volume 0, error -28
ubi0 error: ubi_create_volume: not enough PEBs, only 251 available
ubi0 error: ubi_create_volume: 1 PEBs are corrupted and not used
ubi0 error: ubi_create_volume: cannot create volume 0, error -28
ubi0 error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     65408
        vol_type  7
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
ubi0 error: ubi_create_volume: volume 0 already exists
ubi0 error: ubi_create_volume: cannot create volume 0, error -17
ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
ubi0 error: ubi_create_volume: cannot create volume 1, error -17
ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
ubi0 error: ubi_create_volume: cannot create volume 1, error -17
ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume -1, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
be 0x31a3fc87
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x128a46a1, must
be 0xcd7268d3
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x289fc43d, must
be 0x52d05ec4
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x64af72a9, must
be 0x29094548
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xb52cf17, must
be 0xa462eb86
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xb05c0752, must
be 0x5c6591d9
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x5e867f3f, must
be 0x8307ed4b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x10616357, must
be 0x9e4a9c63
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3daff125, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
be 0x31a3fc87
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x370eb97e, must
be 0x2290cddf
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x5be9a0a4, must
be 0xfa2dadae
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xab2a5866, must
be 0x44fe00de
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x5a1f62f9, must
be 0x3042bfee
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x85e8dc81, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xf81a1493, must
be 0x64f5e25c
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x51394cb8, must
be 0x4fe59aed
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x4a9846b7, must
be 0xe2e4869b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x4cb8afad, must
be 0xf6bba92c
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x561113d, must
be 0xf740079b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x85e8dc81, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3daff125, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x123309e4, must
be 0x43d56a5b
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd5fbf646, must
be 0xbeaba9d7
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3881f93f, must
be 0x52b97eed
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd1249226, must
be 0x6f3ddd30
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd817415f, must
be 0x2250c6e7
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8ef72d88, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x5ddc71c7, must
be 0x289607db
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x7a18673c, must
be 0x1a52b9c5
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd222b0ef, must
be 0xe97f372f
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x78d6ed30, must
be 0x8cbc412e
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xfd099d2e, must
be 0x700d1987
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x85e8dc81, must
be 0xbdcdff05
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x10616357, must
be 0x9e4a9c63
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x3346d2d8, must
be 0xa56e4089
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x58f2007, must
be 0xc450e944
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x78d8254f, must
be 0xb1cfb9cd
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
Running io_basic /dev/ubi0
[io_basic] test_basic():73: byte at 65184 is not 0xa5 but 0x55
Error: io_basic failed
FAILURE

Thanks,
Roshni

On Wed, Sep 23, 2015 at 2:28 PM, Roshni Shah <roshni.shah@timesys.com> wrote:
> Hi Han,
>
> Thank you very much for looking into this.
>
> I do not have CONFIG_CMA enabled. I did not know it was required. I
> can try a test with that enabled.
>
> I tried the older version of the fsl_quadspi driver yesterday and with
> that, I was able to mount the UBIFS.
>
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c?h=imx_3.14.28_1.0.0_ga&id=7a998cb82c4e6862eff95ff75d253717e8f5598d
>
> Is the CONFIG_CMA requirement applicable to later versions of the driver?
>
> Thanks,
> Roshni
>
> On Wed, Sep 23, 2015 at 2:21 PM, Han Xu <xhnjupt@gmail.com> wrote:
>> Have you enabled the CONFIG_CMA in kernel setting?
>>
>> On Fri, Sep 18, 2015 at 4:50 PM, Richard Weinberger <richard@nod.at> wrote:
>>> Am 18.09.2015 um 23:36 schrieb Roshni Shah:
>>>> Thanks. I tried 4.1 Kernel ran UBI tests and mounting the UBIFS on
>>>> Vybrid TWR. I see a different error, however corruptions & UBI test
>>>> failures still persist.
>>>>
>>>> Flash chip: s25fl128s (same as above).
>>>>
>>>> # uname -r
>>>> 4.1.5
>>>>
>>>> Following are the results:
>>>
>>> [...]
>>>
>>>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
>>>> be 0x31a3fc87
>>>> ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>>>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd1882123, must
>>>
>>> So, reading data using UBI does not work as expected.
>>> One thing MTD drivers sometimes get wrong is that UBI is using vmalloc'ed buffers
>>> and drivers cannot deal with that.
>>>
>>> Adding Han Xu, maybe he has an idea.
>>>
>>> Thanks,
>>> //richard
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
