Received: from www12.mailshell.com ([209.157.66.248] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A49Xm-0005CM-80
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 02:43:14 +0100
From: Daniel Toussaint <daniel@dmhome.net>
To: linux-mtd@lists.infradead.org
In-Reply-To: <200309291351.58512.david.goodenough@btconnect.com>
References: <1064826976.29857.116.camel@host35>
	 <200309291351.58512.david.goodenough@btconnect.com>
Message-Id: <1064886137.32296.9.camel@host35>
Mime-Version: 1.0
Date: 30 Sep 2003 09:42:17 +0800
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Indeed, as far as I can tell Compulab are really one of the few who have
this kind of nand flash implementation on an "off the shelf" SBC. I
briefly looked at their manuals/drivers, and came to the same conclusion
as you have: it may take some reverse engineering skills or "good
contacts" to get mtd to work on their board.
I think may I'll try to get a sample anyways, even so it won't be
suitable as a "reference board", it will certainly be fun to try and get
it to work. ... 

Thanks, 

Daniel


On Mon, 2003-09-29 at 20:51, David Goodenough wrote:
> On Monday 29 September 2003 10:16, Daniel Toussaint wrote:
> > Hi,
> >
> > Does anyone know where I can find an x86 based sbc with nand chips on
> > board(NOT implemented as ide flash disk) OR maybe an ISA/pci add-on card
> > of some sort ? I need it to do a proof of concept , write some drivers
> > and a bootloader (x86 legacy bios extension)  ....
> >
> > Thanks,
> 
> How about the Compulab boards.  They come with both NOR and NAND
> flash on the x86CORE boards.  Unfortunately there is no MTD driver for 
> them, and while there is Linux support, it comes as part binary only.
> 
> From what I can see there is not enough formal documentation to 
> write a driver, but there are odd bits of information which someone
> knowledgable about with the MTD driver might be able to interpret
> into a real driver.  You would be doing the Compulab users a favor
> if you built such a driver.
> 
> There do also appear to be drivers for two of the AMD Elan SC520
> reference boards, but at least one seems to have lots of comments
> in it saying that handling it is a kludge.  The Compulab 586CORE
> is Elan SC520 based.
> 
> Regards
> 
> David
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://rd.mailshell.com/lists.infradead.org/mailman/listinfo/linux-mtd/
