Date: Tue, 29 Jul 2008 10:50:29 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: 2nd problem with read_subpage() ?
In-Reply-To: <1217323872.3124.21.camel@sauron>
Message-ID: <alpine.LFD.1.10.0807291045530.17391@casper.infradead.org>
References: <1217314432.3124.9.camel@sauron> <1217323810.3124.19.camel@sauron>
	<1217323872.3124.21.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> On Tue, 2008-07-29 at 12:30 +0300, Artem Bityutskiy wrote:
> > On Tue, 2008-07-29 at 09:53 +0300, Artem Bityutskiy wrote:
> > > Glance at nand_do_read_ops():
> > > 
> > > 
> > > if (likely(sndcmd)) {
> > >         chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > >         sndcmd = 0;
> > > }
> > 
> > Alexey,
> > 
> > my investigation showed that this "random output" command is not
> > supported by all flashes. ST-micro NANDs seems to support it
> > (I checked 2 manuals), while Sumsung NANDs do not (checked manual
> > for K9XXG08UXA). This means your implementation will break many
> > systems and should be either fixed or reverted.
> 
> Note, the Samsung NAND I referred is a large page device.
> 
AFAIK this is a standard feature for LP NANDS. I glanced at spec for
K9XXG08UXA - device supports subpage oprations.

To check it I did this. 
Google -> K9XXG08UXA -> the first link -> open PDF page 41. 

Thanks,
Alexey
