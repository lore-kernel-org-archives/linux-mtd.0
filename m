Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SbI8-0004OE-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 08:58:32 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SbI7-0004O8-00
	for mtd@infradead.org; Tue, 13 Feb 2001 08:58:31 +0000
Message-ID: <151F3D2AE9F0D3119E480004ACB8EA3701DEC944@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 09:59:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> > I have two AM29LV160D one top and one bottom boot and the both say
> bootloc==0 :(
> > I checked the datasheets and the AM29LV160D does not have 
> 004F (bootloc),
> like the AM29LV320D cips do. I'll try to find some other way 
> of determining
> the boot location.
> 
> How does the erase regions look like for these chips?
> 

When CFI-probed they say that they are identical, but in reality they aren't. That's the problem. The only thing that differs that I have found so far is the device ID. But device IDs aren't the same for different manufacturers...

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
