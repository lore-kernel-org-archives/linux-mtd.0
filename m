Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fG8-00041U-S9
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:45:15 -0400
Date: Mon, 15 Aug 2005 15:43:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050815134355.GA3829@wohnheim.fh-wedel.de>
References: <20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430099D1.8000801@inf.u-szeged.hu>
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

On Mon, 15 August 2005 15:34:09 +0200, Ferenc Havasi wrote:
> 
> But If I am right we use kmalloc, and its limit is 128K. Why don't we 
> use vmalloc() instead there?

You're right, it was kmalloc and not vmalloc.  Fundamental problem
remains, though.

I went through this with Artem on irc.  We haven't found a solution
yet, but here are some of the bits and pieces.  Maybe someone can
assembler them into something sane.

Constraints:
1. Once a jffs2 partition/image is created, the virtual erase block
   size may never, under any circumstances, change.
2. Virtual erase block size must be stored in a way that it will
   *always* be read during mount, preferrably early on.

A simple solution for this problem is virtual size == physical size.

One reason to aggregate physical blocks into virtual ones is to save
memory.  The aggregation code makes sure that we never spend more than
128k on the array of struct erase_block.  Not sure if this is really a
valid concern, though.  Once we have such a big flash, jffs2 will
require tons of memory anyway.

If we go for a virtual:physical mapping other than 1:1, we need to be
safe against this scenario:

1. we have a flash with N erase blocks, 1:1 phyical:virtual mapping
2. first erase block is being erased
3. power-fail during erase, block is all FFs
4. resize of partition
5. with new partition size, physical:virtual mapping is N:1
6. no more block headers at the beginning of a virtual block

Jörn

-- 
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz
