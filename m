Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FdqK-000486-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 15:32:00 +0100
Date: Fri, 21 Jul 2000 16:22:51 +0100 (BST)
From: David Woodhouse <dwmw2@alpha1.cygnus.co.uk>
To: Ollie Lho <ollie@sis.com.tw>
cc: David Woodhouse <dwmw2@infradead.org>,
        "Ronald G. Minnich" <rminnich@lanl.gov>, Joe Wang <joewang@sis.com.tw>,
        "K.M. Liu" <kmliu@sis.com.tw>, mtd@infradead.org,
        freebios-devel@sourceforge.net
Subject: Re: SOLVED: Turnning On DOC Millennium ECC Logic
In-Reply-To: <397825D6.BDE058A3@sis.com.tw>
Message-ID: <Pine.LNX.4.21.0007211620430.22633-100000@alpha1.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 21 Jul 2000, Ollie Lho wrote:

> David,
> 	I have successfully turned on the ECC logic of DoC Millennium. The
> ECC logic correctly caculate the ECC on both read and write cases. Now the Millennium driver is as complete as DoC 2000
> driver. I will send you a patch
> next Monday after I did some test (should I CC to Linus also ??).

Excellent - thanks. Send it to me, I'll flush some stuff to Linus in a
week or so. I'd like to make some time to put in the same kind of
threading support that I've put into the CFI commandset code.


--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
