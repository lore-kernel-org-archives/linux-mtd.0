Received: from mail.fh-wedel.de ([213.39.232.194])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BrgSs-0007u0-Px
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2004 13:19:12 -0400
Date: Mon, 2 Aug 2004 19:19:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <20040802171910.GA29585@wohnheim.fh-wedel.de>
References: <20040802170824.GC26115@wohnheim.fh-wedel.de>
	<20040802171502.4DCB1C109F@atlas.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040802171502.4DCB1C109F@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Volatile data device vor jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 August 2004 19:14:57 +0200, Wolfgang Denk wrote:
> In message <20040802170824.GC26115@wohnheim.fh-wedel.de> you wrote:
> >
> > Your approach doesn't always work for me because sometimes people care
> > a lot about the last log entries.  They need to be inside a
> > non-volatile medium, either nvram or flash.  Unless you want to move
> > the page cache to nvram... ;)
> 
> Did you consider using oramfs? See http://pramfs.sourceforge.net/

We already have something similar.  People have to sort their data and
send some to one fs, other to the other fs.  Prone to errors, static,
ugly code, etc.

Jffs2 would be able to do the sorting transparently.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
