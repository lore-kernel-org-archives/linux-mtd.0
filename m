Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kw5Z-0000Jp-00
	for mtd-list@infradead.org; Wed, 04 Apr 2001 23:49:21 +0100
Received: from w146-98.echostar.com ([205.172.146.98] helo=linux0.echostar.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14kw5W-0000Jj-00
	for mtd@infradead.org; Wed, 04 Apr 2001 23:49:18 +0100
Received: from echostar.com (IDENT:ian@linux10 [10.79.98.110])
	by linux0.echostar.com (8.9.3/8.8.7) with ESMTP id QAA31689
	for <mtd@infradead.org>; Wed, 4 Apr 2001 16:48:32 -0600
Message-ID: <3ACBA4C2.DDED5432@echostar.com>
Date: Wed, 04 Apr 2001 16:48:34 -0600
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Proc stuff
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I need some extra bits added to the proc/mtd.  For the product I'm
building we want to have things from the flash registers like the Device
ID and "AMD flash"

Anything else anyone wants while I'm in there?  Also, I was thinking I'd
just add a few extra columns to the /proc/mtd file if that's distasteful
I could create a /proc/mtd directory and put a few different "files" in
there.  Any comments before I start hacking?

thanks,
Ian Nelson

PS, it's bloody fast on my system too.  I have this hilo burner that
takes 20+ minutes to burn a 2Mbyte flash while MTD does it in closer to
20 seconds.  Very very cool.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
