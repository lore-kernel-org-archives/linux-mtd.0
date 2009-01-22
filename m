Subject: Re: JFFS2 losing files on mount
From: David Woodhouse <dwmw2@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0901211603040.12232@lnxricardw.se.axis.com>
References: <d459bb380901210129sb54eb47j2a67a11710f185b5@mail.gmail.com>
	<Pine.LNX.4.64.0901211603040.12232@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Thu, 22 Jan 2009 15:03:39 +1100
Message-Id: <1232597019.3921.2.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marco Braga <marco.braga@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-21 at 16:05 +0100, Ricard Wanderlof wrote:
> 
> On Wed, 21 Jan 2009, Marco Braga wrote:
> 
> > I am doing some power failure tests on an ARM7 based device using
> > JFFS2 on NAND flash and I am a bit disappointed by the early results.
> > ...
> > I'd like to hear your experiences. What do you think?
> 
> We use JFFS2 on both an ARM9-platform and on our own CRIS platform. We 
> never unmount the device in preparation for power down; when someone pulls 
> the plug, the system just dies. While we do occasionally see warning 
> messages about incomplete nodes during the next boot-up, we have never 
> experienced anything as severe as you mention, and we have not lost any 
> files on the JFFS2 filesystem either.

Is this on NAND, or NOR flash? On NAND flash, you do actually have to
have non-buggy userspace; if you don't use sync() or fsync()
appropriately then there may be data which aren't yet flushed to the
flash.

On NOR flash, we're a whole lot more tolerant of buggy userspace. Which
is what >99% of reports like Marco's turn out to be. Although we're
always interested in the possibility that it _does_ turn out to be a
real JFFS2 bug...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
