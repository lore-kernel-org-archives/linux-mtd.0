Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SIyY-0001Ve-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 13:25:06 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SIyW-0001VV-00
	for mtd@infradead.org; Mon, 12 Feb 2001 13:25:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <151F3D2AE9F0D3119E480004ACB8EA3701DEC940@cluster01.axis.se> 
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC940@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Feb 2001 13:24:22 +0000
Message-ID: <25087.981984262@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
>      /* Wheee. Bring me the head of someone at AMD. */
>         if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
>                 printk("Swapping erase regions for broken CFI table\n");

> The expression is false, but the EraseRegionInfo should be swapped. I
> have no solution to that problem. Can you think of one? 

Well, if you can bring me the person at AMD responsible for making the CFI 
table report the erase regions in the wrong order in the first place, I can 
certainly think of a few suggestions. OK, I _know_ the CFI spec doesn't 
explicitly say that the erase regions listed in the CFI tables have to be 
in order - but a modicum of common sense would have helped. 

The 'bootloc == 3' check is supposed to be for devices with the smallest 
erase blocks at the top - "Top Boot" devices. Are your devices "Bottom 
Boot" devices and _still_ have the regions listed backwards? In which case, 
we should probably omit the check for bootloc - they're _all_ backwards. I 
put that in because I assumed they'd at least got it right _somewhere_.

Does anyone else have an AMD bottom-boot device where the CFI table is 
correct and doesn't need swapping? If so, maybe we're going to have to have 
a table listing which device IDs need swapping and which don't. 

Unless someone speaks up fairly quickly, let's assume that _all_ the tables 
are backwards and take out the check for bootloc. If that breaks later, we 
can come up with something better.


jonas.holmberg@axis.com said:
> Secondly, the if-statement on line 660:

Yeah. Please commit. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
