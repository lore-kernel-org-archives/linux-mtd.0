Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Q3x9-0000Me-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 08:58:23 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Q3x7-0000MY-00
	for mtd@infradead.org; Tue, 06 Feb 2001 08:58:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003c01c08fd2$db3d36a0$016310ac@archimede> 
References: <003c01c08fd2$db3d36a0$016310ac@archimede> 
To: "Alessandro Staltari" <a_staltari@yahoo.com>
Cc: mtd@infradead.org
Subject: Re: Maybe FAQ, but I don't know te answer... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Feb 2001 08:58:11 +0000
Message-ID: <15502.981449891@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


a_staltari@yahoo.com said:
> I'm using M-System's DiskOnChip2000. I'd like to use mtd drivers
> provided within the Linux kernel 2.4.0 but some questions arise: Which
> is the most reliable GPL'd flash translation layer available in the
> linux 2.4.0 kernel?

On the DiskOnChip, you need to use NFTL.

> Is it ready to be used in production? 
I'm using M-System's DiskOnChip2000. I'd like to use mtd drivers provided
within the Linux kernel 2.4.0 but some questions arise:
Which is the most reliable GPL'd flash translation layer available in the
linux 2.4.0 kernel? Is it ready to be used in production?
Which boot loader should I use to boot the system from the flash?

Almost. There are some problems with the larger devices, but it should be 
OK on the smaller (<36M) ones. The problems with larger devices should be 
fixed soon - as soon as someone actually has time to work on it, basically.

> Which boot loader should I use to boot the system from the flash? 

You can leave the original firmware in place, which makes it pretend to be 
a BIOS-supported hard drive. So you can use any bootloader, although some 
versions of LILO have problems with the amount of memory that the firmware 
eats. We can also load Grub into the DiskOnChip in place of the original 
firmware, and we've done about 90% of the work required to make grub 
capable of loading a kernel from the DiskOnChip - just needs a few bugs 
fixed.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
