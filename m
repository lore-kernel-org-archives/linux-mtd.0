From: David Woodhouse <dwmw2@infradead.org>
To: Armin Schindler <armin@melware.de>
In-Reply-To: <Pine.LNX.4.31.0401261520320.32301-100000@phoenix.one.melware.de>
References: 
	 <Pine.LNX.4.31.0401261520320.32301-100000@phoenix.one.melware.de>
Content-Type: text/plain
Message-Id: <1075203149.1633.43.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 11:32:30 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 15:26 +0100, Armin Schindler wrote:
> I thought, that such errors will be fixed, but every time I mount the partition,
> these errors still exist.

They'll persist until the garbage collection erases the block in
question. That'll happen naturally in time, although I suppose we
probably ought to prioritise it so the blocks we complain about are GC'd
sooner. 

It's harmless. I prefer to err on the side of verbosity than to miss
reporting things which really _could_ be a problem. 

-- 
dwmw2
