Received: from nasmtp01.atmel.com ([192.199.1.245]
 helo=DVREDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7gMZ-0003Rs-Ta
 for linux-mtd@lists.infradead.org; Sun, 04 Jan 2015 08:16:40 +0000
Message-ID: <54A8F6BE.50708@atmel.com>
Date: Sun, 4 Jan 2015 16:15:58 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: help with mtd-test failures?
References: <CALupW3DMys5qLTw_3t9P0JG64oPgQXa4Lh9M7X5_0yUmLhqGdg@mail.gmail.com>
In-Reply-To: <CALupW3DMys5qLTw_3t9P0JG64oPgQXa4Lh9M7X5_0yUmLhqGdg@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Steve

On 1/3/2015 10:34 AM, Steve deRosier wrote:
> Hi all,
>
> In doing my due dillegence on my system, I decided to run the
> mtd-tests. I'm getting a few failures that I'd like your help in
> understanding.
>
> The one that worries me comes from mtd_oobtest:
>
>      # modprobe mtd_oobtest dev=7
>      mtd_oobtest: error: verify failed at 0x880000
>      mtd_oobtest: error: verify failed at 0xe80000
>
> The most worrysome thing about this is the fact that the result isn't
> consistant. sometimes I get no failures, and sometimes they're at
> different spots.
I think this should be related with nand flash's bitflips. As atmel nand 
driver just use standard oob write/read functions from nand_base.c.
That means there is no ecc protection for mtd_oobtest.
So if there has any nand bitflip happens in the oob area, then 
mtd-oobtest will be failed.

How often does the failures comes?
I tested on my at91sam9g25ek board (nand is: 29F2G08AAD) about 20 times, 
no error happened.

> I'll put the kmesg output later.
>
> The other one is less concerning, but what do these failures from
> mtd_nandecctest indicate?
>
>      mtd_nandecctest: ok - no-bit-error-256
>      mtd_nandecctest: ok - single-bit-error-in-data-correct-256
>      mtd_nandecctest: ok - single-bit-error-in-ecc-correct-256
>      uncorrectable error :
>      mtd_nandecctest: ok - double-bit-error-in-data-detect-256
>      uncorrectable error :
>      mtd_nandecctest: ok - single-bit-error-in-data-and-ecc-detect-256
>      uncorrectable error :
>      mtd_nandecctest: ok - double-bit-error-in-ecc-detect-256
>      mtd_nandecctest: ok - no-bit-error-512
>      mtd_nandecctest: ok - single-bit-error-in-data-correct-512
>      mtd_nandecctest: ok - single-bit-error-in-ecc-correct-512
>      uncorrectable error :
>      mtd_nandecctest: ok - double-bit-error-in-data-detect-512
>      uncorrectable error :
>      mtd_nandecctest: ok - single-bit-error-in-data-and-ecc-detect-512
>      uncorrectable error :
>      mtd_nandecctest: ok - double-bit-error-in-ecc-detect-512
>
> I'm not very concerned because I believe from looking at the comments
> that this doesn't actually utilize my hardware but is a software ECC
> test and I'm using a hardware-based ECC.
yes, this one is a software ecc test.

Best Regards,
Josh Wu

>
> My kernel version is 3.8.  I'm running on an Atmel SAM9G25 processor
> with a Micron MT29F1G08ABBEAH4 SLC NAND.
>
> All of the rest of the tests ran perfectly. And, are there any other
> tests I should run to validate my hardware, kernel/driver setup, or
> UBIFS?
>
> The kmesg for the mtd_oobtest:
>
>      =================================================
>      mtd_oobtest: MTD device: 7
>      mtd_oobtest: MTD device size 39845888, eraseblock size 131072,
> page size 2048, count of eraseblocks 304, pages per eraseblock 64, OOB
> size 64
>      mtd_oobtest: scanning for bad eraseblocks
>      mtd_oobtest: scanned 304 eraseblocks, 0 are bad
>      mtd_oobtest: test 1 of 5
>      mtd_oobtest: erasing whole device
>      mtd_oobtest: erased 304 eraseblocks
>      mtd_oobtest: writing OOBs of whole device
>      mtd_oobtest: written up to eraseblock 0
>      mtd_oobtest: written up to eraseblock 256
>      mtd_oobtest: written 304 eraseblocks
>      mtd_oobtest: verifying all eraseblocks
>      mtd_oobtest: verified up to eraseblock 0
>      mtd_oobtest: verified up to eraseblock 256
>      mtd_oobtest: verified 304 eraseblocks
>      mtd_oobtest: test 2 of 5
>      mtd_oobtest: erasing whole device
>      mtd_oobtest: erased 304 eraseblocks
>      mtd_oobtest: writing OOBs of whole device
>      mtd_oobtest: written up to eraseblock 0
>      mtd_oobtest: written up to eraseblock 256
>      mtd_oobtest: written 304 eraseblocks
>      mtd_oobtest: verifying all eraseblocks
>      mtd_oobtest: verified up to eraseblock 0
>      mtd_oobtest: error: verify failed at 0x880000
>      mtd_oobtest: error: verify failed at 0xe80000
>      mtd_oobtest: verified up to eraseblock 256
>      mtd_oobtest: verified 304 eraseblocks
>      mtd_oobtest: test 3 of 5
>      mtd_oobtest: erasing whole device
>      mtd_oobtest: erased 304 eraseblocks
>      mtd_oobtest: writing OOBs of whole device
>      mtd_oobtest: written up to eraseblock 0
>      mtd_oobtest: written up to eraseblock 256
>      mtd_oobtest: written 304 eraseblocks
>      mtd_oobtest: verifying all eraseblocks
>      mtd_oobtest: verified up to eraseblock 0
>      mtd_oobtest: verified up to eraseblock 256
>      mtd_oobtest: verified 304 eraseblocks
>      mtd_oobtest: test 4 of 5
>      mtd_oobtest: erasing whole device
>      mtd_oobtest: erased 304 eraseblocks
>      mtd_oobtest: attempting to start write past end of OOB
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: attempting to start read past end of OOB
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: attempting to write past end of device
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: attempting to read past end of device
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: attempting to write past end of device
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: attempting to read past end of device
>      mtd_oobtest: an error is expected...
>      mtd_oobtest: error occurred as expected
>      mtd_oobtest: test 5 of 5
>      mtd_oobtest: erasing whole device
>      mtd_oobtest: erased 304 eraseblocks
>      mtd_oobtest: writing OOBs of whole device
>      mtd_oobtest: written up to eraseblock 0
>      mtd_oobtest: written up to eraseblock 0
>      mtd_oobtest: written up to eraseblock 256
>      mtd_oobtest: written up to eraseblock 256
>      mtd_oobtest: written 303 eraseblocks
>      mtd_oobtest: verifying all eraseblocks
>      mtd_oobtest: verified up to eraseblock 0
>      mtd_oobtest: verified up to eraseblock 256
>      mtd_oobtest: verified 303 eraseblocks
>      mtd_oobtest: finished with 2 errors
>      =================================================
>
> Thanks,
> - Steve
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
