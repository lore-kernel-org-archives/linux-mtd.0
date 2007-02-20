Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJd1P-0005Qz-C4
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 16:59:42 -0500
Date: Tue, 20 Feb 2007 21:55:13 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jason Lunz <lunz@falooley.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070220215513.GA13493@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070220213528.GA7764@metaxa.reflex>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 February 2007 16:35:29 -0500, Jason Lunz wrote:
> 
> I'm using jffs2 on block2mtd. I'd be happy to test any patches you have.

Is it ok if I just pass this URL?
http://kernel.org/git/?p=linux/kernel/git/joern/misc.git

The top three patches are test-worthy.

> The readahead-disable one in particular is interesting - i ended up
> patching the source to get rid of the warning about readahead past
> end-of-disk. And mounting jffs2-on-block2mtd-on-ide-flash is quite slow.

If it works for you and improves mount time, that would be good results.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
