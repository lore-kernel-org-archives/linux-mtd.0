Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKKfv-00065l-Dx
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 01:26:48 +0000
Date: Wed, 11 May 2011 18:33:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nitin Garg <nitingarg98@gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
Message-Id: <20110511183322.da0739c9.akpm@linux-foundation.org>
In-Reply-To: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 May 2011 11:25:22 -0500 Nitin Garg <nitingarg98@gmail.com> wrote:

> Hi All,
> 
> The nand_flash_detect_onfi function in mtd/nand detects the NAND flash
> device size using the ONFI parameters:
> 	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
> 
> The lun_count is not taken into consideration due to which we detect
> wrong size for Micron MT29F8G08ADADAH4 as it has 2 logical units.
> 
> We should change the chipsize calculation to:
> 	chip->chipsize = (uint64_t)le32_to_cpu(p->blocks_per_lun) *
> (uint64_t)le32_to_cpu(p->lun_count) * mtd->erasesize;
> 
> Pls suggest.
> 

Please send a tested, changelogged patch to fix it.  Be sure to cc the
relevant maintainer and mailing list.

Thanks.
