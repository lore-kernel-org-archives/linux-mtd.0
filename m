Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mChn-0005z7-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 11:13:47 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mChm-0005z1-00
	for mtd@infradead.org; Thu, 19 Oct 2000 11:13:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <14716.971931289@ocs3.ocs-net> 
References: <14716.971931289@ocs3.ocs-net> 
To: mtd@infradead.org
Cc: Keith Owens <kaos@ocs.com.au>
Subject: Re: Removal of get/put_module_symbol, 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Oct 2000 11:13:42 +0100
Message-ID: <27104.971950422@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kaos@ocs.com.au said:
>  Sources that issue request_module() then use get_module_symbol() to
> look inside the module will be changed to use a registration system,
> as almost every module already does. 

That makes sense - dunno why I didn't see that in the first place. 
It's now on my TODO list for the DiskOnChip and CFI drivers. I'll see if I 
can find a volunteer to make it happen slightly faster.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
