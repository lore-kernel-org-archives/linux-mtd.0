Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y132N-0002yB-DY
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 01:04:24 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so15071874pac.25
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 17:04:01 -0800 (PST)
Date: Tue, 16 Dec 2014 17:03:58 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20141217010358.GM9759@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <548987D3.3060407@gmail.com>
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

On Thu, Dec 11, 2014 at 08:02:27PM +0800, Zhou Wang wrote:
> On 2014年11月30日 17:08, Brian Norris wrote:
> >Have you tested on the MTD test modules (drivers/mtd/tests/*)? This is
> >important, as we seem to regularly get UBIFS bug reports from users
> >whose drivers have not even passed some of the simple tests.
> >
> >Also, it might be worth testing out the UBI tests found in the mtd-utils
> >package.
> 
> I have tested this NAND controller driver on the MTD test modules
> (drivers/mtd/tests/*). All tests passed except mtd_nandbiterrs.ko.
> 
> Here is the test log for mtd_nandbiterrs:
> /home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0
> [  100.484995]
> [  100.490082] ==================================================
> [  100.509657] mtd_nandbiterrs: MTD device: 2
> [  100.523413] mtd_nandbiterrs: MTD device size 8388608,
> eraseblock=131072, page=2048, oob=64
> [  100.551134] mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
> [  100.571585] mtd_nandbiterrs: Using page=1, offset=2048, eraseblock=0
> [  104.431136] mtd_nandbiterrs: incremental biterrors test
> [  104.448872] mtd_nandbiterrs: write_page
> [  104.463193] mtd_nandbiterrs: rewrite page
> [  104.477620] mtd_nandbiterrs: read_page
> [  104.490898] mtd_nandbiterrs: verify_page
> [  104.504338] mtd_nandbiterrs: Successfully corrected 0 bit errors
> per subpage
> [  104.527985] mtd_nandbiterrs: Inserted biterror @ 0/5
> [  104.544673] mtd_nandbiterrs: Inserted biterror @ 1024/2
> [  104.562197] mtd_nandbiterrs: rewrite page
> [  104.576766] mtd_nandbiterrs: read_page
> [  104.590052] mtd_nandbiterrs: verify_page
> [  104.603252] mtd_nandbiterrs: Error: page offset 0, expected 23, got 03
> [  104.625203] mtd_nandbiterrs: Error: page offset 1024, expected 06, got 02
> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
> despite read success
> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
> 
> The reason for above failure is that:
> In ECC mode, when rewriting page data to NAND flash, the NAND
> controller will also produce ECC code and write them to NAND flash
> as well. So when we read data from NAND flash, there is no need to
> correct the error bit. We read what we write to the flash.
> 
> In mtd_nandbiterrs test, We call nand_write_page_raw indeed to perform
> rewrite operation. My question is that: in this NAND controller hardware
> design, it is hard to implement hardware specific write_page_raw to
> write page data without producing ECC code, will this bring some bad
> effects somewhere? It will be very nice if you and anyone can give
> me some advice.

As of now, read_page_raw()/write_page_raw() are not required for any
normal operation. They are useful for debugging and testing though, with
tests like this one.

In the future, we might use read_page_raw() for implementing (optional)
software-based detection of blank/erased pages that have bitflips in
them -- i.e., all 0xff but with a few bitflips. See:

  http://lists.infradead.org/pipermail/linux-mtd/2014-December/056749.html
  http://article.gmane.org/gmane.linux.drivers.mtd/52183/

Brian
