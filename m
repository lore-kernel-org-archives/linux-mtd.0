Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fJJi-0000nU-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 10:20:10 +0100
Date: Wed, 12 Apr 2000 11:26:03 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: Udi Finkelstein <udif@bigfoot.com>
cc: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: DOC2000 and Kernel 2.3 ?? 
In-Reply-To: <1390.955529883@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.21.0004121114030.26095-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 12 Apr 2000, David Woodhouse wrote:

> > 2. Using the Axis JFFS code. Is it stable? does it work at all?
> 
> It's not clear yet whether it would work on NAND flash. 

Yes, JFFS works and it is also stable. It is used in a couple of
our products (all our new Linux based products). However, as David
stated, where's only support for NOR flashes at the moment. In
the future, we or someone else, could add NAND flash support.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
