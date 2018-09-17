Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1shc-0001j4-HK
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 12:32:34 +0000
Date: Mon, 17 Sep 2018 14:32:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, stable@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: prevent harmless warnings
Message-ID: <20180917143211.7e615d69@bbrezillon>
In-Reply-To: <20180910151523.38a59b68@xps13>
References: <20180907142954.13299-1-miquel.raynal@bootlin.com>
 <20180910145744.4a73b068@bbrezillon>
 <20180910151523.38a59b68@xps13>
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

On Mon, 10 Sep 2018 15:15:23 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
> 14:57:44 +0200:
> 
> > On Fri,  7 Sep 2018 16:29:54 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Since the addition of WARN_ON() in nand_subop_get_data/addr_len()
> > > helpers, this driver will produce harmless warnings (mostly at probe)
> > > just because it always called the *_data_len() helper in the parsing    
> > 
> > 			 ^calls
> >   
> > > function (even on non-data instructions, where this value is
> > > meaningless and unneeded.    
> > 
> > 			  ^ missing ')'
> >   
> > > 
> > > Fix these warnings by deriving the length only when it is relevant.
> > > 
> > > Fixes: 760c435e0f85 ("mtd: rawnand: make subop helpers return unsigned values")
> > > Cc: stable@vger.kernel.org    
> > 
> > You can drop the above line this 760c435e0f85 was merged in 4.19-rc1.
> > 
> > If you're okay with these changes, no need to send a new version, I'll
> > fix it when applying.  
> 
> Sure, you can apply, thanks for fixing it.

Queued to master.

Thanks,

Boris
