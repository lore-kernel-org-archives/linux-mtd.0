Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vfxa-0004nv-00
	for mtd-list@infradead.org; Tue, 14 Nov 2000 13:17:14 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vfxZ-0004np-00
	for mtd@infradead.org; Tue, 14 Nov 2000 13:17:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C04E3A.C0282520@smithwicks.softsys.co.at> 
References: <01C04E3A.C0282520@smithwicks.softsys.co.at> 
To: Erwin Authried <eauth@softsys.co.at>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: JEDEC support broken? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Nov 2000 13:16:57 +0000
Message-ID: <12128.974207817@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



eauth@softsys.co.at said:
> With several patches, I'm able to compile most of the MTD devices and
> chip drivers  for uClinux now. There are problems with jedec.c, the
> compiler complains about  the missing "bank_size" in the "map_info"
> structure. What's wrong with jedec.c?

It's been half-ported to the map stuff, but not completely. Remove all 
references to bank_size and keep a start offset in the individual flash 
chip structures.

> Is there a driver that is able to use a physically mapped flash that
> doesn't support CFI? I think it would be best to probe for CFI, and
> then for JEDEC in physmap.c.

Agreed. Let me finish merging the inter_module_xxx() stuff before you do 
that, though.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
