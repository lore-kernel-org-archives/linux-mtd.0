Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTxGe-0001VN-AQ
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 18:46:37 +0000
Received: by pabrd3 with SMTP id rd3so29642098pab.5
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2015 10:46:15 -0800 (PST)
Date: Fri, 6 Mar 2015 10:46:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH v2] Remove deprecated IRQF_DISABLED flag entirely
Message-ID: <20150306184605.GQ18140@ld-irv-0074>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
 <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Jiri Kosina <jkosina@suse.cz>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Sricharan R <r.sricharan@ti.com>,
 linux-mtd@lists.infradead.org, Felipe Balbi <balbi@ti.com>,
 Huacai Chen <chenhc@lemote.com>, Christoph Hellwig <hch@lst.de>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 Quentin Lambert <lambert.quentin@gmail.com>, Ewan Milne <emilne@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Afzal Mohammed <afzal@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Rajendra Nayak <rnayak@ti.com>,
 Eyal Perry <eyalpe@mellanox.com>, Hannes Reinecke <hare@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Bolle <pebolle@tiscali.nl>,
 Keerthy <j-keerthy@ti.com>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, akpm@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 05, 2015 at 03:23:08PM +0100, Valentin Rothberg wrote:
> The IRQF_DISABLED is a NOOP and has been scheduled for removal since
> Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
> core code").
> 
> According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
> interrupts disabled") running IRQ handlers with interrupts enabled can
> cause stack overflows when the interrupt line of the issuing device is
> still active.
> 
> This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
> in older versions of Linux) and removes the definition and all remaining
> usages of this flag.
> 
> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
> ---
> The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
> as IRQF_DISABLED is gone now; the usage in older kernel versions
> (including the old SA_INTERRUPT flag) should be discouraged.  The
> trouble of using IRQF_SHARED is a general problem and not specific to
> any driver.
> 
> I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
> it has already been removed in linux-next by commit b0e1ee8e1405
> ("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").
> 
> All remaining references are changelogs that I suggest to keep.
> 
> Changelog
> 
> v2: Correct previous change to drivers/mtd/nand/hisi504_nand.c that
> broke compilation.  Reported by Dan Carpenter.
> ---
>  Documentation/scsi/ncr53c8xx.txt     | 25 -------------------------
>  Documentation/scsi/tmscsim.txt       |  4 ----
>  arch/mips/loongson/loongson-3/hpet.c |  2 +-
>  drivers/block/cpqarray.c             |  4 ++--
>  drivers/bus/omap_l3_noc.c            |  4 ++--
>  drivers/bus/omap_l3_smx.c            | 10 ++++------
>  drivers/mtd/nand/hisi504_nand.c      |  3 +--
>  drivers/usb/isp1760/isp1760-core.c   |  3 +--
>  drivers/usb/isp1760/isp1760-udc.c    |  4 ++--
>  include/linux/interrupt.h            |  3 ---
>  10 files changed, 13 insertions(+), 49 deletions(-)
> 

For this piece:

> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index 289ad3ac3e80..8dcc7b8fee40 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -758,8 +758,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
>  
>  	hisi_nfc_host_init(host);
>  
> -	ret = devm_request_irq(dev, irq, hinfc_irq_handle, IRQF_DISABLED,
> -				"nandc", host);
> +	ret = devm_request_irq(dev, irq, hinfc_irq_handle, 0x0, "nandc", host);
>  	if (ret) {
>  		dev_err(dev, "failed to request IRQ\n");
>  		goto err_res;

Acked-by: Brian Norris <computersforpeace@gmail.com>

Sorry for the oversight in review, and thanks for the fixup.

Brian
