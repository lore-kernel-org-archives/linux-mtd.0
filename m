Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14RG8A-0000ke-00
	for mtd-list@infradead.org; Fri, 09 Feb 2001 16:10:42 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14RG88-0000kX-00
	for mtd@infradead.org; Fri, 09 Feb 2001 16:10:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010209160048.20512.qmail@softhome.net> 
References: <20010209160048.20512.qmail@softhome.net> 
To: oskaya@softhome.net
Cc: mtd@infradead.org
Subject: Re: m-systems doc 2000 : no free space left 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Feb 2001 16:10:20 +0000
Message-ID: <9992.981735020@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


oskaya@softhome.net said:
> It runs without any problems for some duration .Later it gives an
> error with an argh message stating that it has reached to the end of
> the device and no free space is left . 

You didn't quote the message so I can only guess - but I think this is a 
problem which I've recently fixed in the CVS tree. Did you see the message
"Cannot make free space." ?

> Then i thought that i should grab the latest version from mtd site .
> The snapshot i have downloaded doesn't seem to compile in this case .
> Any idea... 

It should compile. Again, you didn't quote the errors so I haven't got any 
chance to tell you what's wrong.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
