Received: from n26.bullet.mail.mud.yahoo.com ([68.142.206.221])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M277m-0004Mx-Kk
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 17:11:17 +0000
From: David Brownell <david-b@pacbell.net>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Date: Thu, 7 May 2009 10:11:06 -0700
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
	<200905070016.52356.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200905071011.06812.david-b@pacbell.net>
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

On Thursday 07 May 2009, Narnakaje, Snehaprabha wrote:

> > I'm glad to see this patch is so small ... basically, just
> > adding a special case for 2K pages, and keeping the core of
> > this NAND driver the same.  Not needing to change the 4-bit
> > ECC support from the patch I sent earlier seems a good sign.
> 
> Yes, I had to use the .calculate in the new read_page handler
> to stop the ECC though. 

Oh, now I see what you were talking about off-list.  That
doesn't seem quite right.  I'll take a look.


> > Two comments though:  (a) the board-dm355-evm.c file isn't
> > yet in mainline, so the MTD folk can't take this patch as-is;
> 
> Sorry, I didn't realize this. I will separate the board-dm355-evm.c
> from this patch and submit the patch #3 for board-dm355-evm.c to go
> to davinci-linux-open-source.  

Let's wait until we see the previous davinci_nand.c patches get
queued up somewhere "official" though ... in fact, I don't see
why they shouldn't merge for 2.6.30-soon.


> > (b) as noted elsewhere, there are still issues with 4K pages
> > and the NAND core infrastructure.
> 
> Yes, this is still an issue, if we make the read_page handler
> use .eccpos[] for positioning the ECC bytes in the OOB area.
> If we had fixed prepad+ecc nand_ecclayout we would avoid using
> eccpos[] (This is what my initial set of 4-bit ECC patches did
> to support 4K). But this is not a generic solution.    
> 
> The main problem is with nand_ooblayout structure that is not
> extendable for large pages 4K or more, without breaking the
> userspace IOCTLs that is dependent on the size of this structure.   
> 
> Question to linux-mtd list: Are there plans in the linux-mtd to 
> address this generic issue, now that NAND manufacturers are
> coming up NAND chips > 4K page size?

They've been doing it for a while now, actually.  :)

And it wouldn't be an issue here ... *IF* this 4-bit ECC didn't
need to use 80 bytes (8 chunks of 512 bytes, 10 bytes ECC per
chunk) from a 64 byte field.  Doesn't fit.

Maybe the ecclayout stuff should migrate to sysfs, and just
drop the old ioctl stuff for parts that can't use it ... as
is being done to support chips that are 4 GByte and bigger.


> > > +static struct nand_ecclayout hwecc4_2048 __initconst = {
> > > +       .eccbytes = 10,
> > 
> > Not ".eccbytes = 40"?  This is 4 chunks, 10 ecc bytes each...
> 
> No, .eccbytes is for each chips->ecc.steps. 

So it's the same as ecc.bytes, which is not exported to userspace.


> And all nand read/write 
> APIs, we handle ecc.steps (for loop). There is chips->ecc.total that
> is initialized as (chips->ecc.steps * chips->ecc.bytes).  
> 
> It is strange that .eccbytes is for each chunk, while eccpos[] and
> .oobfree[] have to handle/cover all chunks. 

Also strange:  when ECC_HW_SYNDROME is in use, nothing even
looks at the nand_ecclayout to make sure it matches the actual
layout being used ... which derives entirely from the prepad,
postpad, and bytes fields of "ecc".  (Except that some of the
OOB bytes not used for ECC may be hidden, e.g. manufacturer
bad block markers are usually not listed.)

- Dave
