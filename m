Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112Fl7-0006Ff-00
	for mtd@infradead.org; Thu, 8 Jul 1999 16:06:45 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 112Fl7-0003rh-00; Thu, 8 Jul 1999 16:06:45 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 112Fl7-0001R8-00; Thu, 8 Jul 1999 16:06:45 +0100
To: mtd@infradead.org
Subject: Re: Disk-On-Chip progress. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Jul 1999 16:06:45 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E112Fl7-0001R8-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


David.Woodhouse@mvhi.com said:
> now we're talking, and they seem fairly genuinely willing to work with
> us to  find a solution to the problem. It seems as if we'll be able to
> reach an  agreement fairly soon. I certainly hope so.

They seem to be labouring under the impression that they risking losing their
intellectual property if they allow drivers to be released under GPL.

There are two aspect to it: firstly the actual hardware interface to the 
Disk-On-Chip, and secondly the NFTL filesystem. 

Looking at the hardware interface first: M-Systems seem to believe that the 
availability of driver source code would allow competitors to duplicate their 
hardware.

This is insane, because the hardware is covered by numerous patents (search for
M-Systems on www.patents.ibm.com and you'll see them). So they've got no real
reason for believing that their hardware would be duplicated. 

Quite frankly, I believe it would be easier to reproduce the hardware from the 
patents than it would from the driver software. Either way, it would be fairly 
difficult. You can't just look at the overview or the interface and 
automatically get all the details of the ASIC right first time, without 
spending months ironing out the bugs.


With NFTL, their position is slightly more understandable - but only slightly.
They don't want their filesystem to be used on other manufacturers' hardware, 
which is understandable. But I don't agree that there's a problem with having 
a GPL'd version.

There's already a GPL'd implementation of FTL, their original flash filesystem.
They hold patents on it, and it's restricted for use only with PCMCIA devices. 

Any competing manufacturer who sold devices using FTL would be in violation of 
the patents. Exactly the same would happen with NFTL - so they have no reason 
to be concerned about releasing a GPL'd version of NFTL either.

I'm trying to keep the two separate, and concentrate on the first - if we can
drive the Disk-On-Chip hardware, then we can put another filesystem on it. But 
if we can't, there's no chance of it being useful at all.

Having NFTL would also be useful, because it would allow interoperation 
between Linux and other operating systems on the device, but in practice 
you're unlikely to want a dual-boot system on the Disk-On-Chip, so it's not 
the end of the world if we don't get it. Of course, there's no reason for them 
to withold it, but I'm concentrating on the hardware interface first.




----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
