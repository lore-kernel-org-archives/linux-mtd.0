Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rh39-0005bc-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 15:10:47 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rh38-0005bW-00
	for mtd@infradead.org; Mon, 23 Apr 2001 15:10:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A9128@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E310A9128@kolkrabbi.flaga.is> 
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org, nico@cam.org
Subject: Re: partitions and erase regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Mon, 23 Apr 2001 15:10:36 +0100
Message-ID: <12790.988035036@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
>  For my chip I have to fit bootrom in the first 0x20000 kb. The first
> 0x10000 are 8 0x2000 sized sectors while the next 0x10000  is one
> sector of size 0x10000. Because of the "stupid" way of reporting the
> chip with only one sectorsize (mtd.erasesize) I am  unable to erase
> and otherwaise manage this part of the chip. The natural solution to
> me is to make the first part of the chip a partition with two erase
> regions, i.e. the first with erase size 0x2000 and 8 sectors and the
> next with erase size 0x10000 and 1 sector. 

(delayed reaction)

How about the following rules/behaviour for MTD partitions:

 1. For a partition to be writable, there must be a number usable as 'major'
	erasesize (mtd->erasesize), such that a naïve user of MTD can get 
	erases at offsets such that offset % erasesize == 0 to work.
 2. If a partition covers regions of the master which have differing 
	erasesizes, the information about the exact erase regions should
	be made available in the slave.

So... given a master device with 'major' erasesize 64K, which is actually 
8*8K, 15*64K, this would be the result of some example partitions...

 Partition range   Erase size(s)      Writable?

 000000 - 020000  64K (8*8K, 1*16K)	Yes
 020000 - 100000  64K			Yes

 000000 - 008000  8K			Yes
 008000 - 100000  -			No (no usable 'major' erasesize) 

 000000 - 010000  8K			Yes
 010000 - 100000  64K			Yes

 008000 - 010000  8K			Yes

Kári, if this is acceptable for your purposes (and I think it is), then we 
should just implement this behaviour and not have any conditional code at 
all.

/me wanders off to kick some sense into the new Red Hat 7.1 installation, 
which has taken it upon itself to randomly start correcting my spelling to 
some foreign language, and no longer approves of the word 'behaviour'.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
