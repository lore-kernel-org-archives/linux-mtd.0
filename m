Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KESf-0004ye-PO
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 10:40:10 +0100
Date: Mon, 26 May 2003 11:40:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Message-ID: <20030526094050.GA30361@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004101c3214d$223c9560$740486da@w0a3t0>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 24 May 2003 02:02:46 +0900, matsunaga wrote:
> >
> > int __init jffs2_zlib_init(void)
> > {
> > if (WORKSPACESIZE < zlib_deflate_workspacesize())
> > BUG();
> > if (WORKSPACESIZE < zlib_inflate_workspacesize())
> > BUG();
> > return 0;
> > }
> 
> That's great idea too ;-)

Thanks!

> We only have to check the size in init routine.

Actually, we could even go a bit further.  zlib itself could have a
single workspace and a mutex.  Then we would add the following code to
zlib_deflateInit2_():
	if (strm->workspace)
		mem = (deflate_workspace *) strm->workspace;
	else {
		down(&zlib_workspace_sem);
		mem = zlib_workspace;
	}

And this little feller to zlib_deflateEnd():
	up (&zlib_workspace_sem);

The same for inflate, of course, both using the same workspace and
semaphore.

Now every subsystem using zlib can reuse the same workspace, jffs2
anole would save one, a big fat system (TM) with jffs2, cramfs, ppp
and additional patches would save quite a bit more.  And those systems
do exist, no kidding.

And users that want to scale to 64 CPUs and use zlib concurrently on
all of them can still provide their own workspace.

Comments?

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
