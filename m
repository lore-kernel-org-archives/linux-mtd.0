Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xWgC-0002Fd-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 14:42:24 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xWgA-0002FX-00
	for mtd@imladris.mvhi.com; Mon, 13 Dec 1999 14:42:22 +0000
Date: Mon, 13 Dec 1999 08:49:38 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: Jon Burford <jburford@xsilogy.com>
cc: Vipin Malik <vmalik@danielind.com>, MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: power down]
In-Reply-To: <011a01bf40f2$b9660f00$6600160a@isidesign.com>
Message-ID: <Pine.LNX.4.10.9912130848130.3723-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


> I mount the DOC2000 on /usr, but write only to the logs and db files (I have
> 'chattr i' on all other files in /usr).  What I would like to get an opinion
> on is:

If you mount the doc2000 on /usr and have evrything else in ramdisk,
perhaps mount /usr read-only. It won't corrupt that way.

TTYL,
Adi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
