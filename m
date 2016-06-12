Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC726-0001TY-Us
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 15:10:43 +0000
Date: Sun, 12 Jun 2016 17:10:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "George Spelvin" <linux@sciencehorizons.net>
Cc: beanhuo@micron.com, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Message-ID: <20160612171015.276c3095@bbrezillon>
In-Reply-To: <20160612144215.48445eb4@bbrezillon>
References: <20160612131142.293ff800@bbrezillon>
 <20160612122549.30320.qmail@ns.sciencehorizons.net>
 <20160612144215.48445eb4@bbrezillon>
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

On Sun, 12 Jun 2016 14:42:15 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> >   
> > >> Also, the data sheets are a real PITA to find.  I have yet to
> > >> see an actual data sheet that documents the stride-3 pairing scheme.    
> >   
> > > Yes, that's a real problem. Here is a Samsung NAND data sheet
> > > describing stride-3 [1], and an Hynix one describing stride-6 [2].
> > > 
> > > [1]http://dl.btc.pl/kamami_wa/k9gbg08u0a_ds.pdf
> > > [2]http://www.szyuda88.com/uploadfile/cfile/201061714220663.pdf    
> > 
> > Thank you very much!
> > 
> > Did you see the footnote at the bottom of p. 64 of the latter?
> > Does that affect your pair/group addressing scheme?
> > 
> > It seems they are grouping not just 8K pages into even/odd double-pages,
> > and those 16K double-pages are being addressed with stride of 3.
> > 
> > But in particular, an interrupted write is likely to corrupt both
> > double-pages, 32K of data!  
> 
> Yes, that's yet another problem I decided to ignore for now :).

Now I remember why I decided to ignore this. If you look at this other
Hynix data sheet [1] exposing the same pairing scheme you see that the
description as slightly changed. I don't know if it's a fix from the
previous description or if the pairing scheme are really different, but
until someone has tested it on a real device, I'll assume the Hynix
case is an exception which should be handled separately.

> 
> I guess a solution would be to consider that all 4 pages are 'paired'
> together, but this also implies considering that the NAND is a 4-level
> cells, which will make us loose even more space when operating in 'SLC
> mode' where we only write the lower page (page attached to group 0) of
> each pair.
> 

[1]http://minipcsale.ru/images/joomlakassa/TV_BOX/MINIX_NEO_X7/SK%20Hynix%20H27UCG8T2BTR.pdf

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
