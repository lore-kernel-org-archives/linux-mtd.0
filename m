Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp6jJ-0004rB-GO
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 10:17:46 -0500
Date: Thu, 13 Jan 2005 16:17:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050113151724.GB18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
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

On Thu, 13 January 2005 15:05:16 +0000, Artem B. Bityuckiy wrote:
> On Thu, 13 Jan 2005, Artem B. Bityuckiy wrote:
> 
> > See the benefits:
> > 1. We are able to use weaker then CRC32 checksums and still be good in 
> > detecting wrong due to unclean reboot nodes.
> > 2. We have principal ability to distingush between nodes corrupted due to 
> > flash problems and due to unclean reboots.
> > This is extreemly good do be able to distinguish. (JFFS2 has no such 
> > ability). 

Right, very nice attributes.

> > Thoughts?
> Hmm, only one small note, putting CRC to the end does not allow us to 
> recognize unclean reboots and flash media corruptions :-) But we still may 
> do this putting some majic bitmask to the end of nodes.

static uint32_t jffs3_checksum(...)
{
	static uint32_t ret = do_jffs3_checksum(...);
	if (ret == 0xffffffff)
		return 0;
	return ret;
}

When reading the node, simply compare the checksum to 0xffffffff.  If
it matches, we know that
a) the checksum is wrong and 
b) it was due to incomplete write, not flash corruption.

Adler32 has the nice property that 0xffffffff is an impossible
checksum by design already, so the above code wouldn't be necessary.

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
