Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mHnY-00076n-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 16:40:04 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mHnX-00076g-00
	for mtd@infradead.org; Thu, 19 Oct 2000 16:40:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13mHag-0001N5-00@pearl.tao.co.uk> 
References: <E13mHag-0001N5-00@pearl.tao.co.uk> 
To: "David Given" <dg@tao-group.com>
Cc: mtd@infradead.org, nico@cam.org
Subject: Re: cfi_cmdset_0001 unaligned write problems. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Oct 2000 16:39:41 +0100
Message-ID: <31672.971969981@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dg@tao-group.com said:
>  Ditto on BE. Endianness only matters when you are reading and writing
> non-quad  values to memory. The internal representations are
> identical.

Yep, I was misunderstanding what do_write_oneword() does. In fact, it 
passes datum intact to cfi_write() which does the correct thing, rather 
than passing it by reference. That code does look OK.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
