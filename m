Subject: Re: [PATCHv3 4/9] mtd: Remove unnecessary comparisons with
	MAX_MTD_DEVICES
From: David Woodhouse <dwmw2@infradead.org>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1264798703.2785.32.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
	<1264798703.2785.32.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Feb 2010 11:42:13 +0000
Message-ID: <1267098133.30247.6175.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 20:58 +0000, Ben Hutchings wrote:
> 
> @@ -695,7 +695,7 @@ static int __init init_pmc551(void)
>         /*
>          * PCU-bus chipset probe.
>          */
> -       for (count = 0; count < MAX_MTD_DEVICES; count++) {
> +       for (;;) {
>  
>                 if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
>                                                   PCI_DEVICE_ID_V3_SEMI_V370PDC, 

Hm, that looks very overdue for being converted to a proper PCI driver.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
