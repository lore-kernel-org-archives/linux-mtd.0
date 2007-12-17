Date: Mon, 17 Dec 2007 15:46:22 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
In-Reply-To: <1197720795.25999.57.camel@sauron>
Message-ID: <Pine.LNX.4.64.0712171454550.29723@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1197720795.25999.57.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> 
> Hi, this stuff looks nice and useful for me. Few suggestions:
> 
> 1. Please, use -p option when you generate patches.
> 
No problem. The next patch will be with this option.
> 2. We already have notion of subpage in nand_base.c. We already can
> write subpages. Your patch is about reading subpages, so I suggest you
> to do something like s/partial/subpage/. E.g., UBI utilizes sub-page
> writes.
> 
Good point. The question is what name would be better. I used partial
page read because of NAND datasheet (Intel, St, Micron uses term partial
page read or write instead of subpage read or write). May be it will be
better to switch to this name to make search more easy?

> 3. Run nand-tests to make sure you did not brake anything:
> git://git.infradead.org/~ahunter/nand-tests.git
> 
Thank you for link - we will try it. 
(before sending out this code we performed excessive testing - about 500
items were executed, including stress, multithread, power loss tests)

> Question: what was the flash you tested this on? Judging from the
> comments it was a 512-byte page NAND, right?
> 
It was LP NAND with 2048/64 bytes of main/oob area per page.
> ==========================
> Also, an separate idea I'd suggest you too look at, but after you have
> your patch in:
> 
> Glance in how nand_base.c does sub-page write. It writes whole NAND page
> anyway, but fills the subpages which it does not want to write with
> 0xFFs. I am not sure, but I suspect it could be smarter and write only
> the requested subpage. If this is true, and you will do this, then the
> notion of subpage could go away.
> 
> Indeed, you could declare mtd->writesize = subpage size then, not NAND
> page size. Then, for example, for 512-page-byte NANDs you'd have
> 256-byte mtd->writesize, and JFFS2 would have 256-byte write-buffer, and
> you'd speed up jffs2 writes, because it would write less space when it
> synchronizes the write-buffer, and it would waste less space, which
> means less Garbage-collection.
> ==========================
> 
Yes. I looked at this implementation. Your idea of partial/subpage write implementation 
looks good. In fact there will be some drawbacks - if every request will
become small, write performance will become lower - because writing and
positioning are not for free. May be it make sence to add this feature under flag. 
It will take some time to implement this feature, but it definetely make
sense to try and play with it. 
It is not clear how to handle the situation with oob write requests.
What to do if some one wil ask to write a part of page and oob at the
same time? 

I did not understand this part of the code about subpage write:
	/*
	 * Allow subpage writes up to ecc.steps. Not possible for MLC
	 * FLASH.
	 */
	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
		switch(chip->ecc.steps) {
		case 2:
			mtd->subpage_sft = 1;
			break;
		case 4:
		case 8:
			mtd->subpage_sft = 2;
			break;
		}
	}
Why it sets subpage shift to 2 in case of eight ECC steps? It should be
3. (step size is 1/8 of page)


> > +	/* Column address wihin the page aligned to ECC size (256bytes). */
> Why this comment says about 256 bytes. AFAIU, this will be 512 bytes in
> case of 2048-byte NAND page.
>
It is 256 bytes for SOFT_ECC. Arifmetics is quite simple 3 bytes
ECC per 256 bytes of data. 

> > +	if (data_col_addr != 0) {
> > +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
> > +	}
> Redundant curly brackets
>
Thanks. Will be fixed.
 
> >  #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
> > +#define NAND_CANPARTREAD(chip) ((chip->options & NAND_PART_READ) &&\
> > +				(chip->ecc.mode == NAND_ECC_SOFT))
> 
> Why chip->ecc.mode == NAND_ECC_SOFT?
>
I added this limitation because I have only ECC_SOFT chips and afraid to
broke workability non SOFT_ECC chiups. I guess it should work fine for
other devices. Just kind of over protection. It is not a problem to
remove it. 

Thank you for your comments. Waiting for you response.

Alexey
