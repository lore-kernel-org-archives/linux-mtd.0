Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bv1o3-0004Lp-QE
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 12:41:48 +0000
Message-ID: <1476448883.2342.924.camel@gmail.com>
Subject: Re: Failure on MTD sub-page test
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Danesh Daroui <Danesh.Daroui@ascom.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Fri, 14 Oct 2016 15:41:23 +0300
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC7909015DDE3F@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC7909015DDE3F@SEGOTEXCH02.ascom-Resource.ads>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-10-11 at 11:11 +0000, Danesh Daroui wrote:
> Hello,
> 
> We are using UBIFS which is shipped with the Kernel 2.6.39.4 on a
> NAND Flash memory. When I run "mtd_debug info /dev/mtd0" following
> info are shown:
> 
> mtd.type = MTD_NANDFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 1073741824 (1G)
> mtd.erasesize = 524288 (512K)
> mtd.writesize = 4096 (4K)
> mtd.oobsize = 128
> regions = 0
> 
> Now the problem is that when I run mtd tests, only read and NAND ECC
> tests are passed. Then all other tests fail on exactly page 21. For
> instance this is the output when I run page test:

If mtd tests do not work, you need to focus on your MTD drivers and fix
them.

> =================================================
> mtd_subpagetest: MTD device: 0
> mtd_subpagetest: MTD device size 1073741824, eraseblock size 524288,
> page size 4096, subpage size 1024, count of eraseblocks 2048, pages 
... snip ...
> mtd_subpagetest: verified up to eraseblock 1280
> mtd_subpagetest: verified up to eraseblock 1536
> mtd_subpagetest: verified up to eraseblock 1792
> UBIFS error (pid 4243): ubifs_read_node: bad node type (255 but
> expected 1)
> UBIFS error (pid 4243): ubifs_read_node: bad node at LEB 30:98088,
> LEB mapping status 1
> UBIFS error (pid 4243): do_readpage: cannot read page 21 of inode
> 791, error -22

This is a bit confusing - why messages go together. Do you run mtd
tests and also have the same mtd device mounted at the same time?

The tests hammer the MTD device directly, they do not go through
UBI/UBIFS. So make sure UBI/UBIFS are not using the MTD device that you
are testing.

Artem.
