Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bmVc-0005w0-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 17:50:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202151806180.9629-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202151806180.9629-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org,
    J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Feb 2002 18:02:09 +0000
Message-ID: <30752.1013796129@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

rob@sysgo.de said:
>  OK, will look into this. I stole that part from Aleksander
> Sanochkin's patch. I did test it, BTW (with erase/eraseall), and it
> worked. Apparently, these tools erase the device block by block. Is it
> legal/supported at all to make erase calls covering multiple blocks or
> partial blocks ? 

Partial blocks is impossible, so not supported. Multiple blocks is 
permitted.

>  Hmm, I agreed with you about this before I actually attempted coding
> it this way, but the code turned out to be a mess. IMHO, it is _much_
> cleaner as a seperate layer. What would be the advantage of merging it
> into the partition code ?

Fewer wrapper layers to go through. Look at the part_read() call I 
implemented - is that really so bad for the case where people don't have 
multiple 'sections' in each partition?

> - significant effort, specifically since the current partitioning
>   code is scheduled for replacement by Jörn's code, so I'd have to
>   do it twice. 

Jörn's code needs to provide this functionality to be merged - making sure 
there's no regression is part of the work necessary for merging the new 
stuff, and wouldn't necessarily fall to you.

--
dwmw2
