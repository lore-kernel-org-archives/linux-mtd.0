Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxK7C-0000w2-Ex
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 03:44:44 -0400
Date: Tue, 26 Jul 2005 09:44:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050726074440.GB15903@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42E5E816.5090500@inf.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 July 2005 09:36:54 +0200, Ferenc Havasi wrote:
> Artem B. Bityuckiy wrote:
> >BTW, IMO the Summary patch of Ferenc Havasi is not yet in CVS (even 
> >though it greatly helps with mount time) because he didn't bothered 
> >making it cute. He just took messy JFFS2 code, and made it even messier. 
> >I'd be glad to see Ferenc's patch nice and in CVS.
> 
> We also would be happy if it summary patch would be the part of the 
> official JFFS2 (at least the erase block summary).
> 
> If I remember well David (dwmw2) said that it should be the part of 
> JFFS3 only, because he would like to see only bugfixes in JFFS2. He did 
> not mentioned that the reason is that it is messy.

All of which appeared to make sense back then.  By now, I guess,
most people stopped caring about jffs3.  The successor of jffs2 should
no longer be log-structured.  It's just that noone cared enough to
remove jffs3 from cvs yet.

> If it is true we will 
> clean it (or partially rewrite if necessery) just please say some words 
> about exactly why and where it is messy.

Can you post a patch or a URL to it?

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
