Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SarH-0004I8-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 08:30:47 +0000
Message-ID: <151F3D2AE9F0D3119E480004ACB8EA3701DEC943@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Johan Adolfsson <johan.adolfsson@axis.com>,
        David Woodhouse
	 <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 09:31:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> What does the bootloc say? Does it says something other the 2 and 3?
> 

I have two AM29LV160D one top and one bottom boot and the both say bootloc==0 :(
I checked the datasheets and the AM29LV160D does not have 004F (bootloc), like the AM29LV320D cips do. I'll try to find some other way of determining the boot location.

> > If the erase regions are listed the wrong way round _and_ 
> the byte in the
> > extended header isn't set appropriately to tell you so, 
> these AMD chips
> > really are broken. We need to work round them explicitly 
> with a table of
> > JEDEC IDs for the broken chips, or just reject them and buy 
> Intel chips
> > instead.
> 

We do buy a lot of AMD compatible flash chips, so we have to come up with a solution I'm afraid.

> We need a table like that for other AMD compatible non CFI 
> chips as well
> (e.g. Toshiba).
> Jonas has a solution that seems to work here, I guess it 
> should go into the
> mtd tree soner or later?
> We probably want the check against the list before doing the 
> CFI probe.

I'm also starting to dislike AMD flash chips...

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
