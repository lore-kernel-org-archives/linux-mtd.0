Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg8Yt-00083F-VF
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 13:01:45 +0000
Date: Thu, 19 Jul 2018 15:01:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: s3c2410: Error out when ->nrsets < 0 or
 ->sets == NULL
Message-ID: <20180719150127.4b331299@bbrezillon>
In-Reply-To: <20180719103047.mdkvovknicvgsama@mwanda>
References: <20180719094137.22893-1-boris.brezillon@bootlin.com>
 <20180719103047.mdkvovknicvgsama@mwanda>
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

On Thu, 19 Jul 2018 13:30:47 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Jul 19, 2018 at 11:41:37AM +0200, Boris Brezillon wrote:
> > @@ -1152,7 +1157,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
> >  
> >  	nmtd = info->mtds;
> >  
> > -	for (setno = 0; setno < nr_sets; setno++, nmtd++) {
> > +	for (setno = 0; setno < nr_sets; setno++, nmtd++, sets++) {
> >  		struct mtd_info *mtd = nand_to_mtd(&nmtd->chip);
> >  
> >  		pr_debug("initialising set %d (%p, info %p)\n",
> > @@ -1174,9 +1179,6 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)  
> 
> Can you also remove the NULL check from int the middle of the loop:
> 
> 		err = nand_scan_ident(mtd, (sets) ? sets->nr_chips : 1, NULL);

Sure.

>                                             ^^^^
> 
> >  			goto exit_error;
> >  
> >  		s3c2410_nand_add_partition(info, nmtd, sets);
> > -
> > -		if (sets != NULL)
> > -			sets++;
> >  	}  
> 
> regards,
> dan carpenter
> 
