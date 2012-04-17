Received: from zmc.proxad.net ([212.27.53.206])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SK4uH-0002v4-Gb
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 09:41:09 +0000
Message-ID: <4F8D3A50.5000203@freebox.fr>
Date: Tue, 17 Apr 2012 11:39:28 +0200
From: Florian Fainelli <ffainelli@freebox.fr>
MIME-Version: 1.0
To: Tom Isaacson <Tom.Isaacson@navico.com>
Subject: Re: Exposing NAND chip information
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>,
 <8396132.PHseJUhzUe@bender>
 <B36E81988B048A4FA3600EDE585F756BD0F7AC@EXCH02-AKLNZ.MARINE.NET.INT>
In-Reply-To: <B36E81988B048A4FA3600EDE585F756BD0F7AC@EXCH02-AKLNZ.MARINE.NET.INT>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tom,

Le 04/17/12 01:51, Tom Isaacson a écrit :
>> I have the exact same requirement and cooked up a patch to do this for NAND:
>> http://patchwork.ozlabs.org/patch/94407/
>
> Ah, your patch shows you've added the sysfs files in mtdcore.c, which means they'll show up in:
> /sys/class/mtd/..

Yes, when I first asked what was the best place to add those attributes, 
I initially wanted to create something like /sys/class/mtd/nand0 or such 
and put attributes there, but Artem preferred having them in 
/sys/class/mtd/mtd<N>/

> The code I've done adds them in mxc_nd2.c (the device I have) so they appear in:
> /sys/devices/platform/mxc_nandv2_flash.0/..
> Obviously this only works for one type of flash right now, but I was thinking of extending all the separate uses of DEVICE_ATTR and manage_sysfs_files() to call back to a generic sysfs function in nand_base.c so these new parameters appear for all NAND devices.
> I can't find anything online that gives a guide to where files should be added to sysfs - is there such a thing, or do people just make it up as they go along?
>
>> however, to be complete it would also need to expose such informations for SPI
>> and NOR flashes, which I have not done yet.
>
> I don't have access to those devices so I can't test any code I might attempt.

I do, it's just that I have been lazy on working again on this.
--
Florian
