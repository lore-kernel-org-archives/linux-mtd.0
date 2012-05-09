Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRumZ-0003IG-3M
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 00:29:31 +0000
Date: Tue, 8 May 2012 17:29:28 -0700
From: Tony Lindgren <tony@atomide.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH v3] ARM: OMAP3: gpmc: add BCH ecc api and modes
Message-ID: <20120509002927.GF5088@atomide.com>
References: <1335442669-13474-1-git-send-email-ivan.djelic@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335442669-13474-1-git-send-email-ivan.djelic@parrot.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ivan Djelic <ivan.djelic@parrot.com> [120426 05:23]:
> Hello,
> 
> Here is version 3 of this patch after review from Tony Lindgren.
> This version adds a separate initialization function mostly to check CPU
> compatibility. This check cannot be done in gpmc_enable_hwecc_bch() (which
> is meant to be called from mtd function ecc.hwctl) because ecc.hwctl is
> not called before the first NAND read access, and it cannot return an error
> status.

Thanks applying into devel-gpmc branch.

Tony
