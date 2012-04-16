Received: from zmc.proxad.net ([212.27.53.206])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJful-00048M-Lt
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 06:59:56 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: Exposing NAND chip information
Date: Mon, 16 Apr 2012 08:59:48 +0200
Message-ID: <8396132.PHseJUhzUe@bender>
In-Reply-To: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Tom Isaacson <Tom.Isaacson@navico.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sunday 15 April 2012 23:20:25 Tom Isaacson wrote:
> Hi,
> 
> Our production software needs to record the NAND chip type used in
> production so we have a record in case we get problems later. The
> information we need is printed out by nand_get_flash_type(), e.g.: NAND
> device: Manufacturer ID: 0x98, Chip ID: 0xd1 (Toshiba NAND 128MiB 3,3V
> 8-bit) My plan is to add some files to the /sys tree to expose this
> information. But the only part of that information stored is the device
> name, in mtd_info.name. Is there any reason why I shouldn't add the
> manufacturer name and ID and the chip ID to mtd_info so they can be
> accessed later on? Or should I add them to mxd_mtd_s (in nand_base.c) and
> keep it local?
> 
> Also, when I add the files to the /sys tree is there any naming convention I
> should follow? I was going to copy the way the eMMC device does it: manfid
> - Manufacturer ID
>   devid - Chip ID
>   manf_name - Manufacturer name
>   dev_name - Chip name

I have the exact same requirement and cooked up a patch to do this for NAND:
http://patchwork.ozlabs.org/patch/94407/

however, to be complete it would also need to expose such informations for SPI 
and NOR flashes, which I have not done yet.
--
Florian
