Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13MrhB-0003Gx-00
	for mtd-list@infradead.org; Thu, 10 Aug 2000 13:44:25 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Mrh8-0003Gr-00
	for mtd@infradead.org; Thu, 10 Aug 2000 13:44:22 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <ylb66p947pd.fsf@ganglot.ifi.uio.no> 
References: <ylb66p947pd.fsf@ganglot.ifi.uio.no> 
To: Sigurd Urdahl <sigurdur@ifi.uio.no>
Cc: mtd@infradead.org
Subject: Re: Has MTD production quality support for DOC2000? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Aug 2000 13:44:19 +0100
Message-ID: <5585.965911459@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


sigurdur@ifi.uio.no said:
>  I'm quite new at embedding my penguin, and will have to embedd it on
> a DOC2000. But since I'm new at this I am quite confused... I am
> considering going with MTD instead of m-sys drivers, but after
> searching the archives I'm still not sure on wether MTD is stable
> enough for production or not, so please help:=) 

Not yet, if you want to write to the device. Nobody at the moment seems to 
be working very fast on it, and I've been busy with JFFS recently.

Linking the M-Systems drivers into your kernel will place _you_ in violation
of the GPL and you may be sued, so why not help out with the MTD drivers?

The support is mostly there - it just needs to be made a little more robust.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
