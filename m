Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zcV6-0003HU-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 13:33:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F8746syVqFbCtqRmaYQ0001d91d@hotmail.com> 
References: <F8746syVqFbCtqRmaYQ0001d91d@hotmail.com> 
To: "vijay vijay" <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: CFI and driver code for AM29LV320D ..newbie query 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Oct 2002 13:33:08 +0100
Message-ID: <15664.1034253188@passion.cambridge.redhat.com>
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

vijay_peshkar@hotmail.com said:
>  OK. So a 0x98 write to (0x55 + flash_baseptr) and then a read at
> flash_baseptr should give me all the CFI query related data. Right?.

Er, I mean that calling the 'cfi_probe' function should return you a full
MTD driver for the appropriate chip. You don't need to know the details, 
except that you need to turn on the appropriate CFI probing and AMD command 
set code in your kernel.

> Sorry for the dumb question. My second day at development on linux ;)
> Where do I get the code for the standard linux driver for flash.

See drivers/mtd/maps/physmap.c and configure it with the appropriate 
parameters for how the flash is wired up on your boards.

--
dwmw2
