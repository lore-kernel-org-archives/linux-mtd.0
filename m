Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHjQF-0008Gw-RY
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 10:49:24 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050920143622.GD4634@wohnheim.fh-wedel.de>
References: <4329251C.7050102@mw-itcon.de> <4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de> <43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<20050920133244.GC4634@wohnheim.fh-wedel.de>
	<43301877.3040306@yandex.ru>
	<20050920143622.GD4634@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 20 Sep 2005 18:48:04 +0400
Message-Id: <1127227684.20014.63.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Peter Menzebach <pm-mtd@mw-itcon.de>, linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 16:36 +0200, Jörn Engel wrote:
> Image this block contains the used block bitmap of ext2.  All blocks
> handled with this bitmap are free, so the complete block contains
> zeroes.  Now we allocate a single block, writing a single one to the
> bitmap.  When writing, a power failure happens right after the erase:
> 
> Before:
> 00000000000
> 
> After:
> FFFFFFFFFF
> 
> Gee, every single block is used now.  Good thing this happened to the
> block bitmap, so we only lost some space on the fs.  Somewhere else,
> we'd have data corruption.
> 
> Any hard disk filesystem will suffer some kind of corruption in such a
> case.  They heavily depend on the non-existance of 4-6.

Oh OK, Got it, thanks.

> > P.S. I actually missed the mailing list, this should have gone to the 
> > MTD ML. So let's move there please.
> 
> As always.  You fuck it up, I get to fix it. ;)
hehe :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
