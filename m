Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN754-0007w7-NY
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:54:58 +0000
Received: by mail-pf0-x232.google.com with SMTP id q63so63075525pfb.1
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:54:34 -0800 (PST)
Date: Sat, 23 Jan 2016 14:54:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v8 1/7] mtd: nand: gpmi: add gpmi dsm supend/resume support
Message-ID: <20160123225430.GG24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-2-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449096466-18064-2-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 04:47:40PM -0600, Han Xu wrote:
> From: Huang Shijie <b32955@freescale.com>
> 
> i.MX6SX supports deep sleep mode(DSM) that may turn off GPMI/BCH power
> during suspend, add gpmi nand suspend/resume function to release DMA
> channel in suspend function and re-init GPMI/BCH controller during
> resume function.
> 
> Although it is not necessary to restore GPMI/BCH registers value for
> i.MX6QDL, the code doesn't distinguish different platforms to keep the
> code simple.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Han Xu <han.xu@freescale.com>

Pushed this patch to l2-mtd.git/next
