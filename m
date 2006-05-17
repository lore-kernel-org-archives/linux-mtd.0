Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgI3N-0006nt-7F
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 05:10:55 -0400
Date: Wed, 17 May 2006 11:10:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: syed khader <sk.syed@yahoo.com>
Message-ID: <20060517091038.GA22457@wohnheim.fh-wedel.de>
References: <20060517051201.33135.qmail@web37904.mail.mud.yahoo.com>
	<20060517062552.78956.qmail@web37909.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060517062552.78956.qmail@web37909.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: zlib compression is failing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Side note: You might want to read the list etiquette.  Open source
taste is a bit different and usually frowns upon things that are
perfectly acceptable in companies.  In particular, when writing mails
you should only quote relevant bits from the last mail, remove
everything else, and write your answers underneith the quoted text you
are referring to.  And here is the full thing:
http://www.infradead.org/~dwmw2/email.html

On Tue, 16 May 2006 23:25:52 -0700, syed khader wrote:
> 
>   in the logs I am seeing the following error
> messages:
> 
> zlib compressed 68 bytes into 77; failing
> 
>   why does zlib compression fail?

When compressing data, there is always the chance that data is
actually being _expanded_ instead of compressed.  Imaging compressing
a compressed file.  Zlib has to add a small header and then tries to
compress the data, which doesn't work.  So it simply stores the data
verbatim after the header, resulting in bigger data than before.

When this happens, jffs2 doesn't want to store the bigger "compressed"
data, but just the plain uncompressed data, saving a little flash
space.

Quite interesting, though, are the sizes.  68 bytes is exactly a jffs2
inode header.  It makes me a bit uneasy if that cannot be compressed.
So maybe it is time to finally ask some basic questions:
o What kernel version are you using?
o Are there any patches on top of it?
o Is the mtd/jffs2 code from above kernel version or from cvs/git?

> > Here is the link to the log:
> >
> http://rapidshare.de/files/20655260/jffs2crclog.txt.html

I just see a page telling me to subscribe to some service.  Don't you
have some other webspace you could use?

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
