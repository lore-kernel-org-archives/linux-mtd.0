Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SgK2-00051c-00
	for mtd-list@infradead.org; Sat, 26 Aug 2000 14:48:34 +0100
Received: from [213.255.48.147] (helo=giga.prosa.it ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13SgK1-00051W-00
	for mtd@infradead.org; Sat, 26 Aug 2000 14:48:33 +0100
Received: from localhost (root@localhost [127.0.0.1])
	by giga.prosa.it (8.9.3/8.9.3/Debian/GNU) with ESMTP id PAA17120
	for <mtd@infradead.org>; Sat, 26 Aug 2000 15:38:47 +0200
Date: Sat, 26 Aug 2000 09:15:47 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: mtd@infradead.org
Subject: Re: nftl_format and 2 Mb DOC
Message-ID: <20000826091547.A16896@localhost>
References: <20000825194211.A14265@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000825194211.A14265@localhost>; from ciro@prosa.it on Fri, Aug 25, 2000 at 07:42:11PM +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, Aug 25, 2000 at 07:42:11PM +0200, Ciro Cattuto wrote:

> ...now, 2 Mb DOC have 4k erase size, and I'd like to add support for this.
> Is there something I should be aware of before I start hacking to make
> nftl_format happy, instead than confused? ;)

The code in nftl_format looks pretty independent of the erase zone size,
so I simply removed the check against 0x2000. It seems to work fine,
except for an error while writing OOB data, which I'm not sure is related
to nftl_format itself.

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
