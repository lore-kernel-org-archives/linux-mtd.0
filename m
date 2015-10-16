Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn3zv-0002sT-U4
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 12:20:36 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Zn3zS-0001uE-5G
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 14:20:06 +0200
Received: from 95.143.241.142 ([95.143.241.142])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 14:20:06 +0200
Received: from niziak by 95.143.241.142 with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 14:20:06 +0200
To: linux-mtd@lists.infradead.org
From: Wojciech Nizinski <niziak@spox.org>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
Date: Fri, 16 Oct 2015 14:17:12 +0200
Message-ID: <mvqps8$3tb$1@ger.gmane.org>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03.02.2014 09:51, Wiedemer, Thorsten (Lawo AG) wrote:
> Hi list,
>
> in July, 2013, a thread named "UBI leb_write_unlock NULL pointer Oops" was started, but not resolved.
> We have kernel 3.6.11 running on an Freescale i.MX257 (arm926) with UBIFS on a NAND Flash.
> I run into the same problem. Is there a solution for this problem ?
>
> I already added the patches:
> - 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
> - 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug
> But this doesn't resolve the problem.
>
> If necessary, I will provide further information about our system, but perhaps someone can give me a hint where I can find the solution if it exists already.
>

Hello!
Last time I met with the same problem on ARM926 based platform and 
Kernel 3.10.88. After applying all hints from this thread I found that 
usb driver (dwc_otg) was corrupting memory by writing into previously 
freed memory.

Bug was detected using kernel settings:
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB=y
CONFIG_SLUB_DEBUG_ON=y

Which immediately gives nice result:
"BUG kmalloc-64 (Tainted: G           O): Poison overwritten"

Good for me, the same USB driver is used on Raspberry Pi and problem was 
fixed: "[PATCH 042/680] dwc_otg: fix bug in dwc_otg_hcd.c resulting in 
silent kernel memory corruption, escalating to OOPS under high USB load."
