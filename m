Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYZB-0002ky-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:43:01 +0100
Received: from w146-253.echostar.com ([205.172.146.253] helo=linux0.echostar.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pYZ9-0002kk-00
	for mtd@infradead.org; Tue, 17 Apr 2001 17:43:00 +0100
Received: from echostar.com (IDENT:ian@linux10 [10.79.98.110])
	by linux0.echostar.com (8.9.3/8.8.7) with ESMTP id KAA05198
	for <mtd@infradead.org>; Tue, 17 Apr 2001 10:42:25 -0600
Message-ID: <3ADC7273.DB541A9C@echostar.com>
Date: Tue, 17 Apr 2001 10:42:27 -0600
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: A pair of stupid questions, I hope
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

My manufacturing people want a test that responds yes or no to the
question "is this sector locked?"

This seems like it should be pretty easy, but where and how do I
determine that? Is it something that is stored in the mem_region?  There
are lock and unlock ioctls but it's not obvious to me how to query if a
sector is locked? What is the proper way to do this?

then 4M flash..  It's looking more and more like we're going to move
from 2MB to a 4MB flash.  Supposedly the 4MB is banked and it's some
Toshiba part that isn't listed in the code as supported yet.  Do we
already support anything like that?  It looks easy enough to add support
for a new part and I'm eager to give it a try but I don't know about
this convoluted banking thing.  Any advice?

thanks,
Ian




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
