Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp75p-0005Ky-0O
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 10:41:03 -0500
Date: Thu, 13 Jan 2005 16:40:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050113154037.GC18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 January 2005 15:22:38 +0000, Artem B. Bityuckiy wrote:
>
> Yes, I thought so either. But imagine due to unclean reboot the last CRC 
> was not written completely. this is the problem.

Agreed, it's hard to fully protect against such races.

Here is another design I'm not very happy about.  But it might work:

1) Checksum errors on the last node are silently ignored - most likely
   unclean reboot.

2) Last node per erase block is a special endmarker node, similar to
   cleanmarkers.

3) During unmount, an endmarker is written to the end of all
   partially-filled erase blocks.

Rule 1 makes sure we can somewhat distinguish between both problems
and don't report any false positives.  Rule 2 makes sure, we don't
miss real flash corruption on the last node, in case it occurs to the
last node of a full erase block.  Rule 3 closes the next small hole.

As long as GC doesn't obsolete/erase old node before the GC'd
something else is written behind the new node, this should be pretty
safe.  But it's horribly complicated.  Would be much nicer if the
checksum itself could distinguish between both cases.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
