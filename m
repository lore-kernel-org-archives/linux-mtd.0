Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178Lwm-0003Yw-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 15:09:36 +0100
Message-ID: <008101c1fce3$ae6588b0$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <006401c1fcde$bc00e8c0$0200010a@WT0136>  <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com>  <9456.1021556252@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Thu, 16 May 2002 10:12:15 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> >  I have also tried replacing the ioremap call in init)physmap with
> > ioremap_nocache() but with no byte swapping. Should I try it with
> > LE_BYTE_SWAP?
>
> Yes, that could be useful -- although I don't think you should have got a
> cached mapping by default, it's worth a try.
The ioremap_nocache with LE_BYTE_SWAP didn't help. I will return it ioremap.

>
> Can you make it print the contents of the region at 0x8000000 and check it
> matches what you expect to be in the flash chip?
I tried printk("HKC: Raw output of flash address =0x%x\n", *(unsigned
int*)0x8000000) but resulted in kernel panic. I'm starting to think this is
a virtual memory problem. Do I need a TLB entry for the device?

> Are you sure that's
> supposed to be 0x8000000 and not 0x80000000?
Yes, I have double-checked the hardware specs. I also have the board and
flash working with VxWorks which has a flat memory model.

Any other ideas?

Thanks.

HK
