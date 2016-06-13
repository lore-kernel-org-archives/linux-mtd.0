Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCLS4-0008EA-47
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 06:34:25 +0000
Date: Mon, 13 Jun 2016 08:33:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, "Bean
 Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Subject: Re: [PATCH 0/4] mtd: add support for pairing scheme description
Message-ID: <20160613083353.3ac68f9a@bbrezillon>
In-Reply-To: <20160613055402.GA107340@google.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
 <20160611021625.GA144502@google.com>
 <20160611084518.61d9b712@bbrezillon>
 <20160613055402.GA107340@google.com>
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

On Sun, 12 Jun 2016 22:54:02 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Sat, Jun 11, 2016 at 08:45:18AM +0200, Boris Brezillon wrote:
> > On Fri, 10 Jun 2016 19:16:25 -0700
> > Brian Norris <computersforpeace@gmail.com> wrote:  
> > > On Mon, Apr 25, 2016 at 12:01:17PM +0200, Boris Brezillon wrote:  
> > > > Hi,
> > > > 
> > > > This series is the first step towards reliable MLC/TLC NAND support.
> > > > Those patches allows the NAND layer to expose page pairing information
> > > > to MTD users.    
> > > 
> > > Have you surveyed many types of NAND to get a representative sampling of
> > > what kind of pairing schemes are out there? Do you think you've covered
> > > the possibilities well enough in your API? I have a few comments on the
> > > patches to this effect. I honestly don't know the answer to these
> > > questions, because AFAIR, this is rarely well documented in datasheets.  
> > 
> > I only tested on 3 different NANDs from Micron, Toshiba and Hynix, but  
> 
> I'm curious, do you have an example part number for Micron? When I
> looked briefly last week, I only found either MLC that don't mention it
> at all (they fundamentally *have* to have write pairing, don't they?) or
> TLC that required too much work for me to get past their login screens.

I had to register and request the datasheet on their website (after
accepting the NDA). I looked at the L73A and L85A. Not sure about the
other Micron MLC NANDs, but maybe Beal can answer that one.
Oh, and BTW, paired pages are called shared pages in Hynix datasheets.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
