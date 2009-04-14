Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtmYZ-00054L-MM
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 17:36:33 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Date: Tue, 14 Apr 2009 10:36:13 -0700
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<7A436F7769CA33409C6B44B358BFFF0CFFAA9253@dlee02.ent.ti.com>
	<200904071546.14898.david-b@pacbell.net>
In-Reply-To: <200904071546.14898.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200904141036.13325.david-b@pacbell.net>
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

On Tuesday 07 April 2009, David Brownell wrote:
> > 
> >  I have not sent the actual NAND driver to the linux-mtd yet, since
> >  the initial version (supported only 1-bit HW ECC) submitted by David
> >  Brownell was still in review (no comments and not approved yet).
> 
> It merged to mainline yesterday; should verify on DM6446 EVM.

For the record:  it seems to have merged OK, and the resulting
driver passed all the mtd tests I threw at it.  Current mainline
Linux and U-Boot interop through that small-page NAND just fine.

- Dave
