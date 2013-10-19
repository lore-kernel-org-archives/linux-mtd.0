Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXWdX-0003iJ-0j
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 13:32:11 +0000
Date: Sat, 19 Oct 2013 10:32:06 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 00/10] About the SLC/MLC
Message-ID: <20131019133205.GD2470@localhost>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <20130826144153.568f2b1c@skate> <20130827033020.GA2182@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130827033020.GA2182@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, dedekind1@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Mon, Aug 26, 2013 at 11:30:22PM -0400, Huang Shijie wrote:
> On Mon, Aug 26, 2013 at 02:41:53PM +0200, Thomas Petazzoni wrote:
> > 
> > On Mon, 26 Aug 2013 17:36:38 +0800, Huang Shijie wrote:
> > > In current mtd code, the MTD_NANDFLASH is used to represent both the
> > > SLC nand MLC(including the TLC). But we already have the MTD_MLCNANDFLASH
> > > to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
> > > nand with current code. For the reason of READ/WRITE disturbance, the JFFS2
> > > should runs on the SLC only,
> > 
> > Pardon the probably very silly question, but would you mind giving more
> > details about why JFFS2 is not appropriate on MLC flashes? Is there
> > anything that UBI/UBIFS does that JFFS2 isn't doing to take into
> > account read/write disturbance?
> I try to explain it.
> 
> For the UBIFS, it will writes the page(including the oob) only one time;
> but for jffs2, it may writes the page(including the oob) twice, one for the
> marker, one for the real data. 
> 

It seems I overlooked this when I first read it.

Do you mean that JFFS2 will write twice: one write to the spare region,
one write in the data region, with no erase between those two?

I've looked at the JFFS2 code, but it's not trivial to follow :)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
