Received: from f87.pav1.hotmail.com ([64.4.31.87] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zcSX-0003HB-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 13:30:33 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: Re: CFI and driver code for AM29LV320D ..newbie query
Date: Thu, 10 Oct 2002 12:29:57 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F8746syVqFbCtqRmaYQ0001d91d@hotmail.com>
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

OK. So a 0x98 write to (0x55 + flash_baseptr) and then a read at 
flash_baseptr should give me all the CFI query related data. Right?.

Sorry for the dumb question. My second day at development on linux ;)
Where do I get the code for the standard linux driver for flash.

Thanks and Regards,
Vijay


> > Have a query. Can I get CFI and driver code for AM29LV320D anywhere?.
> > Going thru AMD site found some cfi code, but it didn't have reference
> > to this flash.
>
>The whole point in CFI is that you don't _need_ to have a specific
>reference to the chip in question. The standard Linux drivers should drive
>it just fine.
>
>With the exception that AMD managed to screw up the CFI table on some of
>the chips -- but we work around that.
>
>--
>dwmw2




_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx
