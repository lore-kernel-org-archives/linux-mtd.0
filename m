Received: from crown.reflexsecurity.com ([72.54.139.163])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJtcV-00062e-Iq
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 10:43:06 -0500
Date: Wed, 21 Feb 2007 10:42:49 -0500
From: Jason Lunz <lunz@falooley.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070221154249.GB7764@metaxa.reflex>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
	<20070220215513.GA13493@lazybastard.org>
	<20070221030254.GA11044@avocado.homenet>
	<20070221144754.GC464@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070221144754.GC464@lazybastard.org>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 21, 2007 at 02:47:54PM +0000, Jörn Engel wrote:
> > Mount time of a ~56M jffs2 partition went from ~72s to ~54s.
> 
> Ouch!  While this is a significant improvement, 54s is still quite bad.
> The 512MiB partition on the OLPC is mounting in ~3.4s with JFFS2 and
> ~60ms with LogFS.  Imo 3.4s is already bad, and 54s is way beyond.
> 
> Now where is time lost?  One candidate is erase block summary, enabling
> it usually gives roughly a 6x performance improvement.  That would get
> you down to ~9s.

How do I do that?

> Another next thing I suspect is the erase size.  The default is 4KiB,
> which is rather small.  Can you try setting it to 64KiB or maybe even
> 128KiB?

Those timings are already using a 128k erase size.

A raw read of the underlying block device takes 54s, so jffs2 isn't
adding any significant overhead anymore. It was when readahead was
in use.

The only way to increase performance at this point is to make it so that
jffs2 doesn't need to read the entire device at mount time. Is this what
erase block summaries do?

-- 
Jason Lunz | Senior Developer | Reflex Security, Inc.
lunz@reflexsecurity.com
