Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14O3v1-0002rA-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 20:31:55 +0000
Received: from thor.lineo.com ([204.246.147.11])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14O3uz-0002r3-00
	for mtd@infradead.org; Wed, 31 Jan 2001 20:31:54 +0000
Message-ID: <3A787684.3F88526C@Rikers.org>
Date: Wed, 31 Jan 2001 13:33:08 -0700
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Brian Michalk <michalk@awpi.com>
CC: mtd@infradead.org
Subject: Re: Lilo and device 5d01
References: <NEBBLKIBMLGPAFMHEJICCEIJCFAA.michalk@awpi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

try the lilo-mtd version on

http://www.weihenstephan.org/~thorroed/neu/mtd/patches/

I think DW did the original patches.

Brian Michalk wrote:
> 
> I read the man page.
> I tried all sorts of combinations.
> The most logical:
> disk=/dev/nftla
>         bios=0x80
> 
> doesn't work.  I get the fatal: Sorry, don't know how to handle device
> 0x5d01.

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
