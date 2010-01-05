Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NS53I-0005da-IK
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 08:46:13 +0000
Received: by ewy21 with SMTP id 21so8461843ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jan 2010 00:46:07 -0800 (PST)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
Date: Tue, 5 Jan 2010 09:41:42 +0100
References: <201001032117.37459.florian@openwrt.org>
	<1262552177.3181.5891.camel@macbook.infradead.org>
	<2ve717-7pt.ln1@chipmunk.wormnet.eu>
In-Reply-To: <2ve717-7pt.ln1@chipmunk.wormnet.eu>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201001050941.42161.florian@openwrt.org>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Sunday 03 January 2010 22:31:46 Alexander Clouter wrote:
> In gmane.linux.drivers.mtd David Woodhouse <dwmw2@infradead.org> wrote:
> > On Sun, 2010-01-03 at 21:17 +0100, Florian Fainelli wrote:
> >> This patch modifies the physmap-flash driver to include
> >> the ar7part partition parser in the list of parsers to
> >> use when a physmap-flash driver is registered. This is
> >> required for AR7 to create partitions correctly.
> >
> > Hrm, perhaps we'd do better to allow the probe types to be specified in
> > the platform physmap_flash_data?
> 
> I am not completely convinced the ar7part approach is the best way as
> you are:
>  1) not actually reading a partition table and instead using a bunch of
> 	'magic' values to try to work out the partition layout
>  2) it bears no resemble to what is seen by the ADAM2 bootloader
>  3) regardless of whether you would actually want to, the user is unable
> 	to amend the partition table and have Linux automagically set
> 	the table apprioately
> 
> I chatted with Florian a while back about this but we never continued
> with it (Real Life[tm] seemed to get in the way) but I had cobbled the
> following together:
> ----
> diff --git a/arch/mips/ar7/platform.c b/arch/mips/ar7/platform.c
> index e2278c0..df33fea 100644
> --- a/arch/mips/ar7/platform.c
> +++ b/arch/mips/ar7/platform.c
> @@ -24,6 +24,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
>  #include <linux/mtd/physmap.h>
> +#include <linux/mtd/partitions.h>
>  #include <linux/serial.h>
>  #include <linux/serial_8250.h>
>  #include <linux/ioport.h>
> @@ -467,6 +468,60 @@ static void cpmac_get_mac(int instance, unsigned char
>  *dev_addr) char2hex(mac[i * 3 + 1]);
>  }
> 
> +static void __init detect_partitions(void)
> +{
> +	unsigned int i, start, end;
> +	int ret;
> +	char mtdenv[5], *buf;
> +
> +	for (physmap_flash_data.nr_parts = 0;
> +			physmap_flash_data.nr_parts < 10;
> +			physmap_flash_data.nr_parts++) {
> +		sprintf(mtdenv, "mtd%d", physmap_flash_data.nr_parts);
> +		if (!prom_getenv(mtdenv))
> +			break;
> +	}
> +
> +	if (physmap_flash_data.nr_parts == 0) {
> +		printk(KERN_INFO "No partitions found for physmap MTD\n");
> +		return;
> +	}
> +	if (physmap_flash_data.nr_parts == 10)
> +		printk(KERN_INFO "Reached nr_parts limit for physmap MTD\n");
> +
> +	physmap_flash_data.parts = kzalloc(
> +			sizeof(struct mtd_partition)*physmap_flash_data.nr_parts,
> +			GFP_KERNEL);
> +	if (!physmap_flash_data.parts) {
> +		printk(KERN_ERR "Unable to alloc physmap MTD parts struct\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < physmap_flash_data.nr_parts; i++) {
> +		sprintf(mtdenv, "mtd%d", i);
> +		buf = prom_getenv(mtdenv);
> +
> +		ret = sscanf(buf, "%x,%x", &start, &end);
> +		if (ret != 2 || start < 0x90000000 || start > 0x90400000
> +				|| end < 0x90000000 || end > 0x90400000
> +				|| start > end) {
> +			printk(KERN_WARNING "broken partition table for physmap\n");
> +			kfree(physmap_flash_data.parts);
> +			physmap_flash_data.parts = NULL;
> +			physmap_flash_data.nr_parts = 0;
> +			return;
> +		}
> +
> +		start -= 0x90000000;
> +		end -= 0x90000000;
> +
> +		physmap_flash_data.parts[i].name	= NULL;
> +		physmap_flash_data.parts[i].size	= end - start;
> +		physmap_flash_data.parts[i].offset	= start;
> +		physmap_flash_data.parts[i].mask_flags	= MTD_WRITEABLE;
> +	}
> +}
> +
>  static void __init detect_leds(void)
>  {
>  	char *prid, *usb_prod;
> @@ -536,6 +591,7 @@ static int __init ar7_register_devices(void)
>  			return res;
>  	}
>  #endif /* CONFIG_SERIAL_8250 */
> +	detect_partitions();
>  	res = platform_device_register(&physmap_flash);
>  	if (res)
>  		return res;
> ----
> 
> It simply pulls apart the 'PROM' (aka ADAM2) config and uses that to
> build the partition table.

This is indeed simple but if I recall right the rationale behind ar7part was 
to create a sane partition layout no matter if the bootloader was ADAM2 or 
PSPBoot and the root filesystem type. JFFS2 and squashfs do not have the same 
erase-block size alignment constraints, ar7part deals with that too.

When we last chatted about that I did not recall exactly those details.
-- 
Regards, Florian
