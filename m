From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050113154037.GC18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
	<20050113154037.GC18864@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Jan 2005 15:49:09 +0000
Message-Id: <1105631350.26551.204.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-13 at 16:40 +0100, Jörn Engel wrote:
> 
> 2) Last node per erase block is a special endmarker node, similar to
>    cleanmarkers.
> 
> 3) During unmount, an endmarker is written to the end of all
>    partially-filled erase blocks.

This ties in quite nicely with the checkpointing where such a per-block
'endmarker' would contain a summary of what the mount code would glean
by reading through that eraseblock.

-- 
dwmw2
