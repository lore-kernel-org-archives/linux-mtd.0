Received: from smtp128.sbc.mail.sp1.yahoo.com ([69.147.65.187])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrK3d-0004Rk-IV
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 22:46:24 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Date: Tue, 7 Apr 2009 15:46:14 -0700
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<alpine.LFD.2.00.0904071831550.21577@localhost.localdomain>
	<7A436F7769CA33409C6B44B358BFFF0CFFAA9253@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0CFFAA9253@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904071546.14898.david-b@pacbell.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 07 April 2009, Narnakaje, Snehaprabha wrote:
> 
>  I have not sent the actual NAND driver to the linux-mtd yet, since
>  the initial version (supported only 1-bit HW ECC) submitted by David
>  Brownell was still in review (no comments and not approved yet).

It merged to mainline yesterday; should verify on DM6446 EVM.

The funky bits are fortunately limited to the 4-bit ECC support,
which are natural to review/evaluate as deltas on top of that core.
It was easy to tell they would bring out some confusion, which is
a good sign of something that's worth reviewing separately.

And, given the patches I referenced previously ... even those
should only be an issue for large page chips.  (And no DaVinci
board that uses large page chips has hit mainline yet.  Lots of
stuff in the queue for, one hopes, 2.6.31 though.)

- Dave
