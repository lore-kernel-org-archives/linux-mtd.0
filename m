Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fvy6o-0007V5-Nf
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 11:07:33 -0400
Date: Thu, 29 Jun 2006 17:07:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2 wbuf non-contiguous write bug
Message-ID: <20060629150701.GB29253@wohnheim.fh-wedel.de>
References: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
	<20060629124433.GA19237@wohnheim.fh-wedel.de>
	<fe810cf0606290741r2b1de379mc0ba49c2aa336757@mail.gmail.com>
	<625fc13d0606290746x1c8bff28j96769da31e5bc3f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0606290746x1c8bff28j96769da31e5bc3f3@mail.gmail.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 June 2006 09:46:10 -0500, Josh Boyer wrote:
> On 6/29/06, Alexander Belyakov <abelyako@googlemail.com> wrote:
> >On 6/29/06, Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> >
> >Anyway I was speaking _not_ about reverting part of your patch but
> >about getting back following code for Sibley, since it indeed shows if
> >we moved to a new eraseblock.
> >
> >                if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) 
> >                {
> >                        c->wbuf_ofs = PAGE_DIV(to);
> >                        c->wbuf_len = PAGE_MOD(to);
> >                        memset(c->wbuf,0xff,c->wbuf_pagesize);
> >                }
> >
> >> You must be missing something, but I don't know what.  Maybe Josh has
> >> some insight into this problem - he did a thorough review and asked
> >> many probing questions about this particular part of the patch.
> >
> >It would be really nice, since current code seems to be broken somehow.
> 
> I remember going over this with Jörn a while back and being convinced
> NOR ECC didn't need that check any longer.  I don't recall looking if
> Sibley does though.  I'll try to look at it again, but obviously if it
> fixes a bug then it should probably go back in.  I don't think it can
> hurt anything at the moment.

Agreed.  If the second check had been in the git code already,
        if (jffs2_nor_ecc(c) || jffs2_nor_wbuf_flash(c)) {
I would have sent a different patch, simply combining the two
conditions into one.

Next question is: does the check against sibley/nor_ecc make sense?
Would the code hurt anyone if it was enabled for nand and dataflash as
well?

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
