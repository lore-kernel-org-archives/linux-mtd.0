Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141SWH-00063B-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 12:08:57 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141SWG-000631-00
	for mtd@infradead.org; Thu, 30 Nov 2000 12:08:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F1F5@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F1F5@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org, Simon Wood <Simon.Wood@pace.co.uk>
Subject: Re: inter-module-2.2.17 patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 12:08:31 +0000
Message-ID: <2385.975586111@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
>  What should I be doing to get the latest MTD code to  compile against
> 2.2.17? 

OK, I've just put a complete patch for the inter_module_xxx stuff along 
with the latest CVS code into CVS. 

It's patches/mtd-patch-2.2.17-20001130

I've compiled in the DiskOnChip 2000 driver, dug a doc2000 eval board out 
of a drawer and booted it. It finds the device and complains a lot about 
bad ECC, but that's not very surprising because it was my Grub test device 
and probably doesn't have a valid NFTL on it. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
