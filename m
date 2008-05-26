Received: from web36707.mail.mud.yahoo.com ([209.191.85.41])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0SCZ-000619-9a
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 02:12:43 +0000
Date: Sun, 25 May 2008 19:12:41 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080525072501.GA13140@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <636290.99305.qm@web36707.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jörn Engel <joern@logfs.org> wrote:

> On Sat, 24 May 2008 20:41:17 -0700, Alex Dubov wrote:
> > --- Jörn Engel <joern@logfs.org> wrote:
> > 
> > > Writes happen in multiples of mtd->writesize.  Which for NAND is
> > > pagesize.  There are also special cases with subpage writes.  AFAIK only
> > > UBI exploits that feature.
> > 
> > Most xd cards can only be written a whole PEB in a time (can be handled
> with
> > appropriate writesize, I suppose).
> 
> Up to 256M writing pages at a time worked for me.  1G didn't work
> anymore.  Whether this was due to your requirement above or something
> else I didn't work out.
> 

"Smartmedia" spec kind of allows (but recommends against) single page
programming. "xD card" spec prohibits it outright starting from version 1.0.
And in fact I had some really nasty problems recently with two olympus cards
when not writing full blocks.



      
