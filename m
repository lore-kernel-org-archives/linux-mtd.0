Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Xif-0007Ym-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 17:42:05 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Xid-0007Yg-00
	for mtd@infradead.org; Thu, 30 Nov 2000 17:42:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0011301739080I.00533@frumious.unidec.co.uk> 
References: <0011301739080I.00533@frumious.unidec.co.uk>  <44632C76B97BD211AF6B00805FADCAB202D738E9@exchange.saltaire.pace.co.uk> 
To: john@frumious.unidec.co.uk
Cc: Simon Wood <Simon.Wood@pace.co.uk>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: M-System DOC Millennium with MTD. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Nov 2000 17:41:52 +0000
Message-ID: <13967.975606112@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


john@frumious.unidec.co.uk said:
>   The problem, I think (haven't gone far enough through the code) is
> that this firmware doesn't have the hooks that the MTD drivers use to
> identify the chip, but there is something in there that looks enough
> like the doc1000 signature for it to be mis-identified.
>   FWIW this is purely theoretical, but what you've done exactly
> follows what I did about a month ago, and it's working here again now.
> 

You can also work round this by disabling CONFIG_MTD_DOCPROBE_55AA


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
