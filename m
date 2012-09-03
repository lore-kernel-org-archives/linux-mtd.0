Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8TwR-0001ex-El
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 10:31:41 +0000
Received: by ieje10 with SMTP id e10so3604322iej.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 03:31:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345810383.2848.304.camel@sauron.fi.intel.com>
References: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
 <1345810383.2848.304.camel@sauron.fi.intel.com>
Date: Mon, 3 Sep 2012 18:31:35 +0800
Message-ID: <CADqH6Vw4FtGjLF-oPVwg0YcwOoQxk90whB6YoYh4mt=1D2SGmw@mail.gmail.com>
Subject: Re: Problems after 2nd bootup with NAND and ubifs/ubi
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 8:13 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> ECC errors you see and the failing mtd tests mean you need to dig what's
> going on on the driver leve.

Hi Artem,

Thanks for your reply. I was finally able to resolve most of the
driver issues. The main problem turned out to be because the TI kernel
had issues in drivers/mtd/nand/omap2.c, where it forced ecc_opt to be
OMAP_ECC_HAMMING_CODE_HW, and it seems that this setting is buggy.
I've changed that to OMAP_ECC_HAMMING_CODE_DEFAULT and now everything
except for mtd_oobtest is passing (full log below). I'm able to flash
ubifs image on this and it appears to survive multiple boots. I have
not tested very thoroughly but it seems to be working.

Would I be correct in assuming that the mtd_oobtest failure can be
ignored since ubi does not use OOB?

Thanks,
jayakumar

root@android:/mtdtest # insmod mtd_speedtest.ko dev=4

=================================================
mtd_speedtest: MTD device: 4
mtd_speedtest: MTD device size 529006592, eraseblock size 131072, page
size 2048, count of eraseblocks 4036, pages per eraseblock 64, OOB
size 64
mtd_speedtest: scanning for bad eraseblocks
mtd_speedtest: scanned 4036 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 5185 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 10867 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 6290 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 10814 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 6306 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 10810 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 156595 KiB/s
mtd_speedtest: finished
=================================================

root@android:/mtdtest # insmod mtd_nandecctest.ko

mtd_nandecctest: ok - nand-ecc-256
mtd_nandecctest: ok - nand-ecc-512
root@android:/mtdtest # insmod mtd_stresstest.ko dev=4 count=10

=================================================
mtd_stresstest: MTD device: 4
mtd_stresstest: MTD device size 529006592, eraseblock size 131072,
page size 2048, count of eraseblocks 4036, pages per eraseblock 64,
OOB size 64
mtd_stresstest: scanning for bad eraseblocks
mtd_stresstest: scanned 4036 eraseblocks, 0 are bad
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: finished, 10 operations done
=================================================
root@android:/mtdtest # insmod mtd_readtest.ko dev=4

=================================================
mtd_readtest: MTD device: 4
mtd_readtest: MTD device size 529006592, eraseblock size 131072, page
size 2048, count of eraseblocks 4036, pages per eraseblock 64, OOB
size 64
mtd_readtest: scanning for bad eraseblocks
mtd_readtest: scanned 4036 eraseblocks, 0 are bad
mtd_readtest: testing page read
mtd_readtest: finished
=================================================
root@android:/mtdtest # insmod mtd_subpagetest.ko dev=4

=================================================
mtd_subpagetest: MTD device: 4
mtd_subpagetest: MTD device size 529006592, eraseblock size 131072,
page size 2048, subpage size 512, count of eraseblocks 0, pages per
eraseblock 0, OOB size 64
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 4036 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 4036 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
mtd_subpagetest: written up to eraseblock 1792
mtd_subpagetest: written up to eraseblock 2048
mtd_subpagetest: written up to eraseblock 2304
mtd_subpagetest: written up to eraseblock 2560
mtd_subpagetest: written up to eraseblock 2816
mtd_subpagetest: written up to eraseblock 3072
mtd_subpagetest: written up to eraseblock 3328
mtd_subpagetest: written up to eraseblock 3584
mtd_subpagetest: written up to eraseblock 3840
mtd_subpagetest: written 4036 eraseblocks
mtd_subpagetest: verifying all eraseblocks
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: verified up to eraseblock 2048
mtd_subpagetest: verified up to eraseblock 2304
mtd_subpagetest: verified up to eraseblock 2560
mtd_subpagetest: verified up to eraseblock 2816
mtd_subpagetest: verified up to eraseblock 3072
mtd_subpagetest: verified up to eraseblock 3328
mtd_subpagetest: verified up to eraseblock 3584
mtd_subpagetest: verified up to eraseblock 3840
mtd_subpagetest: verified 4036 eraseblocks
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 4036 eraseblocks
mtd_subpagetest: verifying all eraseblocks for 0xff
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: verified up to eraseblock 2048
mtd_subpagetest: verified up to eraseblock 2304
mtd_subpagetest: verified up to eraseblock 2560
mtd_subpagetest: verified up to eraseblock 2816
mtd_subpagetest: verified up to eraseblock 3072
mtd_subpagetest: verified up to eraseblock 3328
mtd_subpagetest: verified up to eraseblock 3584
mtd_subpagetest: verified up to eraseblock 3840
mtd_subpagetest: verified 4036 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
mtd_subpagetest: written up to eraseblock 1792
mtd_subpagetest: written up to eraseblock 2048
mtd_subpagetest: written up to eraseblock 2304
mtd_subpagetest: written up to eraseblock 2560
mtd_subpagetest: written up to eraseblock 2816
mtd_subpagetest: written up to eraseblock 3072
mtd_subpagetest: written up to eraseblock 3328
mtd_subpagetest: written up to eraseblock 3584
mtd_subpagetest: written up to eraseblock 3840
mtd_subpagetest: written 4036 eraseblocks
mtd_subpagetest: verifying all eraseblocks
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: ECC correction at 0x24e0000
mtd_subpagetest: ECC correction at 0x2760000
mtd_subpagetest: ECC correction at 0x2bc0000
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: ECC correction at 0x6080000
mtd_subpagetest: ECC correction at 0x6140000
mtd_subpagetest: ECC correction at 0x7620000
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: ECC correction at 0x81c0000
mtd_subpagetest: ECC correction at 0x9040200
mtd_subpagetest: ECC correction at 0x94c0200
mtd_subpagetest: ECC correction at 0x9740200
mtd_subpagetest: ECC correction at 0x9a60200
mtd_subpagetest: ECC correction at 0x9c40200
mtd_subpagetest: ECC correction at 0x9de0000
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: ECC correction at 0xa4c0000
mtd_subpagetest: ECC correction at 0xa940000
mtd_subpagetest: ECC correction at 0xabc0000
mtd_subpagetest: ECC correction at 0xad40000
mtd_subpagetest: ECC correction at 0xbd80000
mtd_subpagetest: ECC correction at 0xbfc0000
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: ECC correction at 0xc200000
mtd_subpagetest: ECC correction at 0xc586e00
mtd_subpagetest: ECC correction at 0xd49ce00
mtd_subpagetest: ECC correction at 0xde40200
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: ECC correction at 0xe5c0000
mtd_subpagetest: ECC correction at 0xe8e0000
mtd_subpagetest: ECC correction at 0xead7c00
mtd_subpagetest: ECC correction at 0xf1c0000
mtd_subpagetest: ECC correction at 0xf320200
mtd_subpagetest: verified up to eraseblock 2048
mtd_subpagetest: ECC correction at 0x10860000
mtd_subpagetest: ECC correction at 0x115c0000
mtd_subpagetest: ECC correction at 0x11bc0200
mtd_subpagetest: verified up to eraseblock 2304
mtd_subpagetest: ECC correction at 0x12449c00
mtd_subpagetest: ECC correction at 0x12560000
mtd_subpagetest: ECC correction at 0x13fc0200
mtd_subpagetest: verified up to eraseblock 2560
mtd_subpagetest: ECC correction at 0x15b40000
mtd_subpagetest: verified up to eraseblock 2816
mtd_subpagetest: ECC correction at 0x17040000
mtd_subpagetest: ECC correction at 0x17340000
mtd_subpagetest: ECC correction at 0x178e0000
mtd_subpagetest: ECC correction at 0x17b80000
mtd_subpagetest: verified up to eraseblock 3072
mtd_subpagetest: ECC correction at 0x18260200
mtd_subpagetest: ECC correction at 0x18f40000
mtd_subpagetest: verified up to eraseblock 3328
mtd_subpagetest: ECC correction at 0x1a0c0000
mtd_subpagetest: ECC correction at 0x1a220000
mtd_subpagetest: ECC correction at 0x1a40f000
mtd_subpagetest: ECC correction at 0x1a960200
mtd_subpagetest: ECC correction at 0x1b840000
mtd_subpagetest: verified up to eraseblock 3584
mtd_subpagetest: ECC correction at 0x1d100200
mtd_subpagetest: ECC correction at 0x1d640000
mtd_subpagetest: verified up to eraseblock 3840
mtd_subpagetest: ECC correction at 0x1e1c0000
mtd_subpagetest: verified 4036 eraseblocks
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 4036 eraseblocks
mtd_subpagetest: verifying all eraseblocks for 0xff
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: verified up to eraseblock 2048
mtd_subpagetest: verified up to eraseblock 2304
mtd_subpagetest: verified up to eraseblock 2560
mtd_subpagetest: verified up to eraseblock 2816
mtd_subpagetest: verified up to eraseblock 3072
mtd_subpagetest: verified up to eraseblock 3328
mtd_subpagetest: verified up to eraseblock 3584
mtd_subpagetest: verified up to eraseblock 3840
mtd_subpagetest: verified 4036 eraseblocks
mtd_subpagetest: finished with 0 errors
=================================================
root@android:/mtdtest # insmod mtd_pagetest.ko dev=4

=================================================
mtd_pagetest: MTD device: 4
mtd_pagetest: MTD device size 529006592, eraseblock size 131072, page
size 2048, count of eraseblocks 4036, pages per eraseblock 64, OOB
size 64
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 4036 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 4036 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: written up to eraseblock 256
mtd_pagetest: written up to eraseblock 512
mtd_pagetest: written up to eraseblock 768
mtd_pagetest: written up to eraseblock 1024
mtd_pagetest: written up to eraseblock 1280
mtd_pagetest: written up to eraseblock 1536
mtd_pagetest: written up to eraseblock 1792
mtd_pagetest: written up to eraseblock 2048
mtd_pagetest: written up to eraseblock 2304
mtd_pagetest: written up to eraseblock 2560
mtd_pagetest: written up to eraseblock 2816
mtd_pagetest: written up to eraseblock 3072
mtd_pagetest: written up to eraseblock 3328
mtd_pagetest: written up to eraseblock 3584
mtd_pagetest: written up to eraseblock 3840
mtd_pagetest: written 4036 eraseblocks
mtd_pagetest: verifying all eraseblocks
mtd_pagetest: verified up to eraseblock 0
mtd_pagetest: verified up to eraseblock 256
mtd_pagetest: verified up to eraseblock 512
mtd_pagetest: verified up to eraseblock 768
mtd_pagetest: verified up to eraseblock 1024
mtd_pagetest: verified up to eraseblock 1280
mtd_pagetest: verified up to eraseblock 1536
mtd_pagetest: verified up to eraseblock 1792
mtd_pagetest: verified up to eraseblock 2048
mtd_pagetest: verified up to eraseblock 2304
mtd_pagetest: verified up to eraseblock 2560
mtd_pagetest: verified up to eraseblock 2816
mtd_pagetest: verified up to eraseblock 3072
mtd_pagetest: verified up to eraseblock 3328
mtd_pagetest: verified up to eraseblock 3584
mtd_pagetest: verified up to eraseblock 3840
mtd_pagetest: verified 4036 eraseblocks
mtd_pagetest: crosstest
mtd_pagetest: reading page at 0x0
mtd_pagetest: reading page at 0x1f87f800
mtd_pagetest: reading page at 0x0
mtd_pagetest: verifying pages read at 0x0 match
mtd_pagetest: crosstest ok
mtd_pagetest: erasecrosstest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 4035
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasecrosstest ok
mtd_pagetest: erasetest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0 is all 0xff
mtd_pagetest: erasetest ok
mtd_pagetest: finished with 0 errors
=================================================
root@android:/mtdtest # insmod mtd_oobtest.ko dev=4

=================================================
mtd_oobtest: MTD device: 4
mtd_oobtest: MTD device size 529006592, eraseblock size 131072, page
size 2048, count of eraseblocks 4036, pages per eraseblock 64, OOB
size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 4036 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 4036 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 2048
mtd_oobtest: written up to eraseblock 2304
mtd_oobtest: written up to eraseblock 2560
mtd_oobtest: written up to eraseblock 2816
mtd_oobtest: written up to eraseblock 3072
mtd_oobtest: written up to eraseblock 3328
mtd_oobtest: written up to eraseblock 3584
mtd_oobtest: written up to eraseblock 3840
mtd_oobtest: written 4036 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: verified up to eraseblock 3840
mtd_oobtest: verified 4036 eraseblocks
mtd_oobtest: test 2 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 4036 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 2048
mtd_oobtest: written up to eraseblock 2304
mtd_oobtest: written up to eraseblock 2560
mtd_oobtest: written up to eraseblock 2816
mtd_oobtest: written up to eraseblock 3072
mtd_oobtest: written up to eraseblock 3328
mtd_oobtest: written up to eraseblock 3584
mtd_oobtest: written up to eraseblock 3840
mtd_oobtest: written 4036 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: error: verify failed at 0xc60000
mtd_oobtest: error: verify failed at 0x15c0000
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: error: verify failed at 0x20a0000
mtd_oobtest: error: verify failed at 0x2cc0000
mtd_oobtest: error: verify failed at 0x2f00000
mtd_oobtest: error: verify failed at 0x3260000
mtd_oobtest: error: verify failed at 0x3a40000
mtd_oobtest: error: verify failed at 0x3e20000
mtd_oobtest: error: verify failed at 0x3e80000
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: error: verify failed at 0x49e0000
mtd_oobtest: error: verify failed at 0x4fc0000
mtd_oobtest: error: verify failed at 0x54a0000
mtd_oobtest: error: verify failed at 0x5800000
mtd_oobtest: error: verify failed at 0x59a0000
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: error: verify failed at 0x7260000
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: error: verify failed at 0x82e0000
mtd_oobtest: error: verify failed at 0x93a0000
mtd_oobtest: error: verify failed at 0x9820000
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: error: verify failed at 0xa1a0000
mtd_oobtest: error: verify failed at 0xaaa0000
mtd_oobtest: error: verify failed at 0xbac0000
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: error: verify failed at 0xc1a0000
mtd_oobtest: error: verify failed at 0xc660000
mtd_oobtest: error: verify failed at 0xd420000
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: error: verify failed at 0xe1a0000
mtd_oobtest: error: verify failed at 0xfcc0000
mtd_oobtest: error: verify failed at 0xfea0000
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: error: verify failed at 0x105e0000
mtd_oobtest: error: verify failed at 0x118a0000
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: error: verify failed at 0x12180000
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: error: verify failed at 0x14880000
mtd_oobtest: error: verify failed at 0x14b80000
mtd_oobtest: error: verify failed at 0x14ca0000
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: error: verify failed at 0x16520000
mtd_oobtest: error: verify failed at 0x16780000
mtd_oobtest: error: verify failed at 0x16e20000
mtd_oobtest: error: verify failed at 0x17520000
mtd_oobtest: error: verify failed at 0x178e0000
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: error: verify failed at 0x190c0000
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: error: verify failed at 0x1a160000
mtd_oobtest: error: verify failed at 0x1af60000
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: error: verify failed at 0x1d700000
mtd_oobtest: error: verify failed at 0x1dda0000
mtd_oobtest: error: verify failed at 0x1de20000
mtd_oobtest: verified up to eraseblock 3840
mtd_oobtest: error: verify failed at 0x1ee20000
mtd_oobtest: error: verify failed at 0x1f1c0000
mtd_oobtest: verified 4036 eraseblocks
mtd_oobtest: test 3 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 4036 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 2048
mtd_oobtest: written up to eraseblock 2304
mtd_oobtest: written up to eraseblock 2560
mtd_oobtest: written up to eraseblock 2816
mtd_oobtest: written up to eraseblock 3072
mtd_oobtest: written up to eraseblock 3328
mtd_oobtest: written up to eraseblock 3584
mtd_oobtest: written up to eraseblock 3840
mtd_oobtest: written 4036 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: error: verify failed at 0x172eb000
mtd_oobtest: error: verify failed at 0x172eb000
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: verified up to eraseblock 3840
mtd_oobtest: verified 4036 eraseblocks
mtd_oobtest: test 4 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 4036 eraseblocks
mtd_oobtest: attempting to start write past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to start read past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: test 5 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 4036 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 512
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 768
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1024
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1280
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1536
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 1792
mtd_oobtest: written up to eraseblock 2048
mtd_oobtest: written up to eraseblock 2048
mtd_oobtest: written up to eraseblock 2304
mtd_oobtest: written up to eraseblock 2304
mtd_oobtest: written up to eraseblock 2560
mtd_oobtest: written up to eraseblock 2560
mtd_oobtest: written up to eraseblock 2816
mtd_oobtest: written up to eraseblock 2816
mtd_oobtest: written up to eraseblock 3072
mtd_oobtest: written up to eraseblock 3072
mtd_oobtest: written up to eraseblock 3328
mtd_oobtest: written up to eraseblock 3328
mtd_oobtest: written up to eraseblock 3584
mtd_oobtest: written up to eraseblock 3584
mtd_oobtest: written up to eraseblock 3840
mtd_oobtest: written up to eraseblock 3840
mtd_oobtest: written 4035 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: verified up to eraseblock 3840
mtd_oobtest: verified 4035 eraseblocks
mtd_oobtest: finished with 48 errors
=================================================
