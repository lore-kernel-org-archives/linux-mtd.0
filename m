Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cRJY-0006MJ-00
	for mtd-list@infradead.org; Fri, 22 Sep 2000 12:48:24 +0100
Received: from wizball.ivistar.de ([212.42.243.2])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cRJW-0006MD-00
	for mtd@infradead.org; Fri, 22 Sep 2000 12:48:22 +0100
Date: Fri, 22 Sep 2000 13:47:51 +0200
From: Andreas Micklei <ami@ivistar.de>
To: Juergen Beisert <jbeisert@eurodsn.de>
Cc: mtd@infradead.org
Subject: Re: Choosing DiskOnChip driver
Message-ID: <20000922134751.E908@bomberman.ivistar.de>
References: <3.0.6.32.20000922120218.007c5650@eurodsn.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3.0.6.32.20000922120218.007c5650@eurodsn.de>; from jbeisert@eurodsn.de on Fri, Sep 22, 2000 at 12:02:18PM +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

On Fri, Sep 22, 2000 at 12:02:18PM +0200, Juergen Beisert wrote:
> I develop a small PC board with a DiskOnChip Millenium chip. Because it should be an embedded system I do not want use a standard BIOS like desktop pc (I need a very fast boot). Instead I want load linux direct with a small ROM routine from the DiskOnChip (this small routine do the system initializing, too). So my question:
> 
> Is this possible with the MTD software? Which parts of grub and mtd I have to use to solve it? Can anybody help me?

I asked a similar question some time ago and was referred to the following
project:

http://freebios.sourceforge.net/

Seems like a good starting point.

-- 
Andreas Micklei
IVISTAR Kommunikationssysteme AG
Ehrenbergstr. 19 / 10245 Berlin
http://www.ivistar.de


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
