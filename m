Received: from f94.pav1.hotmail.com ([64.4.31.94] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zdOW-0003MD-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 14:30:28 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: Re: CFI and driver code for AM29LV320D ..newbie query
Date: Thu, 10 Oct 2002 13:29:55 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F942WnIstaBE8v3dUh70001d6c9@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David,

Thanks. Do we have a list of devices supported by the mtd code?. Searching 
thru the code,embeddedLinuxWorks.com/db.html and
linux-mtd.infradead.org, am still unable to locate any reference
(part number / device id?) to AM29LV320D while
the rest of the AMD family(and rest of the families) seems to be there!!!.

Please let me know what I am missing..

regards,
Vijay


>From: David Woodhouse <dwmw2@infradead.org>
>To: "vijay vijay" <vijay_peshkar@hotmail.com>
>CC: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
>Subject: Re: CFI and driver code for AM29LV320D ..newbie query Date: Thu, 
>10 Oct 2002 13:33:08 +0100
>
>
>vijay_peshkar@hotmail.com said:
> >  OK. So a 0x98 write to (0x55 + flash_baseptr) and then a read at
> > flash_baseptr should give me all the CFI query related data. Right?.
>
>Er, I mean that calling the 'cfi_probe' function should return you a full
>MTD driver for the appropriate chip. You don't need to know the details,
>except that you need to turn on the appropriate CFI probing and AMD command
>set code in your kernel.
>
> > Sorry for the dumb question. My second day at development on linux ;)
> > Where do I get the code for the standard linux driver for flash.
>
>See drivers/mtd/maps/physmap.c and configure it with the appropriate
>parameters for how the flash is wired up on your boards.
>
>--
>dwmw2




_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx
