Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YICwn-0005WL-HE
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:05:34 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so80036453pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 01:05:12 -0800 (PST)
Date: Mon, 2 Feb 2015 01:05:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] mtd: nand: jz4740: Convert to GPIO descriptor API
Message-ID: <20150202090508.GF3523@norris-Latitude-E6410>
References: <1417549706-28420-1-git-send-email-lars@metafoo.de>
 <20141215154408.GD9382@linux-mips.org>
 <20150109200535.GV9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150109200535.GV9759@ld-irv-0074>
Cc: linux-mips@linux-mips.org, Lars-Peter Clausen <lars@metafoo.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 09, 2015 at 12:05:35PM -0800, Brian Norris wrote:
> On Mon, Dec 15, 2014 at 04:44:08PM +0100, Ralf Baechle wrote:
> > On Tue, Dec 02, 2014 at 08:48:26PM +0100, Lars-Peter Clausen wrote:
> > 
> > > Use the GPIO descriptor API instead of the deprecated legacy GPIO API to
> > > manage the busy GPIO.
> > > 
> > > The patch updates both the jz4740 nand driver and the only user of the driver
> > > the qi-lb60 board driver.
> > > 
> > > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> > > ---
> > > This patch should preferably be merged through the MTD tree with Ralf's ack for
> > > the MIPS bits.
> > 
> > Acked-by: Ralf Baechle <ralf@linux-mips.org>
> 
> For MTD stuff:
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> > Though in my experience MIPS-specific patches to non-arch/mips code receive
> > best testing in the MIPS tree.
> 
> I don't mind this going in the MIPS tree. I doubt this driver will get
> much other activity in MTD soon, and you're likely quite right about
> MIPS testing.
> 
> Let me know if you'd like to take it. If I don't hear back in a week or
> two, I'll take it via MTD.

OK, applied to l2-mtd.git.

Brian
