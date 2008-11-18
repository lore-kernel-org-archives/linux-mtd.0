Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1227017078.16925.123.camel@sauron>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
	<20081113.005534.56563769.anemo@mba.ocn.ne.jp>
	<8bd0f97a0811120808p5858d5adleeef43b1d374bee1@mail.gmail.com>
	<1227016647.27728.398.camel@macbook.infradead.org>
	<1227017078.16925.123.camel@sauron>
Content-Type: text/plain
Date: Tue, 18 Nov 2008 14:15:26 +0000
Message-Id: <1227017726.27728.402.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-11-18 at 16:04 +0200, Artem Bityutskiy wrote:
> Off topic: is this going to really happen? Are you have real plans
> to do this?

The plans for partitioning aren't entirely defined, but yes -- we have
to do it.

> Also, you also mentioned that you have sysfs for MTD, are we going to
> see them in mtd-2.6.git any time soon?

I did a bunch of it when I was on the plane to the kernel summit and
plumbers conference. I should get it to actually compile and then put it
in a separate tree -- I don't think it'll be ready for merging to Linus
imminently.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
