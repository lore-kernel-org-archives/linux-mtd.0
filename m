Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9R9f-00040M-RO
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 12:09:00 -0500
Date: Thu, 10 Mar 2005 17:08:43 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050310164848.GB7018@synertronixx3>
Message-ID: <Pine.LNX.4.58.0503101708360.5506@phoenix.infradead.org>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310154640.GC4910@synertronixx3>
	<Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
	<20050310164848.GB7018@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> No clue until now. On Host-PC or on the embedded system?
Does it make sense to do it on host?
Surely on the board. This way you will have the same JFFS2 but the 
underlying flash will be another.

> This is emacs in hexl-mode on these files:
Hmm, so this means that when you dump the image it looks good, but when 
JFFS2 reads direntry nodes they aren't good. I'd print similar hexdump 
from JFFS2 and see what it actually reads.

Insert the corresponding printk() to jffs2_scan_dirent_node() function in 
scan.c (print the 'rd' contents).

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
