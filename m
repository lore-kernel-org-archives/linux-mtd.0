Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SLsp-0004DP-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 16:31:23 +0000
Message-ID: <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Mon, 12 Feb 2001 17:31:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> The 'bootloc == 3' check is supposed to be for devices with 
> the smallest 
> erase blocks at the top - "Top Boot" devices. Are your 
> devices "Bottom 
> Boot" devices and _still_ have the regions listed backwards? 
> In which case, 
> we should probably omit the check for bootloc - they're _all_ 
> backwards. I 
> put that in because I assumed they'd at least got it right 
> _somewhere_.
> 
> Does anyone else have an AMD bottom-boot device where the CFI 
> table is 
> correct and doesn't need swapping? If so, maybe we're going 
> to have to have 
> a table listing which device IDs need swapping and which don't. 
> 
> Unless someone speaks up fairly quickly, let's assume that 
> _all_ the tables 
> are backwards and take out the check for bootloc. If that 
> breaks later, we 
> can come up with something better.

I have now tested with a bottom boot chip also and it works (it is not swapped and should not be). So the problem is how to find out that the top boot chip is a top boot chip. A table does not sound like a very nice solution, but I don't know of any other. The datasheet for the flash chip does not mention the address used to read bootloc:

	bootloc = cfi_read_query(map, (adr+15)*ofs_factor);

> 
> 
> jonas.holmberg@axis.com said:
> > Secondly, the if-statement on line 660:
> 
> Yeah. Please commit. 
> 

I haven't got commit access...

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
