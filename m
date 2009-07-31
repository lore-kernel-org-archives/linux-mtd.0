Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWsUL-0007CY-MQ
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 13:49:42 +0000
Received: by ywh13 with SMTP id 13so1730693ywh.15
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Jul 2009 06:49:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090730214058.GC13236@buzzloop.caiaq.de>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202913.GB13236@buzzloop.caiaq.de>
	<3972542e0907301422m1c889dc7gc7e0b79ced28421e@mail.gmail.com>
	<20090730214058.GC13236@buzzloop.caiaq.de>
Date: Fri, 31 Jul 2009 08:49:36 -0500
Message-ID: <3972542e0907310649p38c829c9le3051a0f7c0e4fb9@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Daniel Mack <daniel@caiaq.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 4:40 PM, Daniel Mack<daniel@caiaq.de> wrote:
> On Thu, Jul 30, 2009 at 04:22:19PM -0500, E Robertson wrote:
>> On Thu, Jul 30, 2009 at 3:29 PM, Daniel Mack<daniel@caiaq.de> wrote:
>> > Could you try running the torture test from drivers/mtd/tests? Which
>> > platform is that? Are you sure you're running the NAND chip well inside
>> > its timing specs? Does the flash access work from the bootloader?
>> >
>> > I recently had similar trouble which disappeared after I switched off
>> > CPU frequency scaling.
>> >
>>
>> I see these tests but I'm not sure how they're used. is their a doc for these?
>
> The come as kernel module, just insmod them and pass at least the 'dev'
> param to specify the mtd device you want them to run on. See the first
> couple of lines in the individual source files for a full list of
> parameters you can use.
>
> If the torture test doesn't complain about anything, it's certainly the
> jffs2 people's call.

Is their a problem in just including them in the build and have it run
at startup?
I did so since I don't have module tools in my initramfs.
It's unclear if the failures are because of bad blocks or something else.

This is first partition:
0x000000000000-0x000004000000

=================================================
mtd_oobtest: MTD device: 0
mtd_oobtest: MTD device size 67108864, eraseblock size 131072, page
size 2048, count of eraseblocks
 512, pages per eraseblock 64, OOB size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 512 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 512 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written 512 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: error: verify failed at 0x16800
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: error: verify failed at 0x58000
mtd_oobtest: error: verify failed at 0xf8000
mtd_oobtest: error: verify failed at 0x14f800
mtd_oobtest: error: verify failed at 0x341800
mtd_oobtest: error: verify failed at 0x358800
mtd_oobtest: error: verify failed at 0x3ec800
mtd_oobtest: error: verify failed at 0x6ca000
mtd_oobtest: error: verify failed at 0x7e7000
mtd_oobtest: error: verify failed at 0x93c800
mtd_oobtest: error: verify failed at 0x94e000
mtd_oobtest: error: verify failed at 0x957000
mtd_oobtest: error: verify failed at 0xa1a800
mtd_oobtest: error: verify failed at 0xacb800
mtd_oobtest: error: verify failed at 0xd0f000
mtd_oobtest: error: verify failed at 0xfde000
mtd_oobtest: error: verify failed at 0x1063800
mtd_oobtest: error: verify failed at 0x11c4800
mtd_oobtest: error: verify failed at 0x124c000
mtd_oobtest: error: verify failed at 0x1346000
mtd_oobtest: error: verify failed at 0x13f7000
mtd_oobtest: error: verify failed at 0x146a000
mtd_oobtest: error: verify failed at 0x14a4000
mtd_oobtest: error: verify failed at 0x158b800
mtd_oobtest: error: verify failed at 0x17fe800
mtd_oobtest: error: verify failed at 0x1813800
mtd_oobtest: error: verify failed at 0x1842000
mtd_oobtest: error: verify failed at 0x1999800
mtd_oobtest: error: verify failed at 0x1f0e800
mtd_oobtest: error: verify failed at 0x1f1c800
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: error: verify failed at 0x2065000
mtd_oobtest: error: verify failed at 0x20c2800
mtd_oobtest: error: verify failed at 0x2242000
mtd_oobtest: error: verify failed at 0x224e800
mtd_oobtest: error: verify failed at 0x22ae800
mtd_oobtest: error: verify failed at 0x22e3000
mtd_oobtest: error: verify failed at 0x247c800
mtd_oobtest: error: verify failed at 0x2576800
mtd_oobtest: error: verify failed at 0x275a800
mtd_oobtest: error: verify failed at 0x2aa6800
mtd_oobtest: error: verify failed at 0x2ad4800
mtd_oobtest: error: verify failed at 0x2b3d800
mtd_oobtest: error: verify failed at 0x2c02000
mtd_oobtest: error: verify failed at 0x2c0f800
mtd_oobtest: error: verify failed at 0x2c42800
mtd_oobtest: error: verify failed at 0x2d2b000
mtd_oobtest: error: verify failed at 0x2e30000
mtd_oobtest: error: verify failed at 0x2e42800
mtd_oobtest: error: verify failed at 0x30b6000
mtd_oobtest: error: verify failed at 0x30d6000
mtd_oobtest: error: verify failed at 0x3133000
mtd_oobtest: error: verify failed at 0x313f800
mtd_oobtest: error: verify failed at 0x3249800
mtd_oobtest: error: verify failed at 0x3260000
mtd_oobtest: error: verify failed at 0x32b5000
mtd_oobtest: error: verify failed at 0x3443000
mtd_oobtest: error: verify failed at 0x35c5000
mtd_oobtest: error: verify failed at 0x3601800
mtd_oobtest: error: verify failed at 0x3604800
mtd_oobtest: error: verify failed at 0x3622800
mtd_oobtest: error: verify failed at 0x36c5000
mtd_oobtest: error: verify failed at 0x36fc000
mtd_oobtest: error: verify failed at 0x373b000
mtd_oobtest: error: verify failed at 0x3817000
mtd_oobtest: error: verify failed at 0x38b5800
mtd_oobtest: error: verify failed at 0x38fa800
mtd_oobtest: error: verify failed at 0x39a9000
mtd_oobtest: error: verify failed at 0x3a98000
mtd_oobtest: error: verify failed at 0x3cc8800
mtd_oobtest: error: verify failed at 0x3d2d000
mtd_oobtest: error: verify failed at 0x3e5e000
mtd_oobtest: error: verify failed at 0x3e75800
mtd_oobtest: verified 512 eraseblocks
mtd_oobtest: test 2 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 512 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written 512 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: error: verify failed at 0x0
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: error: verify failed at 0x20000
mtd_oobtest: error: verify failed at 0x40000
mtd_oobtest: error: verify failed at 0x60000
mtd_oobtest: error: verify failed at 0x280000
mtd_oobtest: error: verify failed at 0x2c0000
mtd_oobtest: error: verify failed at 0x340000
mtd_oobtest: error: verify failed at 0x3c0000
mtd_oobtest: error: verify failed at 0x500000
mtd_oobtest: error: verify failed at 0x520000
mtd_oobtest: error: verify failed at 0x6e0000
mtd_oobtest: error: verify failed at 0x7e0000
mtd_oobtest: error: verify failed at 0xa20000
mtd_oobtest: error: verify failed at 0xb60000
mtd_oobtest: error: verify failed at 0xc80000
mtd_oobtest: error: verify failed at 0x1200000
mtd_oobtest: error: verify failed at 0x12c0000
mtd_oobtest: error: verify failed at 0x1420000
mtd_oobtest: error: verify failed at 0x17a0000
mtd_oobtest: error: verify failed at 0x1880000
mtd_oobtest: error: verify failed at 0x1900000
mtd_oobtest: error: verify failed at 0x1940000
mtd_oobtest: error: verify failed at 0x1b40000
mtd_oobtest: error: verify failed at 0x1b80000
mtd_oobtest: error: verify failed at 0x1bc0000
mtd_oobtest: error: verify failed at 0x1ee0000
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: error: verify failed at 0x2040000
mtd_oobtest: error: verify failed at 0x2060000
mtd_oobtest: error: verify failed at 0x22e0000
mtd_oobtest: error: verify failed at 0x23e0000
mtd_oobtest: error: verify failed at 0x2420000
mtd_oobtest: error: verify failed at 0x25c0000
mtd_oobtest: error: verify failed at 0x27e0000
mtd_oobtest: error: verify failed at 0x2a20000
mtd_oobtest: error: verify failed at 0x2a40000
mtd_oobtest: error: verify failed at 0x2aa0000
mtd_oobtest: error: verify failed at 0x2b60000
mtd_oobtest: error: verify failed at 0x2e20000
mtd_oobtest: error: verify failed at 0x2e80000
mtd_oobtest: error: verify failed at 0x2ec0000
mtd_oobtest: error: verify failed at 0x2f40000
mtd_oobtest: error: verify failed at 0x3020000
mtd_oobtest: error: verify failed at 0x31c0000
mtd_oobtest: error: verify failed at 0x3220000
mtd_oobtest: error: verify failed at 0x3780000
mtd_oobtest: error: verify failed at 0x3880000
mtd_oobtest: error: verify failed at 0x3940000
mtd_oobtest: error: verify failed at 0x3a20000
mtd_oobtest: error: verify failed at 0x3a80000
mtd_oobtest: error: verify failed at 0x3ba0000
mtd_oobtest: error: verify failed at 0x3dc0000
mtd_oobtest: error: verify failed at 0x3de0000
mtd_oobtest: error: verify failed at 0x3f00000
mtd_oobtest: error: verify failed at 0x3f60000
mtd_oobtest: verified 512 eraseblocks
mtd_oobtest: test 3 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 512 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written 512 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: error: verify failed at 0x60800
mtd_oobtest: error: verify failed at 0x60800
mtd_oobtest: error: verify 0xff failed at 0x60800
mtd_oobtest: error: verify 0xff failed at 0x611800
mtd_oobtest: error: verify 0xff failed at 0x669800
mtd_oobtest: error: verify failed at 0x7cf000
mtd_oobtest: error: verify failed at 0x7cf000
mtd_oobtest: error: verify failed at 0x841000
mtd_oobtest: error: verify failed at 0x841000
mtd_oobtest: error: verify 0xff failed at 0x841000
mtd_oobtest: error: verify failed at 0x8c4000
mtd_oobtest: error: verify failed at 0x8c4000
mtd_oobtest: error: verify failed at 0x8ed800
mtd_oobtest: error: verify failed at 0x8ed800
mtd_oobtest: error: verify 0xff failed at 0xbda000
mtd_oobtest: error: verify failed at 0x1160000
mtd_oobtest: error: verify failed at 0x1160000
mtd_oobtest: error: verify 0xff failed at 0x117a800
mtd_oobtest: error: verify 0xff failed at 0x132c000
mtd_oobtest: error: verify 0xff failed at 0x1725000
mtd_oobtest: error: verify 0xff failed at 0x19c3000
mtd_oobtest: error: verify failed at 0x1aec000
mtd_oobtest: error: verify failed at 0x1aec000
mtd_oobtest: error: verify failed at 0x1bef000
mtd_oobtest: error: verify failed at 0x1bef000
mtd_oobtest: error: verify 0xff failed at 0x1da9000
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: error: verify failed at 0x208d000
mtd_oobtest: error: verify failed at 0x208d000
mtd_oobtest: error: verify 0xff failed at 0x20df800
mtd_oobtest: error: verify 0xff failed at 0x216d800
mtd_oobtest: error: verify 0xff failed at 0x244f000
mtd_oobtest: error: verify 0xff failed at 0x2494000
mtd_oobtest: error: verify failed at 0x25ee000
mtd_oobtest: error: verify failed at 0x25ee000
mtd_oobtest: error: verify 0xff failed at 0x2609000
mtd_oobtest: error: verify 0xff failed at 0x27d1800
mtd_oobtest: error: verify failed at 0x2925800
mtd_oobtest: error: verify failed at 0x2925800
mtd_oobtest: error: verify 0xff failed at 0x2c96800
mtd_oobtest: error: verify failed at 0x2cf6000
mtd_oobtest: error: verify failed at 0x2cf6000
mtd_oobtest: error: verify 0xff failed at 0x2cf6000
mtd_oobtest: error: verify failed at 0x2d68000
mtd_oobtest: error: verify failed at 0x2d68000
mtd_oobtest: error: verify 0xff failed at 0x2ddd800
mtd_oobtest: error: verify failed at 0x2de3800
mtd_oobtest: error: verify failed at 0x2de3800
mtd_oobtest: error: verify 0xff failed at 0x2de3800
mtd_oobtest: error: verify failed at 0x2e75000
mtd_oobtest: error: verify failed at 0x2e75000
mtd_oobtest: error: verify 0xff failed at 0x2e75000
mtd_oobtest: error: verify 0xff failed at 0x2e98800
mtd_oobtest: error: verify 0xff failed at 0x3155800
mtd_oobtest: error: verify 0xff failed at 0x32c5000
mtd_oobtest: error: verify failed at 0x32c6000
mtd_oobtest: error: verify failed at 0x32c6000
mtd_oobtest: error: verify 0xff failed at 0x32c6000
mtd_oobtest: error: verify 0xff failed at 0x35e7000
mtd_oobtest: error: verify 0xff failed at 0x36ba800
mtd_oobtest: error: verify 0xff failed at 0x36f7800
mtd_oobtest: error: verify failed at 0x3b1b800
mtd_oobtest: error: verify failed at 0x3b1b800
mtd_oobtest: error: verify failed at 0x3b46800
mtd_oobtest: error: verify failed at 0x3b46800
mtd_oobtest: error: verify failed at 0x3b49800
mtd_oobtest: error: verify failed at 0x3b49800
mtd_oobtest: error: verify failed at 0x3bb9000
mtd_oobtest: error: verify failed at 0x3bb9000
mtd_oobtest: error: verify 0xff failed at 0x3bb9000
mtd_oobtest: error: verify 0xff failed at 0x3d33000
mtd_oobtest: error: verify failed at 0x3dca800
mtd_oobtest: error: verify failed at 0x3dca800
mtd_oobtest: verified 512 eraseblocks
mtd_oobtest: test 4 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 512 eraseblocks
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
mtd_oobtest: error: read past end of device
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error: read past end of device
mtd_oobtest: test 5 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 512 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written up to eraseblock 256
mtd_oobtest: written 511 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified up to eraseblock 256
mtd_oobtest: verified 511 eraseblocks
mtd_oobtest: finished with 200 errors
=================================================

=================================================
mtd_pagetest: MTD device: 0
mtd_pagetest: MTD device size 67108864, eraseblock size 131072, page
size 0, count of eraseblocks 5
12, pages per eraseblock 64, OOB size 64
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 512 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 512 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: error: write failed at 0x600000
mtd_pagetest: error -5 occurred
=================================================

=================================================
mtd_readtest: MTD device: 0
mtd_readtest: MTD device size 67108864, eraseblock size 131072, page
size 2048, count of eraseblock
s 512, pages per eraseblock 64, OOB size 64
mtd_readtest: scanning for bad eraseblocks
mtd_readtest: scanned 512 eraseblocks, 0 are bad
mtd_readtest: testing page read
uncorrectable error :
mtd_readtest: error: read failed at 0x12800
mtd_readtest: dumping eraseblock 0
00000: c67e816b4bfbe2fb54f6bddf7c1ce18701bf31de56720f4767668759aa883c59
00020: ea56137bd285a1d83c54552f37ae655bda027998cce31a768e5fd9998f1f3f36
00040: ee43784d0dfabea6dae4868edc296d4eff56e17020fb8fb1580590c509dc53cd
...
