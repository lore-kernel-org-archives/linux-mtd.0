Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EV3RV-0006AO-He
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 04:49:03 -0400
Date: Thu, 27 Oct 2005 10:49:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <priewasser@gmail.com>
Message-ID: <20051027084900.GE24422@wohnheim.fh-wedel.de>
References: <436089F3.806@gmail.com>
	<20051027082108.GC24422@wohnheim.fh-wedel.de>
	<43609066.1010805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43609066.1010805@gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NOR "bad blocks"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 October 2005 10:31:34 +0200, Bernhard Priewasser wrote:
> 
> So this means that you have to hope that no block will wear out. And 
> count on JFFS2's wear levelling.

>From an engineering point of view: yes.  With decent wear levelling,
all blocks will roughly wear out at the same time, which you can
calculate beforehand.  You need to know your average write rate and
pick a device large enough to support that rate for your target
lifetime.

JFFS2 also has checksums, so when the bitflipping happens, it will get
noticed.  But that doesn't mean that it is interpreted as bitflipping.
Most checksum errors are caused by unfinished writes during power
failure.

> What are the reasons that cause NAND blocks to die before they would 
> "officially" wear out?

Dunno, not my area of expertise.

> Dou you have a hint for good literature on this stuff (OK, let's better 
> say NAND and NOR flash memory in general)?

I'd doubt that there is even decent literature.  Stuff is
big-business, but not sexy for research papers.  Try finding an
unbiased explanation is such an environment. ;)

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
