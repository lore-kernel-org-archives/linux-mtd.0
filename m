Received: from n24.bullet.mail.mud.yahoo.com ([68.142.206.163])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrK1j-00009w-Mj
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 22:44:25 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] MTD-NAND: Changes to read_page APIs to support
	NAND_ECC_HW_SYNDROME mode on TI DaVinci DM355
Date: Tue, 7 Apr 2009 15:44:15 -0700
References: <1238601784-9563-1-git-send-email-nsnehaprabha@ti.com>
	<200904061849.23110.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0CFFAA90C0@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0CFFAA90C0@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200904071544.15558.david-b@pacbell.net>
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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
> > > > If your device does not do that or you do not want to utilize it for
> > > > whatever reasons then just use the NAND_ECC_HW mode which lets you
> > > > place your ECC data where ever you want.
> > 
> > And that's exactly what these patches do:  enable just such choices.
> > The $SUBJECT patch would be needed to use NAND_ECC_HW with this 4-bit
> > ECC hardware, and not be forced to "choose" the infix-OOB policy.
> 
> I had looked read_page/write_page APIs of the NAND_ECC_HW mode to see
> if we can use this mode for DaVinci DM355 device. 
> 
> The read_page handler for NAND_ECC_HW mode reads the data and ECC from
> hardware for each chunk. It then reads the OOB and extracts ecc code
> from it, before using the ECC from hardware and ecc code from OOB for
> data correction.   

That's pretty much what the RFC patches I sent about 2 months ago
were doing.  One "RFC" aspect was very much whether there wasn't
a better option than "infix OOB".  Overview of the patches and test
results:

  http://linux.omap.com/pipermail/davinci-linux-open-source/2009-February/010977.html

The patches won't quite apply to the version of the DaVinci NAND
driver now in mainline, but they've had only minor changes since then:

  http://linux.omap.com/pipermail/davinci-linux-open-source/2009-February/010979.html
	Adds basic 4-bit ECC support to the DaVinci NAND driver using
	HW_SYNDROME, but limited to single ECC step (small page NAND).

  http://linux.omap.com/pipermail/davinci-linux-open-source/2009-February/010976.html
	Now in mainline ... fixes NAND-core data corruption caused
	by using HW_SYNDROME with multi-step ECC.

  http://linux.omap.com/pipermail/davinci-linux-open-source/2009-February/010978.html
	Updates that 4-bit ECC support to work with multi-step ECC,
	but *strongly* restricted to something else writing the BBT.

Since then I haven't put any more work into sorting out where the
u-boot failure and oob/subpage test failures came from.  That stuff
was not tested with 4KB pages either ... there's at least one bug
in the NAND core code that Sneha pointed out.

(Thomas, the discussion thread for the second of those patches has
more background if you're interested and have the time.)


> The read_page/write_page APIs for NAND_ECC_HW_SYNDROME have the other
> problem that David mentioned - overwriting NAND manufacturers bad block
> meta data, when used with large page NAND chips.

The third patch above goes to some length to prevent Linux from
doing anything other than taking a BBT from flash that something
else has written.  So long as nothing trashes that BBT, and there's
a nice way to get it written in the first place (u-boot need not
apply, it'll have the same issues as Linux), things might act
OK -- once someone resolves the failures I observed.  Still seems
undesirably (and needlessly) fragile to me.

And I rather suspect that fragility is the reason the ROM boot
loader in newer chip revisions from TI is avoiding "infix OOB".
Plus likely a bit of feedback from their development partners
who package end-product NAND programming solutions ... I'm just
guessing, but it sure seems to me like there are many reasons
to avoid that "infix OOB" fragility.

- dave
