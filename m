Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCKpT-0002gX-T1
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 05:54:32 +0000
Received: by mail-pf0-x236.google.com with SMTP id c2so42696919pfa.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jun 2016 22:54:11 -0700 (PDT)
Date: Sun, 12 Jun 2016 22:54:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: Re: [PATCH 0/4] mtd: add support for pairing scheme description
Message-ID: <20160613055402.GA107340@google.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
 <20160611021625.GA144502@google.com>
 <20160611084518.61d9b712@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160611084518.61d9b712@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 11, 2016 at 08:45:18AM +0200, Boris Brezillon wrote:
> On Fri, 10 Jun 2016 19:16:25 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Apr 25, 2016 at 12:01:17PM +0200, Boris Brezillon wrote:
> > > Hi,
> > > 
> > > This series is the first step towards reliable MLC/TLC NAND support.
> > > Those patches allows the NAND layer to expose page pairing information
> > > to MTD users.  
> > 
> > Have you surveyed many types of NAND to get a representative sampling of
> > what kind of pairing schemes are out there? Do you think you've covered
> > the possibilities well enough in your API? I have a few comments on the
> > patches to this effect. I honestly don't know the answer to these
> > questions, because AFAIR, this is rarely well documented in datasheets.
> 
> I only tested on 3 different NANDs from Micron, Toshiba and Hynix, but

I'm curious, do you have an example part number for Micron? When I
looked briefly last week, I only found either MLC that don't mention it
at all (they fundamentally *have* to have write pairing, don't they?) or
TLC that required too much work for me to get past their login screens.

> I had a look at several datasheets. Unlike read-retry this part is
> usually documented in public datasheets, and on a panel of approximately
> 20 NANDs (mainly from Toshiba, Samsung, Hynix and Micron), all of them
> where using the 'distance 3' or 'distance 6' pairing scheme.
> The only exception I've seen so far is the one pointed by Bean here [1],
> and it can be described using the mtd_pairing_scheme approach.

Yeah, I suppose the API is rather generic. It doesn't really assume
anything about patterns/distances -- just that the pairings are formed
in groups of the same size.

> > > The plan is to teach UBI about those constraints and let UBI code take
> > > the appropriate precautions when dealing with those multi-level cells
> > > NANDs. The way we'll handle this "paired pages" constraint will be
> > > described soon in a series adapting the UBI layer, so stay tune ;).
> > > 
> > > Note that this implementation only allows page pairing scheme description
> > > when the NAND has a full-id entry in the nand_ids table.
> > > This should be addressed in some way for ONFI and JEDEC NANDs, though
> > > I'm not sure how to handle this yet.  
> > 
> > Do ONFI or JEDEC parameter pages even provide this kind of info? The
> > ONFI spec doesn't mention paired pages.
> 
> Nope that's the problem. The only way you can deduce that is to extract
> it from other information, but I think my series reworking the NAND
> initialization will help us [2].

Sure, I suppose.

Brian
