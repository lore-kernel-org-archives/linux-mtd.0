Received: from spornkuller.de ([5.45.105.28])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuLjh-0007Dq-1n
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 14:09:41 +0000
Received: from spornkuller.de (localhost [IPv6:::1])
 by spornkuller.de (Postfix) with ESMTP id 2CE4217F432
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 16:09:19 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 May 2015 16:09:19 +0200
From: Johannes Bauer <weolanwaybqm@spornkuller.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Wear-leveling peculiarities
In-Reply-To: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
Message-ID: <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.05.2015 15:53, schrieb Johannes Bauer:

> I don't grasp the whole picture.

Obviously.

I've been thinking about this some more and had an epiphany pretty much 
ten seconds after I hit the "send" button on my email.

Wear-leveling is working alright, but of course some parts (static 
operating system components, for example) will never be written a lot of 
times, because there is no need to change their contents. Wear-leveling 
is only performed on the sectors which are actively written (and on 
those which are unoccupied). This would explain the graphs, but is the 
explanation also correct?

To remedy this, is is advisable/necessary to walk over the whole file 
system every once in a while and read every LEB that has a small erase 
count and write it back to its original location? So that an exchange 
between the near-constant LEBs and the actively-written LEBs is 
performed? Is there a tool to do this?

Best regards,
Johannes
