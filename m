Received: from mail-oi0-f53.google.com ([209.85.218.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd1bl-0006gi-4E
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 19:46:11 +0000
Received: by oibi136 with SMTP id i136so32226162oib.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 12:45:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
Date: Fri, 18 Sep 2015 15:45:48 -0400
Message-ID: <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
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

Hi Richard,

Thanks for your quick response.

Yes, please find below results of both tests. I see errors in the UBI
tests. I appreciate your help with this issue. Thanks.

MTD tests:

# modprobe mtd_readtest dev=0

=================================================
mtd_readtest: MTD device: 0
mtd_readtest: not NAND flash, assume page size is 512 bytes.
mtd_readtest: MTD device size 16777216, eraseblock size 65536, page
size 512, count of eraseblocks 256, pages per eraseblock 128, OOB size
0
mtd_readtest: testing page read
mtd_readtest: finished
=================================================

# modprobe mtd_speedtest dev=0

=================================================
mtd_speedtest: MTD device: 0
mtd_speedtest: not NAND flash, assume page size is 512 bytes.
mtd_speedtest: MTD device size 16777216, eraseblock size 65536, page
size 512, count of eraseblocks 256, pages per eraseblock 128, OOB size
0
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 187 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 30453 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 186 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 9046 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 184 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 13687 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 483 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 384 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 383 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 382 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 382 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 382 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 381 KiB/s
mtd_speedtest: finished
=================================================

# modprobe mtd_stresstest dev=0

=================================================
mtd_stresstest: MTD device: 0
mtd_stresstest: not NAND flash, assume page size is 512 bytes.
mtd_stresstest: MTD device size 16777216, eraseblock size 65536, page
size 512, count of eraseblocks 256, pages per eraseblock 128, OOB size
0
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: 1024 operations done
mtd_stresstest: 2048 operations done
mtd_stresstest: 3072 operations done
mtd_stresstest: 4096 operations done
mtd_stresstest: 5120 operations done
mtd_stresstest: 6144 operations done
mtd_stresstest: 7168 operations done
mtd_stresstest: 8192 operations done
mtd_stresstest: 9216 operations done
mtd_stresstest: finished, 10000 operations done

# ./runtests.sh /dev/ubi0
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    -2
        alignment 1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    128
        alignment 1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 0
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment -1
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 65409
        bytes     16482816
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     -1
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     0
        vol_type  3
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: ubi_create_volume: not enough PEBs, only 252 available
UBI error: ubi_create_volume: cannot create volume 0, error -28
UBI error: ubi_create_volume: not enough PEBs, only 252 available
UBI error: ubi_create_volume: cannot create volume 0, error -28
UBI error: verify_mkvol_req: bad volume creation request
Volume creation request dump:
        vol_id    0
        alignment 1
        bytes     65408
        vol_type  7
        name_len  22
        1st 16 characters of name: mkvol_bad:test_m
UBI error: ubi_create_volume: volume 0 already exists
UBI error: ubi_create_volume: cannot create volume 0, error -17
UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
UBI error: ubi_create_volume: cannot create volume 1, error -17
UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
UBI error: ubi_create_volume: cannot create volume 1, error -17
UBI error: ubi_open_volume: cannot open device 0, volume 128, error -22
UBI error: ubi_open_volume: cannot open device 0, volume -1, error -22
UBI error: ubi_open_volume: cannot open device 0, volume 128, error -22
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -19
UBI error: ubi_open_volume: cannot open device 0, volume 0, error -19
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xd1d39d36, must
be 0x31a3fc87
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xec2bae26, must
be 0xcd7268d3
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x302443de, must
be 0x52d05ec4
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc0173e12, must
be 0x29094548
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xdd0a1909, must
be 0xa462eb86
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x61a989ef, must
be 0x5c6591d9
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc923d217, must
be 0x8307ed4b
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x5a778138, must
be 0x9e4a9c63
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xe39cb667, must
be 0xa56e4089
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x59b5db22, must
be 0xb3537437
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xb23b0107, must
be 0x2290cddf
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x975422eb, must
be 0xfa2dadae
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf01ef932, must
be 0x44fe00de
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xdab5d980, must
be 0x3042bfee
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x4cab2221, must
be 0xbdcdff05
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x347a7d61, must
be 0x64f5e25c
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xc60fa1bd, must
be 0x4fe59aed
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x24bfff41, must
be 0xe2e4869b
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xaf6418d, must
be 0xf6bba92c
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x4448013e, must
be 0xf740079b
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xede3647d, must
be 0xbdcdff05
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xe39cb667, must
be 0xa56e4089
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xcb351910, must
be 0x43d56a5b
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x405fc182, must
be 0xbeaba9d7
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x7e31330e, must
be 0xc81f265f
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x37fa9109, must
be 0x6f3ddd30
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf6406cf, must
be 0x2250c6e7
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x9b197c62, must
be 0xbdcdff05
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xd88b70a, must
be 0x289607db
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xfe89b916, must
be 0x1a52b9c5
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xabc02db, must
be 0xe97f372f
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xde60d71f, must
be 0x8cbc412e
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xbb9e7953, must
be 0x700d1987
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x3e056f37, must
be 0xbdcdff05
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x1f8a1532, must
be 0x9e4a9c63
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x6e278dbe, must
be 0xa56e4089
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0x17d13a63, must
be 0xc450e944
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
UBI warning: ubi_eba_read_leb: CRC error: calculated 0xf28b00bb, must
be 0xb1cfb9cd
UBI warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
Running io_basic /dev/ubi0
[io_basic] test_basic():73: byte at 65288 is not 0xa5 but 0
Error: io_basic failed
FAILURE

On Fri, Sep 18, 2015 at 1:23 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Fri, Sep 18, 2015 at 6:50 PM, Roshni <roshni.shah@timesys.com> wrote:
>> I have a custom board based on Freescale Vybrid Platform with a SPI-NOR
>> flash S25fl128s (16MiB). When using UBIFS on this flash part, I see
>> corruptions after UBIFS is mounted. See error/further below:
>>
>> What could be the cause of these corruptions? Any pointers / help will be
>> greatly appreciated.
>
> Well, does your board pass all MTD and UBI tests?
> MTD test from the kernel and UBI tests from the mtd-utils source package.
>
> --
> Thanks,
> //richard
