Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U3gJ-0005DF-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 09:57:15 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13U3gH-0005D8-00
	for mtd@infradead.org; Wed, 30 Aug 2000 09:57:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000828185018.A2777@localhost> 
References: <20000828185018.A2777@localhost> 
To: Ciro Cattuto <ciro@prosa.it>
Cc: Miguel Freitas <miguel@cetuc.puc-rio.br>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Aug 2000 09:57:06 +0100
Message-ID: <10312.967625826@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ciro@prosa.it said:
> The relevant cvs diffs follow. Notice: these mods make doc_stage1.S
> and makecsum.c work _only_ for 2Mb DOCs!

doc_stage1.S could be hacked to work with both. See the existing loader 
code in the DiskOnChip firmware for inspiration.

There's no real reason to waste the second half of the pages either - and 
we could easily make the checksums work in _both_ types of device at once.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
