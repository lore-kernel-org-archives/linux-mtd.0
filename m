Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t6Th-0000lW-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 12:32:01 +0100
Received: from humbolt.nl.linux.org ([131.211.28.48] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t6Tg-0000lP-00
	for mtd@infradead.org; Fri, 27 Apr 2001 12:32:00 +0100
Received: from activesilicon.demon.co.uk ([212.228.31.28] helo=activesilicon.co.uk)
	by anchor-post-32.mail.demon.net with esmtp (Exim 2.12 #1)
	id 14t6Rs-000NJE-0W
	for mtd@infradead.org; Fri, 27 Apr 2001 12:30:08 +0100
Received: from p90nt4 (p90nt4.activesilicon.co.uk [192.168.1.64])
	by activesilicon.co.uk (8.11.3/8.11.3) with SMTP id f3RBTrm29673
	for <mtd@infradead.org>; Fri, 27 Apr 2001 12:29:53 +0100
Message-ID: <01C0CF15.C21A24D0.chris.read@activesilicon.co.uk>
From: Chris Read <chris.read@activesilicon.co.uk>
Reply-To: "chris.read@activesilicon.co.uk" <chris.read@activesilicon.co.uk>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Brownouts
Date: Fri, 27 Apr 2001 12:29:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

As a follow up to my earlier message:

I am currently working with Intel B3 parts. The datasheet makes no specific 
mention of any built in brownout detection. However, there are a set of 
timings for the reset line. Specifically, it states that it may take up to 
22us to reset the internal state machine during an erase or write cycle 
after the reset pin is asserted. My interpretation of this, in the absence 
of any explicit information, is that whilst erasing or programming, the 
reset line must be asserted a minimum of 22us before the power supply falls 
below the chip's minVcc specification, otherwise the results are 
undefined.....and we all know what that can mean.

Any thoughts/experiences?




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
