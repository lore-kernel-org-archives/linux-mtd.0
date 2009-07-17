Received: from smtp107.sbc.mail.gq1.yahoo.com ([67.195.14.110])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRupJ-0005RQ-Ea
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 21:18:50 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Date: Fri, 17 Jul 2009 14:18:41 -0700
References: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
	<200907171232.53725.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0C011E717E14@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C011E717E14@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200907171418.42113.david-b@pacbell.net>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 17 July 2009, Narnakaje, Snehaprabha wrote:
> 
> > Agreed that needs to be fixed, but there should be a comment
> > about this being an *undocumented* behavior in the hardware.
> > 
> > The reason that the bug exists at all is because this step
> > has never been documented.  So, please roll in this update.
> 
> How about, we get the documents updated for this missing step.

I had hoped this was in the works, but I was told
that for some reason being able to do that was a
problem.  And in the few months since this issue
was identified, the docs haven't been updated.  :(

- Dve
