Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KEfO-0005BG-0x
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 10:53:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030526094050.GA30361@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	 <20030522195708.GB11240@wohnheim.fh-wedel.de>
	 <004101c3214d$223c9560$740486da@w0a3t0>
	 <20030526094050.GA30361@wohnheim.fh-wedel.de>
Message-Id: <1053942836.17182.83.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 May 2003 10:53:56 +0100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-26 at 10:40, Jörn Engel wrote:
> Actually, we could even go a bit further.  zlib itself could have a
> single workspace and a mutex.  Then we would add the following code to
> zlib_deflateInit2_():
> 	if (strm->workspace)
> 		mem = (deflate_workspace *) strm->workspace;
> 	else {
> 		down(&zlib_workspace_sem);
> 		mem = zlib_workspace;
> 	}
> 
> And this little feller to zlib_deflateEnd():
> 	up (&zlib_workspace_sem);
> 
> The same for inflate, of course, both using the same workspace and
> semaphore.
> 
> Now every subsystem using zlib can reuse the same workspace, jffs2
> anole would save one, a big fat system (TM) with jffs2, cramfs, ppp
> and additional patches would save quite a bit more.  And those systems
> do exist, no kidding.

Would be cute -- we need to ensure that it doesn't deadlock. In what
context does PPP do its decompression? I have a feeling it does it in BH
or softirq context, hence isn't allowed to attempt to obtain a
semaphore. cramfs and jffs2 could almost certainly share though.

-- 
dwmw2
