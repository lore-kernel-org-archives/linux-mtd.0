Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17O0mT-0005ao-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2002 19:47:41 +0100
Date: Fri, 28 Jun 2002 20:47:40 +0200
From: Peter Keel <seegras@discordia.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off DOC?
Message-ID: <20020628184740.GA6828@discordia.ch>
References: <3D1B22F2.18643@webmta2>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3D1B22F2.18643@webmta2>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

* on the Thu, Jun 27, 2002 at 10:36:34PM +0800, g_friend@etang.com wrote:
> >Since you cannot boot with the doc2000 installed, I'd recommend trying the 
> >following, **very carefully**:
> >  1. Turn off system
> >  2. Remove DoC from board (I assume it's an ISA/PCI board with DoC socketed?)
> >  3. Install *empty* DoC board
> >  4. Boot into DOS
> >  5. Install latest M-Sys DOS utilities (if not already done)
> >  6. *** CAREFULLY *** install DoC into socket
> >  7. Run DFORMAT utility to replace grub firmware
> >*Disclaimer:  This procedure has worked for me, but it could do *bad things* 
> >to your DoC.  Use it only as a last resort.
> 
> By saying above ,do you mean "hot plug" ?

And do you mean you have to have 
- DOS (why shouldn't I use Linux?)
- An Empty DOC 
?? 

> >If your machine supports "Network" boot, you may want to try configuring GRUB 
> >with the "--enable-diskonchip-biosnetboot" option.  This will allow you to 
> >selectively boot from the DoC, returning to booting from a hard drive or 
> >floppy when needed.

IF your board does support that. Mine does not. That's why the whole
fun started. That, and the inability of grub to access my filesystem.

Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin
