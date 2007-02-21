Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJty7-0006rY-H2
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 11:05:28 -0500
Date: Wed, 21 Feb 2007 16:02:18 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jason Lunz <lunz@falooley.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070221160217.GA2650@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
	<20070220215513.GA13493@lazybastard.org>
	<20070221030254.GA11044@avocado.homenet>
	<20070221144754.GC464@lazybastard.org>
	<20070221154249.GB7764@metaxa.reflex>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070221154249.GB7764@metaxa.reflex>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 February 2007 10:42:49 -0500, Jason Lunz wrote:
> 
> A raw read of the underlying block device takes 54s, so jffs2 isn't
> adding any significant overhead anymore. It was when readahead was
> in use.

That is a bit surprising.  JFFS2 has some optimizations to skip empty
blocks after some bytes.  This is where readahead really hurt - JFFS2
would skip and readahead would read the skipped data anyway.  Now I can
see that JFFS2 has some overhead over plain reading the device, but it
is unusual that overhead and optimizations cancel each other out so
perfectly.

> The only way to increase performance at this point is to make it so that
> jffs2 doesn't need to read the entire device at mount time. Is this what
> erase block summaries do?

Yes.  The idea is to only read the summary at the end of an erase block.
If the summary does not exist, it will fall back to linear scanning of
the block, afaik.

If you enable CONFIG_JFFS2_SUMMARY, it should work for you.  Of course,
your filesystem needs the summary, so you either have to do the
backup&restore procedure or apply sumtool (is that its name?) to your
images.

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
