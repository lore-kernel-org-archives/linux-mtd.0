Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaNdO-0000qc-GO
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 11:04:08 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Date: Wed, 16 Apr 2014 12:18:28 +0200
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <201404152048.50321.marex@denx.de> <20140416015201.GA3204@localhost>
In-Reply-To: <20140416015201.GA3204@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404161218.28828.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 16, 2014 at 03:52:03 AM, Huang Shijie wrote:

[...]

> > > Does the chip vendor so silly to produce such chips? :)
> > 
> > I don't quite understand the meaning of this sentence, but the approach
> > where we try heuristics doesn't scale.
> 
> If two chips share the same jedec_id, it means the two chips are produced
> from the same chip vendor, such as 0x012018 means the chip is from
> Spansion.
> 
> If two chips share the same 5 bytes ID, the two chips definitely are
> produced from the same vendor.
> 
> So my meaning is the case what are you mentioned will _not_ exit in the
> real world. Spansion will not so silly.

You do have an awful amount of trust for those things. I am better of with 
"better safe than sorry".
 
> > > > This code should be future-proof, but if we keep adding such special
> > > > cases, we will end up with false matches sooner or later anyway I'm
> > > > 
> > > > afraid.
> > > > 
> > > > What do you say we add the READID length field into the table ?
> > > 
> > > If we add the length field into the table, we have to sort the table by
> > > some kind of order.
> > 
> > Why, please elaborate.
> 
> pleas see:
> http://lists.infradead.org/pipermail/linux-mtd/2013-December/050670.html

Sorry, but this really doesn't answer my question. It's only a matter of 
correctly implementing the matching function to find a proper match.

Can we get insight on this from the others please ?

> If you are interested in this issue, please give us a patch.
> What I want is making the kernel can support the s25fl128s as soon as
> possible.

Perfect, I'd prefer to support it as correctly as possible.

Best regards,
Marek Vasut
