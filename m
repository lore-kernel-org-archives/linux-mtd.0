Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTVYL-00027K-NJ
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 13:11:02 +0000
Date: Thu, 5 Mar 2015 16:08:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH] Remove deprecated IRQF_DISABLED flag entirely
Message-ID: <20150305130850.GK5437@mwanda>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Quentin Lambert <lambert.quentin@gmail.com>, Jiri Kosina <jkosina@suse.cz>,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Sricharan R <r.sricharan@ti.com>, linux-mtd@lists.infradead.org,
 Felipe Balbi <balbi@ti.com>, Huacai Chen <chenhc@lemote.com>,
 Christoph Hellwig <hch@lst.de>, Kukjin Kim <kgene.kim@samsung.com>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ewan Milne <emilne@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Afzal Mohammed <afzal@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Rajendra Nayak <rnayak@ti.com>, Eyal Perry <eyalpe@mellanox.com>,
 Hannes Reinecke <hare@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Bolle <pebolle@tiscali.nl>, Keerthy <j-keerthy@ti.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-usb@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, akpm@linux-foundation.org,
 Brian Norris <computersforpeace@gmail.com>,
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

On Thu, Mar 05, 2015 at 01:59:39PM +0100, Valentin Rothberg wrote:
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index 289ad3ac3e80..7f9f9c827c1d 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -758,8 +758,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
>  
>  	hisi_nfc_host_init(host);
>  
> -	ret = devm_request_irq(dev, irq, hinfc_irq_handle, IRQF_DISABLED,
> -				"nandc", host);
> +	ret = devm_request_irq(dev, irq, hinfc_irq_handle, "nandc", host);

I think this breaks the build.

>  	if (ret) {
>  		dev_err(dev, "failed to request IRQ\n");
>  		goto err_res;

regards,
dan carpenter
