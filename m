Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WNqp-0002YF-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 21:35:03 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8F001KW1D0NG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2003 23:05:24 +0100 (MET)
Date: Wed, 08 Jan 2003 23:04:25 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: CRAMFS on MTD/NAND Issue
In-reply-to: <Pine.LNX.4.44.0301082150360.9902-100000@filer.marasystems.com>
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Russ Dill <Russ.Dill@asu.edu>, Srinivasu.Vaduguri@nokia.com,
 linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301082304.25101.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.44.0301082150360.9902-100000@filer.marasystems.com>
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

On Wednesday 08 January 2003 21:51, Henrik Nordstrom wrote:
> On Wed, 8 Jan 2003, Thomas Gleixner wrote:
> > > roll your own: Please, make a static compressed filesystem (like
> > > cramfs) that incorporates extra blocks, so that when the checksum is
> > > bad while initially writing the filesystem, or reading the file system
> > > (in the case where ecc can save the data), it rewrites this block to a
> > > free sector). It would seem like a simple modification to cramfs to me.
> >
> > Don't reinvent the wheel! :)
>
> Having a image based filesystem which cannot be written to has it's
> beauty..
Mount your rootfs _readonly_ and you have the _same_ including bad block 
handling.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
