Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KXc0-0000Fz-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 03:53:28 +0100
Received: from [213.255.48.147] (helo=giga.prosa.it ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KXbz-0000Ft-00
	for mtd@infradead.org; Fri, 04 Aug 2000 03:53:27 +0100
Received: from localhost (root@localhost [127.0.0.1])
	by giga.prosa.it (8.9.3/8.9.3/Debian/GNU) with ESMTP id EAA21731
	for <mtd@infradead.org>; Fri, 4 Aug 2000 04:52:27 +0200
Date: Fri, 4 Aug 2000 04:17:19 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: mtd@infradead.org
Subject: Re: DOC2000 & NFTL problems
Message-ID: <20000804041719.A3648@localhost>
References: <20000802134851.A2924@localhost> <3988F8D2.FD1AB1E2@sis.com.tw> <20000803125852.A1378@localhost> <398A226D.8E19BF9F@sis.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <398A226D.8E19BF9F@sis.com.tw>; from ollie@sis.com.tw on Fri, Aug 04, 2000 at 09:54:53AM +0800
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, Aug 04, 2000 at 09:54:53AM +0800, Ollie Lho wrote:

> The DoC is not properly nftl_formatted, or the OOB areas are broken
> or not correctly accessed by doc2000.c

That's what I thought. The point is, which one of the above?

The DOC2000 shouldn't be broken, because I can use it without the least
problem under DOS _and_ under Linux 2.0.38, with the binary module provided
by M-systems (or IGEL, whatever). I will re-try all of this, just to be sure.
But given this, what could possibly go wrong with the way doc2000.c accesses
OOB areas? This SBC is a common PC104 board manufactured by Eurotech.
It features a 386SX, 2 Mb RAM (yes, I'm running Linux in 2 Mb of RAM)
and a DOC socket, besides many other devices. It's pretty standard stuff.

I'm confused...

Thank you for you help/hints/whatever :)

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
