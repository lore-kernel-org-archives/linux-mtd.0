Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOD9S-0000F2-JP
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 00:08:15 +0000
Received: by mail-pa0-x244.google.com with SMTP id dx3so6911440pab.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 17:07:51 -0700 (PDT)
Date: Fri, 15 Jul 2016 17:07:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PULL v2] mtd: nand: Changes for 4.8
Message-ID: <20160716000747.GA76613@google.com>
References: <20160713095640.34bb9f1a@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160713095640.34bb9f1a@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Jul 13, 2016 at 09:56:40AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> Here is the 2nd version of my first PR for 4.8. I removed the duplicate
> SoB tag on one of my patch, and the static specifier in "mtd: brcmnand:
> Detect sticky ucorr ecc error on dma reads"
> 
> Let me know if you find something wrong in this v2.
> 
> Thanks,
> 
> Boris
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git@github.com:linux-nand/linux.git tags/nand/for-4.8
> 
> for you to fetch changes up to 8490c03bd9d40ce71d9b67dcf93e73788ba0516d:
> 
>   mtd: nand: jz4780: Update MODULE_AUTHOR email address (2016-07-11 08:40:19 +0200)
> 
> ----------------------------------------------------------------
> This pull request contains only one notable change:
> * Addition of the MTK NAND controller driver
> 
> And a bunch of specific NAND driver improvements/fixes. Here are the
> changes that are worth mentioning:
> * A few fixes/improvements for the xway NAND controller driver
> * A few fixes for the sunxi NAND controller driver
> * Support for DMA in the sunxi NAND driver
> * Support for the sunxi NAND controller IP embedded in A23/A33 SoCs
> * Addition for bitflips detection in erased pages to the brcmnand driver
> * Support for new brcmnand IPs
> * Update of the OMAP-GPMC binding to support DMA channel description
> 
> ----------------------------------------------------------------

Merged to l2-mtd.git. Thanks!
