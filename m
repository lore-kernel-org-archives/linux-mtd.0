Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbOVu-0001U3-H7
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 15:31:56 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Pierre.Ricadat@UTBM.fr" <Pierre.Ricadat@utbm.fr>
In-Reply-To: <1131711929.43748db9e757d@webmail2.utbm.fr>
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
	<20051028142739.GB1269@wohnheim.fh-wedel.de>
	<1130753526.4365edf6b2807@webmail1.utbm.fr>
	<20051031143345.GB27238@wohnheim.fh-wedel.de>
	<1130771777.4366354129c88@webmail1.utbm.fr>
	<20051031152430.GC27238@wohnheim.fh-wedel.de>
	<1131702259.437467f3dd940@webmail2.utbm.fr>
	<20051111100859.GA23660@wohnheim.fh-wedel.de>
	<1131707642.43747cfa9454b@webmail2.utbm.fr>
	<20051111121353.GB23660@wohnheim.fh-wedel.de>
	<1131711929.43748db9e757d@webmail2.utbm.fr>
Content-Type: text/plain; charset=ISO-8859-1
Date: Sun, 13 Nov 2005 21:36:07 +0100
Message-Id: <1131914167.32542.37.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] separate routine to check jffs2_flash_read
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-11-11 at 13:25 +0100, Pierre.Ricadat@UTBM.fr wrote:
> Quoting Jörn Engel <joern@wohnheim.fh-wedel.de>:
> > > Here is the new patch for current cvs.
> >
> > Unfortunately in DOS format (0x13,0x10 line breaks).  Can you respin
> > it into Unix format?
> 
> Oops. Sorry. This is the good one.

Good ? As long as we restrict the view to the file format.

The patch introduces:

- memory leaks
- use after free
- kfree of pointers pointing to a variable on the stack

Have a close look at all callers of this function.

In general, hiding kfree(var) in the error path of a global function,
which purpose is to read data from flash and handle the error conditions
in terms of messages and return value, is a secure source for above
problems. 

When neither the author himself nor a reviewer recognizes the hidden
trouble, how is an innocent user supposed not to trap into this ?

Unfortunately the patch was applied already. Fixed in CVS.

BTW, can we please start to add DocBook comments to new functions or to
functions which are reworked ? That way the documentation of the global
functions might be reality some day.


	tglx
