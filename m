Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvrw5-0003r9-UF
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 19:17:02 +0000
Received: by padhx2 with SMTP id hx2so199402768pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2015 11:16:40 -0800 (PST)
Date: Mon, 9 Nov 2015 11:16:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Andrew E. Mileski" <andrewm@isoar.ca>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: Hang on reboot in nand_get_device()
Message-ID: <20151109191638.GH12143@google.com>
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
 <5640E95D.5060405@isoar.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5640E95D.5060405@isoar.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 09, 2015 at 01:43:41PM -0500, Andrew E. Mileski wrote:
> On 2015-11-06 13:00, Brian Norris wrote:
> >On Thu, Jul 02, 2015 at 03:21:48PM -0400, Andrew E. Mileski wrote:
> >>I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
> >>dual chip-select NAND part (specified in the device tree as two
> >>separate devices), and kernel v4.0.6.
> >
> >Which driver?
> 
> Sorry, I wasn't specific enough:  fsl_elbc_nand.c
> 
> Currently using the 4.2.0 Linux kernel version, and the problem persists.
> 
> I've actually made a small hack to it to enable software ECC, but it
> isn't fit for distribution.
> 
> The stock driver is rather ugly in my opinion, and makes some overly
> broad assumptions about the hardware; the driver really is only
> intended to support hardware ECC.  I've taken a few stabs at
> cleaning-up the stock driver, but they all end-up being complete
> re-writes (for multi-die support), which is a bit more than I can
> chew.
> 
> The driver otherwise is usable as-is, albeit with only hardware ECC
> (that is insufficient for many modern NAND devices), and exhibits
> the same problem.

Yikes, I wish I hadn't actually taken a closer look at that driver :(
It could really use some rewrites for proper multi-chip/multi-die
support.

...

> >Anyway, if the above looks OK, I can send a proper patch and get your
> >'Tested-by's.
> >
> >Brian
> 
> That seems to work too!  Thanks!

Great! I'll review Boris's suggestions to see if there's a better
option.

Brian
