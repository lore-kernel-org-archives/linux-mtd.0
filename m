Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9RI9-0004Cc-U8
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 12:17:46 -0500
Date: Thu, 10 Mar 2005 17:17:28 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050310170223.GC7018@synertronixx3>
Message-ID: <Pine.LNX.4.58.0503101717100.5506@phoenix.infradead.org>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310154640.GC4910@synertronixx3>
	<Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
	<20050310170223.GC7018@synertronixx3>
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

> Well, may be... hence my question. But I have no clue anymore where to
> search. I hacked onto this burst mode for weeks and only jffs2 is not
> working in always a similair pattern.
> Thats why I show up here, may be burst mode is broken for this system
> and that only for jffs2. But I don't know how this filesystems works
> exactly when reading and I am trying to find out which fucking bug in
> hardware it could trigger, all other tests run fine.
Well, then I offer to start debugging. Insert printk() calls and start 
catching error step by step.

All JFFS2 read/write goes through mtd->write(), mtd->writev(), 
mtd->read(). You might just find the corresponded handlers and insert 
printk's there. This will give us additional information.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
