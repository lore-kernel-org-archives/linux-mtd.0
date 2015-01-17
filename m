Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCZGf-0001SN-62
 for linux-mtd@lists.infradead.org; Sat, 17 Jan 2015 19:42:45 +0000
Date: Sat, 17 Jan 2015 20:42:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
Message-ID: <20150117204217.1a468f02@bbrezillon>
In-Reply-To: <54BAB774.3010102@nod.at>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <20150117200137.71c1aca0@bbrezillon> <54BAB774.3010102@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Steve deRosier <derosier@gmail.com>, Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 17 Jan 2015 20:26:44 +0100
Richard Weinberger <richard@nod.at> wrote:

> Am 17.01.2015 um 20:01 schrieb Boris Brezillon:
> > Just sharing my experience with MLC NANDs requiring read-retry: the
> > number of reported bitflips often raise ecc_strength value (at least
> > with the current read-retry approach).
> > This patch will definitely make UBI move NAND blocks over and over
> > again considering the threshold has been raised and the block is not
> > reliable anymore.
> 
> Within the last 6 months I had to face a lot of strange UBI/MTD issues.
> All showed one "flaw" in UBI, namely that it was designed with good SLC
> NANDs in mind.
> Even some modern SLC NANDs show bad behavior like read disturb after
> less than 100000 reads.
> I think it is time to bite the bullet and improve UBI wrt. MLC NAND.
> This is not an easy task as it needs some hardware to play with and
> time/budget. But I think it is worth the effort.

I do all my MLC tests on a cubietruck (embedding an Allwinner A20 SoC
and a Micron MLC NAND).
I already started to work on randomizer/scrambler support (which are
needed on some MLC chips), and added support for read-retry on a Micron
non-ONFI NAND (you can find my work here [1], but it's not ready to be
mainlined yet).
But these are all things we can handle in the NAND layer.

Then comes trickier parts, like improved bitflips robustness (as
you stated), paired pages handling (you cannot reliably write on one
page without risking to corrupt the page it is paired with, which
implies specific handling for such cases in upper layers: UBI/UBIFS ?),
and surely other things I don't remember :-).

Anyway, I'd be happy to help with any of these tasks.

Best Regards,

Boris

[1]https://github.com/bbrezillon/linux-sunxi/commits/sunxi-nand-next


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
