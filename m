Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hr8Qu-0006bI-8i
	for linux-mtd@lists.infradead.org; Thu, 24 May 2007 04:12:31 -0400
Date: Thu, 24 May 2007 11:14:06 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: Andrew Victor <andrew@sanpeople.com>
Subject: Re: PATCH: at91_nand rdy_pin fix
Message-ID: <20070524111406.0b11fb5d@newbox>
In-Reply-To: <1179992828.13098.26.camel@fuzzie.sanpeople.com>
References: <51303.127.0.0.1.1179957194.squirrel@localhost>
	<1179992828.13098.26.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 May 2007 09:47:08 +0200
Andrew Victor wrote:

Should I re-diff or you will apply it corrected?

BR, 
Ivan

> hi Ivan,
> 
> > -       nand_chip->dev_ready = at91_nand_device_ready;
> > +
> > +       if (host->board->rdy_pin)
> > +               nand_chip->dev_ready = at91_nand_device_ready;
> > +       else
> > +               nand_chip->dev_ready = NULL;
> 
> Patch looks correct.
> 
> Since the at91_nand_host structure is allocated with kzalloc(),
> nand_chip->dev_ready is already initialized to NULL.
> So we don't really need the "else" part.
> 
> 
> Regards,
>   Andrew Victor
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
