Received: from mail6.bluewin.ch ([195.186.4.229])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBxh-0000gV-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 10:30:25 +0000
Subject: Re: Intel Strataflash
From: Raphael Hertzog <eng@eipm.ch>
To: Stephane List <stephane.list@lilotux.net>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20030130094658.GB11189@lilotux.net>
References: <20030129161457.GA9083@lilotux.net>
	 <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
	 <20030130094658.GB11189@lilotux.net>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043924444.555.30.camel@localhost>
Mime-Version: 1.0
Date: 30 Jan 2003 12:00:44 +0100
Content-Transfer-Encoding: 8bit
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

Am Don, 2003-01-30 um 10.46 schrieb Stephane List:
> On mer, jan 29, 2003 at 10:36:13 +0000,
> David Woodhouse <dwmw2@infradead.org> wrote:
> > On Wed, 29 Jan 2003, Stephane List wrote:
> > 
> > > PS : I couldn't compile my kernel with the CVS code...
> > 
> > Details?
> > 
> 
> my grep doesn't know the "-m option" so I think that the patch isn't correctly applied.
> I will look at "patchin.sh" to correct this.

Here's the patch that I use (if someone wants to commit it ...) :

Index: patchin.sh
===================================================================
RCS file: /home/cvs/mtd/patches/patchin.sh,v
retrieving revision 1.9
diff -u -r1.9 patchin.sh
--- patchin.sh	30 Nov 2002 23:48:39 -0000	1.9
+++ patchin.sh	30 Jan 2003 10:57:18 -0000
@@ -60,9 +60,9 @@
 fi
 
 # Get kernel version
-VERSION=`grep -sm 1 VERSION <$LINUXDIR/Makefile | sed s/'VERSION = '//`
-PATCHLEVEL=`grep -sm 1 PATCHLEVEL <$LINUXDIR/Makefile | sed s/'PATCHLEVEL = '//`
-SUBLEVEL=`grep -sm 1 SUBLEVEL <$LINUXDIR/Makefile | sed s/'SUBLEVEL = '//`
+VERSION=`grep ^VERSION $LINUXDIR/Makefile | sed s/'VERSION = '//`
+PATCHLEVEL=`grep ^PATCHLEVEL $LINUXDIR/Makefile | sed s/'PATCHLEVEL = '//`
+SUBLEVEL=`grep ^SUBLEVEL $LINUXDIR/Makefile | sed s/'SUBLEVEL = '//`
 
 # Can we handle this ?
 if test $VERSION -ne 2 -o $PATCHLEVEL -lt 4


Cheers,
-- 
Raphaël Hertzog - EIPM SA
