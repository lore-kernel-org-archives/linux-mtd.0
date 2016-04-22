Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atd0L-00089z-9F
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 15:28:25 +0000
Date: Fri, 22 Apr 2016 17:28:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de, Richard Weinberger
 <richard@nod.at>, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEN to userspace?
Message-ID: <20160422172802.4fa830d1@bbrezillon>
In-Reply-To: <20160422172456.7aaf301c@bbrezillon>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon>
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

+ Richard, Daniel and Brian,

On Fri, 22 Apr 2016 17:24:56 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Sascha,
> 
> On Wed, 20 Apr 2016 15:25:16 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Hi All,
> > 
> > I am currently working on a program similar to ubihealthd, just for raw
> > mtd pages, not UBI. Basically I want to find out in userspace if my Nand needs
> > scrubbing. Is it possible somehow to get this information in userspace?
> 
> Actually we discussed that a year ago with Richard. I told him that we
> should put the read/write/erase statistics at the MTD level so that
> other MTD users (including userspace programs) could use the same infra
> for non-UBI partitions (I need that for the UBOOT and SPL partitions).
> 
> My suggestion was to store those information at the MTD level, and let
> UBI implement its own scrubbing layer on top of that, but Richard
> decided to go for a simpler approach for its first implementation.
> 
> > 
> > So far I can count the number of bitflips corrected using the
> > ECCGETSTATS ioctl. Also I can read the bitflip_threshold from
> > /sys/class/mtdx/bitflip_threshold. The problem is now that I can only
> > read full pages, but the bitflip threshold is per ecc_step_size. Simply
> > dividing by the number of ecc_steps is not accurate. Any way to solve
> > this?
> 
> Hm, you're right, then we'll need to expose those information through a
> different ioctl.
> 
> Regards,
> 
> Boris
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
