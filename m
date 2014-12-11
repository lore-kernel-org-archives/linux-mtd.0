Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xz2SF-0006Lj-70
 for linux-mtd@lists.infradead.org; Thu, 11 Dec 2014 12:02:48 +0000
Received: by mail-pa0-f48.google.com with SMTP id rd3so4929348pab.21
 for <linux-mtd@lists.infradead.org>; Thu, 11 Dec 2014 04:02:25 -0800 (PST)
Message-ID: <548987D3.3060407@gmail.com>
Date: Thu, 11 Dec 2014 20:02:27 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
In-Reply-To: <20141130090853.GG3608@norris-Latitude-E6410>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, liguozhu@hisilicon.com,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, yubingxu@hisilicon.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年11月30日 17:08, Brian Norris wrote:
> On Tue, Nov 04, 2014 at 08:46:59PM +0800, Zhou Wang wrote:
>> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
>> The NAND controller IP was developed by hisilicon and needs a new driver to
>> support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
>> controller works fine in Hip04 D01 board.
>
> Have you tested on the MTD test modules (drivers/mtd/tests/*)? This is
> important, as we seem to regularly get UBIFS bug reports from users
> whose drivers have not even passed some of the simple tests.
>
> Also, it might be worth testing out the UBI tests found in the mtd-utils
> package.
>
> Brian
>

Hi Brian,

I have tested this NAND controller driver on the MTD test modules
(drivers/mtd/tests/*). All tests passed except mtd_nandbiterrs.ko.

Here is the test log for mtd_nandbiterrs:
/home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0
[  100.484995]
[  100.490082] ==================================================
[  100.509657] mtd_nandbiterrs: MTD device: 2
[  100.523413] mtd_nandbiterrs: MTD device size 8388608, 
eraseblock=131072, page=2048, oob=64
[  100.551134] mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
[  100.571585] mtd_nandbiterrs: Using page=1, offset=2048, eraseblock=0
[  104.431136] mtd_nandbiterrs: incremental biterrors test
[  104.448872] mtd_nandbiterrs: write_page
[  104.463193] mtd_nandbiterrs: rewrite page
[  104.477620] mtd_nandbiterrs: read_page
[  104.490898] mtd_nandbiterrs: verify_page
[  104.504338] mtd_nandbiterrs: Successfully corrected 0 bit errors per 
subpage
[  104.527985] mtd_nandbiterrs: Inserted biterror @ 0/5
[  104.544673] mtd_nandbiterrs: Inserted biterror @ 1024/2
[  104.562197] mtd_nandbiterrs: rewrite page
[  104.576766] mtd_nandbiterrs: read_page
[  104.590052] mtd_nandbiterrs: verify_page
[  104.603252] mtd_nandbiterrs: Error: page offset 0, expected 23, got 03
[  104.625203] mtd_nandbiterrs: Error: page offset 1024, expected 06, got 02
[  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect 
despite read success
insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error

The reason for above failure is that:
In ECC mode, when rewriting page data to NAND flash, the NAND controller 
will also produce ECC code and write them to NAND flash as well. So when 
we read data from NAND flash, there is no need to correct the error bit. 
We read what we write to the flash.

In mtd_nandbiterrs test, We call nand_write_page_raw indeed to perform
rewrite operation. My question is that: in this NAND controller hardware
design, it is hard to implement hardware specific write_page_raw to 
write page data without producing ECC code, will this bring some bad 
effects somewhere? It will be very nice if you and anyone can give me 
some advice.

Thanks,
Zhou Wang
