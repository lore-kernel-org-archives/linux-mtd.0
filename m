Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DM0Rw-0002sm-Pl
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 05:15:49 -0400
Date: Thu, 14 Apr 2005 10:15:33 +0100 (BST)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <425E3174.4030308@inf.u-szeged.hu>
Message-ID: <Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
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

> Just an idea: you may try out our summary patch. (
> http://www.inf.u-szeged.hu/jffs2/mount.php )
Yes, summary will help greatly with mount time, but unfortunately it 
doesn't help with memory consumption and iget() (in Sergey's case the time 
of the background checking is the same).

> It makes the mount time faster and there is an experimental option,
> where you can disable the check the CRC of nodes which have good
> summary. (most of the nodes will have it, if you use it correctly)
Albeit I used to claim it is a good attribute not to check CRCs for
blocks with summaries, now I believe it is wrong and dangerous and must 
not be used in JFFS2.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
