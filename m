Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cW6H-0003Fq-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 17:27:17 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14cW6G-0003Fk-00
	for mtd@infradead.org; Mon, 12 Mar 2001 17:27:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01031218235800.02378@rob> 
References: <01031218235800.02378@rob> 
To: rob@sysgo.de
Cc: mtd@infradead.org
Subject: Re: Swich statement in cfi_probe.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Mar 2001 17:27:10 +0000
Message-ID: <27977.984418030@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rob@sysgo.de said:
>  I noticed that in cfi_probe.c, routine cfi_probe_new_chip(), the
> cases following the switch(map->buswidth) are not terminated by a
> break. Thus if the probe fails for the given buswidth, the code will
> try all remaining buswidths too.

> Is that a bug or does it serve a purpose (if so, which ?)

Not sure. If it has a purpose, the only possibility I can think of off the 
top of my head is to work around people giving the wrong buswidth. And I 
think the code would probably break then anyway.

So it's probably a bug. If nobody shouts I'll add in the missing breaks.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
