Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rg7Y-00052s-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 14:11:16 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rg7X-00052m-00
	for mtd@infradead.org; Mon, 23 Apr 2001 14:11:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01042312512000.00451@rob> 
References: <01042312512000.00451@rob>  <Pine.LNX.4.21.0104161208120.12472-100000@dagobert.svc.sysgo.de> <01041713245700.01481@rob> <005801c0cbd3$2bdb3c60$4d02010a@lrpeople.com> 
To: rob@sysgo.de
Cc: "Alexander Melichenko" <AlexanderM@lrpeople.com>, mtd@infradead.org
Subject: Re: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 14:10:38 +0100
Message-ID: <6654.988031438@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rob@sysgo.de said:
>  Some Background info: 
> In order to persuade the BIOS to boot from the Flash, you have to
> enable it's "disk" emulation:  the BIOS can treat each of the flash
> banks as an emulated disk. So far so good, but: these "disk" functions
> are only accessible through the BIOS int 13h call, thus, you can't
> access it from Linux.

> Worse even, the BIOS insists on doing "wear levelling" (i.e. it tries
> to distribute erases evenly over all flash blocks). It does this by
> remapping flash blocks when they have seen to many write erases.
> Therefore,  if you write a continuous stream of data to the flash
> using the BIOS int13h function, the BIOS will scatter your data all
> over the flash memory in an unpredictable way. There is no way (other
> than buying a customized BIOS from General Software) to disable his
> wear levelling. So the bottom line is: 

Has nobody tried to reverse-engineer the format they use for this and 
provide a driver in Linux? See the FTL and NFTL drivers for examples and 
ideas on how the BIOS might be doing the translation.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
