Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SLyP-0004Mb-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 16:37:09 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SLyN-0004MT-00
	for mtd@infradead.org; Mon, 12 Feb 2001 16:37:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se> 
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Feb 2001 16:36:34 +0000
Message-ID: <14127.981995794@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
>  I have now tested with a bottom boot chip also and it works (it is
> not swapped and should not be). So the problem is how to find out that
> the top boot chip is a top boot chip. A table does not sound like a
> very nice solution, but I don't know of any other. The datasheet for
> the flash chip does not mention the address used to read bootloc:

> 	bootloc = cfi_read_query(map, (adr+15)*ofs_factor); 

The datasheet for the AM29LV320D lists it - page 23 of AMD publication 
#23579, Rev A; issued Nov 1, 2000.

Personally, my inclination would be to return the poxy things to AMD
complaining that the CFI tables are broken. How many are you buying?

Otherwise, I think the JEDEC ID may be the only option.


jonas.holmberg@axis.com said:
>  I haven't got commit access...

Gimme SSH public key.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
