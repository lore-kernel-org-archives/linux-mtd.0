Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0kPQ-0002y0-H6
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 12:53:22 -0500
Date: Mon, 14 Feb 2005 18:52:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Amit Gud <amitg@calsoftinc.com>
Message-ID: <20050214175251.GA28755@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200502141122.11786.amitg@calsoftinc.com>
Cc: kernel-janitors@lists.osdl.org, joern@wh.fh-wedel.de,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, gud@eth.net
Subject: Re: [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks fairly simple, but I've never dealt with pci_find_device(), so
my voice doesn't count.

dwmw2, is this ok?

On Mon, 14 February 2005 11:22:06 +0530, Amit Gud wrote:
> 
> Remove deprecated pci_find_device and pci_find_subsys
> 
> 
> AG
> --
> May the source be with you
> 
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> 
> diff -uprN orig/drivers/mtd/devices/pmc551.c linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c
> --- orig/drivers/mtd/devices/pmc551.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c	2005-02-14 02:34:15.000000000 +0530
> @@ -680,7 +680,7 @@ static int __init init_pmc551(void)
>           */
>          for( count = 0; count < MAX_MTD_DEVICES; count++ ) {
>  
> -                if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
> +                if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
>                                                    PCI_DEVICE_ID_V3_SEMI_V370PDC,
>  						  PCI_Device ) ) == NULL) {
>                          break;
> diff -uprN orig/drivers/mtd/maps/amd76xrom.c linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c
> --- orig/drivers/mtd/maps/amd76xrom.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c	2005-02-14 02:34:21.000000000 +0530
> @@ -304,7 +304,7 @@ static int __init init_amd76xrom(void)
>  	struct pci_device_id *id;
>  	pdev = NULL;
>  	for(id = amd76xrom_pci_tbl; id->vendor; id++) {
> -		pdev = pci_find_device(id->vendor, id->device, NULL);
> +		pdev = pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/ich2rom.c linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c
> --- orig/drivers/mtd/maps/ich2rom.c	2004-10-19 03:25:35.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c	2005-02-14 02:34:26.000000000 +0530
> @@ -288,7 +288,7 @@ int __init init_ich2rom(void)
>  	struct pci_device_id *id;
>  	pdev = NULL;
>  	for(id = ich2rom_pci_tbl; id->vendor; id++) {
> -		pdev = pci_find_device(id->vendor, id->device, NULL);
> +		pdev = pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/ichxrom.c linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c
> --- orig/drivers/mtd/maps/ichxrom.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c	2005-02-14 02:34:31.000000000 +0530
> @@ -356,7 +356,7 @@ static int __init init_ichxrom(void)
>  
>  	pdev = NULL;
>  	for (id = ichxrom_pci_tbl; id->vendor; id++) {
> -		pdev = pci_find_device(id->vendor, id->device, NULL);
> +		pdev = pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/l440gx.c linux-2.6.11-rc3/drivers/mtd/maps/l440gx.c
> --- orig/drivers/mtd/maps/l440gx.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/l440gx.c	2005-02-14 02:34:44.000000000 +0530
> @@ -62,10 +62,10 @@ static int __init init_l440gx(void)
>  	struct resource *pm_iobase;
>  	__u16 word;
>  
> -	dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
> +	dev = pci_get_device(PCI_VENDOR_ID_INTEL, 
>  		PCI_DEVICE_ID_INTEL_82371AB_0, NULL);
>  
> -	pm_dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
> +	pm_dev = pci_get_device(PCI_VENDOR_ID_INTEL, 
>  		PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
>  
>  	if (!dev || !pm_dev) {
> diff -uprN orig/drivers/mtd/maps/scx200_docflash.c linux-2.6.11-rc3/drivers/mtd/maps/scx200_docflash.c
> --- orig/drivers/mtd/maps/scx200_docflash.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/scx200_docflash.c	2005-02-14 02:34:50.000000000 +0530
> @@ -88,7 +88,7 @@ static int __init init_scx200_docflash(v
>  
>  	printk(KERN_DEBUG NAME ": NatSemi SCx200 DOCCS Flash Driver\n");
>  
> -	if ((bridge = pci_find_device(PCI_VENDOR_ID_NS, 
> +	if ((bridge = pci_get_device(PCI_VENDOR_ID_NS, 
>  				      PCI_DEVICE_ID_NS_SCx200_BRIDGE,
>  				      NULL)) == NULL)
>  		return -ENODEV;

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall 
