Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWik-00067K-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:29:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BBA8605.2040301@bigpond.com> 
References: <3BBA8605.2040301@bigpond.com> 
To: brendan.simon@bigpond.com
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd: looking for serial flash storage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:38:01 +0100
Message-ID: <14237.1002533881@redhat.com>
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

brendan.simon@bigpond.com said:
>  I can  not easily use a DiskOnChip as there are only 12 address lines
> from the  CPU board connector available to me.  I am investigating
> serial flash  devices.  Are there any that MTD or Linux supports ???

You don't need 12 address lines for a DiskOnChip, do you? 

> I know about the Atmel data flash devices.  Are they supported by
> Linux  or MTD ???

I'm not sure what devices you're referring to - do you have a reference?

> I am interested in investigating the chipsets that the key ring type
> USB  hard drives use.  Does anyone know what chipsets these are ?
> Does MTD  or Linux support them ???

The flash in those devices is generally just standard NAND flash, which is 
supported by Linux. I have no idea about the microcontrollers which are 
used to do the translation layer and emulate a hard drive.

--
dwmw2
