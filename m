Received: from smtp103.sbc.mail.gq1.yahoo.com ([67.195.15.62])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MjKAl-0007Pf-GY
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 21:48:57 +0000
From: David Brownell <david-b@pacbell.net>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: Re: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Date: Thu, 3 Sep 2009 14:48:42 -0700
References: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
	<200908271908.15309.david-b@pacbell.net>
	<0554BEF07D437848AF01B9C9B5F0BC5D91E07BD2@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D91E07BD2@dlee01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200909031448.43314.david-b@pacbell.net>
Cc: Troy Kisky <troy.kisky@boundarydevices.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 28 August 2009, Paulraj, Sandeep wrote:
> I've already sent the patch to U-Boot and it has been accepted.
> Its in the nand next branch.

Actually at that time it was also in the u-boot-next branch;
and since then (after U-Boot 2009.08 got tagged) it's been
merged into the current U-Boot GIT tree.  :)


> For things to become fully functional i'll need a syncs
> between the various branches of U-Boot. I'll have to enable
> stuff in the DM355 and Dm365 configs    
 
I've got a DM355 config patch; why don't I send that along,
after I test with the latest u-boot and some Linux version
which includes the relevant NAND apatches.  It's been
waiting on that merge, which has now happened.

- Dave
