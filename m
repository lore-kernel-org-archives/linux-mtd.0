Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141UKJ-0006Pg-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 14:04:43 +0000
Date: Fri, 1 Dec 2000 00:04:33 +1000
Message-Id: <200011301404.AAA00314@singularity.tronunltd.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: inter-module-2.2.17 patch
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: <lkhatskevitch@hotmail.com>, <mtd@infradead.org>
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



bit of a dodgy ... when I mounted it, I got that mounting unchecked filesystem, go run 
e2fsck message (which is fine), ... buuuuut ... after cd'ing to the mounted file system
and doing 
ls -al
ls -al

I got the "NFTL_findfreeblock: there are too few free EUNs" ... which is odd, since the
only time I've seen them before is after a heap of DoC disk writes ...


hmm .. must have been time delayed from the mount ... hasn't reoccurred ... just copied
a file to it ... no error .. sync'd it .. got that NFTL_findfreeblock error again .. the file is still 
there tho ... reboot ... remount ... yep file is still in-tact.

Looks like its fine ... does it do a free block check when its first mounted (in RW mode) ?



  ----- Original Message -----
>From: "David Woodhouse" <dwmw2@infradead.org>
>To: "Ian" <Relativity@humanheuristic.com>
>Subject:  Re: inter-module-2.2.17 patch
>Date: Thu, 30 Nov 2000 13:45:22 +0000
>
> 
> Relativity@HumanHeuristic.com said:
> >  Works like a bought one :)
> > Thanks Dave - and thanks to Levi too. 
> 
> Can you write to the device?
> 
> --
> dwmw2
> 
> 
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
