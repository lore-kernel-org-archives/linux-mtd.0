Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13l5GA-0003xD-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 09:04:38 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13l5G9-0003x5-00
	for mtd@infradead.org; Mon, 16 Oct 2000 09:04:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39EAA48F.1FAB34F5@techno.spb.ru> 
References: <39EAA48F.1FAB34F5@techno.spb.ru>  <Pine.LNX.4.21.0010151510010.20018-100000@imladris.demon.co.uk> 
To: Nick Maximov <maxs@techno.spb.ru>
Cc: MTD <mtd@infradead.org>
Subject: Re: Ampro again 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Oct 2000 09:05:05 +0100
Message-ID: <2049.971683505@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


maxs@techno.spb.ru said:
>  Are MTD drivers based originally on M-Systems implementation or you
> have writen your own driver set?

Our code isn't based on M-Systems' implementation - it's written entirely 
from scratch according to the documentation.

> I do not understand the difference between NAND devices and other
> devices. Which class of device I have installed on my module? 

The DiskOnChip contains NAND flash devices. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
