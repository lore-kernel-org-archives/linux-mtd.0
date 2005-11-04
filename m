Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EY24h-00010k-Ea
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2005 08:57:53 -0500
Date: Fri, 4 Nov 2005 14:57:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Message-ID: <20051104135742.GA31827@wohnheim.fh-wedel.de>
References: <436B6791.70004@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <436B6791.70004@cetrtapot.si>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: sumtool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 4 November 2005 14:52:17 +0100, hinko.kocevar@cetrtapot.si wrote:
> 
> mount /dev/mtd0
> ^^^^^^^^^^^^^^^^
> 
> This last command hangs the system ---
> What am I doing wrong?

Correct variants:
1) mount /dev/mtdblock0 ...
2) mount mtd0 -t jffs2 ...
3) mount mtd:foo -t jffs2 ...

1) is using the block device only to derive the correct mtd from it,
2) is referring to the mtd directly by number, 3) is referring to it
by name ("foo").

Might be a candidate for the FAQ.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
