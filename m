From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20060107174523.460f1849.akpm@osdl.org>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
	<20060108002457.GE3774@stusta.de>
	<1136680734.30348.34.camel@pmac.infradead.org>
	<20060107174523.460f1849.akpm@osdl.org>
Content-Type: text/plain
Date: Sun, 08 Jan 2006 12:41:12 +0000
Message-Id: <1136724072.30348.66.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, bunk@stusta.de
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN and
	remove broken MTD_OBSOLETE_CHIPS drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-01-07 at 17:45 -0800, Andrew Morton wrote:
> Hey, Adrian isn't an MTD developer

Indeed he is not. And while his minor nitpicks can sometimes be worth
the effort, it's less useful for him to start making value judgements
about removing drivers which have _theoretically_ been replaced by new
code, but which are actually still being used in some cases.

> What he's doing here is to poke other maintainers into getting the tree
> cleaned up.  It's a useful thing to do.

I know what needs doing to clean the tree up -- and removing the older
chip drivers is very far from the top of my todo list. If you really
want to accelerate their demise, add a #warning and a printk saying "You
should no longer be using this driver -- try using jedec_probe or
cfi_probe instead and contact the linux-mtd list if that fails". 

> If you, an MTD maintainer, can tell him what we _should_ be doing, I'm sure
> Adrian would help.

That would be much appreciated -- and _useful_. We need to add sysfs
support to MTD devices, we need to revamp the way that the chip probe
code hands off to the back-end chip drivers, and in doing so get rid of
the use of inter_module_crap(), and we need to audit the module
refcounting while we're at it.

I'm hoping I'll get a week or two some time soon to sit down and
actually concentrate on that, because it's not something I can really
pick at piecemeal and it wants proper testing. But if Adrian wants to
have a go, that would be wonderful.

But picking away at what looks like low-hanging fruit without a real
understanding of what's going on doesn't really help much.

-- 
dwmw2
