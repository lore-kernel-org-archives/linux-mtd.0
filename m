Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fIyM-0000kh-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 09:58:06 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fIyM-0000kb-00
	for mtd@infradead.org; Wed, 12 Apr 2000 09:58:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com> 
References: <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com> 
To: Udi Finkelstein <udif@bigfoot.com>
Cc: mtd@infradead.org
Subject: Re: DOC2000 and Kernel 2.3 ?? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Apr 2000 09:58:03 +0100
Message-ID: <1390.955529883@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


udif@bigfoot.com said:
>  Now the big Question: What is the best (any) way to get a doc2000
> working with the 2.3 kernel?

> I see 3 possible options:

> 1. Hacking the original m-sys 2.2.x driver to work under 2.3.x. Is
> this possible? How much of the binary only portion depends on the
> 2.2.x kernel API? Can it be adapted to 2.3.x by changing only the
> skeleton code around it?

That could possibly work, with a bit of hacking.

> 2. Using the Axis JFFS code. Is it stable? does it work at all?

It's not clear yet whether it would work on NAND flash. 

> 3. using the MTD FFS code. Does it finally work under 2.3.x? 

I'm developing primarily under 2.3 - but my write support for NFTL still 
isn't reliable enough for production use.

In order of preference, I'd say you should go for 2,3,1 - and you're 
welcome to help with the code for any of them.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
