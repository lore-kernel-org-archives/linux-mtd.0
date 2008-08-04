Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ6Gp-00018I-2k
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 20:03:08 +0000
From: David Brownell <david-b@pacbell.net>
To: "Kamat, Nishant" <nskamat@ti.com>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Date: Mon, 4 Aug 2008 13:02:46 -0700
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<DFEF307E035C8647B119E6A60DB62D4AE47C155A@dlee02.ent.ti.com>
	<20080804142426.GK8885@atomide.com>
In-Reply-To: <20080804142426.GK8885@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808041302.46323.david-b@pacbell.net>
Cc: Tony Lindgren <tony@atomide.com>, Kyungmin Park <kmpark@infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 04 August 2008, Tony Lindgren wrote:
> Looks like this driver does not exist outside linux-omap tree,
> care to send the whole driver to MTD list?

Unless someone created a big-endian OMAP, the cpu_to_le16()
calls in the read/write buffer calls can be removed ... and
then the read buffer code can use __raw_readsw(...) to get
what's been a significant speedup on some other ARMs.  (The
atmel_nand.c code should be usable as-is.)

If there are big-endian OMAPs, it's still unclear why that
would be needed (maybe the hardware ECC code would need to
become byteorder-aware?) ... little point in byteswapping
on the i/o paths, except maybe to slow things down.

It'd make sense to merge the driver version which handles
both OMAP2 and OMAP3, too.  With beagleboard.org pushing
out those puppies, the omap3 support matters more.  :)

- Dave
