Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6qOT-0001SL-Js
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 08:29:34 -0500
Date: Thu, 3 Mar 2005 13:29:17 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Bobzin,Heiko" <h.bobzin@icp-ag.de>
In-Reply-To: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
Message-ID: <Pine.LNX.4.58.0503031328060.2925@phoenix.infradead.org>
References: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: Data corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Bobzin,Heiko wrote:
> Hi Artem,
> it still happens with your patch.
Since your flash is plain NOR it should, I see now. It shoul help for 
ECC'd NOR and another flashes which celanmarker size != 0 and c->wbuf != 
NULL, though.

> 
> I first get
> 
> Node header CRC failed at 00510760. But it must have been OK earlier.
> Node was: { 0000, 2000, 00000000, 00000000 }
> 
> The bad node was in the 'inetd', which core-dumped then.
> 
> After a second power-cycle I get another one:
> 
> Node header CRC failed at 005d3a94. But it must have been OK earlier.
> Node was: { 0000, 2000, 00000000, 00000000 }
> 
> The bad node is in a 1.5M application file.
> 
> After the third power-cycle I get 3 of those, then 1, and later
> the test application itself gets corrupted.
> 

Well, I have no ideas why this can happen.

Is it possible to reproduce the error if JFFS2 debugging level 1 is on ?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
