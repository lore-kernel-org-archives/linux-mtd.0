From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050110145154.GC12520@wohnheim.fh-wedel.de>
References: <20050108211842.GA17176@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>
	<20050110145154.GC12520@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Jan 2005 15:13:10 +0000
Message-Id: <1105369990.5698.95.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-10 at 15:51 +0100, Jörn Engel wrote:
> Exactly.  Anything other than functional code makes it hard to read
> and even harder to change.  So the chances of introducing bugs are
> much higher.  In a way, the debug code is needed because of the debug
> code itself.
> 
> Sure, it also serves a real purpose and not having any debug code
> requires programmers that don't cause bugs.  So it is a necessary
> evil.  The real art is to get by with as little debug code as
> possible, yet have enough data to easily find any problems.

I don't really see how printks make the code harder to read. You can
probably convince your editor to hide them from you automatically if
they really offend you.

I prefer to optimise for the common case -- which is the _user_ not the
developer. The level of verbosity if you enable CONFIG_JFFS2_FS_DEBUG is
high, but it means that I can take a log from a clueless end-user and
see precisely what's going on. I can look at a log from someone who's
having problems, see precisely what's happening, and provide a patch in
reply. While there are certainly some printks which can go, and even
more could be demoted to level 2 from level 1 (which is all that's ever
really useful), I wouldn't want to see it completely stripped of
debugging output. Not unless you want to take over the task of
supporting users ;)

-- 
dwmw2
