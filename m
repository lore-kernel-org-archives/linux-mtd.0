From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112170256.GF25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Jan 2005 17:06:02 +0000
Message-Id: <1105549562.26551.120.camel@hades.cambridge.redhat.com>
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

On Wed, 2005-01-12 at 18:02 +0100, Jörn Engel wrote:
> Would this actually be an advantage?  Last time I looked, it was
> cheaper to use more DRAM.  Most DSL routers I see advertised have a
> 1:4 or 1:8 ratio of NOR:DRAM, so it looks as if the prices haven't
> changed much.

Cheaper and faster. But remember who Jared works for :)

Seriously though, XIP is a win on power -- it doesn't take constant
application of power to keep your data in flash. If you start comparing
prices of SRAM and flash, the game becomes a little different.

Of course, if you're _that_ concerned about the power budget one has to
wonder why you're using Linux, but then JFFS2 runs on eCos too...

-- 
dwmw2
