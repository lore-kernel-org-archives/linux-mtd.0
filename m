Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12uIuv-0004v0-00
	for mtd-list@infradead.org; Tue, 23 May 2000 18:56:33 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12uIuu-0004uu-00
	for mtd@infradead.org; Tue, 23 May 2000 18:56:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005231131490.23843-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0005231131490.23843-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: Dvir Oren <dviro@lucidvon.com>, mtd@infradead.org
Subject: Re: Write support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 May 2000 18:56:30 +0100
Message-ID: <3012.959104590@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


phiggins@transzap.com said:
>  I wish I could still do this...unfortunately, I took my chances
> already and used doc_loadbios to write the grub firmware onto the DoC,
> and now it won't boot on my system which has a floppy (the only way
> I've able to get DOS to boot),

Strange. What does it do instead? What firmware did you load with 
doc_loadbios?

> but I can still get it to boot Linux with PXE (netboot). 
> Would something like:

> dd if=/dev/zero of=/dev/mtd0

> accomplish the same thing?

You don't need to set all bits to zero, and it may confuse the M-Systems 
drivers - they start at one when erased.

Stick a loop into mtd/util/erase.c if you want it to erase a whole device.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
