Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141U0Z-0006LU-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 13:44:19 +0000
Date: Thu, 30 Nov 2000 23:44:08 +1000
Message-Id: <200011301344.XAA32650@singularity.tronunltd.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: inter-module-2.2.17 patch
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: lkhatskevitch@hotmail.com, mtd@infradead.org
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Works like a bought one :)

Thanks Dave - and thanks to Levi too.


  ----- Original Message -----
>From: "David Woodhouse" <dwmw2@infradead.org>
>To: <mark.langsdorf@amd.com>
>Subject:  Re: inter-module-2.2.17 patch
>Date: Thu, 30 Nov 2000 12:08:31 +0000
>
> 
> mark.langsdorf@amd.com said:
> >  What should I be doing to get the latest MTD code to  compile against
> > 2.2.17? 
> 
> OK, I've just put a complete patch for the inter_module_xxx stuff along 
> with the latest CVS code into CVS. 
> 
> It's patches/mtd-patch-2.2.17-20001130
> 
> I've compiled in the DiskOnChip 2000 driver, dug a doc2000 eval board out 
> of a drawer and booted it. It finds the device and complains a lot about 
> bad ECC, but that's not very surprising because it was my Grub test device 
> and probably doesn't have a valid NFTL on it. 
> 
> 
> --
> dwmw2
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
