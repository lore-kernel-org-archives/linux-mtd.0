Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187UEN-0004nD-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 05:20:27 +0000
Date: Fri, 1 Nov 2002 06:50:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Pavel Roskin <proski@gnu.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Adding devices at runtime
Message-ID: <20021101055038.GB3738@wohnheim.fh-wedel.de>
References: <20021101033007.GA3738@wohnheim.fh-wedel.de> <Pine.LNX.4.44.0211010019590.1418-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.44.0211010019590.1418-100000@localhost.localdomain>
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

On Fri, 1 November 2002 00:45:59 -0500, Pavel Roskin wrote:
> Sorry, I cannot be more verbose about the device.  I was saying "at
> runtime" because I don't need the second chip for the boot process.  I
> don't care if it's done at runtime or I hardcode the address into the
> kernel.  However, I did check the Config.in and I know that the kernel
> only takes parameters for one chip and one MTDRAM device.
> 
> > It is possible to register devices at runtime. But I don't know of any
> > driver that gives you an interface to do so without insmod'ing it. A
> > question of some 50 lines of code to add that functionality.
> 
> I have those lines (perhaps they are not very pretty), but I was wondering
> if there is "the right way" to do it.  I gather from your that it's called
> insmod.  That's fine.
> 
> I guess another solution would be writing a map for the device, just like
> those little C files under drivers/mtd/maps/

Yes, yet another mapping driver sound like the way to go, judging from
the information you provided.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
