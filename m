Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t5xt-0000b9-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 11:59:09 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t5xs-0000b3-00
	for mtd@infradead.org; Fri, 27 Apr 2001 11:59:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A914A@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E310A914A@kolkrabbi.flaga.is> 
To: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org, nico@cam.org
Subject: Re: partitions and erase regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Apr 2001 11:58:47 +0100
Message-ID: <31211.988369127@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
>  How does JFFS[2] deal with the whole flash chip today? If it just
> deals with 'major' erase size then it shurely must simply ingore the
> first/last part (with 'minor' erase sizes) of the chip. 

It just ignores the fact that it has minor erase sizes. If you have 8*8K + 
15*64K, then JFFS2 will just treat all the 8 minor blocks as a single 
normal-sized block, and will only ever ask the flash driver to erase them 
all together.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
