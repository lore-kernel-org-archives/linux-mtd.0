Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atfzW-00081i-PU
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 18:39:47 +0000
Date: Fri, 22 Apr 2016 20:39:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEN to userspace?
Message-ID: <20160422203912.0d839395@bbrezillon>
In-Reply-To: <571A6B64.9000600@nod.at>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon>
 <20160422172802.4fa830d1@bbrezillon> <571A47D3.6040602@nod.at>
 <20160422181103.3691112a@bbrezillon> <571A6B64.9000600@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 Apr 2016 20:20:20 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 22.04.2016 um 18:11 schrieb Boris Brezillon:
> >> Sasha, what exactly is your use case and why is the UBI approach not sufficient for you?
> >> On Linux MTD access should only happen through UBI and UBOOT/SPL partitions stay untouched.  
> > 
> > Fair enough. So all we'll need is a way to retrieve the maximum number
> > of bitflips for a given block, so that the userspace deamon can
> > periodically read the SPL and bootloader blocks and decide to scrub
> > those blocks if the number of bitflips exceed the threshold.  
> 
> How can we scrub non-UBI blocks in a power cut safe way?
> Unless we have a backup SPL/booloader.

Of course this assumes you have backup partitions.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
