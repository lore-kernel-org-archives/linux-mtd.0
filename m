Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjCMD-0000fn-A6
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 12:19:07 +0100
Date: Sat, 20 Oct 2007 11:29:50 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Erez Zadok <ezk@cs.sunysb.edu>
Subject: Re: [BLOCK2MTD] WARNING: at kernel/lockdep.c:2331 lockdep_init_map()
Message-ID: <20071020092950.GB32465@lazybastard.org>
References: <20071019191433.GK26913@lazybastard.org>
	<200710192004.l9JK4Aju017839@agora.fsl.cs.sunysb.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200710192004.l9JK4Aju017839@agora.fsl.cs.sunysb.edu>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 October 2007 16:04:10 -0400, Erez Zadok wrote:
> In message <20071019191433.GK26913@lazybastard.org>, =?utf-8?B?SsO2cm4=?= Engel writes:
> > 
> > Since when roughly?  2.6.20ish?  Before?
> 
> Yeah, I guess around that time.  If you want, I could go back and test each
> of my backports and see if it has the lockdep message or not.

That's ok.  Just wanted to get a rough idea.

> > Side note: you don't need mtdblock:
> > # cp jffs2-empty.img /tmp/foo
> > # losetup /dev/loop0 /tmp/foo
> > # modprobe block2mtd block2mtd=/dev/loop0,128ki
> > # mount -t jffs2 mtd0 /n/lower/b0
> > 
> > It doesn't really hurt, 'tis just superfluous.
> 
> Neat.  Curious, but where does "mtd0" come from then?  It's not in my /dev
> (which uses devfs on an FC6 system).

JFFS2 interprets that itself.  The only reason why JFFS2 needed a block
device was to determine the minor number of the mtd underneith.  So code
was added to find the correct mtd from "mtd0" or "mtd:some_name"
instead.  I believe you can even disable CONFIG_BLOCK now.

And the code itself was moved to drivers/mtd/mtdsuper.c fairly recently.

Jörn

-- 
Joern's library part 2:
http://www.art.net/~hopkins/Don/unix-haters/tirix/embarrassing-memo.html
