Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ilv2Y-0002hd-AI
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 00:26:04 +0100
Date: Sun, 28 Oct 2007 01:18:12 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: getdents64 problem in 2.6.23
Message-ID: <20071027231812.GA21216@lazybastard.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1193440660.16168.57.camel@shinybook.infradead.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 26 October 2007 19:17:40 -0400, David Woodhouse wrote:
> 
> We probably need to implement a release() operation in the
> jffs2_dir_operations (top of dir.c), which will remove the fake
> 'deletion' dirents if !atomic_read(&inode->i_count). Or something like
> that.

I hate to spoil the fun, but this can cause problems with nfs.

It is legal for nfs to call telldir, close the directory, wait for half
a year, then open the directory, call seekdir and expect sane results.
Not pretty at all for filesystem implementors.

So either these deletion dirents need to stay around or you have to
convert the i_pos "cookie" to a hash of the filename or so or at least
explicitly document that you have broken nfs under some circumstances.

Of course any other program could do the telldir/seekdir stunt as well.
Nfs just appears to be the only one doing this madness in practice.

Jörn

-- 
Doubt is not a pleasant condition, but certainty is an absurd one.
-- Voltaire
