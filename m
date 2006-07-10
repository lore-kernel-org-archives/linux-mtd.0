Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FzsSV-000178-7p
	for linux-mtd@lists.infradead.org; Mon, 10 Jul 2006 10:53:46 +0100
Subject: Re: [PATCH] PNX8550 NAND flash driver
From: Thomas Gleixner <tglx@linutronix.de>
To: "Vladimir A. Barinov" <vbarinov@ru.mvista.com>
In-Reply-To: <43F1D439.60205@ru.mvista.com>
References: <43A2F819.1040106@ru.mvista.com> <43C69EC2.2070601@mvista.com>
	<43F1D439.60205@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 10 Jul 2006 11:53:16 +0200
Message-Id: <1152525196.30929.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Todd Poynor <tpoynor@mvista.com>,
	linux-mips@linux-mips.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-14 at 15:59 +0300, Vladimir A. Barinov wrote:
> >> +    }
> >> +
> >> +    if (((bytes & 3) || (bytes < 16)) || ((u32) to & 3) || ((u32) 
> >> from & 3)) {
> >> +        if (((bytes & 1) == 0) &&
> >> +            (((u32) to & 1) == 0) && (((u32) from & 1) == 0)) {
> >> +            int words = bytes / 2;
> >> +
> >> +            local_irq_disable();
> >> +            for (i = 0; i < words; i++) {
> >> +                to16[i] = from16[i];
> >> +            }
> >> +            local_irq_enable();
> >
> >
> > Really necessary to disable all irqs around this transfer?  How long 
> > can interrupts be off during that time?
> 
> That is needed since the NAND device is binded to the external XIO bus 
> that could be used by another devices.

Err, you have to protect the whole access sequence then. What protects
the chip against access between the command write and data read ?

If this really is a bus conflict problem, then you need some more
protection than this.

Can you please describe in detail why you think this is necessary. 

	tglx
