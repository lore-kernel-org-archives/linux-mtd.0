Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkuxn-0000Qt-6z
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 16:26:39 +0000
Date: Thu, 24 Aug 2017 11:26:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org,
 daniel.vetter@intel.com, jani.nikula@linux.intel.com,
 seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de,
 tomas.winkler@intel.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 peda@axentia.se, kishon@ti.com, bhelgaas@google.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 dvhart@infradead.org, andy@infradead.org, ohad@wizery.com,
 bjorn.andersson@linaro.org, freude@de.ibm.com,
 schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org,
 jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
 lduncan@suse.com, cleech@redhat.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org,
 open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 08/15] PCI: make device_type const
Message-ID: <20170824162612.GE31858@bhelgaas-glaptop.roam.corp.google.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
 <1503130946-2854-9-git-send-email-bhumirks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503130946-2854-9-git-send-email-bhumirks@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 19, 2017 at 01:52:19PM +0530, Bhumika Goyal wrote:
> Make this const as it is only stored in the type field of a device
> structure, which is const.
> Done using Coccinelle.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>

Applied to pci/misc for v4.14, thanks!

> ---
>  drivers/pci/endpoint/pci-epf-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
> index 6877d6a..9d0de12 100644
> --- a/drivers/pci/endpoint/pci-epf-core.c
> +++ b/drivers/pci/endpoint/pci-epf-core.c
> @@ -27,7 +27,7 @@
>  #include <linux/pci-ep-cfs.h>
>  
>  static struct bus_type pci_epf_bus_type;
> -static struct device_type pci_epf_type;
> +static const struct device_type pci_epf_type;
>  
>  /**
>   * pci_epf_linkup() - Notify the function driver that EPC device has
> @@ -275,7 +275,7 @@ static void pci_epf_dev_release(struct device *dev)
>  	kfree(epf);
>  }
>  
> -static struct device_type pci_epf_type = {
> +static const struct device_type pci_epf_type = {
>  	.release	= pci_epf_dev_release,
>  };
>  
> -- 
> 1.9.1
> 
