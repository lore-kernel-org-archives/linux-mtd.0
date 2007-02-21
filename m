Received: from crown.reflexsecurity.com ([72.54.139.163])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJy3I-0000tx-KA
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 15:27:03 -0500
Date: Wed, 21 Feb 2007 15:26:51 -0500
From: Jason Lunz <lunz@falooley.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070221202650.GC7764@metaxa.reflex>
References: <20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
	<20070220215513.GA13493@lazybastard.org>
	<20070221030254.GA11044@avocado.homenet>
	<20070221144754.GC464@lazybastard.org>
	<20070221154249.GB7764@metaxa.reflex>
	<20070221160217.GA2650@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070221160217.GA2650@lazybastard.org>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 21, 2007 at 04:02:18PM +0000, Jörn Engel wrote:
> If you enable CONFIG_JFFS2_SUMMARY, it should work for you.  Of course,
> your filesystem needs the summary, so you either have to do the
> backup&restore procedure or apply sumtool (is that its name?) to your
> images.

I thought I'd enabled CONFIG_JFFS2_SUMMARY, but it turns out not.
I've enabled it now, but I still don't seem to see any speedup.

I'm unclear on how to make the filesystem use it. I create the jffs2
filesystem by simply doing:

	flash_eraseall -j /dev/mtd0
	mount -t jffs2 mtd0 /state

Will this create a summary automatically, or is there an extra step I
need to take? 

...ah, it seems removing the -j does the trick. If I don't use it, mount
goes from >50s to <4s.

thanks!

Jason
