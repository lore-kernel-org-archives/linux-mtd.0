Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WMKx-0002Ih-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 19:58:03 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8E001GXWVBNG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2003 21:28:24 +0100 (MET)
Date: Wed, 08 Jan 2003 21:27:24 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: CRAMFS on MTD/NAND Issue
In-reply-to: <1042054935.10724.10.camel@timmy>
To: Russ Dill <Russ.Dill@asu.edu>, Srinivasu.Vaduguri@nokia.com
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301082127.24636.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
References: 
 <F252EE46074AB645B4F44947EEAD5727C83809@mvebe001.americas.nokia.com>
 <1042054935.10724.10.camel@timmy>
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

On Wednesday 08 January 2003 20:42, Russ Dill wrote:
> NAND *will* have bad blocks, cramfs does not handle bad blocks. There
> isn't an elegant solution for this right now, but here are some options:
> yaffs: desgined for NAND, but has no compression
Solid, but no compression

> jffs2: The NAND code is pretty new, and the journalling is probably
> overkill for your application, but it will work, and should be able to
> adapt to bad blocks.
The code is pretty new in comparison to Makefile V1.0, but it's used in 
production system and can be considered "stable". 
It's really a realiable rootfs.

> roll your own: Please, make a static compressed filesystem (like cramfs)
> that incorporates extra blocks, so that when the checksum is bad while
> initially writing the filesystem, or reading the file system (in the
> case where ecc can save the data), it rewrites this block to a free
> sector). It would seem like a simple modification to cramfs to me.
Don't reinvent the wheel! :)
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
