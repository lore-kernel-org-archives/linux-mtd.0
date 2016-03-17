Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agWMC-0002xX-Ta
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 11:44:49 +0000
Date: Thu, 17 Mar 2016 12:43:59 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Martin Townsend <mtownsend1973@gmail.com>
CC: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS question
In-Reply-To: <56EA943C.4000505@nod.at>
Message-ID: <alpine.DEB.2.02.1603171240030.29358@lnxricardw1.se.axis.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
 <56EA7148.7050008@nod.at>
 <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
 <56EA943C.4000505@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > We expect the flash devices to start failing quicker than normally
> > expected due to the environment in which they will be operating in, so
> > sudden NAND blocks turning bad will eventually happen and what we
> > would like to do is try and capture this as soon as possible.
> > The boards are not accessible as they will be located in very remote
> > locations so detecting these failures before the system locks up would
> > be an advantage so we can report home with the information and fail
> > over to the other filesystem (providing that hasn't also been
> > corrupted).
> 
> Dealing with sudden bad NAND blocks is almost impossible.
> Unless you have a copy of each block.
> NAND is not expected to gain bad blocks without an indication like
> correctable bitflips.

Yes, although the NAND flash documentation sometimes reads like blocks can 
suddenly 'go bad' for no special reason, in practice it is due to 
excessive erase/write cycles, i.e. its a wear problem.

However, I don't know, if you are operating the flash in an environment 
where there is cosmic radiation that can actually damage the chip for 
instance, then of course any part of the chip could fail randomly with a 
fairly high probability. But NAND bad block management is not designed to 
take care of that case, which is why bad block detection is only done 
during block erasure (i.e. when a block fails to erase).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
