Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFPnR-0004ax-Dm
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 18:53:44 +0000
Date: Mon, 29 May 2017 20:53:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: tango: Fix incorrect use of SEQIN command
Message-ID: <20170529205319.6bbc2a5d@bbrezillon>
In-Reply-To: <b9c5447f-2b55-9323-a348-13d2bda16335@sigmadesigns.com>
References: <1494886224-20393-1-git-send-email-boris.brezillon@free-electrons.com>
 <20170516003001.636a9cac@bbrezillon>
 <b9c5447f-2b55-9323-a348-13d2bda16335@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 May 2017 10:38:21 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 16/05/2017 00:30, Boris Brezillon wrote:
> 
> > Boris Brezillon wrote:
> >   
> >> SEQIN is supposed to be used one wants to start programming a page.  
> > 
> > 			      ^ when one ...
> >   
> >> What we want here is just changing the column within the page, which is  
>                              
> I would write "is just to change".
> 
> >> done with the RNDIN command.
> >>  
> > 
> > Forgot the following tags.
> > 
> > Fixes: 6956e2385a16 ("mtd: nand: add tango NAND flash controller support")
> > Cc: state@vger.kernel.org  
> 
> stable, I assume.
> 
> >> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >> ---
> >>  drivers/mtd/nand/tango_nand.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> >> index 05b6e1065203..a2150b15d4c1 100644
> >> --- a/drivers/mtd/nand/tango_nand.c
> >> +++ b/drivers/mtd/nand/tango_nand.c
> >> @@ -332,7 +332,7 @@ static void aux_write(struct nand_chip *chip, const u8 **buf, int len, int *pos)
> >>  
> >>  	if (!*buf) {
> >>  		/* skip over "len" bytes */
> >> -		chip->cmdfunc(mtd, NAND_CMD_SEQIN, *pos, -1);
> >> +		chip->cmdfunc(mtd, NAND_CMD_RNDIN, *pos, -1);
> >>  	} else {
> >>  		tango_write_buf(mtd, *buf, len);
> >>  		*buf += len;  
> 
> Looks correct, but I have no knowledge of NAND protocols :-)
> 
> Acked-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Applied to nand/next after fixing commit message + stable address.

> 
> Regards.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
