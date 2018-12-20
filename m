Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZyzG-0006e3-JJ
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 14:07:44 +0000
Date: Thu, 20 Dec 2018 15:07:26 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "richard@nod.at" <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] mtd: rawnand: Support bad block markers in first,
 second or last page
Message-ID: <20181220150715.5b19f480@bbrezillon>
In-Reply-To: <20181220145954.55ae36e9@bbrezillon>
References: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
 <1545061693-29216-2-git-send-email-frieder.schrempf@kontron.de>
 <20181220145954.55ae36e9@bbrezillon>
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

On Thu, 20 Dec 2018 14:59:54 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> >  
> >  /**
> > + * nand_bbm_page_offset - Get the page offsets for bad block markers
> > + * @chip: NAND chip object
> > + * @index: Index for the page offset  
> 
> Hm, the meaning of index is far from obvious. How about passing the
> current page instead (and return 1 if there are more pages to scan 0
> otherwise)?
> 
> Something like:
> 
> static int nand_bbm_get_next_page(struct nand_chip *chip, int page)
> {
> 	struct mtd_info *mtd = nand_to_mtd(chip);
> 	int last_page = ((mtd->erasesize - mtd->writesize) >>
> 			 chip->page_shift) & chip->pagemask;
> 
> 	if (page < 0 && chip->bbt_options & NAND_BBT_SCANFIRSTPAGE)
> 		return 0;
> 	else if (page < 1 && chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
> 		return 1;
> 	else if (page < last_page &&
> 		 chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> 		return last_page;
> 
> 	return -1;
> }
> 
> And yes, that means defining NAND_BBT_SCANFIRSTPAGE and setting it when
> appropriate.
> 

Oh, and you'll have to define NAND_BBT_SCANFIRST2PAGES like this

#define NAND_BBT_SCANFIRST2PAGES NAND_BBT_SCAN1STPAGE |	\
				 NAND_BBT_SCAN2NDPAGE

and then patch all users of NAND_BBT_SCAN2NDPAGE to use
NAND_BBT_SCANFIRST2PAGES instead.
