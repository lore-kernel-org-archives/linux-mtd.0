Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLzvJ-0002M6-85
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 04:42:07 -0400
Date: Thu, 14 Apr 2005 09:41:58 +0100 (BST)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050413T193912-984@post.gmane.org>
Message-ID: <Pine.LNX.4.58.0504140941040.3328@phoenix.infradead.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
	<1113404557.23175.23.camel@sauron.oktetlabs.ru>
	<loom.20050413T193912-984@post.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Nope. Just three files: one is 200 MBytes, two others are small.

That's all I need to know. JFFS2 was originally developed to work with
small NOR flashes. After NAND support was added it became possible to
utilize it on top of NAND, but with large flashes it is not very usable.
200 MB file is very large for JFFS2. It eats a lot of RAM when
you open the file and iget() is very slow with it (iget() happens when
you open the file, stat it, ls -l, etc).

This is why I started designing JFFS3, though I do this in background and 
don't really spend a lot of time (sponsors are needed :-)). Take a glimpse 
at the evolving document at 
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf, especially at the 
"JFFS2 analysis chapter", which is far not complete though. This will help 
you to realize why it is difficult to use JFFS2 on large flashes, 
especially if you have a 200 MB file :-)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
