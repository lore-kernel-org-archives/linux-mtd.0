Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14abSL-0006hG-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 10:46:09 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14abSJ-0006h9-00
	for mtd@infradead.org; Wed, 07 Mar 2001 10:46:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C0A6FB.DB6056E0@smithwicks.softsys.co.at> 
References: <01C0A6FB.DB6056E0@smithwicks.softsys.co.at> 
To: Erwin Authried <eauth@softsys.co.at>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: 16-bit JEDEC Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Mar 2001 10:45:47 +0000
Message-ID: <26673.983961947@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@softsys.co.at said:
> From the comments in jedec.c I figure out that 16-bit JEDEC flash is
> not supported. There are still several manufacturers that produce
> flash without CFI (e.g., Atmel). If that's true, wouldn't it be better
> to use the already existing cfi implementation to emulate a CFI
> device, instead of implementing all that stuff again for non-CFI
> flash? I believe it wouldn't be much more than having a table with the
> JEDEC id's as an index  that contains all the CFI parameters. 

Yes please, that seems like a sensible plan. :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
