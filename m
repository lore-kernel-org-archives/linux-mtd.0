Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y181f-0000s4-6o
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 06:24:00 +0000
Received: by mail-pd0-f174.google.com with SMTP id fp1so15434318pdb.19
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 22:23:37 -0800 (PST)
Date: Tue, 16 Dec 2014 22:23:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Message-ID: <20141217062333.GD7112@brian-ubuntu>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <548987D3.3060407@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, pawel.moll@arm.com,
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

BTW, your explanation doesn't seem quite right. The problem is that
even though mtd_read() didn't report errors, the data doesn't match
what's written. It's not that there was "no need to correct the error
bit".

I'd recommend digging a little more to figure out what's wrong here. You
might need to instrument the nandbiterrs test. This is possibly
highlighting a driver bug [1].

Brian

[1] Besised simply that you didn't implement write_page_raw(). The
default nand_write_page_raw() implementation looks just like your
non-raw version.
