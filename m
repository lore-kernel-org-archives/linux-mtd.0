Received: from web53404.mail.yahoo.com ([206.190.37.51])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmhbr-0006Cx-2r
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 19:31:52 -0400
Message-ID: <20040719215532.51737.qmail@web53404.mail.yahoo.com>
Date: Mon, 19 Jul 2004 14:55:32 -0700 (PDT)
From: Mak Kar <lin_mkar@yahoo.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1090240245.29112.27.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So, basically If an application gets address as input,
it needs a board map driver to figure out which mtd
device this address belongs to.
So writing a board specific map driver seems a good
solution....


--- Josh Boyer <jdub@us.ibm.com> wrote:
> On Fri, 2004-07-16 at 14:01, Mak Kar wrote:
> > "cat /proc/mtd" would give me just the size of
> device
> > and erase size.
> > how can I get the starting address in flash of any
> > single mtd device?
> 
> The physical addresses for flash are usually
> provided by the user in the
> form of a board map driver.  If there isn't a
> specific map driver for
> your board, see physmap.c.
> 
> In other words, if you don't tell MTD where to look,
> it won't find
> anything. :)
> 
> josh
> 
> 



		
__________________________________
Do you Yahoo!?
Vote for the stars of Yahoo!'s next ad campaign!
http://advision.webevents.yahoo.com/yahoo/votelifeengine/
