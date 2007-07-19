Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBcAo-0000Bi-5T
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 16:00:31 -0400
Date: Thu, 19 Jul 2007 21:56:38 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Tobias Simon <tobias.simon@sp-ss.de>
Subject: Re: flashcp
Message-ID: <20070719195635.GA27750@lazybastard.org>
References: <200707192046.47340.tobias.simon@sp-ss.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200707192046.47340.tobias.simon@sp-ss.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 July 2007 20:46:46 +0200, Tobias Simon wrote:
> 
> I am new in this list.
> Today I found a bug in the flashcp program of the mtd-utils:
> 
> In Line 260 of flashcp.c, the following operation is performed:
> 
> erase.length = filestat.st_size & ~(mtd.erasesize - 1);
> 
> I think that is not correct, because if mtd.erasesize is not a power of 2, 
> using a bitmask is wrong. ARM dataflash, for instance has a erasesize of 
> 1056. My suggestion is the following code replacement, which uses modular 
> arithmetics:
> 
> if (filestat.st_size <= mtd.erasesize)
> {
>    erase.length = mtd.erasesize;
> }
> else
> {
>    erase.length = filestat.st_size + mtd.erasesize - (filestat.st_size % 
> mtd.erasesize);
> }
> 
> What's your opinion?

Many-fold.

1. You're off-by-one when (filestat.st_size % mtd.erasesize) yields
zero.

2. In principle the "patch" looks fine.  Except that it should be a
patch and probably follow kernel coding style or something similar.

3. I keep wondering whether the oddball erasesize of dataflash makes
sense.  Why did they pick 1056, the exact size of two 512 Byte nand
pages with the standard 16 Bytes of OOB each?  Could they need ECC as
well and should the "spare" 32 bytes be used for that instead?

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
