Received: from www12.mailshell.com ([209.157.66.248] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A3uUS-0002VT-0w
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 10:38:48 +0100
Message-ID: <20030929093754.7956.qmail@mailshell.com>
In-Reply-To: <1064827342.29569.17.camel@hades.cambridge.redhat.com>
References: <1064826976.29857.116.camel@host35>
	 <1064827342.29569.17.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: 29 Sep 2003 17:37:44 +0800
From: daniel@dmhome.net
To: linux-mtd@lists.infradead.org
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

On Mon, 2003-09-29 at 17:22, David Woodhouse wrote:
> On Mon, 2003-09-29 at 17:16 +0800, Daniel Toussaint wrote:
> > Hi, 
> > 
> > Does anyone know where I can find an x86 based sbc with nand chips on
> > board(NOT implemented as ide flash disk) OR maybe an ISA/pci add-on card
> > of some sort ? I need it to do a proof of concept , write some drivers
> > and a bootloader (x86 legacy bios extension)  .... 
> 
> A DiskOnChip 2000 or Millennium sounds like an ideal answer for this.
I am familiar with those devices(we are using them in our current
designs), we are looking to replace them with raw nand - As you
recomended me a couple of months ago, in a discussion we had on this
list, concerning jffs2 on diskonchip devices. 
So actually, the design people at my company are ready to switch to
using this kind of flash - only I'll need some working sample to
convince them, especially with regard to booting. 


  
