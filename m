Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6nj4-0006il-SS
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 05:38:39 -0500
Date: Thu, 3 Mar 2005 10:38:17 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <d04hdb$8k1$1@sea.gmane.org>
Message-ID: <Pine.LNX.4.58.0503031038120.26599@phoenix.infradead.org>
References: <d01lkf$v0d$1@sea.gmane.org> <d04hdb$8k1$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin Egholm Nielsen wrote:
> Some more information:
> 
> The problem arose after creating a directory in my JFFS2 NAND fs, and 
> creating some 1000 (small) files in it. After rebooting I removed the 
> entire directory, and at the next reboot I got the error.

Is it real to look at JFFS2 debugging output?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
