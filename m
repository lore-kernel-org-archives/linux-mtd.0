Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bfha-00075H-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 11:39:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021017103610.GA13795@kosh.hut.fi> 
References: <20021017103610.GA13795@kosh.hut.fi>  <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 Jan 2003 12:09:55 +0000
Message-ID: <30397.1043323795@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 17 Oct 2002, jlavi@iki.fi said:
>  Of course measuring write throughput is just one side of performance
> but I think it is fair to say JFFS2 write performane on dirty file
> system with low performance CPUs has improved dramatically since last
> spring.

Fancy repeating the test with current CVS? I just committed the 
oft-discussed code required to avoid decompressing and recompressing nodes 
which haven't changed -- and to avoid even doing the iget() and building up 
the node lists for the inodes to which they belong in that case too.

--
dwmw2
