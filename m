Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Qae-00012h-Hg
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 17:20:44 -0500
From: Gareth Bult <gareth@linux.co.uk>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050307220138.GF26318@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
	<1110231980.11310.40.camel@squizzey.bult.co.uk>
	<20050307220138.GF26318@wohnheim.fh-wedel.de>
Content-Type: text/plain
Date: Mon, 07 Mar 2005 22:20:38 +0000
Message-Id: <1110234038.11284.62.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The old driver also got the interface wrong.  In your example, with
> just a single device to use, it doesn't matter.  But once you deal
> with several devices, the old variant really sucks.  That is why I
> changed it (and why I renamed the driver).

If you were to change the parameter name back to "device", it would be
compatible with the old driver. (pretty much) Hence you'd not need to
change the name (?)

.. initially all my system worked with the pre-existing driver. The new
code was a drop-in replacement and I didn't need to make changes to my
system.

Can you not make the parameter handling "sane" and still keep the syntax
such that it's backwards compatible ?

--
Linux.co.uk - promoting open source software in the UK
"If you have an apple and I have an apple and we exchange apples then
you and I will still each have one apple. But if you have an idea and I
have an idea and we exchange these ideas, then each of us will have two
ideas." - George Bernard Shaw
