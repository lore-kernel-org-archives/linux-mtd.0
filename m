Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tmmi196-012.telusvelocity.net
	([209.115.196.12] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 118bE4-0000mk-00
	for mtd@infradead.org; Mon, 26 Jul 1999 04:14:53 +0100
Date: Sun, 25 Jul 1999 21:14:27 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: dony <dony.he@huawei.com.cn>
cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: embedded linux help...
In-Reply-To: <004f01bec2a5$6b10ad40$34750981@huawei.com.cn>
Message-ID: <Pine.LNX.3.96.990725210700.6434A-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Wed, 30 Jun 1999, dony wrote:

>    I want to build embedded linux into FLASHROM . But I some questions
> to ask: 

I have been working on exactly this problem and then some for the past
little while. Hopefully I'll release a first draft of my stuff to the MTD
group sometime this week (http://www.linux-mtd.infradead.org/). 

>   1 After BIOS starts, how can it switch to FLASHROM address and load
> the linux kernel there? Do I have to write some BootLoader codes to load
> the kernel (similar to LILO)? If so, How should I begin to write? Can
> you give me some example codes or detailed hints? 

Yes, you will need to write a custom boot loader, when I left off work
Friday I had that doing everything but setting up the final bits to jump
to the kernel. The boot loader is structured as a bios extension and
modeled after the etherboot package - it boots directly from an image
stored in a FFS2 file system for which I have also written a R/W linux
driver for.. To make use it your flash has to map an 8k region of itself
into upper memory. 

>   2 After linux kernel starts, then how it find its root filesystem and
> mount it? Or can I remove the root file system and only let the kernel
> run? 

I've done two things in the past, the first is a simple compressed root
image and using the boot loader to bring that and the kernel into ram -
but that is not very good if you need to store state information, so my
latest focus has been to place a filesystem on the flash, using FFS2, a FS
designed specifically for flash.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
