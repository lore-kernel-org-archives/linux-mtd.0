Received: from tim.rpsys.net ([194.106.48.114])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GD7SV-0004tY-CP
	for linux-mtd@lists.infradead.org; Tue, 15 Aug 2006 23:32:30 +0100
Subject: Re: 2.6.18-rc4 jffs2 problems
From: Richard Purdie <rpurdie@rpsys.net>
To: Jonathan McDowell <noodles@earth.li>
In-Reply-To: <20060810060409.GH27094@earth.li>
References: <1154976111.17725.8.camel@localhost.localdomain>
	<20060809093419.GA14187@earth.li>  <20060810060409.GH27094@earth.li>
Content-Type: text/plain
Date: Tue, 15 Aug 2006 23:29:11 +0100
Message-Id: <1155680951.5542.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-08-10 at 07:04 +0100, Jonathan McDowell wrote:
> A "git bisect" is flagging up 8593fbc68b0df1168995de76d1af38eb62fd6b62
> as the problem commit:
> 
> commit 8593fbc68b0df1168995de76d1af38eb62fd6b62
> Author: Thomas Gleixner <tglx@cruncher.tec.linutronix.de>
> Date:   Mon May 29 03:26:58 2006 +0200
> 
>     [MTD] Rework the out of band handling completely

I found time to do some testing myself and can confirm this is the
problem patch for sharpsl as well. I don't see the problem with recent
git kernels if I apply:

http://www.rpsys.net/openzaurus/patches/mtd_revert_oob-r0.patch

which is a hack reverting the above change (only on the bits of the
kernel which sharpsl needs). I'll see if I can trim the diff down and
find the problem...

Richard
