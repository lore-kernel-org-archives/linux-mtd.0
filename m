Received: from web21501.mail.yahoo.com ([66.163.169.12])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1798OC-000058-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 18:53:08 +0100
Message-ID: <20020518175306.38447.qmail@web21501.mail.yahoo.com>
Date: Sat, 18 May 2002 10:53:06 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <23649.1021737644@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Thank you very much for your correction.

I think, this should also be corrected :-

http://www.linux-mtd.infradead.org/tech/nand.html says
that :-

There are four layers of software

JFFS2: filesystem driver 
MTD: Memory Technology Devices driver 
NAND: generic NAND driver 
Hardware specific driver 

It should be :-

There are five layers of software

JFFS2: filesystem driver 
Flash Translation Layer: FTL (for NOR) or NFTL (for
NAND)
MTD: Memory Technology Devices driver 
NAND: generic NAND driver 
Hardware specific driver 

Am i again wrong ?

Thank you for your help.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> studying_mtd@yahoo.com said:
> > A. FAT: filesystem driver 
> > B. Translation: translation layer on the NAND
> flash to
> > make it emulate a normal hard drive
> > C. MTD: Memory Technology Devices driver (MTD
> Block)
> > D. NAND: generic NAND driver
> > E. Hardware specific driver (Plus NFTL)
> 
> No. NFTL _is_ the translation layer in (B). The
> SmartMedia format could be
> used in its place. The other list you gave looks
> more like the existing 
> situation.
> 


__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com
