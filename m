Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fOD-0005Bp-7j
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:52:40 -0400
Date: Mon, 15 Aug 2005 15:51:58 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050815135158.GD3829@wohnheim.fh-wedel.de>
References: <20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<43008BFB.502@yandex.ru> <4300970E.2090803@inf.u-szeged.hu>
	<43009AE1.6010907@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43009AE1.6010907@yandex.ru>
Cc: zhao_fusheng@hotmail.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
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

On Mon, 15 August 2005 17:38:41 +0400, Artem B. Bityuckiy wrote:
> 
> Ok, let's change JFFS2. I would prefer just alwayse assume 1:1 mapping 
> and always use vmalloc in JFFS2 for c->blocks[] (no 128K limitation).
> 
> For compatimility, we need to be able to fallback to the old JFFS2 
> algorithms.
> 
> And here we definitely must introduce the way to recognise versions of 
> the image. We may introduce the version number to clean markers. We also 
> must set INCOMPAT flag in clean markers to prevent new images to be 
> mounted by old JFFS2s. New JFFS2s will mount the FS only if the version 
> is <= then the current JFFS2 version. Something like this. Versioning 
> will anyway be useful in future.

JFFS2 doesn't have a superblock.  Where should the versions be stored?

I'd create a new node with INCOMPATIBLE flag set.  That's the JFFS2
translation of what you just stated.  Converging this node with
something else like the former erase marker would make sense, yes.

> Moreover, Forrest is adding the trick to store the erase count at the 
> beginning of each eraseblock. So, we may store this erasecount in clean 
> markers as well. Then we may rename "clean marker" to "node header".

Sane.  We can combine these changes.

> On NAND, clean marker is in OOB of the first page. As new cleanmarkers 
> become larger, we may span them to the 2nd, the 3rd, etc OOBs.

You're the expert here.

Jörn

-- 
Linux is more the core point of a concept that surrounds "open source"
which, in turn, is based on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
