Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Cg1l-000838-00
	for mtd-list@infradead.org; Mon, 24 Jan 2000 09:43:17 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Cg1j-000832-00
	for mtd@imladris.mvhi.com; Mon, 24 Jan 2000 09:43:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <199912281744.LAA27404@sisko.awpi.com> 
References: <199912281744.LAA27404@sisko.awpi.com> 
To: "Brian K. Michalk" <michalk@sisko.awpi.com>
Cc: mtd@imladris.mvhi.com
Subject: Re: fdisk oddities 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 24 Jan 2000 09:53:28 +0000
Message-Id: <E12CgBc-0003OX-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


michalk@sisko.awpi.com said:
>  It seems as though the doc2000 is not storing cylinders, sectors or
> heads after fdisk exits.  I manually set them, and used very small
> values just in case there was some sort of problem with the 72 MB doc
> I have.  Here is the script:

I get this on hard drives. They make up the geometry on boot, and I believe 
that they only read it from the partition table if they're _really_ confused 
and can't work out what it ought to be.

If you _really_ want to do it, you can alter the NFTL code so that you can 
tell it what the geometry should be - just like you can tell the kernel on its 
command line. But it shouldn't really help. If there are problems with the 
72 Mb device, they're not going to go away if you tell it the physical 
geometry is different - it'll still use all the flash anyway.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
