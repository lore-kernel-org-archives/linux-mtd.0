Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SayH-0004If-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 08:38:01 +0000
Message-ID: <032a01c09597$45f88890$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "Jonas Holmberg" <jonas.holmberg@axis.com>,
        "Johan Adolfsson" <johan.adolfsson@axis.com>,
        "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC943@cluster01.axis.se>
Subject: Re: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 09:30:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


----- Original Message -----
From: Jonas Holmberg <jonashg@axis.com>
To: Johan Adolfsson <johana@axis.com>; David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Sent: Tuesday, February 13, 2001 09:31
Subject: RE: Problems with cfi_cmdset_0002.c


> > What does the bootloc say? Does it says something other the 2 and 3?
> >
>
> I have two AM29LV160D one top and one bottom boot and the both say
bootloc==0 :(
> I checked the datasheets and the AM29LV160D does not have 004F (bootloc),
like the AM29LV320D cips do. I'll try to find some other way of determining
the boot location.

How does the erase regions look like for these chips?

/Johan




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
