Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12EEwD-0002uP-00
	for mtd-list@infradead.org; Fri, 28 Jan 2000 17:12:01 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12EEwC-0002uJ-00
	for mtd@infradead.org; Fri, 28 Jan 2000 17:12:00 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12EEwB-0003gv-00
	for mtd@infradead.org; Fri, 28 Jan 2000 17:11:59 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12EEwB-0000nb-00; Fri, 28 Jan 2000 17:11:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12DseX-0005jo-00@devel2.axiom.internal> 
References: <E12DseX-0005jo-00@devel2.axiom.internal> 
Cc: mtd@infradead.org
Subject: Re: Loading Grub from DiskOnChip. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 28 Jan 2000 17:11:59 +0000
Message-Id: <E12EEwB-0000nb-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've now updated my Grub loader so that it's capable of loading the new GNU 
Grub, which has a slightly different loading convention than Erich Boleyn's 
original versions.

As GNU Grub can also get significantly larger than the old versions, I've 
updated the loader so it's capable of loading files bigger than 64K.

It's almost feasible at this point to decide you want to load a kernel 
directly from the flash, rather than just a bootloader.

Whatever you place in your 'pre_stage2' file will get loaded to 0x08200, then 
jumped to with CS:IP 0000:8200.

It's available from ftp://ftp.infradead.org/pub/mtd/doc-grub-20000128.tar.gz

(And no, I don't know why I called the last one '20000121' when in fact I 
only put it there yesterday - I only just noticed that myself :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
