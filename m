Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13waFR-0001Ix-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 01:23:25 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13waFQ-0001Ir-00
	for mtd@infradead.org; Fri, 17 Nov 2000 01:23:24 +0000
Date: Fri, 17 Nov 2000 01:23:20 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Peter De Schrijver <p2@mind.be>
cc: <mtd@infradead.org>
Subject: Re: MTD on intel 28F320B3 flash memory
In-Reply-To: <20001117005926.A829@portablue.linux-apollo.org>
Message-ID: <Pine.LNX.4.30.0011170121440.1138-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Your From address is broken.

On Fri, 17 Nov 2000, Peter De Schrijver wrote:

> Is this type of flash memory supported ? It seems to use the standard
> intel/sharp command set (command set #3), although it's not fully CFI
> compliant.

We only explicitly support the Intel 'Extended' command set. But IIRC the
'Standard' command set is almost identical, apart from some operations
which we don't support yet anyway.

Try making it use the cfi_cmdset_0001 code and see what happens.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
