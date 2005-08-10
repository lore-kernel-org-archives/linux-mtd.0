Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2o5i-0004PV-4l
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 06:45:49 -0400
Date: Wed, 10 Aug 2005 12:45:56 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <bernhard@prie.de>
Message-ID: <20050810104556.GA19167@wohnheim.fh-wedel.de>
References: <42F9BA34.6090008@prie.de>
	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de> <42F9C28D.4070206@yandex.ru>
	<42F9C4AF.6030505@prie.de> <42F9C612.2050301@yandex.ru>
	<42F9C980.7030301@prie.de>
	<20050810100557.GA18149@wohnheim.fh-wedel.de>
	<42F9D8C5.9060008@prie.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42F9D8C5.9060008@prie.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 August 2005 12:36:53 +0200, Bernhard Priewasser wrote:
> Jörn Engel wrote:
> >Please always reply to all.  I hate to miss interesting stuff, just
> >because some idiot removed me from the Cc: list.
> Better now? ;-)

Much, thank you.

> > The next flash FS, whatever it will look like, will not be log
> > structure anymore.  At least, noone I know of is trying to follow that
> > road anymore.  Log-structuring simply doesn't scale.
>
> But log-structuring and handling failsafe issues works comfortable and 
> reliable... What's another solution, in matters of (a) robustness and 
> (b) scaling?

Artem has described some of the necessary bits in his JFFS3 document.
Ignoring the name, it is quite useful as an introduction.

Basic design must be tree-structured, just like ext2 and all the other
well-known filesystems for hard disks.  Main difference to ext2 is the
requirement for out-of-place updates and garbage collection.

Most of the ugly details can be derived from these three simple
principles.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
