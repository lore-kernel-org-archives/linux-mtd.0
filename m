Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14px7y-0008WG-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 19:56:34 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14px7x-0008VA-00
	for mtd@infradead.org; Wed, 18 Apr 2001 19:56:33 +0100
Message-ID: <3ADDE38C.249F0A11@daniel.com>
Date: Wed, 18 Apr 2001 13:57:16 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Marcio Koch <koch@inf.pucrs.br>
CC: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: Intel Flash
References: <20010418154546.C6248@sirrah.inf.pucrs.br> <20010418155001.A6711@sirrah.inf.pucrs.br>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Marcio Koch wrote:

> TE28F320

^^^^^^^^^^^^^ This is the part #. You can ignore the rest of the stuff.
Go to www.intel.com and download the datasheet on this part and see if it is a
CFI compatable NOR flash or not.

If not CFI, but is NOR, then try to use the JDEC module, rather than the CFI
module. If Not NOR (i.e. if NAND)
then I don't know.

Hope this helps.

Vipin
P.S. This is really a MTD issue and you will probably have more luck posting
to that list. I've CC to that list if you
need the email.

>
> B3BA110
> U9490626A
> (c)1998
>
> Does anybody know if this flash is supported by linux ? If so what kernel
> and mtd code should I use ?
>
> For MPC8xx.
>
> I'm using kernel 2.4.3-pre4 and it fails when I try to load the physmap
> module.
>
> Here is what I did and the error I got:
>
> sh-2.03# modprobe -a mtdchar mtdblock cfi_cmdset_0001  map_rom cfi_probe
> sh-2.03# lsmod
> Module                  Size  Used by
> cfi_probe               7920   0  (unused)
> map_rom                 1072   0  (unused)
> cfi_cmdset_0001         8000   0  (unused)
> mtdblock                6528   0  (unused)
> mtdchar                 5408   0  (unused)
> mtdcore                 2976   2  [mtdblock mtdchar]
> sh-2.03# modprobe -a physmap
> physmap flash device: 3fffff at fe000000
> Physically mapped flash: Found no CFI device at location zero
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: init_module: Device
> not configured
> Hint: insmod errors can be caused by incorrect module parameters, including
> invalid IO or IRQ parameters
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: insmod
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o failed
> /lib/modules/2.4.3-pre4/kernel/drivers/mtd/physmap.o: insmod physmap failed
>
> Any help would be appreciated.
>
> Thanks,
>
> Marcio Koch
> koch@inf.pucrs.br
> PUCRS/ELinux
>
> To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
> the body of a message to majordomo@axis.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
