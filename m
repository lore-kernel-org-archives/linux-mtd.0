Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Yl23-00008y-00
	for mtd-list@infradead.org; Tue, 12 Sep 2000 09:03:07 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Yl22-00008s-00
	for mtd@infradead.org; Tue, 12 Sep 2000 09:03:06 +0100
Received: from passion.cygnus.co.uk (passion.cygnus.co.uk [194.130.39.73])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id BAA18315
	for <mtd@infradead.org>; Tue, 12 Sep 2000 01:03:03 -0700 (PDT)
Received: from passion.cygnus.co.uk (dwmw2@localhost)
	by passion.cygnus.co.uk (8.11.0/8.9.3) with ESMTP id e8C82rk07019
	for <mtd@infradead.org>; Tue, 12 Sep 2000 09:02:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: 2.4 __setup and __initcall backported to 2.2.18
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Sep 2000 09:02:53 +0100
Message-ID: <7018.968745773@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The 2.2.18 release is going to support __setup and __initcall macros in the 
same way as the 2.4 kernels, which means that we can do without a whole lot 
of ugliness.

Therefore, as soon as 2.2.18 final is released, I'm intending to stop 
supporting the old method of init calls. 

If anyone wants to step up and volunteer to maintain them, because they 
want to use kernels older then 2.2.18 (I can't see the init stuff being 
backported to 2.0 just yet), then please make yourself known now.

Otherwise, the old init calls will get out of sync with the code. I won't
remove them immediately, but I _will_ do so when I first notice that they're
out of date.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
