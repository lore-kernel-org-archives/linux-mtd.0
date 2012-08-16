Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1sy7-0004Rd-17
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 05:50:08 +0000
Received: by yenq9 with SMTP id q9so2742124yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2012 22:50:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
References: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
Date: Thu, 16 Aug 2012 13:50:05 +0800
Message-ID: <CADqH6VzcvvR2q=OB_pebk+drmCaoq54MdRas352Rw1=RJbJA=Q@mail.gmail.com>
Subject: Re: Problems after 2nd bootup with NAND and ubifs/ubi
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 15, 2012 at 3:19 PM, Jaya Kumar <jayakumar.lkml@gmail.com> wrote:
> - run the MTD tests to validate your flash

I have errors with pagetest, oobtest, subpagetest . The other tests,
speedtest, stresstest, readtest, nandecctest, are passing.

root@android:/mtdtest # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "X-Loader"
mtd1: 001e0000 00020000 "U-Boot"
mtd2: 00020000 00020000 "U-Boot Env"
mtd3: 00500000 00020000 "Kernel"
mtd4: 1f880000 00020000 "File System"

root@android:/mtdtest # insmod mtd_speedtest.ko dev=4

=================================================
mtd_speedtest: MTD device: 4
mtd_speedtest: MTD device size 529006592, eraseblock size 131072, page
size 2048, count of eraseblocks 4036, pages per eraseblock 64, OOB
size 64
mtd_speedtest: scanning for bad eraseblocks
mtd_speedtest: scanned 4036 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 6376 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 11027 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 6355 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 10983 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 6364 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 11008 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 156785 KiB/s
mtd_speedtest: finished
=================================================


root@localhost:/mtdtest# insmod mtd_nandecctest.ko
mtd_nandecctest: ok - nand-ecc-256
mtd_nandecctest: ok - nand-ecc-512


root@localhost:/mtdtest# insmod ./mtd_stresstest.ko dev=4 count=100

=================================================
mtd_stresstest: MTD device: 4
mtd_stresstest: MTD device size 529006592, eraseblock size 131072,
page size 2048, count of eraseblocks 4036, pages per eraseblock 64,
OOB size 64
mtd_stresstest: scanning for bad eraseblocks
mtd_stresstest: scanned 4036 eraseblocks, 0 are bad
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: finished, 100 operations done
=================================================


root@localhost:/mtdtest# insmod ./mtd_readtest.ko dev=4

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


root@localhost:/mtdtest# insmod ./mtd_pagetest.ko dev=4

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
mtd_pagetest: error: verify failed at 0x2232000
mtd_pagetest: error: verify failed at 0x2232800
mtd_pagetest: verified up to eraseblock 512
mtd_pagetest: verified up to eraseblock 768
mtd_pagetest: error: verify failed at 0x6d3f800
mtd_pagetest: error: verify failed at 0x6d40000
mtd_pagetest: error: verify failed at 0x78bf800
mtd_pagetest: error: verify failed at 0x78c0000
mtd_pagetest: error: verify failed at 0x7a1f800
mtd_pagetest: error: verify failed at 0x7a20000
mtd_pagetest: verified up to eraseblock 1024
mtd_pagetest: error: verify failed at 0x861f800
mtd_pagetest: error: verify failed at 0x8620000
mtd_pagetest: error: read failed at 0x8dbf800
mtd_pagetest: error -74 occurred
=================================================
insmod: can't insert './mtd_pagetest.ko': Bad message


root@localhost:/mtdtest# insmod ./mtd_oobtest.ko  dev=4

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
mtd_oobtest: error: verify failed at 0x1880000
mtd_oobtest: error: verify failed at 0x1a20000
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: error: verify failed at 0x2700000
mtd_oobtest: error: verify failed at 0x2ea0000
mtd_oobtest: error: verify failed at 0x3100000
mtd_oobtest: verified up to eraseblock 512
mtd_oobtest: error: verify failed at 0x4260000
mtd_oobtest: error: verify failed at 0x4520000
mtd_oobtest: verified up to eraseblock 768
mtd_oobtest: error: verify failed at 0x6a40000
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: error: verify failed at 0x8160000
mtd_oobtest: error: verify failed at 0x8280000
mtd_oobtest: error: verify failed at 0x9460000
mtd_oobtest: error: verify failed at 0x95e0000
mtd_oobtest: error: verify failed at 0x9c20000
mtd_oobtest: error: verify failed at 0x9fe0000
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: error: verify failed at 0xba60000
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: error: verify failed at 0xc1a0000
mtd_oobtest: error: verify failed at 0xc2a0000
mtd_oobtest: error: verify failed at 0xd040000
mtd_oobtest: error: verify failed at 0xd0e0000
mtd_oobtest: error: verify failed at 0xd1e0000
mtd_oobtest: error: verify failed at 0xd820000
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: error: verify failed at 0xe5a0000
mtd_oobtest: error: verify failed at 0xea00000
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: error: verify failed at 0x104c0000
mtd_oobtest: error: verify failed at 0x10aa0000
mtd_oobtest: error: verify failed at 0x10c60000
mtd_oobtest: error: verify failed at 0x10e40000
mtd_oobtest: error: verify failed at 0x10f20000
mtd_oobtest: error: verify failed at 0x115a0000
mtd_oobtest: error: verify failed at 0x11740000
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: error: verify failed at 0x12840000
mtd_oobtest: error: verify failed at 0x13c00000
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: error: verify failed at 0x14d00000
mtd_oobtest: error: verify failed at 0x15020000
mtd_oobtest: error: verify failed at 0x15420000
mtd_oobtest: error: verify failed at 0x15640000
mtd_oobtest: error: verify failed at 0x15e80000
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: error: verify failed at 0x16520000
mtd_oobtest: error: verify failed at 0x16ea0000
mtd_oobtest: error: verify failed at 0x17620000
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: error: verify failed at 0x18900000
mtd_oobtest: error: verify failed at 0x189c0000
mtd_oobtest: error: verify failed at 0x18ce0000
mtd_oobtest: error: verify failed at 0x18d00000
mtd_oobtest: error: verify failed at 0x18f40000
mtd_oobtest: error: verify failed at 0x18fc0000
mtd_oobtest: error: verify failed at 0x18fe0000
mtd_oobtest: error: verify failed at 0x199c0000
mtd_oobtest: error: verify failed at 0x19ce0000
mtd_oobtest: error: verify failed at 0x19d20000
mtd_oobtest: error: verify failed at 0x19f60000
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: error: verify failed at 0x1a260000
mtd_oobtest: error: verify failed at 0x1b740000
mtd_oobtest: error: verify failed at 0x1be00000
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: error: verify failed at 0x1c3a0000
mtd_oobtest: error: verify failed at 0x1cb40000
mtd_oobtest: error: verify failed at 0x1cc60000
mtd_oobtest: error: verify failed at 0x1cfc0000
mtd_oobtest: error: verify failed at 0x1d500000
mtd_oobtest: error: verify failed at 0x1d8e0000
mtd_oobtest: error: verify failed at 0x1d940000
mtd_oobtest: error: verify failed at 0x1dca0000
mtd_oobtest: verified up to eraseblock 3840
mtd_oobtest: error: verify failed at 0x1eb80000
mtd_oobtest: error: verify failed at 0x1ebc0000
mtd_oobtest: error: verify failed at 0x1ec40000
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
mtd_oobtest: error: verify failed at 0x79bc800
mtd_oobtest: verified up to eraseblock 1024
mtd_oobtest: verified up to eraseblock 1280
mtd_oobtest: verified up to eraseblock 1536
mtd_oobtest: verified up to eraseblock 1792
mtd_oobtest: verified up to eraseblock 2048
mtd_oobtest: error: verify failed at 0x10126000
mtd_oobtest: error: verify failed at 0x10126000
mtd_oobtest: error: verify failed at 0x1019d800
mtd_oobtest: error: verify failed at 0x1019d800
mtd_oobtest: error: verify failed at 0x10ac2800
mtd_oobtest: error: verify failed at 0x10ac2800
mtd_oobtest: verified up to eraseblock 2304
mtd_oobtest: verified up to eraseblock 2560
mtd_oobtest: verified up to eraseblock 2816
mtd_oobtest: verified up to eraseblock 3072
mtd_oobtest: error: verify failed at 0x19319000
mtd_oobtest: error: verify failed at 0x19319000
mtd_oobtest: verified up to eraseblock 3328
mtd_oobtest: error: verify failed at 0x1bd23800
mtd_oobtest: error: verify failed at 0x1bd23800
mtd_oobtest: verified up to eraseblock 3584
mtd_oobtest: error: verify failed at 0x1c2fe000
mtd_oobtest: error: verify failed at 0x1c2fe000
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
mtd_oobtest: finished with 78 errors
=================================================


root@localhost:/mtdtest# insmod ./mtd_subpagetest.ko dev=4

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
mtd_subpagetest: error: read failed at 0x0
mtd_subpagetest: error -74 occurred
=================================================
insmod: can't insert './mtd_subpagetest.ko': Bad message

Are these indicative of hardware problems or is there a possibility I
have mistakes in my configuration? I would welcome any advice.

Thanks,
jaya
