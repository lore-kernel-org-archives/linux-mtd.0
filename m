Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VltLt-0001Vs-Qk
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 04:37:24 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWY00L0KI5MEF70@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 13:36:58 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
In-reply-to: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
Subject: Re: [PATCH 1/9] mtd: amd76xrom: use DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 28 Nov 2013 13:36:57 +0900
Message-id: <005401ceebf3$7903b730$6b0b2590$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Jingoo Han [mailto:jg1.han@samsung.com]
> Sent: Thursday, November 28, 2013 11:32 AM
> To: 'Brian Norris'
> Cc: 'Artem Bityutskiy'; 'David Woodhouse'; linux-mtd@lists.infradead.org; 'Jingoo Han'
> Subject: [PATCH 1/9] mtd: amd76xrom: use DEFINE_PCI_DEVICE_TABLE macro
> 
> This macro is used to create a struct pci_device_id array.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Please, ignore these patches.
According to the Greg Kroah-Hartman, 

"Yeah, and it's a horrid macro that deserves to be removed, please don't
use it in more places.

Actually, if you could just remove it, that would be best, sorry, I'm
not going to take these patches."

So, I will send the patch to remove 'DEFINE_PCI_DEVICE_TABLE' instead.
Sorry for annoying. :-)

Best regards,
Jingoo Han

> ---
>  drivers/mtd/maps/amd76xrom.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
> index f7207b0..6a0582e 100644
> --- a/drivers/mtd/maps/amd76xrom.c
> +++ b/drivers/mtd/maps/amd76xrom.c
> @@ -296,7 +296,7 @@ static void amd76xrom_remove_one(struct pci_dev *pdev)
>  	amd76xrom_cleanup(window);
>  }
> 
> -static struct pci_device_id amd76xrom_pci_tbl[] = {
> +static DEFINE_PCI_DEVICE_TABLE(amd76xrom_pci_tbl) = {
>  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7410,
>  		PCI_ANY_ID, PCI_ANY_ID, },
>  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7440,
> @@ -319,7 +319,7 @@ static struct pci_driver amd76xrom_driver = {
>  static int __init init_amd76xrom(void)
>  {
>  	struct pci_dev *pdev;
> -	struct pci_device_id *id;
> +	const struct pci_device_id *id;
>  	pdev = NULL;
>  	for(id = amd76xrom_pci_tbl; id->vendor; id++) {
>  		pdev = pci_get_device(id->vendor, id->device, NULL);
> --
> 1.7.10.4
